Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 51E80766B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 03:58:14 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so73675777pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uoISGRle57k1a1/hzTlS9GN6x/hWb/0aXpDqA9J+xVA=;
	b=l1OT5wL9yTwK6SCVZcJHN8v46LZ5NZYROYUHZndNUovHrPaKGt2zXORmzevaF7dp1a
	sUt6l5Zf3H0NEpGPSynZNDJkq2FBzJwgH4W8ozSH2RdOZ/hBngDKrxrlcOKkkA9Wx3Rs
	slBqK0keFA4FXsd9sTefkYC8tImDRFK/znCu9dRqeMQmvOM/z1fnjD6B3NKxtJ7RbVZH
	dcjm29KPngPwwKKkVuk57X0dIEyTpmFee8dloukhFA8sEFT3jZ+tJ86dv8+0YLeQZHWE
	9BqSXhDNAXgZCvtJLv6U1TYIT9AtZm1dGEXborTRlM/l2mC/9MHg5dZ8kYoVgLjOK8j8
	d0YA==
X-Received: by 10.66.219.228 with SMTP id pr4mr6593990pac.99.1446695895265;
	Wed, 04 Nov 2015 19:58:15 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	qn5sm4799710pac.41.2015.11.04.19.58.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Nov 2015 19:58:14 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 21:58:12 -0600
Message-Id: <1446695892-21744-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
References: <1446695892-21744-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-python][PATCH 2/2] gateone: update to latest git
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
X-List-Received-Date: Thu, 05 Nov 2015 03:58:15 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

This version works with pyton-tornado 4.2 as currently distributed
with OE.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...on.py-Hack-around-broken-gethostname-thin.patch | 26 ----------------------
 .../recipes-connectivity/gateone/gateone/80oe.conf |  1 +
 .../recipes-connectivity/gateone/gateone_git.bb    |  7 +++---
 3 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch

diff --git a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch b/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
deleted file mode 100644
index 5f5fa91..0000000
--- a/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d811d3bdf06d78c93c48bef762c19c392c879077 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 26 Nov 2013 15:54:10 +0100
-Subject: [PATCH] configuration.py: Hack around broken gethostname thingy
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- gateone/core/configuration.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gateone/core/configuration.py b/gateone/core/configuration.py
-index da41cbd..d1c8222 100644
---- a/gateone/core/configuration.py
-+++ b/gateone/core/configuration.py
-@@ -162,7 +162,7 @@ def define_options(installed=True):
-     ]
-     # Used both http and https above to demonstrate that both are acceptable
-     try:
--        additional_origins = socket.gethostbyname_ex(socket.gethostname())
-+        additional_origins = [] # additional_origins = socket.gethostbyname_ex(socket.gethostname())
-     except socket.gaierror:
-         # Couldn't get any IPs from the hostname
-         additional_origins = []
--- 
-1.8.4.2
-
diff --git a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
index cde98bc..09cdbfa 100644
--- a/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
+++ b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
@@ -2,6 +2,7 @@
 {
     "*": {
         "gateone": { // These settings apply to all of Gate One
+            "log_file_prefix": "/var/log/gateone.log", // default would be /var/log/gateone/gateone.log
             "log_file_max_size": 5242880, // 5 megabyte logs for OE by default (default would normally be 100Mb)
             "log_file_num_backups": 2, // Default is normally 10
             "origins": ["*"], // Every device has a unique origin
diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 7eae12a..80bbae8 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
 HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
 
 PV = "1.2"
-SRCREV = "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
-SRC_URI = "git://github.com/liftoff/GateOne.git \
-           file://0001-configuration.py-Hack-around-broken-gethostname-thin.patch \
+SRCREV = "17fbf85753f4d9c317950a3ef14f811188a51cb7"
+SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
            file://gateone-avahi.service \
            file://80oe.conf \
            file://gateone.service \
@@ -49,6 +48,7 @@ FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYT
 RDEPENDS_${PN} = "mime-support \
                   openssh-ssh \
                   python-compression \
+                  python-contextlib \
                   python-crypt \
                   python-datetime \
                   python-email \
@@ -76,6 +76,7 @@ RDEPENDS_${PN} = "mime-support \
                   python-tornado \
                   python-unixadmin \
                   python-xml \
+                  python-html5lib \
                   bash \
 "
 
-- 
2.6.2.11.gb05c2f9


