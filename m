Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 481677EDF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:25:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JDjM4tYdz4s
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566969943;
	bh=b093+hMYlri0bkdf5UWlMv22LtuewbJaLkKSEf0y0s8=;
	h=From:To:Subject:Date:From;
	b=IUbMDk/crnGckXijCGMR6t91lpwcjHAmbTusvX2pjXscZ2QXT9NDEuNwXctjCOEJb
	tCqpZTeoDLr/ihd79dlCH1SDBIRpDpdrl+anE2qAUIqnJ0AZbJDoXAZPHOTUwYZh1g
	A6+8eQIfcyIfYpz/5eo2ftawQ5jOMuL5MeCq+5E4FPEpYHcNLZuGZ+sOdYYT8tq3Tl
	hJzkhzHi9qx+0lZLdM86v4++ifKKkK0hyhqJ2DCzx/d8L0HZpnzP1afKgjVQndrjW/
	4mUlmRiV72MPvm/TeVt9rhZ6JIYGDRxpYbUp4gJcXyJjU1dW3sYmxdZRRbwVnjDG6Q
	4f/3a3ptzXM/RQIRCa4VkwKRPiYB4qLas6n4q9EoNFOFXfIBe69KafgpY74IkcWBaG
	K4+u7oR8CP+dh2q3oildSoNMMraJ4DC/XKZa87GVm/YLKgC+06nnsmn8AOtOzWVPnJ
	jBN7v+I2QdpV4SQWkAjZFtZQI/f4byE8LQ/7zEksfpFf62y5ezInDAJ+V9RwScBnD9
	0uWvaNIbRok3Ugy/FjsJMPWKSg/ErwoEA5/tKtxTTS0zjzGuFueT19gzRdFC36T9tD
	GmqHdO8/bwFybp2lPtBzmfbAF67pl7GRvffemzfhdhD0r20Vt3xIum/dC0eebnXOv5
	CiFJ3OXJucutXOIZcnt/iQQw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 08:25:43 +0300
Message-Id: <20190828052543.2084-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libgit2: Don't pass parameters with their default values to cmake
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
X-List-Received-Date: Wed, 28 Aug 2019 05:25:43 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb b/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
index f02f5e738..82acc4926 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
@@ -13,12 +13,8 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE = "\
-    -DTHREADSAFE=ON \
     -DBUILD_CLAR=OFF \
-    -DSHA1_TYPE="builtin" \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
-    -DBUILD_EXAMPLES=OFF \
-    -DLIB_INSTALL_DIR=${libdir} \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


