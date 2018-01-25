Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F85D60721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:56:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 143so15860697wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lStVhKlwqhcBMkSnXyteUx/wiElT1F+dHb+ZCrUZQ5k=;
	b=SRr6JM+BpDvTZIy5u1ycJ3UZiVT3+DsxQAOJJP+GlqJJggrxl8TVTNLkJE1taDNhnL
	Zv2c78F6WWWIKRfWfv3HbYmxBavHGhQQZGBdH2epc5EhdNPAQQ80+QfRr+t3BoL6+2uj
	EkgWk5lgoVlWfFW21hlcwbX2B+DtwOLjb2dLR05wtGPL0BAJeIEcRoSCEThfZgrnmie6
	Lz7OcciRgZBuez5j02E+hvrBDzduBfMCW3y+PW13tzaybhmoK1d7xaiyeBcWxuspCcMK
	eleIvFKMHzO/lRyL15e4MSfgJGg9LpToDCAHiwajgzOl5se81YGcEsHuuVhWmtHdh7Ah
	2tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lStVhKlwqhcBMkSnXyteUx/wiElT1F+dHb+ZCrUZQ5k=;
	b=YAgBChuvKq0dkW8VvlGg8j6pidD7lDU8EiCd93EY3xzVTn2WuButvoqMyWznG5YJ/x
	f85IhQFqnzW5pJUT8sc5weHusUzz8JGO7teN0LqDzrznBZhEqS+9USErsaHu7QB9BvEE
	sfuT6hqxH2WNv0G8X7JtBjb56z2swhZRN5SZpQgW9Eru8ll+/YRh6J2ls42ctymi3+KD
	Er/XAyQD4RZCXiH51ajuAFlZ1FCvmHMQ6u3Hc/JZkQcrB3FLUenXfWd6yMLHdC1sanLN
	rgNHrHHpxG7i4m+zLE/k4sNMb99fHWharb92cXVFNXi5gCUlX6Ra6jVf1F464EcU0nMm
	aN4g==
X-Gm-Message-State: AKwxytcwqu6Ir6keKmthjQoHg6k+cJO8IcGlRGFPsWfSBdSi4wK6fRCE
	JA9uvEG0ctV7BU/aJv4MI+0n8Q==
X-Google-Smtp-Source: AH8x224trbZbhoyoLt407to7n31ieP54mQiSelhW22zANdX+OxFK7fF/QBPBlSid3Dqh/7Mv1rhJ5Q==
X-Received: by 10.28.45.151 with SMTP id t145mr7876622wmt.129.1516899420142;
	Thu, 25 Jan 2018 08:57:00 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:48ee:c0c2:b594:3a2a])
	by smtp.googlemail.com with ESMTPSA id
	w73sm11209389wrb.34.2018.01.25.08.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 08:56:59 -0800 (PST)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jan 2018 17:56:55 +0100
Message-Id: <1516899415-31585-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] qrencode: 3.4.4 -> 4.0.0
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
X-List-Received-Date: Thu, 25 Jan 2018 16:56:59 -0000

Upgrade qrencode from 3.4.4 to 4.0.0

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 meta-oe/recipes-graphics/qrencode/qrencode_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
index 6a159a7..f539775 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://fukuchi.org/works/qrencode/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-PV = "3.4.4+git${SRCPV}"
+PV = "4.0.0+git${SRCPV}"
 
-SRCREV = "1b565c7b599029818fc596e7da4371a3083da36c"
+SRCREV = "07f3c5d4bf9136711422cc7dbf28aff469da220a"
 SRC_URI = "git://github.com/fukuchi/libqrencode.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


