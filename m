Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2C071BF0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:19:38 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id o21so11726309qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pJ5b3FjOX32X21AJM3C8nqLJ10kpYQ3oamy3us5wEQA=;
	b=D5jUuFCJ0BuVCHtv7/2EGHsDZtDQ7aoWcU5jnLuyE5lpd9P3tViKlSFR0+DKvx521Y
	5O/Xm49A4ayAr27QwTBtAcxlEbERFn+xFPpsSwoHxelyLPQqLynTIGBsgXBpGUIcpjXX
	tkKVxkCrmYnVLI6K7wZaM0KzVJbUfv3gEmKbcNOGgGtTa6IGJPsFob6Rqceedjnmidnf
	A/VOJbkKmlAGHTQfRPhNxyz84CaALcuJPdOoQppZw0UjYiTgEw0CYwMErgUB6uDS6qZE
	69ym/AzrI2Nw8YwNf/k4GmrIyokpYjkfF3kN11oK60kfYRrM+VvGIrP5MYDLv0/CqK3W
	KbSg==
X-Gm-Message-State: AKS2vOybFAXxBFx9gaZlpNJl783L2LiwDgC/xxs+LbkjKfyIz8M5JJ53
	JHdMgN9Pz3DgNnpUSt4=
X-Received: by 10.200.0.153 with SMTP id c25mr13961718qtg.28.1497633579438;
	Fri, 16 Jun 2017 10:19:39 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	n37sm2160099qta.12.2017.06.16.10.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:19:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:19:32 -0400
Message-Id: <1497633572-1306-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-serpent: update to version 1.22
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
X-List-Received-Date: Fri, 16 Jun 2017 17:19:38 -0000

Verify the license terms have not changed and update checksum based on the
latest PKG-INFO

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc              | 6 +++---
 .../python/{python-serpent_1.19.bb => python-serpent_1.22.bb}       | 0
 .../python/{python3-serpent_1.19.bb => python3-serpent_1.22.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.19.bb => python-serpent_1.22.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.19.bb => python3-serpent_1.22.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 0b1aa91..8b98043 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3773e39c491bb1f9ccc98389d57169d7"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dd6e89638fc70146d17dd7087fa817ae"
 
-SRC_URI[md5sum] = "cdef596f727cb6b4176c89769d2d41ee"
-SRC_URI[sha256sum] = "946b2c837f889971df3575af9dadd8f09bfe48549ebc1b9f6434263b653707ce"
+SRC_URI[md5sum] = "6950f234edcacfa1d31b6655ac3c6256"
+SRC_URI[sha256sum] = "a67ca57082b00ea734854d751ab19e8a49d4ea0d4be7194985da35863fb9fb19"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.19.bb b/meta-python/recipes-devtools/python/python-serpent_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.19.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.22.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.19.bb b/meta-python/recipes-devtools/python/python3-serpent_1.22.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.19.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.22.bb
-- 
2.7.4


