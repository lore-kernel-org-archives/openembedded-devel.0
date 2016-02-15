Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9B56E682
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:18:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g62so77367997wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bSe3KssRaiBnRbyh3KJNudczadBfjBtditLtiG8bvD0=;
	b=TjN1QB7NL5XYQPiud5/Bo6G4mgWdS2DWDQZUicpWjskVsCQTfNjvPg1Ig2zcLGn6mT
	m7PX3AOtsZflbkNj3nUhcJla5GYvI94AthlUK6vEok/pWfSqyxzJyerJekzHeIawzAHj
	2ZWFDSaJzvsYv9dVV5D/SnGtOa3ooRO//xMwkA50LFxlHz/bMh10LN6BRkrUECEv4INY
	2/wgiIHDV2MayCTRM+ghzr9jrWX4JsSOhpF7hnvPEtoRi/bnajw4Y2In4Ak//fQ66JVG
	4EJPhla8YPKb+h2UNoShQ6glULeQaAusfUCIuNpyMikF8zEfexG20v7Fd+CrzKAGgAgH
	QXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=bSe3KssRaiBnRbyh3KJNudczadBfjBtditLtiG8bvD0=;
	b=bMintErFA8yrnLpnkzWq7Mv/7KCzCfs7L54oWzdiaDq8/C+9WvkUtich+akqVgkovY
	Z65BPwXvLJGjmT7VLK2XULHTvklOsTl7iW/TWzUDim1eFrw/rgkQMdNt8Nq1wlfuV2Ah
	S0IGi4FOQElj6FfZmEea8YkxIc7G8TW+ywUTEcd9kZVn3q5L0oC0MU3Qvb0kDvfaA2SU
	25HtQv2r8rO7HrxygZEe8bXnK8gxEpgYbWyMSV2AUyjLMf8hUG+0RPrnSTB/9GwZk//1
	uqADCqBYyfDgKyrQAvaRIYKC1XL6Y2iaS2yvvH85YheFE89ejsejdLQ0bTMGywL9YttV
	+5yA==
X-Gm-Message-State: AG10YOThVqqHPg8mexsFOCNoPcpLx/K56xVwE1PCySKQ5fcKlxFPzxs9Ja8oncHQ+k+PQA==
X-Received: by 10.28.65.5 with SMTP id o5mr15693810wma.75.1455571081144;
	Mon, 15 Feb 2016 13:18:01 -0800 (PST)
Received: from localhost.localdomain (p5B0A09DF.dip0.t-ipconnect.de.
	[91.10.9.223]) by smtp.googlemail.com with ESMTPSA id
	t8sm25773276wjy.41.2016.02.15.13.18.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 13:18:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2016 22:17:49 +0100
Message-Id: <1455571071-10666-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libsdl-ttf: update to 2.0.11
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
X-List-Received-Date: Mon, 15 Feb 2016 21:18:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Licence changed to Zlib [1]
* patch does not apply anymore and does not seem to miss

[1] https://www.libsdl.org/projects/SDL_ttf/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libsdl-ttf/files/configure.patch               | 52 ----------------------
 .../{libsdl-ttf_2.0.10.bb => libsdl-ttf_2.0.11.bb} | 20 +++------
 2 files changed, 7 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsdl-ttf/files/configure.patch
 rename meta-oe/recipes-support/libsdl-ttf/{libsdl-ttf_2.0.10.bb => libsdl-ttf_2.0.11.bb} (55%)

diff --git a/meta-oe/recipes-support/libsdl-ttf/files/configure.patch b/meta-oe/recipes-support/libsdl-ttf/files/configure.patch
deleted file mode 100644
index de88f0a..0000000
--- a/meta-oe/recipes-support/libsdl-ttf/files/configure.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Index: SDL_ttf-2.0.10/configure.in
-===================================================================
---- SDL_ttf-2.0.10.orig/configure.in	2009-10-12 23:06:38.000000000 +0000
-+++ SDL_ttf-2.0.10/configure.in	2014-07-17 12:33:34.011662505 +0000
-@@ -1,5 +1,4 @@
- dnl Process this file with autoconf to produce a configure script.
--AC_INIT(README)
- 
- dnl Set various version strings - taken gratefully from the GTk sources
- 
-@@ -11,12 +10,19 @@
- # if backwards compatibility has been broken,
- # set BINARY_AGE and INTERFACE_AGE to 0.
- 
--MAJOR_VERSION=2
--MINOR_VERSION=0
--MICRO_VERSION=10
-+m4_define([sdlttf_major_version],[2])
-+m4_define([sdlttf_minor_version],[0])
-+m4_define([sdlttf_micro_version],[10])
-+m4_define([sdlttf_version], [sdlttf_major_version.sdlttf_minor_version.sdlttf_micro_version])
-+
-+AC_INIT([SDL_ttf], [sdlttf_version])
-+
-+MAJOR_VERSION=sdlttf_major_version
-+MINOR_VERSION=sdlttf_minor_version
-+MICRO_VERSION=sdlttf_micro_version
- INTERFACE_AGE=0
- BINARY_AGE=10
--VERSION=$MAJOR_VERSION.$MINOR_VERSION.$MICRO_VERSION
-+VERSION=sdlttf_version
- 
- AC_SUBST(MAJOR_VERSION)
- AC_SUBST(MINOR_VERSION)
-@@ -25,6 +31,8 @@
- AC_SUBST(BINARY_AGE)
- AC_SUBST(VERSION)
- 
-+AC_CONFIG_MACRO_DIR([acinclude])
-+
- # libtool versioning
- LT_INIT([win32-dll])
- 
-@@ -42,7 +50,7 @@
- AC_CANONICAL_HOST
- 
- dnl Setup for automake
--AM_INIT_AUTOMAKE(SDL_ttf, $VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- 
- dnl Check for tools
- AC_PROG_LIBTOOL
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
similarity index 55%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
rename to meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
index ad3792e..0249abe 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
@@ -1,33 +1,27 @@
 SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl freetype"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
-
-PR = "r2"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING;md5=22800d1b3701377aae0b61ee36f5c303"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
-           file://configure.patch \
            file://use.pkg-config.for.freetype2.patch \
 "
+SRC_URI[md5sum] = "61e29bd9da8d245bc2471d1b2ce591aa"
+SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7"
 
 S = "${WORKDIR}/SDL_ttf-${PV}"
-EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config "
 
 inherit autotools
 
-TARGET_CC_ARCH += "${LDFLAGS}"
-
 do_configure_prepend() {
+    # make autoreconf happy
+    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog
 
     # Removing these files fixes a libtool version mismatch.
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
 
     for i in ${MACROS}; do
-      rm -f ${S}/acinclude/$i
+        rm -f ${S}/acinclude/$i
     done
-
 }
-
-SRC_URI[md5sum] = "814e6e17e8879254208d23b3b7e0354b"
-SRC_URI[sha256sum] = "7d38704bcc7c34029c2dcb73b2d4857e8ad76341c6e0faed279eb9f743c66c6a"
-- 
2.5.0


