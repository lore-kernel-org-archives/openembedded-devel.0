Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 422906079E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:25:25 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id ay10-v6so3590419plb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nx8nkqJPDTi8IbagXT32NWM+G0mqu8g9NMxcRcZKzBM=;
	b=DECIusMbPEfFoBZItgPl54DFkMTSG2FWoRgNJkplsDTBgPqIrbg6QlnodWbfBWRNgn
	3bK1/30Twk/SyM+tBTCMbthBbi0zIlBjJJaXL2m1Bhe6h4AYRE895q7AbMH2qX9s0yKM
	mkYz2tG9NOy321ZP/cIHbjJorz3SiGcN9s66ynUr6K3f1jevbSQ3NCyki0akEF913YSr
	CB4S/QE3kexlqjlyqn6QjurzruFX6t18tPWsvPv+qjG7FyQ3bmRzba/Z03lYT7MwRKBr
	3sZ4Ot1ATcz05VLqQ6upgmVoZ3n7l26WJLanKPq61CLAwyHcR4GZg88hB21MM/dj7xwu
	u+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nx8nkqJPDTi8IbagXT32NWM+G0mqu8g9NMxcRcZKzBM=;
	b=dfFwF8LVfU8SYnBxe/oPN5+dX8gxEviZKhDS4rmgHGiKkYNX0gv616VCeZEQc30jMx
	IKPa0d8TttO50rVzruiY5085EApHIrtXnEGbNxYTxPseKmdNvDiTCe7kkvpG8MBm4yqM
	wPBXcWkc5gMqpohim3Y/uW7YzC0KSffq9ScgZLvIv89OfHmBe51Kf1DXfab5Rr4juVl1
	Q9O/llZTENPF0pvfIY4YXPvOCYFKN78XUumsaBLCn7UGanSpaR1nGSVIwspHiK5yCEze
	y0UopQb7z4ryVvMRwrPRN7O5s4MEoroCUsM7PqfEftFXec1zEHxuG6ZSJngTT2n8oRwY
	U/xQ==
X-Gm-Message-State: ALKqPwc8OendAcBW0D4l/q+VGPneZuJTRjZNPtruA//md/mrl2OHQgaD
	ygQ4cUfav66rl63XtugPaNNjAA==
X-Google-Smtp-Source: AB8JxZoLKF7bbIPyV6bVZIG40VHG8oCBJK+0sDYMh3NW1v12EpJ8YDYpPaxxarSRBfqjHun+B301Pw==
X-Received: by 2002:a17:902:543:: with SMTP id
	61-v6mr7446896plf.47.1526606726864; 
	Thu, 17 May 2018 18:25:26 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e87-v6sm14433172pfl.65.2018.05.17.18.25.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:25:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:25:19 -0700
Message-Id: <1526606719-7909-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] c-ares: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:25:26 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index 70e497f..23ec049 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
+
 SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
 PV = "1.13.0+gitr${SRCPV}"
 
@@ -18,7 +19,6 @@ inherit cmake pkgconfig
 
 PACKAGES =+ "${PN}-utils"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


