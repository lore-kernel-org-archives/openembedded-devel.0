Return-Path: <danismostlikely@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id C09A16A574
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:12:37 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ta17so8340359obb.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 15:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PKTaTOitz4QSNkP4VHymzxB+k2F9IqKh8S1BNjaBp3c=;
	b=qOGYvQSRwdV/Qz7vfIPq5h++oe5OxolibQcJlNwrmiWe5XuHXP5JGBQ4gzDjs85XTC
	4R6iNqOJNHEWvN2SFfA6wrIYBhUHIBclkibnfpPle6n4p7tY6g9kize8xA19wSDBlsk8
	QjmC4L9suzwDBPt0qynG5wd/idS2cM+TOtMOA+JVZ99rMn6r0IC7jVb85AQq1rMB1Crl
	ghCApS5LbjIpz2zYBRjftKMDZ3eMBKsMfJhErBHyXbiOyJ0H89jq9akiRtubCF4oHHM1
	SxqRcACVL/TA3TaA80/Kxu/3WrtXIoUwlncTMWF5sneIIsliwUpMB6Y21COaSsd5IEl+
	Lm0g==
X-Received: by 10.60.52.15 with SMTP id p15mr2997343oeo.87.1370297558520;
	Mon, 03 Jun 2013 15:12:38 -0700 (PDT)
Received: from mediabox.gateway.2wire.net
	(71-17-188-15.sktn.hsdb.sasknet.sk.ca. [71.17.188.15])
	by mx.google.com with ESMTPSA id jt9sm47794942obc.0.2013.06.03.15.12.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 15:12:38 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jun 2013 16:12:14 -0600
Message-Id: <1370297534-9882-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
References: <1370297534-9882-1-git-send-email-danismostlikely@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [oe-core][PATCH] Make Python IPv6 aware
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
X-List-Received-Date: Mon, 03 Jun 2013 22:12:38 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Wrap this around DISTRO_FEATURES, because we don't want it
unconditionally enabled.
---
 meta/recipes-devtools/python/python.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index d0ed55b..4618eb3 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -19,6 +19,7 @@ inherit autotools
 PYTHONLSBOPTS = "--with-wctype-functions"
 PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
 
+ENABLE_IPV6 = "--enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = "\
   --with-threads \
   --with-pymalloc \
@@ -27,5 +28,6 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
+  ${ENABLE_IPV6} \
   ${PYTHONLSBOPTS} \
 "
-- 
1.8.1.4


