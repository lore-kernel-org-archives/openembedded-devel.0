Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A8ADE7DE7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNZ4ry5z7P
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345535;
	bh=27GEnBkaEcbRZkLRt7DZyOQ0nzx6Ni9sG16EVrsKQns=;
	h=From:To:Subject:Date:From;
	b=GvnPIXHmwsz+ncblR9HjY083Rxx5XAWVvdgD+ti7CPFTrm0ppD7eiwS3nJ0KHAAgk
	pIcHlvK4DHshybPXNPx1qG5ZrzP+BoESYG6N5+LVby7ukweNjVYmQOMVu8g+2CNC/U
	5s10Gx0j95+Iuc9cKrpWVSP68ASu9oPdPJUwYBCaA1Fmz1aZL8ZVO8OZSPvnymDzWu
	7o/AAvWpAVCl7W0JNvRZhnjIu/qhGxACqrnQ9Cz4Us0AedKJWkmrxTbMOfkCL6P7YW
	+kKPBn63y2GjqqBm4R3Lm9pI9vCdR8dziT39VD7WxzefBm10KMfG9ai2nOdSTeeksZ
	Nk4Bl+41GdihpfKbw3+2gbaF4wyYeDsgyUL4FmfTVMELaMfyHJfOdqqEW2DCFl72IY
	sNuTD3qghCqKhYJ4EvtpnnEpp0a6ejT8Qyvj8rzxtnjvQGTbcA1lNKZoRZ4ivKTUlF
	voAAVqUSFqEJAFOYDp5AgoqDcuAWMZy44r7tpZjjLTzLdGUc8kjzdHCsy6XGnMFHt1
	6QJbalGCtj6cfMOmA3RCjMaGJLp8Bq7VUHhOZXJMvnaE2NLiZvCzT7HdNFAs+6u0Pr
	ZL3/2y7LUM6+CSWGvPVDtyN59p2ZhJ6I2FCcy/QbSRoQUaMNeGwZbtZWIY6adUCtgY
	iCPFQJNNh+uY5SUqulW9FgLE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:48 +0300
Message-Id: <20190508195852.28803-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] libdc1394: Fix the file permissions in the sources.
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
X-List-Received-Date: Wed, 08 May 2019 19:58:54 -0000

Recipe and patch executable was wrong (although harmless).

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-multimedia/libdc1394/files/install_examples.patch     | 0
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
 mode change 100755 => 100644 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
old mode 100755
new mode 100644
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
old mode 100755
new mode 100644
-- 
2.17.1


