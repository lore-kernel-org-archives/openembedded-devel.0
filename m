Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 2B96661B75
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 13:11:30 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 077B96043B;
	Sun, 15 Mar 2020 14:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584277891;
	bh=SFXf9Mv9hKEtDl1UYVxZWBU9RQj/hhdikxnllQf/lEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ruIUJMT+F6ZvlhXRULqnmrlqeK/DUC4AdTb30kKPW5GqPs6UW5JVhbkdKzMK9sFoF
	Kd1bV2U2bqmgPWOTlo4d0NC2M5cH0Potr0MT8Ovr5GkVc86GqUgjyDWZMidObeKjrt
	8Y7Hqy79WGbemsQlzn3yQfnAS8UrrZ3rK7ssLkCGZXs3hXlS3SSgwTNgHGR8MuAsEk
	r0un2nTYWg1qd7g3oWaHXbDEBqEEdpj9D/N2hQhgNvzg4f/7ubnm+xuLHfuATx8bXN
	sGnH0VPq/vjaOQF6ZF4BV1V3Am9TuE8cogjJPJiA0zNrCAVuaKVABXkv+6rZ5BZCks
	TGLf5okQ6hLCw==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 14:11:26 +0100
Message-Id: <1584277886-652-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584277886-652-1-git-send-email-pjtexier@koncepto.io>
References: <1584277886-652-1-git-send-email-pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] flashrom: upgrade 1.1 -> 1.2
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
X-List-Received-Date: Sun, 15 Mar 2020 13:11:30 -0000

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} (77%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
similarity index 77%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 074a1a5..17445ac 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -7,8 +7,8 @@ DEPENDS = "pciutils libusb libusb-compat"
 
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            "
-SRC_URI[md5sum] = "91bab6c072e38a493bb4eb673e4fe0d6"
-SRC_URI[sha256sum] = "aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19"
+SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
+SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
-- 
2.7.4


