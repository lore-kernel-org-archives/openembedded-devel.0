Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1436F77E92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a188so12674611pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l1veGwEjYXWE2ZXhtL1lPRIAVwlE9HHwZnFhoaTXkIk=;
	b=N4C6J/IDn58lbSs0V+Bs/CzlCkp9kvhJiWKVlEiNAUsrOlJXvfl7JSMWpHliFEyGSX
	8+xX6rbG2lC6f3I+Si6iaKjO+XWwK4o98RFmPES03+gWA3z3rwxaq9gZcayVZg79D8/e
	AaNkAxK48hbM+XUUJV+6AMcWpR9ZpRUn5OzJmk9uX0VmfmdXJzr4P6XZb42vl8r9YFOh
	rwHa/Cw8J1ZYF+Jj7gfmihVXmlnjrppBZel/LmWpzArUJzN5VraTAywxdL8ivvNJK9yi
	+Q17ZNIzL2G+udDGStOKB+eJWx04XP6lnHlJpOG0S/62dvKjBp0j7jAv44s6grhGD2Sr
	rN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l1veGwEjYXWE2ZXhtL1lPRIAVwlE9HHwZnFhoaTXkIk=;
	b=B2bvXzwiotnRc2Fk5lasomiiTgqNeQXmA33kjmNbprA6amYKcZ9qJ3ssSPix9wTbYA
	yQ273SEXYQqCwxcOwgec4+rJpCij3OeJeCHy3aAW85hrO2a8V577bsdGCoTePX7NsnGF
	rVWoShbnAPTWKri5gtNbZZ6Mg2xuvDRbuUaxwinpYGr7U45Y9XY87beK3zcoNgGsNKj5
	DOC3DPGakkSQRK8bbWo5WS2IWmfEwmolBYr3Ro8wxJS3MCsYvmCo5aqCNk79ZlHF8dhq
	2RYbsi18iZRavt9RlX2rBUK/HY7a+H/hBXYbMbv+dWUdGfYKczYcv1Qgm9sZrH+cfB+v
	kboQ==
X-Gm-Message-State: AN3rC/4DzqBiKEhOUBAuPhcrg4vaVNuiLLO27DG6iolXXSAilWqJ/itP
	NpwWU4I5PS+M+g==
X-Received: by 10.84.238.141 with SMTP id v13mr5465243plk.13.1492116114768;
	Thu, 13 Apr 2017 13:41:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:01 -0700
Message-Id: <20170413204106.30679-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 24/29] librcf: Fix build on aarch64
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/librcf/librcf/aarch64-support.patch    | 13 +++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb           |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
new file mode 100644
index 000000000..28cd0fe60
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/aarch64-support.patch
@@ -0,0 +1,13 @@
+Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
+===================================================================
+--- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
++++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
+@@ -60,7 +60,7 @@ namespace RCF {
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
+-#elif defined(__arm__)
++#elif defined(__arm__) || defined(__aarch64__)
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index b8d15835b..51ad7ec9c 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=137c2935b51c95068a8b1bbd434ffe2d"
 
 SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
+           file://aarch64-support.patch \
           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-- 
2.12.2


