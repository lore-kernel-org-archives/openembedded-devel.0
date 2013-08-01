Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD846A39D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 07:09:05 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so798812eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2013 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rMFeMi+Cc1j28icleN8NKVWqaekBkBgMZY83hJMQQKM=;
	b=k71sFZgJc+rMNHUmoOXq+/S8YDf4fMOPREMKFRwTZewkWOnKJyFu3e6t2eVFM1NXP2
	R0oBIoCCRgvTPXaKNeYx6rKxD2+lQQOPXW9O0zOj8gYH8aFtQZwNI0R/EoToXjfi+V2B
	xJbu/lrKNwoTuBqExAmNql76ZwW2aRPxTzUYCuniL4mQsXT+8Qr4SwM89mjS8DIU2Mq0
	IxAU7bt2yx/HA2DVwuU5ZTPf1UnNjl3qkkGICD87kmvIQo2X4TPI3a0bstQYz0eFlS56
	ptBT+3Qo8CGnQQGu6q6PS6w/Q2UkD7XV2ZLv1UxNoUqLykOAUqeEoA8+9O02SQshMCmV
	MBUg==
X-Received: by 10.14.47.73 with SMTP id s49mr132231eeb.71.1375340945153;
	Thu, 01 Aug 2013 00:09:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id p5sm1768322eeg.5.2013.08.01.00.09.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 00:09:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Aug 2013 09:09:26 +0200
Message-Id: <1375340966-597-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-networking][PATCH] ntp: allow to run pkg_postinst_ntpdate in do_rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 07:09:05 -0000

* read-only rootfs cannot run postinsts on first boot and in this case
  it doesn't really have to as we can create cron task in do_rootfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 9367d41..6e8b452 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -114,14 +114,10 @@ INITSCRIPT_NAME = "ntpd"
 INITSCRIPT_PARAMS = "defaults"
 
 pkg_postinst_ntpdate() {
-if test "x$D" != "x"; then
-    exit 1
-else
-    if ! grep -q -s ntpdate /var/spool/cron/root; then
+    if ! grep -q -s ntpdate $D/var/spool/cron/root; then
         echo "adding crontab"
-        test -d /var/spool/cron || mkdir -p /var/spool/cron
-        echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> /var/spool/cron/root
+        test -d $D/var/spool/cron || mkdir -p $D/var/spool/cron
+        echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> $D/var/spool/cron/root
     fi
-fi
 }
 
-- 
1.8.3.2


