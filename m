Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7AD746E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 May 2018 01:39:42 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c2-v6so34331146qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 May 2018 18:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Q05UNcSaxOMyV69ZCYyk30tuXFlOL10zpoleLTxjuzI=;
	b=SDwdr1tWBGzAS2eyPbkDP/O5tIouAkbwdP1hVi7LC51ocSUDLq3IO95a/HbZGnmfuF
	iFmey/go0Iw4rwleykZ+5evppATcEzfJEAjLrARphUL/Dib+Y4y3R4i/nyR8+kxEMkwG
	+HFQSyLqu7EbGe0YeThQv3L7ngHCJRm2DWo93Q9GQTGdkAfN3rtowV4YJ+zpf/iQQsZT
	eguHv7dfCgZjCBnBcDFjLUd5TooVcD1qnayf6zPBrAeCw3gJt6nV1pPbsd8tEWxiTl3H
	4FjciuOjnJJ7mNt+e3D+vH2+LjWFWYdgGBRXEOlt1dzd330SM7+hoiY0nQCYtOVaTFLj
	GmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q05UNcSaxOMyV69ZCYyk30tuXFlOL10zpoleLTxjuzI=;
	b=j55pMJqvm5qTZTI5lPZW9rYcvPCcezUURFfyu0jzYMvn+KOrNDAl/oLHcqIQX7JW0f
	wbWsEJvUYrNzwkooB31PGk/tG1XD4POLT6UOB/QUXwhvfELg8R854+w2iKksspzCN0B1
	JKz4sIuOfGgfT+lDsUn22c8GKQ4PPBRt5BJx0PPoU9owEk4JwXIjOdvp0fFlsCLJeyau
	c+pJ40f0nHrkApou+7tCqxXxOvszMchQLp4rnqPEHF2exB9+2EHvEgSjzEBdoGnFNOBL
	LDFPrqziczGPmNnyC1QWVuFFll2hfEk3Jl9AKO18SvcHw0bcODPa/KBm0GqljIXkm5l3
	c28w==
X-Gm-Message-State: ALQs6tBSjPzuhgE6IfYyuL1K6uGAXzwbw3WxmF6FWNZXVF2dFgNICUCp
	OGLNNO1H1ZXsFemTUBGrEYtDaVxS
X-Google-Smtp-Source: AB8JxZqEhYieXS1WgldVjzSqymN6F3jox7hzuhccC/JEdtrP7ew7xEqz1XwitZIkOoxPBFBBYaJL9A==
X-Received: by 2002:ac8:2187:: with SMTP id
	7-v6mr16526187qty.181.1525657183351; 
	Sun, 06 May 2018 18:39:43 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	t47-v6sm19247110qtc.1.2018.05.06.18.39.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 May 2018 18:39:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 May 2018 21:39:33 -0400
Message-Id: <20180507013933.16973-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [PATCH] xproto -> xorgproto fixup
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
X-List-Received-Date: Mon, 07 May 2018 01:39:43 -0000

In openembedded-core, commit 460a2b27af8d023b27703b491331c8cbe7aad0ff
deprectated xproto and xextproto for xorgproto due to changes in the upstream
Xorg project.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_330.bb        | 2 +-
 meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb | 2 +-
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
index 16f9b78824..c2feb81070 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
-DEPENDS = "libxaw xproto xextproto libxext libxau libxinerama libxpm ncurses"
+DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=f02ab9ebda87b770ecf711dbb3784a33"
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
index 7d26d141f3..3e5c31a05d 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
@@ -3,7 +3,7 @@ require recipes-graphics/xorg-lib/xorg-lib-common.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b0d5bdc98f7ebab3b6c3791d9bf40907"
 
 SUMMARY = "XFIXES Extension"
-DEPENDS += " xextproto xproto zlib"
+DEPENDS += " xorgproto zlib"
 PE = "1"
 PR = "r11"
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
index 8ba5ac354d..cb1ffcd8cc 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 SUMMARY = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxau xmlto-native"
+DEPENDS += "xorgproto virtual/libx11 libxext libxt libxmu libxpm libxau xmlto-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
-- 
2.17.0.rc2.3.gc2a499e6c


