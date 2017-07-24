Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 66A9371C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:32:06 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d136so10676194qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Qzs3wsYysd/V0uXMD+YZwoKyas7f/XQR3vrayPq32n0=;
	b=Qv6csPhc0dctttVrZ6jAyU5MLFbVyQvlThgjf4IPU1FtNE18WkfzIek4pNuDu+3LCM
	j40UCJHk89izGk2dw3tWNK4kDP+Q6C85l8Ythp3TeqmRR1tKCriWrPYjqJUbu95L5qiV
	r2Y583/4zRj4Dd1czPDdI2/ULeJER2r0o0l2K9UuyxKaUkqYv46zoZ1ZI8TPiyo1kBSd
	PaymROgYnQQgGEowl0oiLnQA9mLmoTQdHE+XVfWwpYS0ssLkuqJQPRYHLLy4+6ScDtwH
	kYBFezef+MDiROgzvM/p4XPCs+JJIK1dlxVNpBT3LxchsCMthgp5s0pG5LPn7o1t6Xfy
	dnQQ==
X-Gm-Message-State: AIVw110C8xQRf276ASTu0KXGmhSwNEwSlT0qgcAvv7MqyJplQgUADFld
	Wrh0AcPKHzXoY6s3ydc=
X-Received: by 10.55.168.140 with SMTP id r134mr10970949qke.204.1500921128047; 
	Mon, 24 Jul 2017 11:32:08 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	t43sm8997302qth.30.2017.07.24.11.32.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:32:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:32:00 -0400
Message-Id: <1500921120-15260-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-serpent: update to version 1.23
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
X-List-Received-Date: Mon, 24 Jul 2017 18:32:07 -0000

Update license checksum and verify terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc              | 6 +++---
 .../python/{python-serpent_1.22.bb => python-serpent_1.23.bb}       | 0
 .../python/{python3-serpent_1.22.bb => python3-serpent_1.23.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.22.bb => python-serpent_1.23.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.22.bb => python3-serpent_1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 8b98043..6454ee0 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dd6e89638fc70146d17dd7087fa817ae"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9f611d4c9e2816d387bab64c40d93294"
 
-SRC_URI[md5sum] = "6950f234edcacfa1d31b6655ac3c6256"
-SRC_URI[sha256sum] = "a67ca57082b00ea734854d751ab19e8a49d4ea0d4be7194985da35863fb9fb19"
+SRC_URI[md5sum] = "d9d6afa51f2560cf5933dcdfd947011d"
+SRC_URI[sha256sum] = "8480ce3d8864b8974d9fe396998c6a7dae96edb68edf905bfd32ea9a11853ba5"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.22.bb b/meta-python/recipes-devtools/python/python-serpent_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.22.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.23.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.22.bb b/meta-python/recipes-devtools/python/python3-serpent_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.22.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.23.bb
-- 
2.7.4


