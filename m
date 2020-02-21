Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C5DBC6023B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNnc33Pmz4c
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318068;
	bh=z9D/XFff0MBRYzyvyoP4rXSR5Md51v6br7AaI2kDE4c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TULwokGaGKe7EH7+9wGh1JlsspqeWeoHgswlHGRcKT8EGA2UzOvxPvPKPhhtokWsx
	jHcV1qUlJ4tlyFEW2ssxco8/yr6GMyORdSMWUSlScrgoaxnUVA/+0V3tiQ7EbiaN4u
	OJbJ+GnKdOFU3LM6grsYsbo89BptFe9b+phYtVixZSE49QrQvZ8mlTH9r15rZoya8O
	lLsL/kmUPKSVLXAkQ/WcohYsQIS04CkXiSz7nRevwlx3e0w34T4BfIVmrVz0JfLjwS
	w6P7VsvkR3earD7jUvp3eS3s2zN5FuOS+OBCCMOvazV49ahVl7e5/7P2XcrsgD+FHb
	//VOZ7l3t273h4HcpcpdGuIBLAiUPNMBi1iNET0AWkQYp+cxiDgc53A+qEKgYA+sxV
	pHyabSGUT0NjnTi6LrwaeI/B188agf/te3R9kgx0cXZ811wAcknqhZav0/SjBd4vaP
	sfu/dbcpj2j5K6xZQJPVAAGGqUkvWOfrGBf5Tsk/zzOQVJievu9rRSOzuuHd6SjUmS
	brhOcBkz9JnJ/yLFFVyr4ZyDLi5AZdhhPEtUPce5O5MMeTPtqgjUQzZTDj/D4u0JRN
	ZHhWRor5JCwn9J/TsdyoxaIus52YSIL28eMhWcNfDeKVk7ZvMk0KT9zPGd543arZFf
	HdOuH5XbfXrn41MEo8htfJxY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:47:46 +0200
Message-Id: <20200221204746.14560-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221204746.14560-1-bunk@stusta.de>
References: <20200221204746.14560-1-bunk@stusta.de>
Subject: [meta-networking][warrior][PATCH 2/2] wireshark: Upgrade 3.0.6 -> 3.0.8
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
X-List-Received-Date: Fri, 21 Feb 2020 20:47:48 -0000

Upgrade on the 3.0 stable branch,
including fixes for CVE-2019-19553 and CVE-2020-7045.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
index 9436231cd..1c0ededf2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
-SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
+SRC_URI[md5sum] = "034f09e639fb4efebbc08af7b2a85333"
+SRC_URI[sha256sum] = "b4bd8189934d82330a053c5b10398f2b625b1e1c8818831ab61739b2d7aa7561"
 
 PE = "1"
 
-- 
2.17.1


