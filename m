Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 619B461121
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:08:49 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so5003688pjr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tTTeZPWwKYhaTr+w9qbIlNxByKW8BOqdPPpC50e9gsE=;
	b=IQ3J8wO1ki9R1Vp7vHWL68crDAtdPQgN8sF+rYuV95hl46er1pJ256Um/gYg6UIkbA
	CaZxB6HozKT16KMYCQ7fQZhFWdvlExs2St9Qia2QVMw/ILPmGTmxOc71vv8WpLBka17I
	6TkmuSphBhyzJTzTOif+gtbXYVaYFgbBOD+iFYxqHOQreybzYoCSrmFEjk2T8HgkvLDe
	zlQ4kbfPmbRBo0Aymfk3vUdQXkDyZyC1UYGwNWtsG7X2J/3V5Awy1itFgNHYY/bDOl5n
	M8u/ANUBif8Xa6SW9kTWulTdoqlWPdYnF+PNHxE41ZwmmDAYZznnhR8GxYdbpnTc6uOg
	3Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tTTeZPWwKYhaTr+w9qbIlNxByKW8BOqdPPpC50e9gsE=;
	b=Lw7NByYws30+Q5Hj6d9J4ED76EQtXFrcFaagcK7Y81DZnGiJ+U12/vGqdc2NnQfYSo
	isJdq4KhHW/ynkmMd87efBh8sNEEWvDFEjr6PZIH/hYtzKJyA8fYoY9L8PvkTKYBtV+P
	5wEYCwE433ItJ2HqdNCenxoLNZywSETeOXXfYw2U/6j4wKMj1YBhFn19Q7HxPvhfpK8q
	6mkupVpQlGw4hzdXXMYYFrPBVYb4Ag7QJdrl7LXt1LpLWHq1Nr1C7945yjv4CP07XCJ0
	DE/6o/VgNfIiZnGgoGUyYY+CO9S+BgtkXHSZCbq71qDlVOglx4xV/5m6fFKzPon2tGXZ
	1k0w==
X-Gm-Message-State: APjAAAWtQVohQWRn2qjP7u4KdHLWCrXh+vdyvlR5gEl57VaWhRQSMOmN
	EQfWwb6mEX1ZYIvxVScOrW8iVXy4PIw=
X-Google-Smtp-Source: APXvYqzZUsTamrBru0CtF7bXmVst2KJ5NkR47WU1wwxWgN6hs0I4Z9spD59q2vuUH2oh0X+T0lnyUA==
X-Received: by 2002:a17:902:b617:: with SMTP id
	b23mr7235436pls.285.1581754129933; 
	Sat, 15 Feb 2020 00:08:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	i27sm9628451pgn.76.2020.02.15.00.08.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 00:08:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 00:08:46 -0800
Message-Id: <20200215080846.732993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpv: Fix build with python3
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
X-List-Received-Date: Sat, 15 Feb 2020 08:08:49 -0000
Content-Transfer-Encoding: 8bit

Use bootstrap.py to download right waf version
turn the python3 patch into a sed command

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/mplayer/mpv/python3.patch  | 12 ------------
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb  | 15 +++++++--------
 2 files changed, 7 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/python3.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch b/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
deleted file mode 100644
index df208cf878..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/python3.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Use Python 3 instead of Python 2.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/waf b/waf
-index 6ce2a24..de3c898 100755
---- a/waf
-+++ b/waf
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index bd2e389fee..066e18aa86 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -17,11 +17,7 @@ LICENSE_FLAGS = "commercial"
 SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv \
-    https://www.freehackers.org/~tnagy/release/waf-2.0.19;name=waf;downloadfilename=waf;subdir=git \
-    file://python3.patch \
 "
-SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
-SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
 
 S = "${WORKDIR}/git"
 
@@ -102,11 +98,14 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-adjust_waf_perms() {
-    chmod +x ${S}/waf
-}
+do_patch[postfuncs] += "get_waf"
 
-do_patch[postfuncs] += "adjust_waf_perms"
+get_waf() {
+    cd ${S}
+    ./bootstrap.py
+    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
+    cd -
+}
 
 FILES_${PN} += " \
     ${datadir}/icons \
-- 
2.25.0


