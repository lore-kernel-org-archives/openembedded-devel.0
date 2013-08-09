Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 33D8E6B551
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:53 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so1927709eaf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=myRCAGWf8PcsbeQgg6C3XaWoz7bmDu9I2PnqIRCLEcA=;
	b=m9/j9M6zZqb6Bzm8ttZnF0UWaErzDwvbULiJuiaW2tSJR7AJ2e/sb7ZAP4iNHBnR9H
	wmbs8wTYjTjW1VotlHw2fLUd+DbW6r69jIdRWY3t7GPeipI5IjtFayS1Zp5Zzkp+iBxp
	2imhgQd1XhWqPEsKEftXujYYYKhxMSS3zFAn0CipHgIKgllARVX7cpGZDZ+/ca3y5JMd
	MKoF9FvWgctIvzljxBil4PzJDbUSXy4YocFsrCEiYFIfdvdmtARpvsAs9y/nZR7V8F8K
	wu/jMQP6xnEkDePYu0eOc0WUKlk/ZkeDFo6IJsT2ucZR0/47+Kyla3PlDf68JuAC5Prw
	MSVg==
X-Received: by 10.14.225.199 with SMTP id z47mr7456520eep.24.1376038433664;
	Fri, 09 Aug 2013 01:53:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm26778399eeg.13.2013.08.09.01.53.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:25 +0200
Message-Id: <1376038471-32202-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/12] llvm2: add dependency on perl-native
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:53 -0000

* it fails without it:
  | -- Could NOT find Perl (missing:  PERL_EXECUTABLE)
  | CMake Error at tools/llvm-config/CMakeLists.txt:5 (message):
  |   Perl required but not found!

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
index 8765a76..f683fc3 100644
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -1,4 +1,4 @@
-DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common"
+DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common perl-native"
 DEPENDS_class-native = "llvm-common-native cmake-native"
 
 SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
-- 
1.8.3.2


