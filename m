Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 66EAE6011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:21:58 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o77so1053600qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EcejGPRwyO9ozvLhJjrVjbQKLcprxSGPtlGRZDYpw+4=;
	b=Uh7/TZOawcQNr0rvd9r8BPo1Ef4ZcePKRqeeOWizLJk/s4HfdcUWnY0ZYTizM970wj
	6bGuSkrboSikl731myR907WwfgvXpdmybV6hCIyK2fRXImGlCodfSycZmZbxH0dWlSED
	jld3qjiKKhWWC1SZr5ERkslV4IW7YXan6JzjKuBn2XLRantQ301ThjtZ/AEnVD4wKi+P
	dg63rimH6IbWc1dODTWcK4xNbej9khvUE0dwheBTkw6XBbB12r8pZcYQPCOit63kf/sG
	w6/RSwF0KddRtt2o2C52cILAX0OabqocQooQoCELPV96oqv1jBvBr5H3dA57e/PxYr+R
	XtPg==
X-Gm-Message-State: AHPjjUgtAtdO8nZ/wL23j5Tpz/bajVUA2zIP8qLiosTlCAZBbsN885aE
	9krTPt+KYACpnhF9nrg=
X-Google-Smtp-Source: AOwi7QCxdeS5Z5XJCVGr9uD8Z7d15H1ye3MhIBejgaGLkr+lLRQC6DkOQUaun0/ew5OsGBYOrDc9tQ==
X-Received: by 10.55.159.80 with SMTP id i77mr22178587qke.76.1505766119122;
	Mon, 18 Sep 2017 13:21:59 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	h58sm5740222qta.82.2017.09.18.13.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:21:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:21:51 -0400
Message-Id: <1505766111-14853-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-aws-iot-device-sdk-python: update to version 1.2.0
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
X-List-Received-Date: Mon, 18 Sep 2017 20:21:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-aws-iot-device-sdk-python.inc      | 4 ++--
 ...-sdk-python_1.1.2.bb => python-aws-iot-device-sdk-python_1.2.0.bb} | 0
 ...sdk-python_1.1.2.bb => python3-aws-iot-device-sdk-python_1.2.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-aws-iot-device-sdk-python_1.1.2.bb => python-aws-iot-device-sdk-python_1.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.1.2.bb => python3-aws-iot-device-sdk-python_1.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
index a64c6c4..eaeb020 100644
--- a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
+++ b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aws/aws-iot-device-sdk-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30"
 
-SRC_URI[md5sum] = "6835982c7fb36b19aa474d346f29ec3d"
-SRC_URI[sha256sum] = "ac98d39d7230e06fc9a30bdb3398c985a7c357b10898a769db022d315855102a"
+SRC_URI[md5sum] = "e6781f6c42bbc547d508d6fa6720ac8f"
+SRC_URI[sha256sum] = "6b2865d4f518794b96a834fc81b568428daa0ef92037da2e9288b4af5d8dd736"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb b/meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.1.2.bb
rename to meta-python/recipes-devtools/python/python-aws-iot-device-sdk-python_1.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.2.0.bb
-- 
2.7.4


