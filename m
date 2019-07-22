Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D96EA7EF31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:32:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sYGh1Ty4z4M
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563780748;
	bh=ULyAZh4Hwt8clL7F2C+K85yewYP0OYpZG/smV4Zo/2o=;
	h=From:To:Subject:Date:From;
	b=tpmstup2opNxiDKaF8RWqRMjIxnf1qJfyhmh+7Llsl3qulsgKMH9/rWuK/DJ/7E0p
	0Asg+7AviRRQ/5XCcNNSm/CQdgMMLNAU17QGKAm5E7zHB8QVWiB6lFCVP2AjE5V+1h
	OOZs4oKxnlOZAAibucTWynVNNbW+ZdtTbrph+ouPn671XpNlpdxM77lOTWhRZvm2yJ
	+JSw25L4O5L8qpmnHqK2itjeY0x6ZAQalUgnWT6B7If6FhkTiRIO1WRyLSeitfrxuL
	WuxNisQ5HbgHw+R7tDDXwh6lFmV+nPv9uJrvI4GTLpbyTFdOM+VmuZjjjQMR1NTlHF
	ByCk4nSGgLjlmeAVYSO27Bpur9lNYzyGA8x0ICnBk5OwNlDOUgGxrGkK9vit7gfwLF
	OxFhwSu4bTiaK6Ww2Dgb8J48nIrYHjE1btFWyuHap1udA2vG52Hd8oc/st18X/CTik
	zMHn81dMyYpSSWqnNuXTctR9WXLpsG9KBzES28tMeNJ+RP3kYcuGrrmmGpU9wjoHC/
	kNORoom4P1jq3sDLF2s3B4xcokceDVStqfpqdSwm3FUvhirkmQA49X+LU+dJseadog
	1Lok85EiU5+xC3KZAA8BJMusZ7w/8dojGF9sAWFxC/GSs74zXn4y0YSIHvDlm+WtVe
	6FsgvCAXwaC1Fpy2kbCNNyeo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 10:32:23 +0300
Message-Id: <20190722073224.9950-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] jasper: Use the new upstream GitHub location instead of the defunct tarball URL
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
X-List-Received-Date: Mon, 22 Jul 2019 07:32:28 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
index cc6a694ce..d2c7ffdab 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baa697d7510288a9cdcce9bd7edaf9bc"
 
 PR = "r1"
 
-SRC_URI = "http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${PV}.zip"
+SRC_URI = "git://github.com/mdadams/jasper.git;protocol=https"
+SRCREV = "b13b8c86be870107f83b0a9a4b77557cb2b65d69"
+
+S = "${WORKDIR}/git"
 
 inherit autotools lib_package
 
@@ -13,6 +16,3 @@ PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,freeglut"
 
 EXTRA_OECONF = "--enable-shared"
-
-SRC_URI[md5sum] = "a342b2b4495b3e1394e161eb5d85d754"
-SRC_URI[sha256sum] = "6b905a9c2aca2e275544212666eefc4eb44d95d0a57e4305457b407fe63f9494"
-- 
2.17.1


