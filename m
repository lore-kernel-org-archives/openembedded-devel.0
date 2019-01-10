Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0FA7C09E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:13:23 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-8921-123.w193-250.abo.wanadoo.fr
	[193.250.63.123])
	by koncepto.io (Postfix) with ESMTPSA id 15EC1605EA;
	Thu, 10 Jan 2019 21:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1547151204;
	bh=KvSQe9h9oKMF7OskMCMXo7eza87Dwp2qcNDgHA0BmUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouDLNOmg5yOCzqarIQb5zgE/epcl546Gm6/3xIavQnIUcB3HwonlOB1YHaUbV7Yjb
	P43cHHnDpBURAU6GXAqZPupN+0x3l0RM2EktiSxH+dMzGb8n1s1/WqmXJRWmhYbIUJ
	b7dP5T0ZrZUhFQW3B2OKIX03Di/vsmj13O1pabUBOBfuWLHThCEA5qVeUckzN2bfGe
	ntPO2PYka+b141Mia1dx2d0voOupVCLM5IERqMDLWR4GlduWTHm6OV+wFZe/pAUnYf
	66IwHLBVYuaDSzqouWIXL+9FkT092iT0hlqVY6kSbjpNTiss+QlJVEADcmpFNzs0Ey
	kLIIPEYHrsXdQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 21:12:41 +0100
Message-Id: <1547151161-31217-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547151161-31217-1-git-send-email-pjtexier@koncepto.io>
References: <1547151161-31217-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH v2 2/2] qrencode: 4.0.0 -> 4.0.1
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
X-List-Received-Date: Thu, 10 Jan 2019 20:13:23 -0000

Upgrade qrencode from 4.0.0 to 4.0.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---

Changes in v2: None

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


