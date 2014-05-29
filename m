Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f45.google.com (unknown [209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id A969A6FC43
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 04:12:40 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so12153467pad.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v3bben1oDHCPMq3Z8ISU+UVie9Zao2F7ETkSd8iXldw=;
	b=sANpZiNja1I1gF99t1hw7bAp4u4e0DKJ77aoH5XH/bHuN4K8pXP3r/PV9fozRJQ0me
	DAsz4rWhXN8OrSn6Srv6T9lIsGsExsKPePwEX3DBeopbL3rcY2SRWt9nTFEkgbNLCpUG
	wED0Nw12iG8dp9ASYFdLprJG3yTfDmj8fNE+hoLwes3K7RdbCheC49UHa+5aC2zPxtQw
	xikJ/xRPITfeRbc1BLtfogJzs/A7RMbqBMKTIR+UKsI22L3dsTED1hGP5OKGYWoL0HdE
	65FGtl+ecdXpaNPY8+/1hTkRrxPC1woQW9aSVlAZM3RfsJ9orgi3w4LevyoF8awUFZYP
	C1Dg==
X-Received: by 10.66.65.204 with SMTP id z12mr5273610pas.60.1401336761740;
	Wed, 28 May 2014 21:12:41 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ei4sm30954179pbb.42.2014.05.28.21.12.40 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 21:12:40 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 21:15:33 -0700
Message-Id: <1401336933-24140-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <CAMKF1sqE4AdE9c-v1Fr+drXcfEdRYxSv_Bm8q7sq=Egx13iaeQ@mail.gmail.com>
References: <CAMKF1sqE4AdE9c-v1Fr+drXcfEdRYxSv_Bm8q7sq=Egx13iaeQ@mail.gmail.com>
Subject: [meta-oe][PATCH v2] libpostproc: fix S!=B failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 May 2014 04:12:45 -0000

From: Tim Orling <TicoTimo@gmail.com>

Implement khem's suggestion, ${S}/configure $(EXTRA_OECONF).

NOTE: with or without autotools-brokensep, the following:
| WARNING: QA Issue: ELF binary 'libpostproc.so.52.0.100'
| has relocations in .text

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
index 148d169..aae1700 100644
--- a/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
+++ b/meta-oe/recipes-multimedia/libpostproc/libpostproc_git.bb
@@ -42,5 +42,5 @@ EXTRA_OECONF = " \
 "
 
 do_configure() {
-    ./configure ${EXTRA_OECONF}
+    ${S}/configure ${EXTRA_OECONF}
 }
-- 
1.8.3.2


