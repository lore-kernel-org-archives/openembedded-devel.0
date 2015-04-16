Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 87A6873D0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:03 +0000 (UTC)
Received: by yhda23 with SMTP id a23so4520810yhd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7zt3WfpGYXj9AOOU1NBJ1CJN2Y9v4MlIeDG6KFQrncc=;
	b=gJ3SYaQl/2NfJoQzmBNmq2hEaqSfif/fKchhc9vytJlLtbUwHSmuYsKh30GSUh62vM
	NVrbe0UIdg/HuaszVetsuttCVdgH6GN3C7JoVLzFd/aNlzGlQ7OFXIRzkXX8li3t/GE1
	xMda6LvjiqYy/P3NrM/tdPyicCGN11rtX4UBFcbBEEdZ5l7+9TLT6tJXbSqeEW7J5Pie
	n8V3vlE4YrSx/u0x4hxyMEd681IlXf9R1Jd7+WPz+0I1pJdeKtTNpig6UQXTPWZ+atUu
	ASeEyXGSuPDY1kNAmsoCM3Ru5y2KHSGthziMCr/I8XeykG+83NnVe0nU8CuR8jL/odc+
	9vdw==
X-Received: by 10.170.95.85 with SMTP id m82mr28484379yka.55.1429197485352;
	Thu, 16 Apr 2015 08:18:05 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:39 -0700
Message-Id: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 1/7] python-cffi/python-pycparser: enable native build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 15:18:04 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-cffi_0.9.2.bb     | 2 ++
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb b/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
index 6c34b67..90d8099 100644
--- a/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "b1bf4625ae07a8a932f2f1a2eb200c54"
 SRC_URI[sha256sum] = "1988ce7ff9c64ecd5077776175e90fd8f0a8c827cb241a23647175ce08126bb2"
 
 inherit pypi
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
index bee4052..fbb6486 100644
--- a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
@@ -6,3 +6,5 @@ SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
 SRC_URI[sha256sum] = "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
 
 inherit pypi
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


