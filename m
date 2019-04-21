Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 769776D73C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Apr 2019 12:58:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t17so12701816wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Apr 2019 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k73TniQPsh6UD2nt7lIsKvPEKCR121w+YAf501jLV8E=;
	b=OUREoUmv6kBKmVujxGCqyj7NC6/SVRRqNHYDL7gYWh5EWXcpGYZy7bUyg+K5xFFtYL
	JSM3PCzfgsq46JGdVF8F5lRrIoyIQ0/ZsGzI7+o0VBEuMZiawLbkwFZqoTyQyMdnsHtM
	I4aBEvVjghaiPA6ED8Qf7vLqoG9zpnuxN28rwMi7Hk+AOIww5Ov3O/kOUL76jU4uv0cQ
	tISB8raNDN+fK3/TQdxsCG52tUI1MctUuWjh5WO6tk0AZxoQP8C0V+FEwRFNaVFVLChV
	A9MtyArE4A40ebqJqWv+H15n/vpjOHdb4azRQm1PlUruVQvhhh9CuJe5qbsV2+gOFfDg
	XwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k73TniQPsh6UD2nt7lIsKvPEKCR121w+YAf501jLV8E=;
	b=EkczHuQY3dmZVi8HRWYY3ncSTySsBVAQ5Tm2rNUttspJU/iVI/Aopt4Wwm99DgjjzZ
	A6Mj6SzUppG2reiNLCttC8qZXHPu0RKrdP0wSoV9H4X+gOyhvq6C+Ehn+4woPHy8nf9c
	ZmUol1SjEb4kDJFTxcOEtKFjNj5Z8oNyICenXtUcF8l/RZWI1kAVulukZRP46ZK3/m6o
	6WTbC5O6Zf3fLmZgs+ADh5W+jRdy8ix4OeK9ZW/bd5xnyVde1uZk90KbgYaZN3kK9d5X
	gOJ5drAvLOZLKt2h4zNVSkp2+4GD6EFJZ6O7Bbo9b8kyE6LsYBi5e5k4RF5IMhnfTmzQ
	pwSw==
X-Gm-Message-State: APjAAAUtCxN8EW2tP/H8E/tm/zgFYZe93mlevFqlqwxZyCeBP0PYFGKG
	Rjs15Plt09B7hLZB6W/10MFz0cVA
X-Google-Smtp-Source: APXvYqwLdjGrjhKpeDquUYyw0Dd6RR2ptb/cTs5u9h43Z80Nv6QjZ3mtF+UbzSH1mlYhjtScYrmBmg==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr10335404wrr.1.1555851536919;
	Sun, 21 Apr 2019 05:58:56 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0F10871B60A041D40E8A5E.dip0.t-ipconnect.de.
	[2003:f0:7f0f:1087:1b60:a041:d40e:8a5e])
	by smtp.gmail.com with ESMTPSA id
	f10sm10717679wrs.17.2019.04.21.05.58.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 21 Apr 2019 05:58:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Apr 2019 14:58:48 +0200
Message-Id: <20190421125848.2390-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] fluidsynth: upgrade 2.0.4 -> 2.0.5
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
X-List-Received-Date: Sun, 21 Apr 2019 12:58:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes are found at [1] - upgrade can be considered as bugfix release

[1] https://github.com/FluidSynth/fluidsynth/releases/tag/v2.0.5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 810ca997e..234be02ca 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "9671e412feedb90325e038c3aaf5d543eebc20c0"
+SRCREV = "7f11a9bf5c7304e04309a6ec9fc515ee815524bf"
 S = "${WORKDIR}/git"
-PV = "2.0.4"
+PV = "2.0.5"
 
 inherit cmake pkgconfig lib_package
-- 
2.20.1


