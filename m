Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74DC67721D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 22:49:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so2341474wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eiMB9RWxyjtWNiW9I07b1m2xyz+jzvYG3Bj6a5UN498=;
	b=Q534uvcSLc7LefhGBjLtlpP4PDjGpr+g63PkmvDB5jhqNx2Ci927EwnTtUiRHpRtIf
	RPfUSVNk/HitvI40fUwGSrs1a9MLWJFTs4lT+D/s7y0lkcXZM7SNvvWHeseUmu6nN4xQ
	vquAgumEW+Bt55MWqaOM+G480MUAMuytL1TnQoC55vvwGL4Re5pCDIi/RDBCawKbXggX
	NBg4YmlXJEVK9ovHnSj4dBBXCVYYN6v1R0Dbpl9qW6/SCWposCsR1eFiS4QSBgl0Bqi9
	BrXqvtqLAcxlWOCGIs4giu9L3/a1F9iaAXZ/SWMRZU5YTsfDZZEgUJyijgU0/HayvmOW
	za5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eiMB9RWxyjtWNiW9I07b1m2xyz+jzvYG3Bj6a5UN498=;
	b=t7aN6RW+jkikXkBmj4bF29zPAYvhlfKQlYGlSCvzvhu8SxkuH39S1EZmPDU0ns5zWp
	pSQrYL9qrt40leE7aU0HaTeawp5Zv+455BFLopnW4o03kVKJnhFVGKjUbj0hj9NEvwlP
	axvMTENAn3ySVkxaicFtePfMnUQF6EE0tK5WOo3D0Sz2c2YEj41kC9HdRtf7ReD4pmII
	Q5r36IBBYFGXyNiTN+OQm4D+GOvwzjCqNTECVRnw7+WjFeB67voYuuUGW3SkdGNj/GbJ
	+OYNFCnrgJ+0/x4rzri5Ku7p+9G6o97rhvpVkwd1uLFClLmOpIPf6KzrKkBAgPAXR3cL
	onrg==
X-Gm-Message-State: AKaTC001G+MxJ4OFoMF1RS7FO8fbp9ocYV1L3nKgBEIA8DN52J2fyZtQJuK5M+w5G2/jlw==
X-Received: by 10.28.139.12 with SMTP id n12mr9037348wmd.79.1481755796859;
	Wed, 14 Dec 2016 14:49:56 -0800 (PST)
Received: from localhost.localdomain (p579CE070.dip0.t-ipconnect.de.
	[87.156.224.112]) by smtp.googlemail.com with ESMTPSA id
	d64sm9625699wmh.3.2016.12.14.14.49.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 14:49:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 23:49:37 +0100
Message-Id: <1481755778-16443-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-browser][PATCH 1/2] firefox: fix configure with oe-core master - there is no nss-config
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
X-List-Received-Date: Wed, 14 Dec 2016 22:49:56 -0000
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
2.5.5


