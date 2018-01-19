Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 760D5787CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:19:48 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id d9so1892520wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 07:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y5TFMoMwQRGZ9ayIv9YPjn87atE3PfVCkFDLUUWgkyQ=;
	b=t5+Z6vcvz3KX26LuK2l3AwcGMCIngrEga4WmLrPQmcKZTdx/E6V81H38CuxFmMRaBj
	+haNEITnaF21lIz2mNGAY/KAcXWp1bLkf3mMHHauSCpFn646yC8agFNUgOQ+/PpsoWcJ
	8nrs1jvuy6xIDDvEnFq1cbzqydLHiDZ7OBocYJdGFW/KQb/0pPvk7OhME6H7LG1eVUoB
	vusBdA+JuQ3jP6Tsm/yrs3yxp3ByfmctPtjvg9QAe4CJVafQnMJyjVIBWdGAe7/Y2IcA
	tyIQuipKfkXA8FeXdzbPiueDFH+rtAFfACIYwUsfisn/plU8c7mMD4/ng9OfwnZgUYFt
	m5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y5TFMoMwQRGZ9ayIv9YPjn87atE3PfVCkFDLUUWgkyQ=;
	b=jaxmpt39GqxU0lO8IpKdgDM15PJ4lHXX/MKyKXavydEgIL8Z/sVIZej3UPQK1NxJJS
	oy1BulVfTmNhN+diOBm8BBAGFrM59iI8NbJn4oYXpAD2T47Nw58ENHJy0a6keYmkFEUX
	lFCorJ2ehxTCCcPh+k5KZV9oBsdqSDUqJD7IiCSVSKMd9a6nIdgYiliNH3PI7oM+TL94
	afcfFaJ9Iq0GWug8w9xs0yMbL3w3Wgvp8jta/HpoTVp/p17iKLaygsiJAXW3ptGilx+l
	xA5WKTtdW+03cgakgWjRESLXMFLMb1gJx2ut69PTeMZRmV5vW/qmrm6TzzLKnIp3Lmaw
	JPfg==
X-Gm-Message-State: AKwxytcw4P797n7moXo5szE4+JlnFBz9yVTSclMsoY/9sywAOmmer4E0
	3/eydJnCZLHspF/Ns274fABjzg==
X-Google-Smtp-Source: ACJfBoscAJB67zVg1ury7M2ETVtIxbMajUfrQ4xiCS1zFOdndxm0cH6EYCQlLJRLIRuEOUb0v23oKg==
X-Received: by 10.223.189.130 with SMTP id l2mr10165248wrh.61.1516375188922;
	Fri, 19 Jan 2018 07:19:48 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i1sm22496189wrh.96.2018.01.19.07.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Jan 2018 07:19:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jan 2018 15:19:42 +0000
Message-Id: <20180119151942.19731-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180119151942.19731-1-Martin.Jansa@gmail.com>
References: <20180119151942.19731-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] xorgxrdp: add distro_features_check for x11
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
X-List-Received-Date: Fri, 19 Jan 2018 15:19:48 -0000

* fixes: following errors in every world build:
  ERROR: Nothing PROVIDES 'xrdp' (but meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb DEPENDS on or otherwise requires it)
  xrdp was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xorgxrdp', 'xrdp']

  ERROR: Nothing PROVIDES 'virtual/libx11' (but meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb DEPENDS on or otherwise requires it)
  libx11-diet PROVIDES virtual/libx11 but was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
  libx11 PROVIDES virtual/libx11 but was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xorgxrdp', 'virtual/libx11']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
index 20cf45f06d..6150865795 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Xorg drivers for xrdp."
 
 LICENSE = "X11"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007"
 
 inherit autotools pkgconfig 
 
 DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 
-SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
-           "
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
 
 SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
 
-- 
2.15.1


