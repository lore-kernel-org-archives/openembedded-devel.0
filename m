Return-Path: <chenqi_hycx@cetc.com.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0005C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 02:25:34 +0000 (UTC)
Received: from cetc.com.cn (cetc.com.cn [220.181.39.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14449.1789439130064043511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 19:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cetc.com.cn, ip: 220.181.39.39, mailfrom: chenqi_hycx@cetc.com.cn)
Received: from mail.cetc.com.cn (unknown [101.95.142.114])
	by mtasvr (Coremail) with SMTP id _____wDnwSpprKhq4HkBAA--.2428S3;
	Tue, 15 Sep 2026 10:24:41 +0800 (CST)
Received: from server-7r32.. (unknown [101.95.142.114])
	by front01 (Coremail) with SMTP id C6CowABnmmoZrKhqT9UxAA--.39497S2;
	Tue, 15 Sep 2026 10:23:22 +0800 (CST)
From: chenqi_hycx@cetc.com.cn
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ostree: remove untested PACKAGECONFIG settings
Date: Tue, 15 Sep 2026 10:25:24 +0800
Message-ID: <20260915022524.844005-1-chenqi_hycx@cetc.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C6CowABnmmoZrKhqT9UxAA--.39497S2
X-CM-SenderInfo: xfkh015lbk5un06fv33fof0zgofq/1tbiAgYLCmqn+AUJFAAAso
X-CM-DELIVERINFO: =?B?oMSFsZMTIGijefgSB8euu+6OLk7VHJpweJu2O0jc6H0leTZ3KSwAYM2Ck2shLWqtE7
	j2j/GCaODyZX0hnFUcCYykRgdfpnVYuohULoe5XN458hydDYglB1vy6QC4M13LZj9PbDRD
	IOAT4P5fvt43dikgNCveK8tg9aP811TTaxquKrq1iukbPNaKFaI1+7IwKsexVw==
X-Coremail-Antispam: 1Uk129KBj93XoW7KrWUWr4kXrW8Gr1kKr13KFX_yoW8Ar18pa
	n7Xw47tayUG3ZrJw47A3yaqr4qgFy5W3y3GryDGw4fZFWaqws2qw4vkF4qqFyYv393Xr45
	GFn5t3y5Wa1kuFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3gc02F40EFcxC0VAKzVAqx4xG6I80ewCY02Avz4vE14v_GrUv73VFW2AG
	mfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYS7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2
	IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l
	84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4kE6xkIj40Ew7xC0wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07j089NUUUUU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 02:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130033

From: Chen Qi <chenqi_hycx@cetc.com.cn>

These two settings, class-native and class-nativesdk, were obviously
not tested. This is because for native and nativesdk, if users don't
do special settings, 'smack' and 'selinux' will never appear in the
DISTRO_FEATURES. In addition, there's even no nativesdk class extension
for libselinux.

Most likely, these two settings were just copied from above and were
left there ever since.

Note that if we enable 'selinux' for ostree-native, the following error
will appear at rootfs:

  | bwrap: Creating new namespace failed: Operation not permitted
  | error: Deploying tree: Finalizing deployment: Finalizing SELinux policy:
           failed to run semodule: Child process exited with code 1

Signed-off-by: Chen Qi <chenqi_hycx@cetc.com.cn>
---
 meta-oe/recipes-extended/ostree/ostree_2026.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.4.bb b/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
index b48fbb0a62..05a514c262 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
@@ -52,14 +52,12 @@ PACKAGECONFIG ??= " \
 # We include curl because ostree can't (currently) be built without
 # soup or curl - https://github.com/ostreedev/ostree/issues/1897
 PACKAGECONFIG:class-native ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
     gpgme \
     curl \
 "
 
 PACKAGECONFIG:class-nativesdk ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
     gpgme \
     curl \
-- 
2.43.0


