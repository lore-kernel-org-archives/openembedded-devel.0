Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83E387F93A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 22:05:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t26so11323240wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6P0BVjsi5N3ZYULhs44YaN0Avg8niHZgv0TFEBbGX0U=;
	b=qsZZYh2RAufBzqUvmirRyUrXwlVY0nQFOJSkLTARfvb7IO6JtaykxLrSM2idIDkQAW
	/gl3Hkaat3hRMOTINNl7E9Phzmg9evHjxF3G+2Kwk/wU/oCQRxEl4m8KgzZMcPPsUjmG
	Z+Tu83Eg+gUfc/2f67qvSaHW5usFq1xf0gOqJeGP7Au4YzE8PjufW/nl8Z1r6QESWT9O
	J+Rjnr+5AYEtFnQOf0afPucPPH4DUiBEJmWW3UeGtK/k5jV8+rFcSk1IXW8VfzpiEyRj
	1UA6CQRuTeM24EK1EGNrhd5huQL3OZyv4gAnldOAuV69ciU68L6f6PNKrAC3ujpZMyIq
	BtHg==
X-Gm-Message-State: APjAAAU6M0JnRrDWxJ97HbOwmwBJBScrZKTRj0FpOE6UmhNDQPkrbYen
	MlzVzOywBGHmXfYufTkVA6YhRYHR
X-Google-Smtp-Source: APXvYqyfS6BHEvzds2p34GM1goD3lVwv2tAog8jn9SEP7xZ2mha/MsdnL8ESg068d0fN3xzXeyC8zQ==
X-Received: by 2002:a1c:7e91:: with SMTP id z139mr17826171wmc.15.1573423513079;
	Sun, 10 Nov 2019 14:05:13 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t24sm29925375wra.55.2019.11.10.14.05.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 14:05:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:05:08 +0000
Message-Id: <20191110220510.10077-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191110220510.10077-1-git@andred.net>
References: <20191110220510.10077-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] nodejs: allow use of system gyp
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
X-List-Received-Date: Sun, 10 Nov 2019 22:05:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that there is a gyp (python2) recipe in meta-python,
allow its use instead of the bundled one for when
meta-python is enabled.

At the same time, unconditionally inherit pythonnative
as in either case gyp actually uses python, and the
build machine's python and installed modules should
never be used.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 53149af5e..7c3728cc6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=be980eb7ccafe287cb438076a65e888c"
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
-inherit pkgconfig
+inherit pkgconfig pythonnative
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -52,6 +52,7 @@ ARCHFLAGS ?= ""
 
 PACKAGECONFIG ??= "ares icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
+PACKAGECONFIG[gyp] = ",,gyp-py2-native"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
@@ -77,6 +78,8 @@ python do_unpack() {
     shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares', True)
+    if 'gyp' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/tools/gyp', True)
     if 'libuv' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/uv', True)
     if 'nghttp2' in d.getVar('PACKAGECONFIG'):
-- 
2.23.0.rc1


