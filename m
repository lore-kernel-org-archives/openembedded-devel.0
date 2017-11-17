Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE31F78798
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:02:02 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e19so7179321qte.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kdA6c7GGVyyEKUyRZI7MQRuC3mrr9b55ZC0s4oZYU4k=;
	b=hG4fhWhtVUG1oQni/grFBYcwmqZLNXQC1EmAQoSCRrOVe66yuRozwZcif5lEhvsdeh
	29Qly28e2k4BW5eu9vM+omV7FWWYasOBSSW8ria4fTvyRjsAivUQ1Qe3LwvHw2mO+Cwc
	qFSUnmG8/u1zSz9r4alMmlu5l9LyvjG8kX4Glg27ue5asGW21yThSMIAazyIr9z0D3rD
	WXodJwYqjxSartOWLiku4DV8GeFk1rlOxGVU861tSSwzpyNsFAqkIphSoFtzDkh27csX
	+xceMt0M9nRRU/svPUqqW1KvBYoZ8Phc+HFTvVmlrit1kjyifYcVvmG3CtWdseaD03bD
	6g1A==
X-Gm-Message-State: AJaThX6UYPxFI9Ku35hp4Mhmo+YX619Os3qnGAPbo+NAJie+zk0njrYp
	fvvZU8+FbMRHyDtEReON08vx8FgO
X-Google-Smtp-Source: AGs4zMaLLXSbbwUiXZNzDM7xn3LVHLQrtujEjDRj5DjVJhlO9U3BhfF1xBwBwup8s2/c6vP2A7y0zQ==
X-Received: by 10.55.99.214 with SMTP id x205mr9197426qkb.34.1510934523538;
	Fri, 17 Nov 2017 08:02:03 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id b36sm732891qtc.86.2017.11.17.08.02.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:02:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:01:54 -0500
Message-Id: <1510934514-13593-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-py: update to version 1.5.2
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
X-List-Received-Date: Fri, 17 Nov 2017 16:02:03 -0000

Update license file checksum and verify the MIT license still applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc                   | 6 +++---
 .../python/{python-py_1.4.34.bb => python-py_1.5.2.bb}              | 0
 .../python/{python3-py_1.4.34.bb => python3-py_1.5.2.bb}            | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.4.34.bb => python-py_1.5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.4.34.bb => python3-py_1.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 1aef0e7..c7d6727 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
 HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b506f3df287708b2f99588b5cc351091"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "d9c3d8f734b0819ff48e355d77bf1730"
-SRC_URI[sha256sum] = "0f2d585d22050e90c7d293b6451c83db097df77871974d90efd5a30dc12fcde3"
+SRC_URI[md5sum] = "279ca69c632069e1b71e11b14641ca28"
+SRC_URI[sha256sum] = "ca18943e28235417756316bfada6cd96b23ce60dd532642690dcfdaba988a76d"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.34.bb b/meta-python/recipes-devtools/python/python-py_1.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.4.34.bb
rename to meta-python/recipes-devtools/python/python-py_1.5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.4.34.bb b/meta-python/recipes-devtools/python/python3-py_1.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.4.34.bb
rename to meta-python/recipes-devtools/python/python3-py_1.5.2.bb
-- 
2.7.4


