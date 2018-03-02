Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D71E78983
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 13:48:01 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id f25so11953404qkm.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 05:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sp0v5CI/5QFrGMnPIfUTnpzj483G4eRpEwpk0dFfjCU=;
	b=frLLa2otVFiG/6ZOvfS1qpb8MZMFXWQs6ED/aTmMxP+ADdWan0b3ZClxLDPKP77TWV
	L6gdiLxIAN3sSvrNHj/KKEPLjN7Vnut2GMlNfNslbcM2qBFdYUm7ffQaoojrDoVfNrB4
	moPO84W2uG67wHfFC+3mmQAXWpV+JQSjXpu3q92Qj0M8ycj80iK8YmMo3v0l5dHtCOSB
	3HF7kQGdGthy0g7MxoBOUN9BeCVbUqqHqD6mkVqC5SYnGSWq+dUDpNaqChH4M70krp9A
	9rdJygko9TtoSS0ku7IbRrMbS7+zECo2YL03PsZR2jLd1ZgUNnTTjPOlPC61PjAjZDQB
	K2OA==
X-Gm-Message-State: AElRT7G4kzhKIM0Jm5lCMcL7curaRyjrSC58XMdHeCYwcG5V0lGFx0P6
	fpait679jh2RWiqU4oFZgOeYDTzf
X-Google-Smtp-Source: AG47ELtQA1tZ4BOgeumaL4ZGSjN/YPtalP0yo1D4qmOza1OreX3O6anlaiq4Wd3zMoCdYqyc3ToWpQ==
X-Received: by 10.55.123.197 with SMTP id w188mr8495046qkc.70.1519998482448;
	Fri, 02 Mar 2018 05:48:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z127sm4225029qkb.1.2018.03.02.05.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Mar 2018 05:48:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 08:47:51 -0500
Message-Id: <1519998471-1729-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-serpent: update to version 1.24
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
X-List-Received-Date: Fri, 02 Mar 2018 13:48:02 -0000

Update license file checksum and verify the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc              | 6 +++---
 .../python/{python-serpent_1.23.bb => python-serpent_1.24.bb}       | 0
 .../python/{python3-serpent_1.23.bb => python3-serpent_1.24.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.23.bb => python-serpent_1.24.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.23.bb => python3-serpent_1.24.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 6454ee0..3f51bc2 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9f611d4c9e2816d387bab64c40d93294"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=acdea68f0e5a89eb6cbfdf54e38c356e"
 
-SRC_URI[md5sum] = "d9d6afa51f2560cf5933dcdfd947011d"
-SRC_URI[sha256sum] = "8480ce3d8864b8974d9fe396998c6a7dae96edb68edf905bfd32ea9a11853ba5"
+SRC_URI[md5sum] = "d0c50f1943ff86d830eb3fe40f6dc1e3"
+SRC_URI[sha256sum] = "b6855483d95a03b6aee358363684cd38a3a670240da5bc6da4253079cb07b8df"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.23.bb b/meta-python/recipes-devtools/python/python-serpent_1.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.23.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.24.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.23.bb b/meta-python/recipes-devtools/python/python3-serpent_1.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.23.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.24.bb
-- 
2.7.4


