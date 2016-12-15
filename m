Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 48D39772E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:52:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so7985840wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fwTZQNyn16dmaR3mOruZNvK5jJ3/sm5Maqj5sKIbg+w=;
	b=TyNVwTtWdsCaWlX6rxm0ChAYlRaZsJBAeSJ4KysO6yc9Lv9x+BfrD/+ngjiMo3YG8W
	2SasclH4kbnYNjmyJR66BQ9N6qOr1cTApW0TSgmlsA6JUthzwwTvCLNYxQc9I/1zculH
	zicWroVDhSFMO+DfMTPPAwYaJN2xdFIRg4XWwzpjif7114ZTqybv4M+J1XrF9klXS1F0
	DqEWsrDU7JyY0BhFJDvC9qnaUeiSPOt0xEdBJDcU+iR3FI1zMxtODH/HC2lv51qBZHXA
	xYoXguVcmOlAPznUWebI5J+Ul2tNDMWrbjiAXaanIDNQtT5sDB9JjhKULDSU2ialBWcT
	GnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fwTZQNyn16dmaR3mOruZNvK5jJ3/sm5Maqj5sKIbg+w=;
	b=XUTkbyxGR09Hm5wVukLCM19Y+vyFW2WS79ffOlHxFo0YEwiD2bicUic0XlCT7eTnsn
	aRV6841l5p0nsAAkuTTNYvlv2iw2pX96dULuMwxUaMk5gQR+IfZf4Dg+h37fAhWzvBmm
	9Yln7C8Ya8SEh21B0hGfXcib8CUKLsfpUc2Y9ZC9sCVy6UZlHwhujG7QU9yOyrakpYyt
	/4ffB1hMRYxMQIBJPds2tHLlLPb2DTnmktfXKjsVsWgYQY8c4UGCa1Vxm4urt4AG2sKg
	VXF08//PIcoDMIImgRVfWbnxqPrqtL3WXxt+IFggLfqI5wPqeVghLbstcYw79ZULDYLX
	7k0w==
X-Gm-Message-State: AIkVDXLt1dpf+rZ87aMTUF2OT+vJEYNU2xv6E/jeIJ918b1e8BPiUYuqFaVxZJCS8HfxRA==
X-Received: by 10.28.156.10 with SMTP id f10mr2609621wme.63.1481824342859;
	Thu, 15 Dec 2016 09:52:22 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	e5sm13482891wma.12.2016.12.15.09.52.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 09:52:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 18:52:09 +0100
Message-Id: <1481824331-347-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH V2 1/3] firefox: fix configure with oe-core master - there is no nss-config
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
X-List-Received-Date: Thu, 15 Dec 2016 17:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| configure:15633: checking for NSS - version >= 3.21.3
| configure: error: you don't have NSS installed or your version is too old

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch

diff --git a/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch b/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
new file mode 100644
index 0000000..8bb6c55
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
@@ -0,0 +1,47 @@
+From f5533e4f2ac147256f7c41166ae1ef98f41d7f39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 14 Dec 2016 21:37:03 +0100
+Subject: [PATCH] use pkg-config to find nss
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index c27acdd..16133bf 100755
+--- a/configure
++++ b/configure
+@@ -15630,7 +15630,8 @@ fi
+ 	min_nss_version=3.21.3
+ 	echo $ac_n "checking for NSS - version >= $min_nss_version""... $ac_c" 1>&6
+ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+-
++    NSS_CONFIG="pkg-config nss"
++    nss_config_args=
+ 	no_nss=""
+ 	if test "$NSS_CONFIG" = "no"; then
+ 		no_nss="yes"
+@@ -15638,11 +15639,11 @@ echo "configure:15633: checking for NSS - version >= $min_nss_version" >&5
+ 		NSS_CFLAGS=`$NSS_CONFIG $nss_config_args --cflags`
+ 		NSS_LIBS=`$NSS_CONFIG $nss_config_args --libs`
+ 
+-		nss_config_major_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_major_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\1/'`
+-		nss_config_minor_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_minor_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\2/'`
+-		nss_config_micro_version=`$NSS_CONFIG $nss_config_args --version | \
++		nss_config_micro_version=`$NSS_CONFIG $nss_config_args --modversion | \
+ 			sed 's/\([0-9]*\)\.\([0-9]*\)\(\.\([0-9]*\)\)\{0,1\}/\4/'`
+ 		if test -z "$nss_config_micro_version"; then
+ 			nss_config_micro_version="0"
+-- 
+2.5.5
+
diff --git a/recipes-mozilla/firefox/firefox_45.5.1esr.bb b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
index dd98282..d384786 100644
--- a/recipes-mozilla/firefox/firefox_45.5.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.5.1esr.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
            file://Fix-firefox-install-dir.patch \
            file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
+           file://0001-use-pkg-config-to-find-nss.patch \
            "
 
 SRC_URI[archive.md5sum] = "ec943bcff82e868d2f5e95dde7edb83f"
-- 
2.7.4


