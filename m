Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOKR-0006d9-Ev
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:47 +0200
Received: by wgbds1 with SMTP id ds1so371306wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jRRM6MzfcBtVqR8SxQrYA3+Su5V+2ee2Z92V43YDq0U=;
	b=DQweG1mDD68s0wMd8hX+w3B9iF+Kasg4dG0IeyJ9GqbTXM+eNllPrI2MKp2+lehjq+
	MAXxWp21uI9eylEDPkcfGlcRnHX9N20HFEGz8NBGvXmtH1PHMzXobHGeU4RDbUgof1da
	aoxcPIsoqemdmAx2T/LotmrxUTvoZBevAq77wxRxbBUeN8bBzXFNkqGm5z+73UQzQS83
	AQFOH2b8eWJN1jXLBYE1PL9XoFoDWYjHxPHYfZN0efdFINo4ITlX2YUZ/0gNl0LD0TBp
	qJhBf84bCBoLRO5kLRE8WnHIErrdAD5K39N1UAQ0CCLNLTriPrL+dH8S6iHZLSwBZa7v
	W1pQ==
Received: by 10.180.102.3 with SMTP id fk3mr16449854wib.9.1335444730646;
	Thu, 26 Apr 2012 05:52:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm10812003wib.2.2012.04.26.05.52.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:52:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:19 +0200
Message-Id: <cb9a2c734da82f76b49e369fc05077f85babdeac.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 14/15] libusb*: remove native support, was moved to oe-core
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libusb/libusb-compat_0.1.3.bbappend            |    6 ------
 .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 -
 2 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
 delete mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend

diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
deleted file mode 100644
index 5b50d6b..0000000
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PROVIDES += "virtual/libusb0"
-PROVIDES_virtclass-native += "virtual/libusb0-native"
-BBCLASSEXTEND = "native nativesdk"
-
-inherit lib_package
-
diff --git a/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend b/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.5



