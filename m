Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1326D87E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 12:05:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q206so3187493pgq.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 04:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c6cJu0epq8dvkvsti3oUZyScKLz0u5tk25jIjEkqsWs=;
	b=JGl5SCS4eYnNWiPo3H54DEeUxMKYhvUPwOGMc3ZNvW8sAsyZNXnAbTWPjq715mGMXQ
	FCXID67FNGzyPK8Z6B/PW2gBLZJbvdUhKMmUk+uiw5tOcok+6PMZD9dqd/39laOKOBCp
	M36WF+IoWGssdXpo2ib01Dl6706XkwKIC5Gmu49Jn04OcWsa8iftYLPDzJwEZvyY3rFR
	4lXDqf0qMtmBeawLGfDk9qbAGFXBCLfOAfF1+BssyyM/TUTYUrKBgTx/m9FX/8lN3mAE
	UN8Z85TtQ53DasCJEhF5bUUT0bmZzbEnc3WE1+Usnvpu3+dcIHmjcup1bIuxgUvBy+L4
	ykdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c6cJu0epq8dvkvsti3oUZyScKLz0u5tk25jIjEkqsWs=;
	b=GnbgDJaB4MKUB607f8zPz0F2ltwGvOxgN2wEXG7RpW6oYbhFw7e8MFpdcv0eCfymfi
	0n/95rxdwdc2HdDR1YPs5Z+hEdUpH/k1YeInz85mh/s4vrrWMWeyOfpA3ltOQIdG54um
	ZbndX0g7rcjr96Quuek51poA6qwi1RhlXMkrvHN5W2hqwqiCsCiMd7RxxTwvoAvBDu84
	g3A7TObF1tL7yoAyNDjWD4g7MD8/YK5KBx9nkbag6vFudP7N4cp5iKDbkOybKi6wve7w
	sGFlslirNC82Ra4ioXaiFof4poubMlQ0Fz3JEZ878fvC854dxzEjOPCoWO6A+pT+pL8x
	x2lw==
X-Gm-Message-State: AHQUAub90AIdB1YEvK7JwyTFj9PG/xF8BYLOvxM+Vih/GWTyvAKXrege
	/g0IHVo3ZpVp/jeJtYAMBXIe47A2cHE=
X-Google-Smtp-Source: AHgI3IYfVH4gjfX1kzKk5KasB1tIMRoVmmQQiAWLS8kzluAsMChnArUayDbBrVH7hsglPyqrC3FiXw==
X-Received: by 2002:a63:4f61:: with SMTP id p33mr12770686pgl.303.1551009955387;
	Sun, 24 Feb 2019 04:05:55 -0800 (PST)
Received: from localhost.localdomain ([128.242.105.20])
	by smtp.gmail.com with ESMTPSA id
	h10sm9820400pgn.11.2019.02.24.04.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Feb 2019 04:05:54 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Feb 2019 12:05:44 +0000
Message-Id: <1551009944-16585-1-git-send-email-tuanha@viosoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] octave: add version 4.4.1
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
X-List-Received-Date: Sun, 24 Feb 2019 12:05:54 -0000

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 .../files/fix-blas-library-integer-size.patch      | 16 +++++++++
 meta-oe/recipes-devtools/octave/octave_4.4.1.bb    | 39 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
 create mode 100644 meta-oe/recipes-devtools/octave/octave_4.4.1.bb

diff --git a/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch b/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
new file mode 100644
index 0000000..e89d7d3
--- /dev/null
+++ b/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
@@ -0,0 +1,16 @@
+diff -Naur octave-4.4.1.orig/configure.ac octave-4.4.1/configure.ac
+--- octave-4.4.1.orig/configure.ac	2019-02-23 10:46:24.287240571 +0000
++++ octave-4.4.1/configure.ac	2019-02-23 10:46:42.255249333 +0000
+@@ -762,6 +762,12 @@
+   AC_MSG_ERROR([BLAS and LAPACK libraries are required])
+ fi
+ 
++if ac_fn_f77_try_run "$LINENO"; then :
++  ax_blas_integer_size=8
++else
++  ax_blas_integer_size=4
++fi
++
+ case $ax_blas_integer_size in
+   4)
+     HAVE_64_BIT_BLAS=no
diff --git a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
new file mode 100644
index 0000000..c91556c
--- /dev/null
+++ b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "High-level language, primarily intended for numerical computations"
+HOMEPAGE = "http://www.gnu.org/software/octave/"
+SECTION = "math"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+DEPENDS = "gperf-native texinfo lapack pcre readline"
+
+inherit autotools pkgconfig texinfo gettext
+
+EXTRA_OECONF = "--disable-java --disable-docs"
+
+SRC_URI = "https://ftp.gnu.org/gnu/octave/${PN}-${PV}.tar.gz \
+           file://fix-blas-library-integer-size.patch \
+"
+
+SRC_URI[md5sum] = "b43bd5f4309a0c048c91af10cf8e8674"
+SRC_URI[sha256sum] = "09fbd0f212f4ef21e53f1d9c41cf30ce3d7f9450fb44911601e21ed64c67ae97"
+
+do_compile_prepend() {
+	for folder in "liboctave/operators liboctave/numeric liboctave/array liboctave/util"; do
+		mkdir -p ${B}/${folder}
+	done
+}
+
+PACKAGES =+ " octave-common liboctave liboctave-dev liboctave-dbg"
+
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${datadir}/${PN} \
+            ${libdir}/${PN}/${PV}/oct ${libdir}/${PN}/${PV}/site  \
+            ${libdir}/${PN}/site ${datadir}/applications ${datadir}/metainfo"
+FILES_${PN}-common = "${datadir}/icons"
+
+FILES_liboctave = "${libdir}/${PN}/${PV}/lib*${SOLIBS}"
+FILES_liboctave-dev = "${libdir}/${PN}/${PV}/lib*${SOLIBSDEV}"
+FILES_liboctave-dbg = "${libdir}/${PN}/${PV}/.debug"
+
+FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/${PN}/${PV}/oct/${TARGET_SYS}/.debug"
+
-- 
2.7.4


