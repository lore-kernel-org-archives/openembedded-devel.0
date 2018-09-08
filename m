Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D26FB79817
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 02:59:15 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id g44-v6so18280805qtb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ZCVhJa+n3TZIhyBecaoq/Dj+Qfzpj7eHM2pTO+UHm2w=;
	b=JLb/2mayMLWyynM9AF7oYqqAqi57mIM4FpPfIfybBNCLI4WuiIr8LuYE42uL7UHs9M
	tjOiWKsjyd6Us7UB4E/cYmulHedCZ8FgShof1dOR6a+4x26N5Ga4HLqEQpyU3/tmp0m+
	2GbFUmwmnMXG1YBGYxfEeG5joNCAkDfNc7re5A3bHqpjcGnIo2VwN7m2c3EYFc0HPCXa
	DAyJfDmSP6H2C5fILZkCuV6T4EaEZgGnrW81mht+zoJfMN72U3PwGvXhPZ+Yy3xY1S8z
	LyE3TQwOZdU3nAyaGFUpKItIXZxPmN7RSv5LI5bTJnciI10d8YAwcTGHZEESFv2FvKAi
	ZWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ZCVhJa+n3TZIhyBecaoq/Dj+Qfzpj7eHM2pTO+UHm2w=;
	b=gU0EXh+6A7Nl9pgu0zzIP7yrKYzMvU1ywA2Py0u0IU6hoLgSP97u0/bTU+vkCxu/iA
	7cyoZTogQ0zG01D3aHTtSjxaa+Yvy5k3sqz8pAklQWuRuyM0HM77ecW+Q3BAAmzulfkt
	tiI3Aog3XMGT+YtcN7SAmR4Yu+7792bIEAGJ9rj4GtqrOgKlZcvqhcihJ5h75MN0lsmA
	bdrFyqY+PwJKK38aZK94+1oHDUQh72GKuINMcykZK70a0BRuJ0efaljA+FchCwKF09BA
	nmAVycsg6M0MIN8m6WNqF4O+MknIa7e137DU1z7mb0GXNCv1qFMVsIdPj9CeMfybF9Ui
	XOGw==
X-Gm-Message-State: APzg51AogAtPeOPmNwsn/pf0SPYWrzxBO0WUCbq8G9O8O7JGeCybIBR7
	KNA+OEBLa3Q9ANKS+I6JxnAVApoy
X-Google-Smtp-Source: ANB0Vda74KIjT8qPb1e2+3rb/3aeSkS/HztnPCC6CgZVS1jBdHu8NAllhcJurqgI1EiyKdOe08V2mg==
X-Received: by 2002:a0c:9aef:: with SMTP id
	k47-v6mr8124297qvf.134.1536375555986; 
	Fri, 07 Sep 2018 19:59:15 -0700 (PDT)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id
	n8-v6sm6425758qtk.38.2018.09.07.19.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Sep 2018 19:59:14 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 22:59:10 -0400
Message-Id: <20180908025910.13871-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH] sip: Update from 4.19.8 to 4.19.12.
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
X-List-Received-Date: Sat, 08 Sep 2018 02:59:16 -0000

 * This builds the private sip module for building PyQt5. In the
   future we should split into a -tools and -modules. But lets fix
   building for now

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/sip/files/sip.patch             | 16 ++++++++++++++++
 .../sip/{sip_4.19.8.bb => sip_4.19.12.bb}                | 16 +++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/sip/files/sip.patch
 rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb} (69%)

diff --git a/meta-oe/recipes-devtools/sip/files/sip.patch b/meta-oe/recipes-devtools/sip/files/sip.patch
new file mode 100644
index 000000000..78100fc4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/files/sip.patch
@@ -0,0 +1,16 @@
+diff -Nurd ./sip-4.19.12.orig/configure.py sip-4.19.12/configure.py
+--- ./sip-4.19.12.orig/configure.py	2018-07-05 05:55:19.000000000 -0400
++++ sip-4.19.12/configure.py	2018-09-07 16:41:18.102569271 -0400
+@@ -949,10 +949,10 @@
+ 
+     if len(module_path) > 1:
+         del module_path[-1]
+-        module_path.insert(0, sip_root_dir)
++        module_path.insert(0, sip_module_dir)
+         sip_module_dir = os.path.join(*module_path)
+     else:
+-        sip_module_dir = sip_root_dir
++        sip_module_dir = sip_module_dir
+ 
+     # Override from the command line.
+     if opts.platform is not None:
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
similarity index 69%
rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
index ea944b32f..be384fd39 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
@@ -4,13 +4,15 @@ SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
-inherit python-dir
-
 DEPENDS = "python"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "0625fb20347d4ff1b5da551539be0727"
-SRC_URI[sha256sum] = "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c960801679942377c297bc"
+inherit python-dir pythonnative
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz \
+           file://sip.patch \
+          "
+SRC_URI[md5sum] = "e28b0790dfe4962ce6bbd7c4772f40c9"                            
+SRC_URI[sha256sum] = "24617fc31b983df075500ecac0e99d2fb48bf63ba82d4a17518659e571923822" 
 
 BBCLASSEXTEND = "native"
 
@@ -23,7 +25,7 @@ do_configure_prepend_class-target() {
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
     echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
 }
 do_configure_prepend_class-native() {
     echo "py_platform = linux" > sip.cfg
@@ -32,7 +34,7 @@ do_configure_prepend_class-native() {
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
     echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_NATIVE}
+    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
 }
 do_install() {
     oe_runmake install
-- 
2.13.6


