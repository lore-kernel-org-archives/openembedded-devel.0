Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13DAC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 21:52:54 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web10.2991.1747777965115471228
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 14:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: renesas.com, ip: 210.160.252.171, mailfrom: chris.paterson2@renesas.com)
X-CSE-ConnectionGUID: JiAvP/4iTn2BZr4uwt9RPA==
X-CSE-MsgGUID: afixUTXGSzCs2gXPlHLvxg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 May 2025 06:52:43 +0900
Received: from spl2-146.localdomain (unknown [10.226.92.154])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A8300409DB03;
	Wed, 21 May 2025 06:52:42 +0900 (JST)
From: Chris Paterson <chris.paterson2@renesas.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Paterson <chris.paterson2@renesas.com>
Subject: [meta-oe][PATCH] smarty: Drop allarch
Date: Tue, 20 May 2025 22:52:36 +0100
Message-ID: <20250520215237.454574-1-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 21:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117522

allarch is causing issues when running yocto-layer-check for
test_machine_signatures on a BSP layer that depends on meta-oe:

bitbake-diffsigs -t smarty do_package_qa -s 416787047ca76d43b094860cf617234f957d11895e7b7be20cbe9203289f27e1 1e482ffc1ead26bcd1f89d4dcf92e497dd6223933941b3ec6e483cb0072c9f5d
Hash for task dependency php:do_packagedata changed from 6bfffcbbcd4507bd0be6cf3138583b92d82e75099c13dcf58363aaa938ed6f9a to 24c5373ca06af905e35fa48b7ca3477283add52fc54348fee9dd5a28efd1bc05
Hash for task dependency php:do_package changed from cc9a8c60aeb862dd19eda30bd6ed137beb2ddd8b5b730a8b996fc58681a2ccdd to e8d7465054669b47fcf933f060e1fb69a3871d1d1e3d5b9a9610644edd17d2a8
Hash for task dependency bzip2:do_packagedata changed from c00269772615a22d528f4205b4a1ce88a2325c9acd08de20445d20e22e255b1c to c3629ef771a2b92ed5eb9c36cffd96557537542e2bae0568e191225af0c5f4fc
Hash for task dependency bzip2:do_package changed from bf71dc096cc85a6f6cdddebb908709f47b55ed8401a7f56fc7810484f8d0a226 to 3326e837bd452b74e32ab6b4f96fca7ed69e4d5cbbdd57acc6c9325201638cc4
Hash for task dependency bzip2:do_install changed from 9e253b0c997975295046712d52a305e50d73148a00b6970aa39d5e548d66dc91 to a78a2933308498a16e713a934c1cc59480d5fd4c8bedf6b055c2ef6608836f78
Hash for task dependency bzip2:do_compile changed from b515ce5b36cc71307ce02f27a4b5187482acfeeddc74e6679c60ebef46ab6e1d to fe7f086dbf72dc1924bf9b4f7ddd54e519627fd7782434b50f67b245ce72073f
Hash for task dependency bzip2:do_configure changed from 52680e9abaad7c7ec1ba6098f965bfd991924a5ce1a57db73725eb8917cfda31 to 3395d5acb3b7d42a4ff2cfd010d4d05c0595f91d36f8d9cd9888a367987ddb4f
Hash for task dependency bzip2:do_deploy_source_date_epoch changed from b3cb06d6eb2fcd84f94c4f66c8e68dcb4f277622e1e3e5809fe2ea02ab589b31 to a6eade80d249c35f50b8b4d7ba5d72ccaed07068dde6529a5f219b918a7c5294
  basehash changed from f275277525924e477f47fb1b0bd4eb782ef2818fa2bd930159cd5ae5960f1e91 to 7aaec6b4c1f6b5ce5726d99f3a040678c1e49a5aa6f2f22d28503563b8e6fb32
  Variable TUNE_CCARGS value changed:
  " [--mcpu=cortex-a57.cortex-a53+crc-] {+-mcpu=cortex-a57+crc+} -mbranch-protection=standard"

allarch was introduced to smarty in
0f33416ad038 ("smarty: update 4.5.5 -> 5.4.2") which was first introduced
for Walnascar hence the issue wasn't caught until now.

Removing the allarch inheritance fixes the issue.

Also remove extra whitespace after comment.

Link: https://lists.openembedded.org/g/openembedded-devel/topic/issue_meta_oe_walnascar/113168928
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 meta-oe/recipes-support/smarty/smarty_5.4.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
index 7072641d4585..37336ff5d70e 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -18,9 +18,7 @@ S = "${UNPACKDIR}/git"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit allarch
-
-# `make clean` removes files, they can't be rebuild with `make all` 
+# `make clean` removes files, they can't be rebuild with `make all`
 CLEANBROKEN = "1"
 
 do_configure[noexec] = "1"
-- 
2.43.0


