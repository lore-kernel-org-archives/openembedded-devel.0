Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 981A67F89C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 07:29:02 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id b1so10337861pgq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 23:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gwqd80OxUwxd1Wzt3oKrKXCU/ptOXeopIQFdohJ4ABQ=;
	b=PtsIVdlMR3qu7FpaFZ/xj89BL5Fg5BQ179tiBBsBa2UeAOC/TTp9FQLTDGOGNY5lzg
	K49i+H/leWXY93vCzeogMNE/jLIjejT5rkHTEB3Cpf1NGcGSDbKdAfcCyiK9dMlIZXBg
	lJkRntykeuoZzx04em/btuaZBT/w+qp3hQwhXZ+G8pfFchM+aDPxxbUcKnSyqeAVrY+u
	/vFBwNuWZn2FWoPel928pTX07++nuPesvSpxFyjz5mqgSUNfDLck5A5kvB1yJYsatoqy
	yLWw39wGT0U13ZXAR0HD3UoZjjpoDKDBNjOpCxXUNC+jYXR3KwfXxY/MbwS5YntKtb7d
	zkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gwqd80OxUwxd1Wzt3oKrKXCU/ptOXeopIQFdohJ4ABQ=;
	b=ACqEq2JG2LRIR1r42qJwPislWPqMXWcMKJ7PSlVCjUCXhz+1g/ZKtBNDwdDKzeNdfL
	dSrOeOY8Vkm5d3hI5BDL6EJWTt23CDYSegzuuuxSlxOIlZ3IfPQYIif3FzH6hXaPLAxi
	gpMdElAGLv9xujfIN+d8nBzs2wwArbNmE9Cd4DNA6WwNBkoHXAfXnUoTP5tVtmBEMM1V
	flSUqYgBjo9SlYAvpBnq335o2aR7zQS39ccwSLQd30vgKPWMrnEWsJZbdT+8AUkzWiKm
	QL8elY6FPDLIQbaU8P2b7+Tct3aHaInsbQ+NAldz19xCi/cPuUkuP/cpkh/PhAdnBUD0
	x8VQ==
X-Gm-Message-State: APjAAAWUrNSYaotRmHSHGjI8rQROFfIdPgWHJW0zHHFJWFvlszsxvBeR
	b7dHAIWx7JPVIVmPPe8Xv4i3N2FoW10=
X-Google-Smtp-Source: APXvYqw0tkJsWq7wU73IZN4dHFJoC1TitKY2XpvlgyAkywqXdrp9uxU8ZS399kYdfUsekVmA0G9/XQ==
X-Received: by 2002:aa7:8006:: with SMTP id j6mr47428122pfi.182.1574839743190; 
	Tue, 26 Nov 2019 23:29:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	j14sm1853703pgs.57.2019.11.26.23.29.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 23:29:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 23:28:48 -0800
Message-Id: <20191127072848.785911-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127072848.785911-1-raj.khem@gmail.com>
References: <20191127072848.785911-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] mercurial: Upgrade to 5.2 and switch to py3
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
X-List-Received-Date: Wed, 27 Nov 2019 07:29:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix python path during target build
v3: Separate target specific do_install, since this was making native
    not work

 .../{mercurial_4.6.1.bb => mercurial_5.2.bb}  | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_4.6.1.bb => mercurial_5.2.bb} (50%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
similarity index 50%
rename from meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
index 13710aaea3..18ffb23d78 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
@@ -3,29 +3,36 @@ HOMEPAGE = "http://mercurial.selenic.com/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "python python-native"
-DEPENDS_class-native = "python-native"
-RDEPENDS_${PN} = "python python-modules"
 
-inherit python-dir
+DEPENDS = "python3 python3-native"
+DEPENDS_class-native = "python3-native"
+RDEPENDS_${PN} = "python3 python3-modules"
+
+inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
-SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
+SRC_URI[md5sum] = "9ba9d59157c002db8d8cab680de08eb5"
+SRC_URI[sha256sum] = "ff030e923f03ee15c91191996fcb099bfcfa60c7df263be227f67b6a65d36194"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
 BBCLASSEXTEND = "native"
 
+export LDSHARED="${CCLD} -shared"
+
 EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
     PREFIX=${prefix}"
 
 do_configure_append () {
-    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
+    sed -i -e 's:PYTHON?=python:PYTHON?=${STAGING_BINDIR_NATIVE}/python3-native/python3:g' ${S}/Makefile
 }
 
 do_install () {
     oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
 }
+do_install_append_class-target () {
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/hg
+}
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+
-- 
2.24.0


