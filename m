Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9187709E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:02:12 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so35108197wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OTn1cSCPnI+h1gkZuH/L6edXw8FqxdG7pG7zhSPEGTM=;
	b=u1L9HoZvKKoXoQCFy5pmvvDL6xf12m4q7A4ADoIMi3aotOGvQIb8PRwOFz3prgL//a
	Y3yjzWGGcxxecaB4bCTNt304xB20b0h11VsoJE8VadqUIJMYUd9m7oqgG5Zjx+RVKANo
	fFBtNYwdlL89Ngi1/dBaw+JYyo3MBTmVajk8KzJOF0DUE9zyxZisAKwtM09RWjLk4DYF
	HikIMNnUawKJupORPS6l+ebFO42+bnWdLSWNC+0QcQCO5rcOmMidsYu9qernzTfBQEZR
	irN6dqO469zz1qeTdsRfKnieuyLbIx2U4rY7+4h9LW7ie/RF1rhZW3QWGAiRkLMuzy0R
	gahg==
X-Received: by 10.180.188.169 with SMTP id gb9mr3328511wic.44.1443708132634;
	Thu, 01 Oct 2015 07:02:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb9sm6285107wjb.49.2015.10.01.07.02.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 07:02:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 16:03:08 +0200
Message-Id: <1443708188-9180-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [PATCH][master][fido][dizzy][meta-oe] llvm.inc: fix PACKAGES_DYNAMIC
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
X-List-Received-Date: Thu, 01 Oct 2015 14:02:13 -0000

* all dynamically created packages start with libllvm${LLVM_RELEASE}-
  libllvm${LLVM_RELEASE}-%s-dbg
  libllvm${LLVM_RELEASE}-%s
  libllvm${LLVM_RELEASE}-%s-staticdev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 0597be1..04c87aa 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -132,7 +132,7 @@ FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
                    ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
 
-PACKAGES_DYNAMIC = "^libllvm-.*$"
+PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
 
 INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
 
-- 
2.6.0


