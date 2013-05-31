Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 48D62608F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 13:35:26 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u11so2187160pdi.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TlVtfhJnHj33bi8Jhm6oLAQOMM9dzQ8yBWAd3A2ZAL0=;
	b=QWmPMYCAnTIq1WHkzw+7+OFEHMIObMKfv2L2Fa3cweuz3DuT38JcFsCSYNHrHG2Wma
	ZJZvrtu7wCUr0RlGmhhjgQ1ruFAnoyY9CwUAQmO0GvEHtRPYzqz7s2RS2wsVol9Q6SE/
	+rJlDxVfYc+bRPt337sRQvzi1EwnL2QiUv3UqIKJn1WaKzYO4A3yLtrQ42O4cFBHJ8l5
	GEDwFWNqmAgSp4qjdoFSeIGcccHBN09l8B4CLUun6v0tyYpiUmwLcH4UdtRplXUyS37l
	VCDwgIUrhHjNzr8q00Bs+5unYAomrMn5SVC401XCvFW2YzgxvBhlr9gtPd9Z9YWCeM4W
	NgnQ==
X-Received: by 10.66.232.164 with SMTP id tp4mr13603845pac.39.1370007327484;
	Fri, 31 May 2013 06:35:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id b7sm46717944pba.39.2013.05.31.06.35.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 06:35:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2013 23:30:30 +1000
Message-Id: <1370007030-19796-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] llvm: fix parallel build
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
X-List-Received-Date: Fri, 31 May 2013 13:35:26 -0000

Doing a parallel build may result in the following:
*** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'

Avoid this by building tblgen first before building the rest of llvm.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 546a40b..a56fda0 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -104,6 +104,11 @@ FILES_${PN}-dev = " \
                    ${libdir}/llvm${LLVM_RELEASE}/*.a \
 "
 
+base_do_compile_prepend() {
+    # Avoid *** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'
+    oe_runmake tblgen
+}
+
 do_install() {
     # Install into a private directory to be able to reorganize the files.
 
-- 
1.8.3


