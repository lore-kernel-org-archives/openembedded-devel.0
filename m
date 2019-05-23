Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB7407E400
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id j187so6324475wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KGsmL0YaLlOJF8ESUaa5SDaJ3qDOUMRyQkma18Pwhe4=;
	b=mxPeQ+h4css89lZDwyUO8nl2fOptVz8W4O6KcT+m61/IZYSFWbogoqJQlQ+tO3wXp1
	1TFYnJJwncogpRakDjdn28SC+raw9o67tIwseKd7m9s6/yLCEiVO25zV113VqrIvVcH6
	4+d1neJL/MsC1y8SOtEFTnckE920zQnjfryGAc2uZQDotrYEMmOzia611hDyKwpupKwn
	H287XEQOWn4/ENCwIdZ/q08s6ii2YCV/xBJHFFwMEvqp7rF5ryOzUP3NKNJ2UvC+WCU1
	EZ6Zjh3xN5I6imjL281pGSbXm90PBBZ2C3t/eS9hvitV1JDgZyK8opBTGESpH2LvW95g
	bTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KGsmL0YaLlOJF8ESUaa5SDaJ3qDOUMRyQkma18Pwhe4=;
	b=WD3PI4u3r4zebvM+kWwp+B7LfH6SPIUNEq6Mayrf/BXZr2dZhN6JR1I5jn1Sg0BV0/
	Nx508wYYbsfLYxPWXxRHE5S611CermUKSY4Cj2bFNlEWii645ZNC7NAu1q1iHcF703Fo
	+mUlVAurFKnjOqc3kHT+af0yBH3Tb43nYFuSQziuyZfCprYH17rJblPjrkdAI9Dz9xlD
	7Jb8rog/GQ9YCLHslPydJ0tOBC/z9Ece9wRScdl3h4IH6tyVhCb2NZFo6Hg0vcAPkI3s
	1z4OySLT3yaOI3/gl0FwC7o+bBuNJJkvHR4gtptjHAWLjGECFTCRhJiB6gc97rsYV9db
	LaPw==
X-Gm-Message-State: APjAAAUracVnvNiYS5oG65PUkoXTBafCqUIR2nCyL+DNkPNN5JHgst+b
	eWetOAJ3ptdfASW1TmJK22fGv/W3CFk=
X-Google-Smtp-Source: APXvYqxH+fbtL7sEj6uZmpkiBDbSfHcc42/W9oCN5HocTSkOZDgqFU81uo5bbA5ef3ml/IVnBBXI/A==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr10812125wml.77.1558594149191; 
	Wed, 22 May 2019 23:49:09 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:20 +0200
Message-Id: <20190523064859.24336-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/41] appstream: initial add 0.12.6
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
X-List-Received-Date: Thu, 23 May 2019 06:49:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Do-not-use-host-include-path.patch   | 32 +++++++++++++++
 .../appstream/appstream_0.12.6.bb             | 41 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream_0.12.6.bb

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch b/meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch
new file mode 100644
index 000000000..47f4e7aed
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-Do-not-use-host-include-path.patch
@@ -0,0 +1,32 @@
+From 0cf0a05bf5e8c49debfccb5a8ac1ab5024478eeb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 6 May 2019 22:42:07 +0200
+Subject: [PATCH] Do not use host include path
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 93896ae..40b92d7 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -140,8 +140,7 @@ appstream_lib = library ('appstream',
+     soversion: as_api_level,
+     version: as_version,
+     dependencies: [aslib_deps],
+-    include_directories: [stemmer_inc_dirs,
+-                          include_directories ('..')],
++    include_directories: [include_directories ('..')],
+     install: true
+ )
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/appstream/appstream_0.12.6.bb b/meta-oe/recipes-support/appstream/appstream_0.12.6.bb
new file mode 100644
index 000000000..8a0d18864
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream_0.12.6.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Utilities to generate, maintain and access the AppStream database"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Distributions/AppStream/"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPLv2;md5=4641e94ec96f98fabc56ff9cc48be14b \
+    file://LICENSE.LGPLv2.1;md5=435ed639f84d4585d93824e7da3d85da \
+"
+
+
+inherit meson gobject-introspection
+
+SRC_URI = " \
+    https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
+    file://0001-Do-not-use-host-include-path.patch \
+"
+SRC_URI[md5sum] = "ffd1555953828656971424ca5329f352"
+SRC_URI[sha256sum] = "ab20067036207aa0708608f87d6e2043ec46fad0b55b411eb1f242b8b9ab0d14"
+S = "${WORKDIR}/AppStream-${PV}"
+
+DEPENDS += " \
+    xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native \
+    gperf-native \
+    libxslt-native \
+    glib-2.0 \
+    libyaml \
+    libxml2 \
+"
+
+GIR_MESON_OPTION = 'gir'
+EXTRA_OEMESON = " \
+    -Dstemming=false \
+    -Dapidocs=false \
+"
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${datadir}/gettext \
+"
+
+BBCLASSEXTEND = "native"
+
-- 
2.20.1


