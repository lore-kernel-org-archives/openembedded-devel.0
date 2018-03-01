Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 01BF778200
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 09:39:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so30047335wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 01:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XpuE05pYf3O68wJAFONsiUBvMMrTevV64N1+hNXhGkg=;
	b=Kciyf11GprsdxJaUCVV7/5tQjzmh3/bn7AdhSRQyw+4RcCwkdRF4BlLfoHAjsU8epk
	9yO0HDMWQ3DqYztzkbh0BSHgPPNNH1a/s0hqvj1G08p8lTtY+8KlvacQQyRnXBco+yuE
	Vl7Qp1e6VcBOqDFu1ya7vYC3RrCTwcs3ydu+w2HTw12bSj2GTV53CuWr4Qq51D+JgnUJ
	e2sTvaM5xuXgBAAJ2uKJ478QkjRMXVi+B2d3Ljbpsf30DNqx5WiraH/INOATRy7KwwgB
	6OXJu7R+PJYady7zug7/IAtTxNZcBqCi2VD0qIn+a3nahPSghad5sspNEKvIv1sMN0Hp
	rtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XpuE05pYf3O68wJAFONsiUBvMMrTevV64N1+hNXhGkg=;
	b=ZUTNq5kslvCoDkmjuBbibfGcjXectW2aiIQO0PBtS6wNRf9JMlnfRUPOAqtIhEIrBm
	wySeqKJh/ouOhvOYDJbOehjRWE6NUXzl9svXDlj6ccOUPY1LEaAP1BC/swe+DYuesSzt
	ORmTd8HXOIA9YI2ixG5UWWn6eosKJuRUIz/Sb6daiGs/szmuxlZG9om3g+WO/OAvqGdI
	02yoAJ/SIqM6cg8IPwUpkWb7BSG6AhosVkN9nnWOyDZIFuie1Kd08LxieDhDMg/f0i3J
	G2BgAp5Enr5J9eeRUobCi3UVFSmduxuiX+dtHDwy6lft+Hj47or3Soe3sPM7fCx88AH+
	+wew==
X-Gm-Message-State: AElRT7Fm+NZaEAB+1SNKQlvVDAsJQOA/GI3SvOzhLod5Xq79L13RMAD7
	FvII8lSWMEO62gcVtV72wrXR1g==
X-Google-Smtp-Source: AG47ELsTvxH5s1RwJ++q1U0UeHfyzMhV1vR2FMT7OK7rG/W9jlTXSYt/B+SED8lGDmL4ShFVeMf/TQ==
X-Received: by 10.28.68.133 with SMTP id r127mr1114370wma.19.1519897160584;
	Thu, 01 Mar 2018 01:39:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l22sm4771399wre.52.2018.03.01.01.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 01:39:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2018 09:39:18 +0000
Message-Id: <20180301093918.245-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180224105155.14511-1-Martin.Jansa@gmail.com>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] vboxguestdrivers: upgrade to 5.2.8
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
X-List-Received-Date: Thu, 01 Mar 2018 09:39:20 -0000

* 5.1.26 doesn't build with 4.15 kernel

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...estdrivers_5.1.26.bb => vboxguestdrivers_5.2.8.bb} | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.26.bb => vboxguestdrivers_5.2.8.bb} (71%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
similarity index 71%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
index fdefe03172..e00db4d7e0 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
@@ -12,22 +12,24 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
 VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
-           file://Makefile.utils \
+    file://Makefile.utils \
 "
-SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
-SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
+
+SRC_URI[md5sum] = "e731ea9c5c31096ec4c2a3bfba26665c"
+SRC_URI[sha256sum] = "ee2759d47b0b4ac81b8b671c9485c87fb2db12c097b3e7e69b94c1291a8084e8"
 
 S = "${WORKDIR}/vbox_module"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH_x86-64="amd64"
-export KERN_DIR="${STAGING_KERNEL_DIR}"
+
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
 
 addtask export_sources before do_patch after do_unpack
 
 do_export_sources() {
     mkdir -p "${S}"
-    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules ${T}/vbox_modules.tar.gz
+    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh ${T}/vbox_modules.tar.gz
     tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
 
     # add a mount utility to use shared folder from VBox Addition Source Code
@@ -38,6 +40,13 @@ do_export_sources() {
 
 }
 
+do_configure_prepend() {
+    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:99: *** The variable KERN_DIR must be a kernel build folder and end with /build without a trailing slash, or KERN_VER must be set.  Stop.
+    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108: *** The kernel build folder path must end in <version>/build, or the variable KERN_VER must be set.  Stop.
+    mkdir -p ${WORKDIR}/${KERNEL_VERSION}
+    ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
+}
+
 # compile and install mount utility
 do_compile_append() {
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
-- 
2.15.1


