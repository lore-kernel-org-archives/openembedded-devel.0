Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6D17FBB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a15so14077976wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FKcHi7VerrnD3lNshaizC0YqN3RmPkvfSlY4bAUaFQE=;
	b=h+VM43+z2qcpSDmLEiW8rU1kstnULyleLO/Iu3t8UHXtgYKV/pF8V4z/XiabnaSuS9
	5DiBiX/QJod2LcbAtxpFM5FXwgl+b1XsZs9d570WfjvpTMFlZHVqZo6L17YhzD1uUBCB
	FoclfGcZ6t5CaI6wTfZQU5sR+YCRqlqmCzXNFW/cY/HfbUFRVlVWaf5OSXLftQnOeD27
	3gENGDUVpUo6jXxTn8d6op/nRszZPbvmodVS+kWn1X6l6jRyv9uNkiOdk+e4f/Z/xHFG
	pQuZdRCfV+vHKyBJ+fVY0R1WAEjUyvLp3rsfIMP92DR1QyvOFbqhOQiuHnqMN9ljWChP
	5rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FKcHi7VerrnD3lNshaizC0YqN3RmPkvfSlY4bAUaFQE=;
	b=s20pVZO/yzP9JxmsugVrOQzL8JW1NdsrP2twTR5k1xsxoT5G254l9dUhAoB/VH83sb
	AOwwg2jLpQc6S7k5C+gCUDeV034tNrC90ZXimW+QalLTuvuAIDS14ThQxoFCaqUg49F8
	5dzCX5W8QdGSkq8mleG3Aa5JRfAWuGVxAZYUF5BymaV8Ps1qmjA35hAC499dTR09KFTM
	+Wm3CcjPE+pL+JfeakFj5w7cuWMEhOr/puY8riOL9WahJ/uBFZHdyuF18JoTKqqxpT+b
	75GinpijbGjMm/87pDztifeEksDhUuoRoSkUtcIwwLPQVDIOl/NLhkRnv6u1BwDfw1qP
	dB5Q==
X-Gm-Message-State: APjAAAV6GkDuXWbIp8UCPNGj4ponWQleiotIlTZMDU2wSK5S7/wm30rS
	bFr4YbZ4xvHI8WGnk/+F5rO/e6Io
X-Google-Smtp-Source: APXvYqxiYD/p3713IVr9ucNFNU+bdG0+G/Dw1srglK7CD1doQsIuSTru+YB8/d0m/9hBU2lBsXqYPA==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr23241877wrn.274.1575851940854;
	Sun, 08 Dec 2019 16:39:00 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:21 +0100
Message-Id: <20191209003840.3383-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/29] rest: initial add 0.8.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is an optional dependency for upcoming gnome-online-accounts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 33 +++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
new file mode 100644
index 000000000..33b8744eb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "library to access web services that claim to be "RESTful""
+HOMPAGE = "https://wiki.gnome.org/Projects/Librest"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+DEPENDS = " \
+    libxml2-native \
+    glib-2.0-native \
+    glib-2.0 \
+    libsoup-2.4 \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.md5sum] = "ece4547298a81105f307369d73c21b9d"
+SRC_URI[archive.sha256sum] = "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
+
+# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
+# * libsoup-gnome support was removed upstream three years ago [1]
+# [1] https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf2f1ecad17e9a720
+EXTRA_OECONF = "--without-gnome"
+
+do_configure_prepend() {
+    # rest expects introspection.m4 at custom location (see aclocal.m4).
+    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build
+}
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/rest/.libs"
+}
+
-- 
2.21.0


