Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 900B572F30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:31 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so159444pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l1veGwEjYXWE2ZXhtL1lPRIAVwlE9HHwZnFhoaTXkIk=;
	b=cXoHXVc6wzRRHAt5PCepJYbrC3T/IDTDEjeJt+/CTWfd3vePPjAbDIz+LQke/MoTne
	61NEIKt+U4M0N0D0TvlgG4iUEl38d1gXe7SAj3ScaYoWn7VRZ4G1CHz/mldqwdNmMzyt
	ijDkCo8lsgvRp3tQF4L7iL/xZ2xeQWV8YhcRR/BuGe/5hJQJeO8K6J9W4vnIqP1dtfb1
	pv0kw2FBaPX9kcaX7nNLlKAGH0v31lUBM6eIW972pN8XM3GDVmK+xFz/xtDLEAToUsDA
	uw7jJXryAJjqfcpgu9mqRuYsMvavKBZS6FCVRE9XBbKk4i4EnZM2Tq6uoc2SQ8lQiKgh
	2CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l1veGwEjYXWE2ZXhtL1lPRIAVwlE9HHwZnFhoaTXkIk=;
	b=SpX7HpsVr8NTL0R3Q6rUPhcjm93PGwQxaHAco0IAWwNPWXRKiMxzJCZn1zURQc6Hf1
	Qy920NH9vBkOoFvDWnPiumcedJi4MwS7ukLZruOp2yAaE/i4f3b/YmwEQM3nP3nWPPug
	Xh3P/LaUajgxcqTOf8vG7FpL5D+HHxwVvy8VPIOQiJiL5+WZkVEUWe1w/6+r3fkLQa4z
	e/BPDD3r1H0MhELv06ryqBuMGRafm+QnxpXn2ZFY6yvm4t47vrvQCvjL6vOvQq8Dh2Wy
	R5shMj1x/WosgkOD2/smW9n9M1cicaxcjJ5ejzksSNXo91ukdPlF6AtjqOU+2cxfYzWm
	N1Ag==
X-Gm-Message-State: AN3rC/6q1nCv2FSJgOjAIIY3RhVksR6Gqcv8kMOuvHfd8GxiRrtJrQIc
	ufe6N5x/ayM7lZ38
X-Received: by 10.98.138.150 with SMTP id o22mr18996711pfk.69.1492539752582;
	Tue, 18 Apr 2017 11:22:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:35 -0700
Message-Id: <20170418182142.27253-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 25/32] librcf: Fix build on aarch64
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:31 -0000

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


