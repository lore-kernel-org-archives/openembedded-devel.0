Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8797B71B31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 00:46:56 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u42so12381309qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2018 16:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VEJ9kGz5T6jQHS5549m6WPkHwy+V/AAS9M2V3OaRIGc=;
	b=iIoyVd7tTUDytcFE9VrHx8E/KhywdQvtoVDI+TTTiwI6Ogct0EjmTdqYi612JKELfo
	N1HLonCrv1mVuo/gLB6dy2m7bTBn2k/F+gTyoaFiK6GAQ+IFOntDUpYJ7/j6txuiCMfj
	q0Kmrh8ae8Sf9zf0OaB/KdetAOwMoOW0GS+VG5bai6ni5pSxVuw884y2oaX+5AIKGoVC
	5VGp+Xp9dzaM3JnoTq1vuMDep563AYwSpp4sjYRyou98mFljrnL8Ycqc+2G3Yx9pRP90
	Lm5CyZn0z+0UPVeopJ5FmGKdzfBA8RqwhRL5U7bd0xoCbDFY78fAb0yWaaPBjaG+mhj4
	hL4w==
X-Gm-Message-State: AKwxytcbV6f0bXFj+JxCKeoGFj7Hh6+oG+HoxoD93Wi7vsbELRAyzXa7
	aFb3dQBwRts5SXWFrX5VAUXnp+3X
X-Google-Smtp-Source: ACJfBotLn5sFJ4MInYPTbgu4xKf/pEg59kG0jrS37vt9a/j2v5E3VaPcbErt8U/r7Y6CpkqZ/P924w==
X-Received: by 10.200.37.167 with SMTP id e36mr44453083qte.320.1515977217062; 
	Sun, 14 Jan 2018 16:46:57 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y16sm17502437qta.48.2018.01.14.16.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Jan 2018 16:46:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jan 2018 19:46:38 -0500
Message-Id: <1515977198-32517-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: update to version 1.11.4
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
X-List-Received-Date: Mon, 15 Jan 2018 00:46:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.11.2.bb => python-cffi_1.11.4.bb}           | 0
 .../python/{python3-cffi_1.11.2.bb => python3-cffi_1.11.4.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.11.2.bb => python-cffi_1.11.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.11.2.bb => python3-cffi_1.11.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 78addb6..9c934b2 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "a731487324b501c8295221b629d3f5f3"
-SRC_URI[sha256sum] = "ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6"
+SRC_URI[md5sum] = "8ef0f852498908b20bc508799901fe93"
+SRC_URI[sha256sum] = "df9083a992b17a28cd4251a3f5c879e0198bb26c9e808c4647e0a18739f1d11d"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-ctypes \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.11.2.bb b/meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.11.2.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.11.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.11.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.11.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.11.2.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.11.4.bb
-- 
2.7.4


