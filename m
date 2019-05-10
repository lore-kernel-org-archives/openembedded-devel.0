Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C58ED7E085
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYc41lwz7P
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489316;
	bh=GgBKHxkGSUgF8l7W4CQGnc659yA9NNYIG3BySVRb/hg=;
	h=From:To:Subject:Date:From;
	b=AcNzd2+Xg1tfr1qGHQvWyfLMUFx9yKP2rLoAm0NzjD0pZKtO+HbgrPPNH5OJSmYD6
	AX4Z1v7ATyrOldP+yHWTLxI+FvdcevOLCkTfl4Cgpo25vPlNNiFRuVRMzE5L7wiqtU
	VfpXDdR2uBUso/UqmtnocHRZ7Uh26aKBVcfDyHX1yTSKIdOX8BDNlgV/+IaGOeCm+d
	s6krY1bSL11qwO7e1gTZ9teA4ezwe5wVjJ5MdhbEQh1zJwZ1ezDxYDT2CxhdmlGbgT
	uymTbCEhuA+DHmdZpnnbwg1e5nAr5cQ7u1Bnsr+YjN9dsliCEMRNLXjdMs2iWw9z9g
	dNXBlOuV3/S6mPN6IEIHndXpWKZ0QniGs5DfEkNkc9y0mRMkc5OFBAZijsn3nDgY4L
	i6wpnioYSXpOQVMzuPKdS2zRl7kX4RPFh638V3bkBBaWkIMkdVWjV3gncuYYvIADlB
	GqXdEjC0fp1wv04/D420Vdhs7JQCBEYkzG5JB/nVqiuZvIqwdw1/PL43ybvvcHhyi2
	tdfa4Ru8RaAgqrlqeWfTwjgtdPvthER5eTA5hMN7XMnahUkrohDIPQPUDF414/nk3/
	NB8LZlpfniWGT1LwSuDfBXtQIF503lCFbQ9gVaORTKgwxg0SgOqtKUtjgiXudiONdi
	SgCUKypP6HpWlUS1Eza4bjKk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:54:57 +0300
Message-Id: <20190510115515.19491-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] postgresql: Upgrade 11.2 -> 11.3
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../postgresql/{postgresql_11.2.bb => postgresql_11.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_11.2.bb => postgresql_11.3.bb} (58%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
similarity index 58%
rename from meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
index 0f59c8dd1..ff9306c1a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
@@ -7,5 +7,5 @@ SRC_URI += "\
    file://0001-Add-support-for-RISC-V.patch \
 "
 
-SRC_URI[md5sum] = "19d43be679cb0d55363feb8926af3a0f"
-SRC_URI[sha256sum] = "2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405"
+SRC_URI[md5sum] = "c2a729b754b8de86a969c86ec25db076"
+SRC_URI[sha256sum] = "2a85e082fc225944821dfd23990e32dfcd2284c19060864b0ad4ca537d30522d"
-- 
2.17.1


