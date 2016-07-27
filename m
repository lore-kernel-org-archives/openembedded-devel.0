Return-Path: <straka.derek@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9867673166
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:53:53 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so2022779pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1rj6TS/z8CBdAtjcycl5GoIM+yBw46/zknxrAFjPP+A=;
	b=S/WRa3+Vq3SjF8Xr03u6ON9CzgNy3RPvcTRFCSWA18pzKhO7z+7dSUuukQA6EWakNB
	OAFDLzZ9s7oQXTVHa2h5iy+FV5PatmRRQV8sDSZv72Nqc5OAZqJpNVEw5DzR1dPeaUna
	V4K87wc1VcnxrwFn0PY/CzykV0Rj5b+UuKy+XvzgjhOjB9hbDqXJb7nguTFSk9bEEM+b
	GS3rW7K2rq/JD1kTUfyg1wtuomh8qeM6LTKoIP6td3eOpmuxKVEwuYHuh3VeOkdunuFE
	tqCpUj6Fm+qmuyvRnN8/vp+tOkuYElSmEJfHRprNciE8Q75tif8DRa3Y0M/hfwGy9hHE
	0dDw==
X-Gm-Message-State: AEkooutE3h2y9QVcav/nqSrBCVDvFp8SX8gwghuja0wbp+1gcga4yejxNaYtfbgDwRIX+Q==
X-Received: by 10.66.227.194 with SMTP id sc2mr51037633pac.120.1469638434048; 
	Wed, 27 Jul 2016 09:53:54 -0700 (PDT)
Received: from lnx-dereks-laptop.router
	(mobile-166-137-178-128.mycingular.net. [166.137.178.128])
	by smtp.gmail.com with ESMTPSA id
	p64sm10608108pfd.11.2016.07.27.09.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 09:53:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 12:53:45 -0400
Message-Id: <1469638425-30339-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] nostromo: update to version 1.9.6 * Update license checksum to include latest copyright information * Update patch for the latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 16:53:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...GNUmakefile-add-possibility-to-override-variables.patch | 14 +++++++++-----
 .../nostromo/{nostromo_1.9.5.bb => nostromo_1.9.6.bb}      |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename meta-webserver/recipes-httpd/nostromo/{nostromo_1.9.5.bb => nostromo_1.9.6.bb} (93%)

diff --git a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
index 7cf011b..8cd4682 100644
--- a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
+++ b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
@@ -91,7 +91,9 @@ diff --git a/src/nhttpd/GNUmakefile b/src/nhttpd/GNUmakefile
 index f6d12de..9524911 100644
 --- a/src/nhttpd/GNUmakefile
 +++ b/src/nhttpd/GNUmakefile
-@@ -1,18 +1,18 @@
+@@ -1,20 +1,20 @@
+ #	$nostromo: GNUmakefile,v 1.6 2016/04/12 19:02:06 hacki Exp $
+ 
 -CCFLAGS = -O2 -pipe -Wall -Wstrict-prototypes -c
 +CFLAGS := -O2 -pipe -Wall -Wstrict-prototypes -c
  
@@ -120,14 +122,16 @@ diff --git a/src/tools/GNUmakefile b/src/tools/GNUmakefile
 index 15bea61..663ddb5 100644
 --- a/src/tools/GNUmakefile
 +++ b/src/tools/GNUmakefile
-@@ -1,11 +1,11 @@
+@@ -1,13 +1,13 @@
+ #	$nostromo: GNUmakefile,v 1.3 2016/04/12 19:02:58 hacki Exp $
+ 
 -CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
-+CCFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes
++CFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes
  
  crypt:		crypt.o
--		cc -o crypt crypt.o -lcrypt
+-		cc -L../libbsd -o crypt crypt.o -lcrypt -lbsd
 -		strip crypt
-+		$(CC) $(CFLAGS) -o crypt crypt.o -lcrypt
++		$(CC) $(CFLAGS) -L../libbsd -o crypt crypt.o -lcrypt -lbsd
 +#		$(STRIP) crypt
  
  crypt.o:	crypt.c
diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
similarity index 93%
rename from meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index 562ecd0..e06a696 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A simple, fast and secure HTTP server"
 HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
+LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=0bb3711a867b9704d3bfabcf5529b64e"
 
 SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
@@ -11,8 +11,8 @@ SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://nostromo \
 "
 
-SRC_URI[md5sum] = "dc6cfd6b5aae04c370c7f818fa7bde55"
-SRC_URI[sha256sum] = "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc18523bad62f6b914"
+SRC_URI[md5sum] = "27aa241d78ff78920354c3e03a5026ea"
+SRC_URI[sha256sum] = "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f411e8eb"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
1.9.1


