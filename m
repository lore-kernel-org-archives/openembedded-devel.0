Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA21780D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:35:34 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id m84so7300089qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GXGiBEb4Zk7k23HEMxJAecoGqbN1wG2HSmyyy1SzYnA=;
	b=L5OQfPqKSpGlsvnD2qPV3hgX08b06N/cfq2R8JmCsnuUqoa6rZQ73/sOkN0LJ5/WSy
	6puK5H9yzjggMGF+fu8tquvySmZndtTgMETl7/zSJZnSfqzAK80uwNPxeWEHURvTMEwk
	wfmLmSCkYAMIQafuL2/VrTVK3irXLu8Xkarz0eP0TOSZ424wIfc1y2OQRToZcABR7VzV
	tWR4hTuEiE2Ghe4PEp6L9eNU82hM7+ulyL7ANTwZw1XGH0YX3zhxNYWzDUBZ0EvIiw64
	yyFTKJeWGWr0MGg6ic1nMRiqCXNOV9hhp62CKYOzPPJO9c0xpKDuPkFo1tfJKb288p/P
	SG0w==
X-Gm-Message-State: AHYfb5jSHflZRIdvXDUlKZhJM3kVsZQVQjb8XZb3lc9dvBhIlgx9cisZ
	UjzbcAtiVAZmhAQ4EDk=
X-Received: by 10.55.144.130 with SMTP id s124mr13163388qkd.136.1502328935685; 
	Wed, 09 Aug 2017 18:35:35 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id o1sm3301251qto.72.2017.08.09.18.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:35:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:35:29 -0400
Message-Id: <1502328929-11329-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-requests: update to version 2.18.3
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
X-List-Received-Date: Thu, 10 Aug 2017 01:35:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-requests.inc               | 4 ++--
 .../python/{python-requests_2.18.1.bb => python-requests_2.18.3.bb}   | 0
 .../python/{python3-requests_2.18.1.bb => python3-requests_2.18.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.18.1.bb => python-requests_2.18.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.18.1.bb => python3-requests_2.18.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 81819bf..03eb7df 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=979d6a23b143e13ea0e5e3aa81248820"
 
-SRC_URI[md5sum] = "40f723ed01dddeaf990d0609d073f021"
-SRC_URI[sha256sum] = "c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9"
+SRC_URI[md5sum] = "c8f60cf816a35c0c3fef0a40d0e407a6"
+SRC_URI[sha256sum] = "fb68a7baef4965c12d9cd67c0f5a46e6e28be3d8c7b6910c758fbcc99880b518"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-requests_2.18.1.bb b/meta-python/recipes-devtools/python/python-requests_2.18.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.18.1.bb
rename to meta-python/recipes-devtools/python/python-requests_2.18.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.18.1.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.18.3.bb
-- 
2.7.4


