Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC624783CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:16:18 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d145so9458930qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OUNCyldyd9MTsrWnAnAox2IoglDuJG7s6OcMebg1dcQ=;
	b=dbFSNkhYp9VWptaR8u7EoSGsUD55zINtQqhAj6Abn/AMDGX/HZqLDnKLPa2XO4hijO
	ONqkFY4box/fvEsZj+feSSsJkx+i3hVkQBw5DTVs8dcju3h22EUIV2Cj6xT4IS+1dfPv
	ftwnqL0hhJexrEBpvW22am/2AuqkWekL1YbrkRGRlsBdSCTnySu0nVr7ksB6U8e1qx1T
	7PqLvfEUBt6e54E72zGFkvBUByzXA5+FxfpnskGfk2QKEmNWUHC6KhwfLf11d0Yd6Ud8
	SRHoacMnafDFrceRf/4IPmWkJzdD4YhP2XrL0AoY6SG2Dl37a/I8hvcyel+AXlt8GPa7
	i+OQ==
X-Gm-Message-State: AHYfb5iTimq7tcdrS0fnTW929gY3iuBNr5zTnSEfyihbFBCIZalkKlva
	m6tO8JJDqMpBdxN1YRg=
X-Received: by 10.55.77.194 with SMTP id a185mr29237340qkb.338.1502720179501; 
	Mon, 14 Aug 2017 07:16:19 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	d184sm4972598qkc.68.2017.08.14.07.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 07:16:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:16:07 -0400
Message-Id: <1502720167-20094-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.2.1
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
X-List-Received-Date: Mon, 14 Aug 2017 14:16:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.2.0.bb => python-pytest_3.2.1.bb}         | 0
 .../python/{python3-pytest_3.2.0.bb => python3-pytest_3.2.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.2.0.bb => python-pytest_3.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.2.0.bb => python3-pytest_3.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index bfa6e46..5dd1783 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "f7c0ffc970b26bdf8e6ba1c67af2ea79"
-SRC_URI[sha256sum] = "0225cf10b9e173f84729d5f4648211458a222c6e53a77a85e104bc5f31c244ee"
+SRC_URI[md5sum] = "635976c2a9b2c2599d69fb0ad5abaf7d"
+SRC_URI[sha256sum] = "4c2159d2be2b4e13fa293e7a72bdf2f06848a017150d5c6d35112ce51cfd74ce"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
 
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.2.0.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.2.0.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest_3.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.2.1.bb
-- 
2.7.4


