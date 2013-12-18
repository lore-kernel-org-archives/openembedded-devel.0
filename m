Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9A86C60D8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:43:51 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d49so3482045eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QYltFU7yaVZ4Rd+Il2/0SC/jxnU1fAH5vcPG7P2N+Uw=;
	b=HWYyk/4e0A+jwA76vL+LEdcbiaKPGbipT+iqodtpPBQ0llMzHzrDNogZDGznzh2H9a
	UXGxesJsHk+er3aX7eUdZ+iuE44IUTw46CTyNnfJzqEC4h+3wqTbez4AVeHvE7FSCDXA
	EzK1bzjytW9TRV44IU8Vm8bCfDy5gQnOWhDE0Rit5/yY9H3OhQO2DUGnDmCU5B2JeUAz
	CMn7w9+3UUXBgshUMwkDjbAqJFoNivHrPMG8Xc4B+qTH8dV4JPEZ2BMF9Z9v4Sz7mHWF
	MKGM2gtPK6l3QpJ3ugs7R+lkiEsGpb+5+A30pMDoKPX7LyDrmox4JJ4s4x+ZiVupyqeA
	YoIg==
X-Received: by 10.15.23.206 with SMTP id h54mr29225288eeu.17.1387374231798;
	Wed, 18 Dec 2013 05:43:51 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm189038eeh.8.2013.12.18.05.43.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 05:43:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 14:44:21 +0100
Message-Id: <1387374261-6840-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-multimedia][PATCH] tvheadend: Disable dvdscan
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
X-List-Received-Date: Wed, 18 Dec 2013 13:43:52 -0000

* when enabled it will try to download
  http://linuxtv.org/hg/dvb-apps/archive/tip.tar.bz2
  from do_configure (bypassing PREMIRROR and bitbake fetcher), but
  what's worse even when it fetches it, it fails in do_install, because
  dvb-scan directory is empty, reading the script called from configure
  3.3-r0/git/support/getmuxlist, I don't know how it could work before,
  because it first moves files to dvb-scan directory and then removes
  them all one by one.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 7c8b959..65d43c6 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -20,6 +20,7 @@ do_configure() {
                 --bindir=${bindir} \
                 --datadir=${datadir} \
                 --arch=${TARGET_ARCH} \
+                --disable-dvbscan \
                 --disable-bundle
 }
 
-- 
1.8.4.3


