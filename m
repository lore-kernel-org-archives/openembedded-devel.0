Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A29457C2C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJYb1ryDz5k
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548841923;
	bh=16WUvItM3CPafCFKJ8Z4OFS4n9wusbGe8pq1ppmhJcU=;
	h=From:To:Subject:Date:From;
	b=JoJSzo1A37M9/4raz9DEU601i8h/DYs8ElRqU3MI9chlxEPWoUaqV43DcVv1IuHs7
	hAst4aJt7aoLA27sA3WfXqGBcf9KKGUMFWfBfk8zlYDhtRDZpFmH3oUBOMbJseCzEt
	D1sIs9tHtxe9IzGdmuVLZLyV7fqfB3MtQCXULLByxdmYOFSLF/czpTX0Eo70o2jptY
	6YvkJS5J3Kem8IW4ivpWKRqk8XZ9qnIXONZVfSu85tAQqpWq7zAt+6jUOqiksmyWyl
	fuUaS0ft7C0Jyi+5zuDWLrKroJ8w3TfVV8cToGnESji5qaaQkcibKzLRq+rkdWQIZb
	kjYoEpod+ftVjDH2TltKnRGmFds8dxx6LkDzCpI5ge9d/LSJOnvkfEJ4RhrvfOotSe
	hJS/jNuo8kQv1EswU0gtgTy5/UScSOFw6zyTkb9Ai/6TUJIacGGaKS9PKc31sd8I3O
	PlQreU/F76gR1+8Qn/L3bFS4J5Ii12y9jq3pADrDHMhr29nOhbajxEZhPl1ViWF0vJ
	eV85DMfrbd6X2fwY7UEZz+kcsFFEDApTENGJii4sUca2o5EVU4rpHX8Uwq0BtMHniD
	56EPaEeKSHm4t4xxP6KfLERITuCDELJ1N9tzsHM20MBWGKxTq5WObb9bbdMHxEjRyc
	OpgmXfKo4SSsOsZPkMeRs2g0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:52:01 +0200
Message-Id: <20190130095201.11965-3-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] wireless-regdb: update 2018.05.31 -> 2018.10.24
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
X-List-Received-Date: Wed, 30 Jan 2019 09:52:02 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
index 2b990db3c..e1aa9a517 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
-SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
+SRC_URI[md5sum] = "b81bd1f6525a4806a707881aa3dda63f"
+SRC_URI[sha256sum] = "0d3e845ac77d21aac9b88642c3dd043a83e3920d706b63d5e5c31dffdbec9116"
 
 inherit bin_package allarch
 
-- 
2.11.0


