Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 042977891E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 16:51:51 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f14so5783586pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 08:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8jDM4GT3uDsyDycHQuP8mm4xRNilxvE2bgnjMKlIP3I=;
	b=pqlJ0ur4+xnXWGE3vqQr8f5Lc2yISC1XsJHBsyAVe7N9QRCJRLoz9xwILk+Zx3CjRn
	CdRPU3OJeslTOZ3wVNudJ/Jq9vaPoAy8lqNsSxgtKmdrVvFtiW8jVd88w6gYRyZrZ1qr
	ZDF0OfgsBXBUsZVxShOvax23FZp5VCLukgr2Y0vVF1/CrqBPJRSPSlsvhpN2XZcv+0ZU
	MjqXdBN2vffWxnLkz332I3E/JXVTQayqKKlCZbCZ/vE3kMViPR4QsegqNJ+f6nMyQHLR
	Y/+fM5TExMpAMKU2jlFJJ0KYXQmF0AM9p7nyiOA9sGuLzG6TsrFVqGVuNze6k7hX4iMT
	y4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8jDM4GT3uDsyDycHQuP8mm4xRNilxvE2bgnjMKlIP3I=;
	b=RVWWB+lhuyrxevQFrxZ6WnGpKbfkAdOmyChLHC509Bat0gP96pG3OPZsEwkq9GazIg
	GhXiu5AjLfPhHNkdV+G7tvkH9o36/+RUjgxE2Macip+ZdrzRMq/gJXPfRN1TVHDE08J3
	oPC10bihHYQ1oMtotNdjvRUKMpkuQOsk/DCyVCnZOzBDFZf5PYT7ZGd3n9Gplw1/F0ed
	TlBdbjZ8y/jNR7Kt3dRPG0n/emhLLheq6Fhr7VI+qoHaSlFmXy6AfiDOrOVxfJL+FIVP
	kwVYkEw2bDx12pNpgWsaE1vNiV1oAeF+sovBq/BVCN1fHCBJbh66pcf2yEIU6mdUtpdc
	MERw==
X-Gm-Message-State: AKGB3mLnG3vMzZQ28bKpOfUjeB+te/AXrpG1E/YCAYBY/72Tt7VcAgtY
	VFR3dkrbf64usPc8y2Hnlmmy+g==
X-Google-Smtp-Source: ACJfBotNM3NmC8OSvxOwXrsX8Obe0UnieW3CZaCSePTwrUCigE/QK4keZu2mkWLbuU3zj5fDbjKKRA==
X-Received: by 10.101.72.197 with SMTP id o5mr12337476pgs.298.1515516713176;
	Tue, 09 Jan 2018 08:51:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:553c:1986:3dd2:36a8])
	by smtp.gmail.com with ESMTPSA id
	d81sm35168813pfj.163.2018.01.09.08.51.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 08:51:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jan 2018 08:51:50 -0800
Message-Id: <1515516710-23797-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515516710-23797-1-git-send-email-akuster808@gmail.com>
References: <1515516710-23797-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] wireguard: udpate to 20171221 version
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
X-List-Received-Date: Tue, 09 Jan 2018 16:51:52 -0000

this fixes build issue on a 4.14 kernel:

/src/compat/padata/padata.c:831:9: error: implicit declaration of function 'padata_alloc'; did you mean 'padata_alloc_pd'? [-Werror=implicit-function-declaration]
|   return padata_alloc(wq, cpu_possible_mask, cpu_possible_mask);
|          ^~~~~~~~~~~~
|          padata_alloc_pd

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...eguard-module_0.0.20170810.bb => wireguard-module_0.0.20171221.bb} | 0
 ...ireguard-tools_0.0.20170810.bb => wireguard-tools_0.0.20171221.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20170810.bb => wireguard-module_0.0.20171221.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20170810.bb => wireguard-tools_0.0.20171221.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20171221.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20171221.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index f37d52b..6bd581a 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "8dd3e080407b8295c25565a847a4ca27"
-SRC_URI[sha256sum] = "ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7"
+SRC_URI[md5sum] = "39bb99fe11356423fb1ab45ae2d938bb"
+SRC_URI[sha256sum] = "2b97697e9b271ba8836a04120a287b824648124f21d5309170ec51c1f86ac5ed"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


