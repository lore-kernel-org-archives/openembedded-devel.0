Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAB279CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 15:09:07 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k8so11386321lja.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=o87ZwjpkROwR245MET+ye5xIaQcPmut/nix4GutX+zc=;
	b=kOWJ5cB+qXFctrnrXDQ5AEz8ADrxtMqf0JpZQivfM/Z5muANYQxZC7LpSR4k3szuI3
	JSymRBLTjKOJII4P9EK78j3V42hCFhkDreYstPojWh1VYMyFfAm3uiN2NeU+lFP8hW0Z
	9v2NWUph+efFcEVRaJxLZ/m0xq+vmegjIej8m/KhvN/1WN9IL+gNgMZbeqfO/Td5Pl2K
	FovRcc2vLZ9Yrwhz0M/CFNyNonqfVP2iF726HemTZdVs9M/IdP2m5+mVbzqi95+l2KYS
	937//+xcWmoPidYQ9LhP6PhZl/OQW2aIEMDC14fUVjkD6FihWN9zW5Sx3wx/TbgdTFsL
	In2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o87ZwjpkROwR245MET+ye5xIaQcPmut/nix4GutX+zc=;
	b=BkSUQlqn1Gtt7ToVQg4c5k7aYy1YUoSeWi1xxZWY1qvx9NIjTifg47GMIorHpDKqRZ
	jRrqsI8NpNsxdk6kWHmFmvlT6Civ/76J+ZD6pC60oXw1QyKSMUE6tPcHmRkK020A5biR
	5ZrvKocBT2/gq+I+Fe1X3YCT+vxR/t4DIQ0gddBZse5CtMSMxiu6TazSMAai4NJxo9yZ
	5RYMFjYH4CRJALyWWWdhOm567NtRPUC30Y/fOU27ji0cpHv7P4qgerzwS/11Dbils/UN
	RsEyiIb86o72fO2chMCVVx2pQXUYxOWvgLuqM7qZZ0vAOiSeDXUepVwSKlDxQsYb9vza
	gRlw==
X-Gm-Message-State: APjAAAVOg6R6Lsuw4qi0DYLsb05oMPGi5JpFo62AYeYF52Xe0f41zBaX
	pIZdkDvGdW9aiao9zBtSlINHE4fdTao=
X-Google-Smtp-Source: APXvYqzjJ2ql09V+3QqaKcdRCIQfY9Ecwc5k/sbBPjoGm87yvCLQtNbczSwHGcTs2B7apczlkex1zg==
X-Received: by 2002:a2e:9898:: with SMTP id b24mr8023396ljj.70.1557155347492; 
	Mon, 06 May 2019 08:09:07 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y131sm787166lfc.76.2019.05.06.08.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 08:09:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 17:09:03 +0200
Message-Id: <20190506150903.3875-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] ebtables: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Mon, 06 May 2019 15:09:07 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index f05bd615d..276784009 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -12,6 +12,8 @@ RDEPENDS_${PN} += "bash"
 RRECOMMENDS_${PN} += "kernel-module-ebtables \
     "
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://ebtables-save \
            file://installnonroot.patch \
-- 
2.17.1


