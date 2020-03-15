Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 9586861B72
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 13:11:29 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 669436035F;
	Sun, 15 Mar 2020 14:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584277890;
	bh=Dhg9f8/DmVIDm9LWIP/UBO/I32fVewmTEP+BbmCjIIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wMhTSq18meUamqx8aWHxIgTf0VHbdKcQeLrYuStzMpu+D1LAjPeGueBiCvS8FBDAZ
	rqU4f3OwAIcuJfabhrloT4ESl8AomnbLBhmqzcpC76juV2ZVv0PXnfBULfE2MJXYD9
	aR3/mIN8kE140i7NRPtsHBRg/UH+N+LF2IH8StD3P0qppvWSEbwXgFCya0u1Oey3yr
	0RlG6ZLE0loh6s6k3eHojzGHk4keo/mPQ7odhqfbLmERUcSinviudiqM2hHnP+rnlT
	Tnwi5uZXJW+5iKFM7QwjgoBvu9VFJKSkY1CInFKxC0Z958lwsTSMPzrYC/IYAaR0LB
	Z628CuWqfjQ2Q==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 14:11:25 +0100
Message-Id: <1584277886-652-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584277886-652-1-git-send-email-pjtexier@koncepto.io>
References: <1584277886-652-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] ddrescue: upgrade 1.24 -> 1.25
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
X-List-Received-Date: Sun, 15 Mar 2020 13:11:29 -0000

See changelog https://lists.gnu.org/archive/html/info-gnu/2020-03/msg00002.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-extended/ddrescue/{ddrescue_1.24.bb => ddrescue_1.25.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.24.bb => ddrescue_1.25.bb} (90%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb
similarity index 90%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb
index 52bd11b..cf24354 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.24.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[md5sum] = "8ac89f833c0df221723e33b447e230fe"
-SRC_URI[sha256sum] = "4b5d3feede70e3657ca6b3c7844f23131851cbb6af0cecc9721500f7d7021087"
+SRC_URI[md5sum] = "99fd7a28bf9953d88534c7ee9ab5bd2a"
+SRC_URI[sha256sum] = "ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.7.4


