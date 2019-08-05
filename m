Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 34B98608B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 18:24:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 462R524JQMz65
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 20:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565029495;
	bh=XvJmKOFp1iRgkCXARAsxItO4y1VSUN6OZw+doAcDL6A=;
	h=From:To:Subject:Date:From;
	b=A7yMJrGAHEDTloj5eph8HZOoJSqJ0FDHT+QKKiLNUhYtDSeeu7+SLhkAK+WrhIl68
	qjSa1Kh/3yt2oXK/oMlBsJ7wX6zoSuaZED/vQu9f6mAhTfKYhD6aqtLowUNywg923U
	wrAYMR9kBfkdnl3aDbguDY+xOHzQ4w7cgQsL4PsSvUp+v2eR3U7cT+H6D4YPylLrZb
	/OZJQ0c/oXVVFB5mDKGY8wdQVvTIsQoSKJq6GOU2bkWoJH2LyD1dR7B2LYpR/eMuqK
	y/3dfoRBBPoCDRn40w2Bnbd/U34Sa67ydpPVSv255/5T09fk562Gd1HHJqO6ptgpCD
	Y6hNpLlvn4b3tfXErMYaj1kA0HXhEhko8VFsvuH2NNwWDaHLnnZuIt+tm3rOWWwxj2
	lxToUNBPz79yITQEL4T0BfospGMD6vjD2zrWQmKlZTDZUleFDAvoIKUynjBZzn+ESL
	j8ZC5kGcu4vunQiagYeHgaToge7C8cGTlIp8EWvd9sMvBTYcURthYFcNsGfoiClCr+
	CEcipRjHIeUWcjgHPH8aJfeJI/CphkkEU8S6yv9h7b+Ifb/2p1ReNB7uwzwsr7LgTG
	2G/Z+8gAN+lw+bFLPFV/iLe2lnbAbc4ioDoDOQNMt+GDYV6wxqE1a86Ga3cvK8FwXt
	b5fnqNfvse8Ev3lWoDNWTqtA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 21:24:53 +0300
Message-Id: <20190805182453.30420-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Mon, 05 Aug 2019 18:24:55 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
index d442925ee..efcd5e42e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.17.1


