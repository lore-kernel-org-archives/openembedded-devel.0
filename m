Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id AD8937D30C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 03:56:48 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r11so13849171pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 19:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KwCfGt5egh4YiPPFN0651XhpHk5DzqSUpC+O+8dvqgs=;
	b=ot4bX5yLXkDNeRMd1OxVCcJv3cRu0e0oA9hbI+8bSnz7mjRdeG59Vi77f0UiVM8/iI
	Z1IeZyJ7D+tRFCQM2D5VpfV78M1SbXU8bvf37zQ/AhuJ3HlRBUoFW+1woton/0K/fy6P
	AiBkbhCV8KL3SG7gR75TiAmfOlFjw47KdAj6Fovb2zqwEjEYE+Mu5XnA0slJt8O199Ad
	mf00KclCDFHBayuJeUKGbia25dB0MX6h3XI6L7ksFE2+SM1JRUBQHnEF6mSyyemAijMm
	01yL0qhrdQ3gAwdnl5cVi5Inyy9Zx8+AgfoDfu3s/Pafp+8YxleqpJchmtmZlBZghlzl
	J17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KwCfGt5egh4YiPPFN0651XhpHk5DzqSUpC+O+8dvqgs=;
	b=AopvJB2CBf5zzk2jLGKINLwCZ357h0i9WHIbGdP0glkhS7+EqOy/YlbP++CR+C8xdr
	dCkNSqgFaXFScW3C1N63PrqBV0V0CC21tysqZdYoWqceHkH5q8JTCudak2+XHnCoFRt9
	9N5W4Tp3pdiWBgydcXcwrtW05Cxyqpzd9Jwx6zIxTfl2ffeuD1nH1cIVDMrGiC4txhs5
	ZR9LnBk/orbHt2O+hducz93mGMSvtwQo7wC3WRvyVAxideHYIxB+YJIkU4UbCtfVYXLy
	wQWPevLFH4DagpHZaiP0+mZL8yq6XekCaxMoz8Q54U+dskSNqpmQ5R+yupOzBrFsKtbP
	myRQ==
X-Gm-Message-State: APjAAAVFqmMBiRwfYpAPFwKUHuiWqJiwe9mB94Lftr/hSSJSDX0yTRmk
	cGcFl/fZXYaxggWxa+YzOY92C/PcMY8=
X-Google-Smtp-Source: APXvYqzJ2v4tQZuN19wpoOnUSVBd2V1Zi4T9fOBW9i3r7sEm5T6TTdwJq2SjdnaLeEMoGyV7fO8ihg==
X-Received: by 2002:aa7:855a:: with SMTP id y26mr49402464pfn.175.1577419009443;
	Thu, 26 Dec 2019 19:56:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r30sm36673613pfl.162.2019.12.26.19.56.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 19:56:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 19:56:38 -0800
Message-Id: <20191227035639.303716-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227035639.303716-1-raj.khem@gmail.com>
References: <20191227035639.303716-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] open-vm-tools: Ignore -Warray-bounds
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
X-List-Received-Date: Fri, 27 Dec 2019 03:56:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-utilBacktrace-Ignore-Warray-bounds.patch | 33 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
new file mode 100644
index 0000000000..95664e8552
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-utilBacktrace-Ignore-Warray-bounds.patch
@@ -0,0 +1,33 @@
+From ac3f93ea087d3a5461fe57fe021d0fe9a959e13c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Dec 2019 15:25:02 -0800
+Subject: [PATCH] utilBacktrace: Ignore -Warray-bounds
+
+This is new warning with gcc10, until its fixed ignore it like gcc<10
+did
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/user/utilBacktrace.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/open-vm-tools/lib/user/utilBacktrace.c b/open-vm-tools/lib/user/utilBacktrace.c
+index b72340ad..97ca53f2 100644
+--- a/open-vm-tools/lib/user/utilBacktrace.c
++++ b/open-vm-tools/lib/user/utilBacktrace.c
+@@ -517,6 +517,11 @@ Util_BacktraceWithFunc(int bugNr,                // IN:
+    } else {
+       outFunc(outFuncData, "Backtrace for bugNr=%d\n",bugNr);
+    }
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Warray-bounds"
++
+    Util_BacktraceFromPointerWithFunc(&x[-2], outFunc, outFuncData);
++#pragma GCC diagnostic pop
+ #endif
+ }
++
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 9e4aa4881a..eda77c2060 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch;patchdir=.. \
     file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
     file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
+    file://0001-utilBacktrace-Ignore-Warray-bounds.patch;patchdir=.. \
 "
 
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
-- 
2.24.1


