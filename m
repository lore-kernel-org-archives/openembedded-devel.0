Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05A1F7E101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s11so8294454pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vvEDXjFpsH7hF0YtmKyinUaBLDKjgRWB0+PgeSlk/ro=;
	b=WWZaDE1r+r8EF6BXmx15s1yazVps1Vhezv/jc8ao1biGMQxeuqwIqtJTdG7IsVA/mO
	nTFkWW1KmFNZk2yWHTTCp2lktAc9RH9jGWExEsX2cJxacnaI4YZ3oaE+/NSsNx1IQ/wM
	J7nLm0Xv4WHL+hKyqvQvr2jtmVk6ZU7TSCc8DFCqfWUOdegIW960CdD4j+vMFWGxpfsR
	td15TqVHwfv0LU0YYu6CINDrtE+zED0jTklPE+FWsChGlOq6DUOaMKglbZE4DonaLqru
	+P/rAyeri2NHnzNHHRAjG5gssReNUsMaUMCnGsGKlNJmMb40cJXbMkBArX4/EdbZDeZX
	Z5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vvEDXjFpsH7hF0YtmKyinUaBLDKjgRWB0+PgeSlk/ro=;
	b=L8eyu66Qy9YnGTbbZ1MJrDYc5TVfiPBrvM4Khm1j2TGSuxoDcsQds0+4fLC0AlEH8G
	9S9BQXKo+omDYx8ggUjAyw6yIPxWfz2K7UJB2KAg4VJM/R7AQxdD9BdFhPtX54+H6x6o
	ASdsC8ktSpH4Yo0WB+TbuN+3hnPsRgFU0KpIlw9ocfSXeyOooLnTGwfLY5DYuZbfIVE4
	qSN+2Pfr2ZJAAHH2MFiKH12ixrrc0nMsYuiwyVSDlA0yCzeCUk9/EXi8AqgWS4U7F2kI
	GK7jcfBYCSnBdGjMgF8AN154yROeMD+v6oahUN9EyLWH2MBTQ5bNH0TmQgo9qS4vmiVJ
	esAg==
X-Gm-Message-State: APjAAAV6i3aA3Jqdbsg6IIYjVMXlK509+oqiF/MA/tB0yzznpV56PGxN
	cKfrw4oZF/jm1U+fOac6nGzdE8FH
X-Google-Smtp-Source: APXvYqwG9ZmB/q1YaoAWLGC+4JgO5s+Jv1bfZxmD/N/fz76doW4P4jc+MxpIFlcgaPtsnKroGpByEg==
X-Received: by 2002:a63:c106:: with SMTP id w6mr76091572pgf.422.1558411004092; 
	Mon, 20 May 2019 20:56:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:07 -0700
Message-Id: <03d3e3877a6eed51661d000d2d312e17a5d7ebfe.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 07/34] xfce4-vala: auto-detect vala api version
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
X-List-Received-Date: Tue, 21 May 2019 03:56:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Get rid of tedious maintenance burden

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...e.ac-Detect-vapidir-if-not-set-explicitly.patch | 31 ++++++++++++++++++++++
 .../recipes-bindings/vala/xfce4-vala_4.10.3.bb     |  7 ++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch b/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
new file mode 100644
index 0000000..a3a9330
--- /dev/null
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
@@ -0,0 +1,31 @@
+From 35267d995a81263b98f0ad56399ac3e30f9cf152 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 30 Apr 2019 09:48:08 +0200
+Subject: [PATCH] configure.ac: Detect vala-api version if not set explicitly
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
+index 9bf4230..c489385 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,7 +38,7 @@ AC_ARG_WITH([vala-api],
+ 		AC_HELP_STRING([--with-vala-api=VERSION],
+ 				[Use Vala API version VERSION]),
+ 		[vala_api=$withval],
+-		[vala_api='0.16'])
++		[vala_api=`$PKG_CONFIG --variable=vapidir_versioned vapigen | sed -e 's:.*vala-::' -e s:/vapi::`])
+ M8T_CHECK_VALA([$vala_api])
+ AC_ARG_WITH([default-vapidir],
+ 		AC_HELP_STRING([--with-default-vapidir],
+-- 
+2.20.1
+
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 97007be..68dbc69 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -7,12 +7,13 @@ inherit xfce pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch \
+"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.42"
-
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
 RDEPENDS_${PN} = "vala"
-- 
2.7.4


