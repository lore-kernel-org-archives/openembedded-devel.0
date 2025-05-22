Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644BAC54F2E
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:12:59 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlie6.idc.renesas.com [210.160.252.172])
 by mx.groups.io with SMTP id smtpd.web10.22338.1747915974116799471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: renesas.com, ip: 210.160.252.172, mailfrom: chris.paterson2@renesas.com)
X-CSE-ConnectionGUID: emL4WGeXTiCtLpvRdmhqaA==
X-CSE-MsgGUID: Iu+SijM3TdiaRiI4Tt/i9g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2025 21:12:55 +0900
Received: from spl2-146.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C25D94000C96;
	Thu, 22 May 2025 21:12:54 +0900 (JST)
From: Chris Paterson <chris.paterson2@renesas.com>
To: openembedded-devel@lists.openembedded.org
Cc: paul.barker.ct@bp.renesas.com,
	Chris Paterson <chris.paterson2@renesas.com>
Subject: [meta-oe][PATCH] spectre-meltdown-checker: Set recipe as machine specific
Date: Thu, 22 May 2025 13:12:42 +0100
Message-ID: <20250522121243.4140107-3-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522121243.4140107-1-chris.paterson2@renesas.com>
References: <20250522121243.4140107-1-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117588

This fixes an issue where running the test_machine_signatures
yocto-layer-check tst case fails when using a BSP layer that depends on
meta-oe.
e.g.

bitbake-diffsigs -t spectre-meltdown-checker do_package_write_rpm -s 3efb5226ab4e83ef90cf33f0a474314d345c675707b3476dde1d3c42f79cc3d0 e268e68c02265542bf80fd51f8c4f26f63b668746639826fbdb870d91e2ba2fd
Hash for task dependency linux-cip:do_packagedata changed from 7feeecd5cbda152da452be41a8b0babe91e48f3097c4e5bb33f6dc426dd203e3 to f466574a3f8a32b23393fe4154b4fb6d172bb75d82ea5424405386d00c30b57d
Hash for task dependency linux-cip:do_package changed from 2281027d1d4da253d371c2c0aebb829aa262b9b2a563247a3bd95621621abdb6 to a8d245eb965ab2f20b4a9d620e5c3af1e4437a5e08665b05f5c52706454642eb
Hash for task dependency linux-cip:do_install changed from 75e91702bbcdd891ada3b08d884f6842fa94c01dcb52917dc0d0e85239799569 to 2cb117e47f68e5e1ba21b19934e1be2a14501d9ec72e0565f409dbbdd024ff24
Hash for task dependency linux-cip:do_compile changed from 015e60756358bf4b46b1c2570d70c334285b38c54d8c515c1fd301044a73e123 to ce97c36a37c0438254ad429e9c53a7520abade5e513180bc52850b683de4df5c
Hash for task dependency linux-cip:do_configure changed from 188050940f59e4ec4a20bea82f6a9b8261126e716fec07bacbeadbb9f5989882 to 111fa8c18085e992ce52a0bb1ee53276e36720092288dead4f70cf3a64f8fb05
Hash for task dependency linux-cip:do_deploy_source_date_epoch changed from 5e39db86fcde43fb0d0afd08e2d22c4c2e6b2fbf1e2e9017f1cc6f541c6798b0 to f621317487884d32348672899270c7841f7d4739140e35eb09d2378fccd90213
Hash for task dependency linux-cip:do_patch changed from a8da5639ab6a39a57122a59758aad964d199a10ce0ae5a3e36f17e6830ee3f97 to 77fbb8bbb5e3c0141b731b3afc001370f28ba796f09b6361de04c93ec2f165b9
Hash for task dependency linux-cip:do_kernel_metadata changed from 0099cc1d4d35547ff1e4b1d448934304c1708ecfc42abaf38de23abdaf986310 to 08b1d5c2fe80e6a074b8ac8a27370caf0f8713eae85ca0d861140d28e443c59c
Hash for task dependency linux-cip:do_kernel_checkout changed from aa1bb0aeef7b4aa5ec2d01d3a99d7addd3a262b496962c9bfea9345bbccfac1e to ffb0021b913cdad6ab0bdd7e7a51c49c4afbc24087d4b410aa097faa73bf2e8b
Hash for task dependency linux-cip:do_symlink_kernsrc changed from 14695f6b8d892af536305c58a130d67fdca751a0dabeba2edf708787d067c8ba to 9d9d7511d5feed853c5e450dd93994e0f0b263c9e6d5d389e8c85471696e5df2
Hash for task dependency linux-cip:do_unpack changed from 6cf2e7fd1e1d67578f6bed761378953f91a8a58df0107698cc259c1989674da1 to 5d98fa31606f06f0e4416f9df82f97fdc6f63799b65486912dc4a3fc7f871f3c
  basehash changed from 556fad4e4426a9390de6ccdcc631aeb35d391ccc9676f6a4810237e2f501cf85 to 72beced62420cc92f276f8a31cd4de3d6f9e3877b14fff9d82ff7d863855b7da
    Variable MACHINE value changed from 'hihope-rzg2h' to 'hihope-rzg2m'

Link: https://lists.openembedded.org/g/openembedded-devel/topic/issue_meta_oe_walnascar/113168928
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 .../spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
index c6593ea7429f..40858258c396 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
@@ -26,7 +26,7 @@ RRECOMMENDS:${PN} = "\
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit allarch
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_compile[noexec] = "1"
 
-- 
2.43.0


