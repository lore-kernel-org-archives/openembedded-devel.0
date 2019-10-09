Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 43CE97F45E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 07:42:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46p5lP0BHjz4S
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 09:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570606929;
	bh=lWUWidcQIofZzxG2/9rlq7v5EP9ZETNV7O6loTorpMU=;
	h=From:To:Subject:Date:From;
	b=H9jkSFJabcrgm9ifMrnZayfd5RoWE2yRGn6ieBA4U1Nmvj3e5mqJBWE6X6o5t6oyP
	IjcbCr07YC86XdazHfEo8nNNQ71/XckSdh2Xpjfy7qdvp+DHK4GjJZ8dGzS/vDaDP6
	4wXSsd+tHzC/wtH5xJ/Uw4C5cUsd44V4NY1Xh4ChLjjYtnuoA1edgSYgdGNMIsK1Ot
	V82XTGMJtLmDR4GzxXWmGtyjGjwZxQ8p7/CXrvQad75OcgP+m15N6g6yPCCjYREmQ9
	kkW3QodvPjlh8XAsF45JjXedcCv58srILL+m/aTQn5wgyQradWqyzDghtbcEW+FNld
	rD66C2OdYciccO+gi7LGYr8hP5q+a3UVP1jCbdTNEvUhauFZrCHQ6/fPHh8ZMrKZ3J
	A/oV5GEGalSR4hSNrEPbYIY7f3UFDZlLsO//x+JoWBKELH/wOZAE75AXT6vfDzZ8XM
	QQqa+9OMliO5Cvi+cKoSZYLf4LRgxm1hmlfCM02Qe6Bp0XWVUm4EtR/j/jHhqOpX8k
	tSbelfoaLIKP6cGEeHtqwK28BS+kcgSXLIFNbUvHzOH1gZWMQnjoCPpkaN0oDUU08Q
	ak8gkRzUU/foYQG20W1J+SLlR5q+STmADldEpDx0l+sZhd0whrRJlTUYzKw9Eb1TAm
	PuPqbddrw5x8rGloTTod9uMc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2019 10:42:07 +0300
Message-Id: <20191009074207.18686-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] xmlrpc-c: Remove the RDEPENDS on perl
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
X-List-Received-Date: Wed, 09 Oct 2019 07:42:11 -0000

The tools that use perl are no longer built.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
index 524263760..6c31b6981 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
@@ -15,7 +15,6 @@ SRCREV = "343a3b98e54999d67edb644bcd395aa9784fb16e"
 S = "${WORKDIR}/git/stable"
 
 DEPENDS = "libxml2"
-RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep binconfig pkgconfig
 
-- 
2.17.1


