Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 89C5B65CA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 17:12:01 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so7047199wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 09:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RsYHDNt0ZS0ysYain1f1M/P9rKBGRGas6EqjVkI/nGA=;
	b=bv8DAG5bED0wi5xQy5GAOLlRkERSA3fNIDu/F15Q4f/2sax5m8QlOlGVqusd4Mo+u6
	2oRaWuunELE3cQCOj6KLwM+zJm18zrApBiWxG3kfN/yHqhH4WkZPeDOtuW4oKjTvPXnL
	lrgzXDOSoOAj+IdlO4aDScHU6so2RSPlqEW/Od4s9QvuvsDOncTJQAWJLw+2LqDQyov1
	dW1n1FWBcVTnCkp7qN+peOCR6CzEKk4Agu+XgpjyZOMt1wfUNqMSNtrNjukztCCL1Gy4
	jFVn/bN+h5SK3Fv7yrVQFj8ZTNgaO0O9hyX1J3cO9x09L7Ergm5WdPY+TF56MQS4XOPz
	gSng==
X-Received: by 10.180.97.195 with SMTP id ec3mr18175281wib.79.1418317921712;
	Thu, 11 Dec 2014 09:12:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u9sm2398515wjy.37.2014.12.11.09.12.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 09:12:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 18:12:02 +0100
Message-Id: <1418317924-22256-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][PATCH 1/3] mongodb: blacklist because do_configure fails
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
X-List-Received-Date: Thu, 11 Dec 2014 17:12:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 2701c4c..879fc7c 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -9,6 +9,13 @@ DEPENDS_append_x86-64 = " gperftools"
 
 inherit scons
 
+# Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod' depends on the availability of a system provided library for 'boost_program_options', but no suitable library was found during configuration.
+# | Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod' depends on the availability of a system provided library for 'boost_program_options', but no suitable library was found during configuration.
+# | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod] Error 1
+# | scons: building terminated because of errors.
+# | ERROR: scons build execution failed.
+PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
+
 PV = "2.6.0+git${SRCPV}"
 SRCREV = "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v2.6 \
-- 
2.1.3


