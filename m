Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 700B179832
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:58:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v90-v6so15978545wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GWxR1DeneKMb4+Jh1UBkN8DcvXutOJOXL3wzvIX4kYY=;
	b=YU8E1AKrBW990pJ6aWBSiFfrxy0POYjfgba/Ll1xrDmuHu/uhGLZLdAuqwD0jNE0Se
	vGQxJjUkianrylz5uTniZRo/BHPwDqirpOWJDct91a0A3WSxWShx1VmiCM/xcCE38bRn
	7z45stp7ZS5oERfWWmZ6ToDYSadKvb+CStezAnpJZIU0Bi2UcwMSCzBiLKXZNjBt2Wiz
	GqXupyBMhgv2azwENJ5Ea+mJJRlwrhmZ4mZKxUrJYvrxuDSsIUZ+/xdHzVKR+jQdC/1z
	8ydczDoe2HTMQVuXTLHYXpuFuORGG7kBk6YbtPYRltajc8k6kSJU66wf7QNqe2/oLDRP
	brmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GWxR1DeneKMb4+Jh1UBkN8DcvXutOJOXL3wzvIX4kYY=;
	b=FeQTq9a748poBQavudEA++3BsmyTmENoMIkx9POE1h+oJ5shXtXEysvnERhgfgqawo
	2v0oj0k0bIuRQHuffmos/pFlauWWiu2fsu5VQPAHi7fpKHPvii5nVRlpaYSz9O6mij+q
	gODV95Yt0A3s/+SuSfMLSrkanNCD5o501wxKQYv/xJgPrUEy1ptXJnlENRsJk7rb9k1z
	T0gtdgifTzurq5UxeupVnEdtU919uBowknsQ15vLKq2grK79cR04lKM/fi1ILRKTAkJj
	WOedYorXSbas9VhAM7awD/n7P839o/lHDFF32bHwoYiLxUt/gm7sfhqu2vkSZKuygaPM
	mzQg==
X-Gm-Message-State: APzg51AcIQWjqAN9qrXZmUOAx2GfMEfOWPiv16heLvyqKUKnJ5CvTl/T
	3pK943aYrA9WIOe6J7nt+1aZtCrW
X-Google-Smtp-Source: ANB0VdYzGgB/WspGKZ23tH0aZL1b9u//CiMl4ANYPbWbn+Y3p/8EaeCRKez3AWvawlpM0iXuGC9zZg==
X-Received: by 2002:a5d:6550:: with SMTP id
	z16-v6mr6934659wrv.194.1536346735989; 
	Fri, 07 Sep 2018 11:58:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b22-v6sm8944786wme.48.2018.09.07.11.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Sep 2018 11:58:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 18:58:52 +0000
Message-Id: <20180907185852.28479-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180907185852.28479-1-Martin.Jansa@gmail.com>
References: <20180907185852.28479-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][sumo][PATCH 2/2] openocd: prevent fetching git submodules during do_configure
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
X-List-Received-Date: Fri, 07 Sep 2018 18:58:55 -0000

* I've tried just disabling them with:
  --disable-internal-jimtcl --disable-internal-libjaylink
  but that still tries to use missing jim.h:
  | ./src/helper/jim-nvp.h:47:10: fatal error: jim.h: No such file or directory
  |  #include <jim.h>
  |           ^~~~~~~
  | compilation terminated.
  | Makefile:3619: recipe for target 'src/libopenocd_la-openocd.lo' failed
  | make[2]: *** [src/libopenocd_la-openocd.lo] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/openocd/openocd_git.bb   | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 20bc663f98..1a15e53b8f 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -4,14 +4,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libusb-compat libftdi"
 RDEPENDS_${PN} = "libusb1"
 
-SRC_URI = "git://repo.or.cz/openocd.git \
-           file://0001-Add-fallthrough-comments.patch \
-           file://0002-Workaround-new-warnings-generated-by-GCC-7.patch \
-           file://0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch \
-           file://0004-Fix-overflow-warning.patch \
-           file://0005-command-Move-the-fall-through-comment-to-right-scope.patch \
+SRC_URI = " \
+    git://repo.or.cz/openocd.git;protocol=http;name=openocd \
+    git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
+    git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
+    git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
+    file://0001-Add-fallthrough-comments.patch \
+    file://0002-Workaround-new-warnings-generated-by-GCC-7.patch \
+    file://0003-armv7a-Add-missing-break-to-fix-fallthrough-warning.patch \
+    file://0004-Fix-overflow-warning.patch \
+    file://0005-command-Move-the-fall-through-comment-to-right-scope.patch \
 "
-SRCREV = "1025be363e2bf42f1613083223a2322cc3a9bd4c"
+SRCREV_FORMAT = "openocd"
+SRCREV_openocd = "1025be363e2bf42f1613083223a2322cc3a9bd4c"
+SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
+SRCREV_jimtcl = "a9bf5975fd0f89974d689a2d9ebd0873c8d64787"
+SRCREV_libjaylink = "699b7001d34a79c8e7064503dde1bede786fd7f0"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
@@ -20,10 +28,10 @@ inherit pkgconfig autotools-brokensep gettext
 
 BBCLASSEXTEND += "nativesdk"
 
-EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html "
+EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html"
 
 do_configure() {
-    ./bootstrap
+    ./bootstrap nosubmodule
     oe_runconf ${EXTRA_OECONF}
 }
 
-- 
2.17.1


