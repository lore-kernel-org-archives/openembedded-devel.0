Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2DC7E65C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 21:26:11 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y5so11762580pfo.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AGyvyaUgqAOIgxqbsNk2/XCmvK2OrYbXbtenaKx365E=;
	b=bhjjDFPH6sjMBYNoAQ9EElTSZE1pWjO4+IaGf4qDQPlZ84GZCNrSSsJEGJVWeLIj4y
	vIqP1Srg3D8qHaU2xoAUT+JH/fKZcysl8SWzVcbvInSzYXMK1rh4kaXLUjq8AvYXnGhW
	t/DhshyUITL/LfkamWnI346zS+s6baRjAfWjUmI0+72d/nRQszq+5PK4phwAQ6gYWP43
	a1Mxgnw1Fh0/EX5UBSkOfAGlDoCtS+6NNebgPtF9B1clwNvnNuFNoqreIjSF6hQYndPn
	gAOkbN8TECnuvyje50+XKMl0sefR5bWlrLQnBRUsX30uYrCBMYBRGSXeHQXcYTWwjAd9
	4dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AGyvyaUgqAOIgxqbsNk2/XCmvK2OrYbXbtenaKx365E=;
	b=ldzmN+IDeDNu7yx9Hzufhsy52/5omD7LKN4RQg88ZuQuA0ApmtdIdYiSadme22FW/q
	O5FIx/TVI487DadfZlb5pWqXnjStzcCBfTa1KXGhpG0M/VmGeunW16Uzh8jq+PG7VNS7
	lpxIV8rvnN7nUhx8nVXYKetMmaptn6lM0892mRS0RoCatf+O6c8t0TicoWXUSidE/cXz
	xCgt+Z12lvm0T8pfZoPUJLIzUUTxCYt9lrTDqSVyrq5ng38ylKWUw4WKbx+bjHVEn9dX
	sdMsjEaMR2sPaSLBpHci+Jq6iLEgRpzN53Gg71ltWC6nhqiJ8R0gcQ5UBiZBEJ5HfRdh
	V3ig==
X-Gm-Message-State: APjAAAUE8+A5T28VkCx7CtZLx4WKaURKPxk9Ux85iRrVgfC8IeguCtMX
	W/+/Vw1ckIZtshgnaZzFph1THQQqLLc=
X-Google-Smtp-Source: APXvYqzzXf1gBlP4ANu5oJRVX1P5LbEwaEMIyfMhn/V1/w7SMX5pmZhGxVM/MduJ0AwkRxv6RUCx3w==
X-Received: by 2002:a63:ec13:: with SMTP id j19mr34378254pgh.369.1568237172536;
	Wed, 11 Sep 2019 14:26:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	h9sm18638511pgh.51.2019.09.11.14.26.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 14:26:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 14:26:05 -0700
Message-Id: <20190911212605.1435873-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openocd: Add --disable-werror always
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
X-List-Received-Date: Wed, 11 Sep 2019 21:26:12 -0000
Content-Transfer-Encoding: 8bit

toolchain-gcc override is only valid when meta-clang is included in
layers, but this knob is actually needed for gcc to work, so having an
empty override would not add this option while the default compiler
remains gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index ab2fd7f721..241b4baa33 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -26,8 +26,8 @@ inherit pkgconfig autotools-brokensep gettext
 
 BBCLASSEXTEND += "nativesdk"
 
-EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html"
-EXTRA_OECONF_append_toolchain-gcc = " --disable-werror "
+EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html --disable-werror"
+
 do_configure() {
     ./bootstrap nosubmodule
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/jimtcl/autosetup
-- 
2.23.0


