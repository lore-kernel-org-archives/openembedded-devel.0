Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 55B107FA2B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCN2wf5z8b
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373888;
	bh=pgYtavu+MHLLK522gJ/nCl+4qO2aypFDbjvq2do0ZlI=;
	h=From:To:Subject:Date:From;
	b=MU9rMhj86+11BSeI1MqVMCDVuAmbJlj/dGTuZDsGDO5u6sUWp8XBS6VM6rkfYWO1t
	WjW8vucnUFXDcisLePWl5JEcQIMYstRebaqOMT513yaTXGBMZxYBhw2CCvOJJiKCey
	4b7WiRaecPawBBrsr+RCIilEBsU79DfnJiuq8WSs6ilnYI/J6ca5f/BwC/OaO51hnW
	VNlbNY6tHjWlX1/vs3m0y3SHwp0fjFjhDBJ4Vvv7VxLOPVSfzG6UIS2LxY3W7KQ89W
	YatKWVBDqyXIubR8TZtoq8rzxQgHviihji8VOAgNDTunNhPRXJbX8fvWmWKehAM7ST
	qChVbziQrEarbcpl9SA7cb6sq9w/LP0mcnrmhF56w2CA+G3OMgRH0aY/zjUuCkuWZu
	Phf2i3Gqf9FkAIqaRQLbDWiLbrbjoKy76wRj09Vq6vD2lwJAxjz1Z+E7r/m4iIYO1k
	QQF3EVM/F8TKP3O2doQu93ReJIyaGVhA5HXYj8pgGukL1h21tdNM1q71Yckhn24BM6
	f+mwA6Wjhnf1+1rXAOAFHi9RWTIFmcAvLwHRtWrTrBSwCfhFlMN7wEW9/fwBrK9hzs
	1rXDw712TgoZZGzx/s+RBR2XAHNrVtwBg7ZNx1nc0jT+2YLDwMc1WqGimHuc9SzWs7
	9RGHFsk/NoKzgIGfIp7Y3slE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:23 +0200
Message-Id: <20191029183123.1868-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openwsman: Upgrade 2.6.9 -> 2.6.11
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:27 -0000

This includes the fix for CVE-2019-3833.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../openwsman/{openwsman_2.6.9.bb => openwsman_2.6.11.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.9.bb => openwsman_2.6.11.bb} (97%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
similarity index 97%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
index f9292790c..16a83a4be 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
@@ -15,8 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-# v2.6.9
-SRCREV = "5efb1545dbac7e6d1e0a992f3e84ca12cea1c18e"
+SRCREV = "d8eba6cb6682b59d84ca1da67a523520b879ade6"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.17.1


