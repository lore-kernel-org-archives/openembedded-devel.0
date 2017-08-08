Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6268F779C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:39 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m85so17499494wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zKI7YvGh6HCs8IQxF5ComCgaHfGT6RlVHdePkTITevs=;
	b=NqS9S5i9RMF96DEtKeOsUsoKGEv5s5vwWLsvCPka1RD7zsAm5m+eAKH81HpOlaWg8n
	jdTTRAHiqCwJCxYfPr94NSkPb5xfk62m1i2qnVmu+8OaVvwEM/kEUnvLCxmrvdVyxHDX
	/9UZKnae8NnXviIppJA6tZwhgr23mN+Xi7oo9J3sSvGDnS7b4+ef92fW2i6S3AGkvATA
	V4ibpa2nbL71d7/jh15RyakSKL34clH54fJDrP8aBS7keAVtHFWcisRL9W21EHh6bzcd
	L0uIHJjT7SAb6xFlwg4BgmtkcLRQhuOZ1Cfe6EfGwTRHiMAJb2mI12zTmZv7x05st1gY
	HV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zKI7YvGh6HCs8IQxF5ComCgaHfGT6RlVHdePkTITevs=;
	b=QBMjHNB98nH+VBbNFgf2jJf0iZ8sAfHwbyaympyErMjvWcrHFncgZ8En3pzPnXy1Pe
	KO2BV3Jhu4bF5DgOA6TO+6/hi55LKHMPUTRq/Iv2gSyfAvgY758QeosBDC9YF6jEGfQf
	OMHMOmSak0DuJltbzWdnvkmJ21DOxSyxjXzpw+O2zYGrDD4NyNlpnKCX1ze6XWBGAvfv
	xvaB0Mf5SYxr9dWOglS/hvmu69RDIXLx5uamL4ktU2cgId+DDMckU9UzUiPTNGPgEimo
	sCwU4inrCVTqIcQo7b+E/vgL1bNcRqniohXVSm7N9aAOnAUc2Xi/LtVFEHZYKn+2pG4r
	fbRQ==
X-Gm-Message-State: AHYfb5hEIcBAyF1SIMbUlqUZzv5CZ8XxCrCMXBZ33X0mpfHYVDiuoCue
	35zz5sPh07tu4dBi
X-Received: by 10.28.229.197 with SMTP id c188mr4449498wmh.77.1502228319977;
	Tue, 08 Aug 2017 14:38:39 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:19 +0200
Message-Id: <20170808213821.17561-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] xfce4-screenshooter: update 1.8.2 -> 1.9.1
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-Makefile.am-create-ouput-directory-for-desktop-file.patch was applied
upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...m-create-ouput-directory-for-desktop-file.patch | 29 ----------------------
 ...ooter_1.8.2.bb => xfce4-screenshooter_1.9.1.bb} |  6 ++---
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.2.bb => xfce4-screenshooter_1.9.1.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch
deleted file mode 100644
index 62bffef..0000000
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c85bf7cc5c1e1780d215f6fe233e3ed4597c72ed Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 21 Sep 2015 06:54:28 +0000
-Subject: [PATCH] Makefile.am: create ouput directory for desktop file
-
-Upstream-Status: Submitted [1]
-
-[1]: http://bug-attachment.xfce.org/attachment.cgi?id=6460
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index a22fc20..2ef0e54 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -122,6 +122,7 @@ app_desktop_DATA = $(app_desktop_in_files:.desktop.in=.desktop)
- 
- src/xfce4-screenshooter.desktop.in: src/xfce4-screenshooter.desktop.in.in
- 	$(AM_V_GEN) ( \
-+		$(MKDIR_P) $(dir $@); \
- 		sed -e "s^@PLUGIN_PATH@^$(libexecdir)/applications^" \
- 			$< > $@ \
- 	)
--- 
-2.0.1
-
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
index d1cb684..06dea64 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
@@ -7,10 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI += "file://0001-Makefile.am-create-ouput-directory-for-desktop-file.patch"
-
-SRC_URI[md5sum] = "3a32ecc5566453a58f6a4ddd70649444"
-SRC_URI[sha256sum] = "9dce2ddfaa87f703e870e29bae13f3fc82a1b3f06b44f8386640e45a135f5f69"
+SRC_URI[md5sum] = "75e1501418f904769e4fd25eff6a3946"
+SRC_URI[sha256sum] = "e62b31d9cf06a7414a26400c2ebe7a2ae7c2b22aa60f997f25145ea9ebe6e0db"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.9.4


