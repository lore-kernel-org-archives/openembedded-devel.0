Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id B2519600B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:33 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id c5-v6so11152960wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IDiJl6HpeDc8rSgZKXZ6QynYVqsIewbIMtA431f/mc8=;
	b=QoM3xj+6hpSeZuofHqiaHkOrUSzs7zCdfXmOTGIRzRLvIfQvN3B6ZqxvnrG5AqsmBF
	M9kw32JnR/ZUc2853cswNPU6ksZMxKC/hfw74Ed9hdRj6MITpxi8Lr+paAH+qYanqcrQ
	BUAPe/2oGiqLDj5qReINHfG48CmOqcgonIfPWCb4kZmoUsFzP+elOlyR5i1X39xAtB6R
	9h42R1jD1D7ff+KyIVppVRxPNc5GnUqJLOFpAdJMC4rjCQkfPE/AZzMLrir0A6/2goSd
	gMzES5Q2Fj+V9s/ktjQ5ZvfZg85gxyztl98+2xCyPPcpA3WVTNTXRmjO7UheQGEtCK4E
	ejeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IDiJl6HpeDc8rSgZKXZ6QynYVqsIewbIMtA431f/mc8=;
	b=NtOa8a/2qcfn3goWVbkZ6Ac3lgs74284QXBzmqWleZSc0yb2WTQwPQuFSJ7sTtRF4Z
	MPdxiE2YhrC0hl5bgT9KK3CCFP82+LDrFfrV+bhwSK2Ixg4BcGljkNJIHbtlNgZYE4/A
	Z8R8naM4K5ARQOExF76ZNtnDoWJFvms/vUF9bQr5P6RF/dMYjp3pSEpKotgPBX+pB2lX
	NFr1M+JGOzAqak7KmeWbQ7dXeoE6ZIKuilsEyJn8+t5hVdvBr+zDgaj9ciIzNANV6gIz
	J2cp8CwsNNSSVgJlQ6gWK29rKGJ2oidOpkwgMSDO6Vnwnjxobt0xyyKOmH0ZvyEHIP0H
	zvkQ==
X-Gm-Message-State: APt69E0NEpdUvd8RRwilql9GXF0IQdbfaufCO3RkVGi0zA+tW6Xymwah
	4D+GxuG10RUp0ysXGYiUTKTK1w==
X-Google-Smtp-Source: AAOMgpdW4TuhRP8Gy1GlMtZ+SPg1W8JQnWEpDOqZlzK8/60bq9bgYmx3ChuPwX6NDjKpzYKWnTKLDg==
X-Received: by 2002:adf:e40f:: with SMTP id
	g15-v6mr13644480wrm.145.1530360214130; 
	Sat, 30 Jun 2018 05:03:34 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:11 +0200
Message-Id: <20180630120315.29414-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] blueman: initial add 2.0.5+
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on RaspiB3+

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../blueman/blueman/0001-Search-for-cython3.patch  | 31 +++++++++++++++++
 .../recipes-connectivity/blueman/blueman_git.bb    | 40 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
 create mode 100644 meta-oe/recipes-connectivity/blueman/blueman_git.bb

diff --git a/meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch b/meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
new file mode 100644
index 000000000..269174b2f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
@@ -0,0 +1,31 @@
+From 77db892cdee265e971270c06ca1ffbaeea6449a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 26 Jun 2018 00:27:40 +0200
+Subject: [PATCH] Search for cython3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 727089d1..6b565cdc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,7 +58,7 @@ AC_SUBST([PYGOBJECT_LIBS])
+ 
+ AC_ARG_VAR([CYTHONEXEC], [Cython compiler])
+ if test "x$CYTHONEXEC" = "x"; then
+-   AC_PATH_PROG([CYTHONEXEC],[cython])
++   AC_PATH_PROG([CYTHONEXEC],[cython3])
+ fi
+ AC_SUBST([CYTHONEXEC])
+ AC_MSG_CHECKING([for cython executable])
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
new file mode 100644
index 000000000..884e9859a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/blueman/blueman_git.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
+
+inherit autotools systemd gsettings python3native gtk-icon-cache
+
+SRC_URI = " \
+    git://github.com/blueman-project/blueman.git \
+    file://0001-Search-for-cython3.patch \
+"
+SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
+PV = "2.0.5+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = " \
+    --disable-runtime-deps-check \
+    --disable-schemas-compile \
+"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+RRECOMENDS_${PN} += "adwaita-icon-theme"
+RDEPENDS_${PN} += " \
+    python3-dbus \
+    bluez5-obex \
+"
+
+PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,thunar"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/Thunar \
+    ${systemd_user_unitdir} \
+    ${PYTHON_SITEPACKAGES_DIR} \
+"
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
-- 
2.14.4


