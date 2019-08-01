Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9E47F54A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 13:43:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so64728693wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2019 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jSsqSbLuaZsZQvZg+tIO0/cMCsTysnn/Nf8liLKj/tc=;
	b=M3SIKQ85rVFua3iRchbLf+nznXXbzYTwkLYQ348jMSKhnAAiD4tpH7WD4k9859rOZ1
	dHK7onWvMGLvEkTwTq/S+pIAYN6GEzm/rTyutqnkqKv5PkzAfcfCUX0wRD5RUQetWVRT
	J+lt8N210kWq1IXpM6jNeg08bLrIFXb9X1ktGfj6otObAwPUF4aK2s0gCj2DFEyRPV3g
	c5anxgkWD9AON+BIl2I+CBaqKGoUbC5u9kKqYDksr+/hSp5S3JanJIgE1HYMdP68q51o
	OQNs17cpOArHfr2gUlQAQs99xxNbx6H2MfRPdLqTNGV7jw0TQ16pqoCeW2rwP1pbN7lR
	SF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jSsqSbLuaZsZQvZg+tIO0/cMCsTysnn/Nf8liLKj/tc=;
	b=t0H2BkqmRq/+1R/nvguoGgs1IVsxz/ow2wwVwOavq3koHdPpkjSgwXZ9Zf1qHzaELL
	WsySaSxqPsnUDBom5OTMVZ7lkR41bAx/jaZWEFjwz2DYvdD65oSkaARDDuumWe+0/GWp
	ZoaB+y3WALqk3Wcb8lLzC3UvDNWhvN3maJ3VEcgA9RygXPoU4FqtySEIXMIFr/msTezv
	0byOKHwXkLYibg7RfrXpvFjYq5jkEaVDceQoDpQXN+zySVMFXMEnrFGnSesI2CtgLdDN
	UAU83L03UmIm5wfOokgLHaK6FaTYpfJOt+NMkb4ZnobIYDFqwFkifPqTKfBeMlLfMlAO
	jJLw==
X-Gm-Message-State: APjAAAWOKMBOYgjbRMYnAoZrjJLcgqCMUeQZL43XjjLfWkfG31RFNm4C
	XUj2hdSDfNsyIHplrk76yr9Pz2Xd
X-Google-Smtp-Source: APXvYqxZeLHg3Gkx0p1ciA2HbLuqa7u07hZVFTs+MKxEw4VmFnWKjvqK2f2OQeBonX0Hu3E8Zvc4CQ==
X-Received: by 2002:a1c:a01a:: with SMTP id j26mr80934679wme.112.1564666981204;
	Thu, 01 Aug 2019 06:43:01 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id
	n12sm74253948wmc.24.2019.08.01.06.43.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 06:43:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Aug 2019 14:42:45 +0100
Message-Id: <20190801134245.74028-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] zstd: Update 1.4.0 -> 1.4.2
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
X-List-Received-Date: Thu, 01 Aug 2019 13:43:01 -0000

Also drop zstd-<variants> and add PACKAGECONFIG support for build options

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../zstd/{zstd_1.4.0.bb => zstd_1.4.2.bb}     | 35 ++++++-------------
 1 file changed, 10 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.0.bb => zstd_1.4.2.bb} (55%)

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.2.bb
similarity index 55%
rename from meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
rename to meta-oe/recipes-extended/zstd/zstd_1.4.2.bb
index 06357da956f4..b5d95d940b34 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.2.bb
@@ -11,40 +11,25 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
 
 SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
 
-SRCREV = "83b51e9f886be7c2a4d477b6e7bc6db831791d8d"
+SRCREV = "ff304e9e65e7cde17a637eea190a874c26c48634"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
+PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
+
+# See programs/README.md for how to use this
+ZSTD_LEGACY_SUPPORT ??= "4"
+
 do_compile () {
-    oe_runmake
-    oe_runmake -C programs zstd-compress zstd-decompress zstd-frugal
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
 }
 
 do_install () {
     oe_runmake install 'DESTDIR=${D}'
-    install -d -m 0755 ${D}${bindir}
-    install -m 0755 ${S}/programs/zstd-compress ${D}${bindir}
-    install -m 0755 ${S}/programs/zstd-decompress ${D}${bindir}
-    install -m 0755 ${S}/programs/zstd-frugal ${D}${bindir}
 }
 
-PACKAGE_BEFORE_PN += " \
-    ${PN}-compress \
-    ${PN}-decompress \
-    ${PN}-frugal \
-"
-
-FILES_${PN}-compress = " \
-    ${bindir}/zstd-compress \
-"
-
-FILES_${PN}-decompress = " \
-    ${bindir}/zstd-decompress \
-"
-
-FILES_${PN}-frugal = " \
-    ${bindir}/zstd-frugal \
-"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


