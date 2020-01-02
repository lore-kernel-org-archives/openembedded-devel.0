Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3271F7FBFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:47:50 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id a6so17342374plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OfeWCoFvMIPbaubS8Jq9XqgvGN5Pt4nXgjaSzwNxmeE=;
	b=DI4HrSI+f4+KSPxi/UcrVHTczv5/yOsAjZgynxCsh1uzMQKmzMKxneO+fy2kNNNt2M
	zIc0UvVJWhSDB3IalyTCbte6jyodvrfrIMy+z0T+S9QCBfUQcGUKnj9ohR0CLwd970Ld
	Rql1pRLuRr8OP8TlhKWJNzr3607h1Q+8c7VqHWzXVD6gQTM7Zi9IngYwa6gYVuM8d0FM
	UpV+/jGxBJTIvRARtp9+z3nrv8RA3H1S4Izz3qKJpRzrCFYVGlYZ1U+JDADCQgHA1i1u
	vz7jo+ptgEX31VfS1W2zHArgJDfF8zPRjtlR9PnQjdq115vjGVLUxpUxk5aD9Ivnjesr
	y/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OfeWCoFvMIPbaubS8Jq9XqgvGN5Pt4nXgjaSzwNxmeE=;
	b=Ega82BvYBxPRSF0+ViNOH70lyuq9JLAMn5j/IUmjcr/8DKCdojYVjK/ZasrQc3l6bn
	OG8rE9r0tGFZ6VCcXXqoQM5rPXQIG/2mPXBPmwqQiv/yYKWoufJXDXdG8brfsu3nHY9m
	o8octMrWXxYw1KcNm5/TAwSqKySLXhebJXQwhLuTs4Tjc5bnYzNnFFI8KraITMFT/FHD
	2emuUbYm31jRN01FfyQXEww8gwAtJKZ6DXCmqANJmM216kDqMvRTlsZ5cfnRHYQH+TfY
	ndJR47Ph6O+A9ag+Mpr9Qv/y3phP5t13e9uDE0Fg6XXqpKkc+rQG0hzaOrNYTLCeuyPw
	JhwQ==
X-Gm-Message-State: APjAAAXtBGqla5UTpYFUaqBqX1tQ3vD1lCxMD6ju4kt3Hcv/3K+f7Sv4
	Eo0VXXKkXu4XiYfcTeXuFXdHgQH0k8U=
X-Google-Smtp-Source: APXvYqyyaIi9PIgZ1EUCpfjCqWlIOM5x3ipAm8ZcdoEuvHiGsutHuV4RTZUMuVqQKmYz6Uy/rcB8+w==
X-Received: by 2002:a17:902:8e87:: with SMTP id
	bg7mr60607677plb.279.1577987270879; 
	Thu, 02 Jan 2020 09:47:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	l14sm58566815pgt.42.2020.01.02.09.47.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 09:47:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 09:47:42 -0800
Message-Id: <20200102174742.2228874-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102174742.2228874-1-raj.khem@gmail.com>
References: <20200102174742.2228874-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH v2 4/4] vorbis-tools: Use external gettext
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
X-List-Received-Date: Thu, 02 Jan 2020 17:47:50 -0000
Content-Transfer-Encoding: 8bit

Fixes build with gettext 0.20.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not remove intl/ directory

 .../vorbis-tools/vorbis-tools/gettext.patch   | 37 +++++++++++++++++++
 .../vorbis-tools/vorbis-tools_1.4.0.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
new file mode 100644
index 0000000000..b61ce7c184
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
@@ -0,0 +1,37 @@
+Fix build with gettext 0.20.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,8 +2,8 @@
+ 
+ AUTOMAKE_OPTIONS = foreign dist-zip
+ 
+-SUBDIRS = po intl include share debian win32 @OPT_SUBDIRS@
+-DIST_SUBDIRS = po intl include share debian win32 ogg123 oggenc oggdec ogginfo \
++SUBDIRS = po include share debian win32 @OPT_SUBDIRS@
++DIST_SUBDIRS = po include share debian win32 ogg123 oggenc oggdec ogginfo \
+ 	vcut vorbiscomment m4
+ 
+ EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES vorbis-tools.spec config.h mkinstalldirs
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,7 +31,7 @@ CFLAGS="$cflags_save"
+ AC_PROG_LIBTOOL
+ 
+ ALL_LINGUAS="be cs da en_GB eo es fr hr hu nl pl ro ru sk sv uk vi"
+-AM_GNU_GETTEXT
++AM_GNU_GETTEXT([external])
+ 
+ dnl --------------------------------------------------
+ dnl System checks
+@@ -383,7 +383,6 @@ AC_OUTPUT([
+ Makefile
+ m4/Makefile
+ po/Makefile.in
+-intl/Makefile
+ include/Makefile
+ share/Makefile
+ win32/Makefile
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
index 8e9914b498..89e66528ac 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
@@ -13,6 +13,7 @@ DEPENDS = "libogg libvorbis"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch \
            file://0004-Fix-format-error-blocking-compilation-with-hardening.patch \
+           file://gettext.patch \
           "
 
 SRC_URI[md5sum] = "567e0fb8d321b2cd7124f8208b8b90e6"
-- 
2.24.1


