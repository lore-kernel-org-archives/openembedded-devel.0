Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExc-0000Fp-Gp
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:19 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so1580325eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Z2bhhSgJQvvnStuSobRk1gpvxrE7i+HRDeZjkYAhdo8=;
	b=nrhw9TUs9u3/LSFKTjzZpeB2iZzUE/zPI5KGYPb4GzsO3lg0HLgTJSNezTKu6XjGXJ
	PyC/QQq1TLXQOGH8qIg8PQVHx89rRS9m5Cdl71ujJ01Gc/48X1EPJLFaOXj9bty3tPz7
	SvTZAYF0FvAFXdsIhA3c1Q5ineL5kkIK10r1ZkMbBoRFeNBKGyVDaUdAoyigl809UCNR
	oZF0ZWbRfbeb1rnm/JxyEBZAFpaFrbOmKBIoI2pmfKB8JZdRIvZKD4KIsxpDjDootf9/
	dunUYp1mxEeFRVP7X1I/CXmJbW4ZpjCv/bZzgBoYxus5YzUTrted46UoJH42L3V8Z870
	Tl0w==
X-Received: by 10.14.182.137 with SMTP id o9mr23312532eem.13.1365199262004;
	Fri, 05 Apr 2013 15:01:02 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.01.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:01:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:33 +0200
Message-Id: <b82eabad8ebe03ce933d37d83dd87aad82a51b0a.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/6] zaurus: remove obsolete ROOT_FLASH_SIZE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 22:18:24 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf  | 1 -
 conf/machine/c7x0.conf   | 4 ----
 conf/machine/collie.conf | 2 --
 conf/machine/poodle.conf | 2 --
 conf/machine/spitz.conf  | 4 ----
 conf/machine/tosa.conf   | 2 --
 6 files changed, 15 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index c881693..282bb76 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -10,7 +10,6 @@ MACHINE_FEATURES += "iwmmxt"
 
 # NAND factory-default
 # mtdparts=sharpsl-nand:7168k@0k(smf),59392k@7168k(root),-(home) 
-ROOT_FLASH_SIZE = "58"
 
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index c0f07e1..86b41f1 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -11,10 +11,6 @@ require conf/machine/include/tune-xscale.inc
 # SL-C760 (Husky) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
 # SL-C860 (Boxer) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
 
-# There isn't an unique size valid for all models,
-# please set the right value in your local.conf
-ROOT_FLASH_SIZE = "25"
-
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 2cd1499..2d191c7 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
-ROOT_FLASH_SIZE = "14"
-
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index d1bcb15..befd4a6 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-ROOT_FLASH_SIZE = "22"
-
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index b2283ec..46ca3eb 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -13,10 +13,6 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 # SL-C3100 (borzoi) mtdparts=sharpsl-nand:7168k@0k(smf),32768k@7168k(root),-(home)
 # SL-C3200 (terrier) mtdparts=sharpsl-nand:7168k@0k(smf),44032k@7168k(root),-(home)
 
-# There isn't an unique size valid for all models,
-# please set the right value in your local.conf
-ROOT_FLASH_SIZE ?= "5"
-
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index ab12b8b..961d674 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-ROOT_FLASH_SIZE = "28"
-
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "480"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
-- 
1.7.12.4



