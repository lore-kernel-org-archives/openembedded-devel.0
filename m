Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id C588E7BFDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2019 21:25:58 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-8921-123.w193-250.abo.wanadoo.fr
	[193.250.63.123])
	by koncepto.io (Postfix) with ESMTPSA id 8559660566;
	Tue,  8 Jan 2019 22:25:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1546982759;
	bh=27PUTkBVI85H8zxwPsd8H6SPaWHkhHuDrga4vyE98Kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d/j/G6MxjujveTMLg8Pga5reRXngt4Nf2RTDah9xpkIwBlwA0Ms3BVv16Bndd0845
	+q6F0cvtITCmo/4hbcei8+TCeLP24LJKFQPegAWtxH4oaALlenc5h7rH5FiNilqlKC
	shqjUB5XdKmSKNz89gf17Mk7eU4CpzWGDudK78fnO59QPni6/Lbhodu7/3CNUt4mW5
	LTivS17/ZAmb+9pCY+yWzK8/P6UwMbJiPS3zcP5w/3+JL9GezBpY04znnB7VNmiHxA
	RkLdv9LfNFUSSCBOaSls8s/qvzfZojz0jQpMs9hGIWqZn/9fTtBJNrpOsQrELunwNf
	CECpQjb7dwibg==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2019 22:25:20 +0100
Message-Id: <1546982720-31704-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
References: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] qrencode: 4.0.0 -> 4.0.1
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
X-List-Received-Date: Tue, 08 Jan 2019 21:25:59 -0000

Upgrade qrencode from 4.0.0 to 4.0.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-graphics/qrencode/qrencode_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
index f539775..108c339 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "http://fukuchi.org/works/qrencode/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-PV = "4.0.0+git${SRCPV}"
+PV = "4.0.1+git${SRCPV}"
 
-SRCREV = "07f3c5d4bf9136711422cc7dbf28aff469da220a"
+SRCREV = "7c83deb8f562ae6013fea4c3e65278df93f98fb7"
 SRC_URI = "git://github.com/fukuchi/libqrencode.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


