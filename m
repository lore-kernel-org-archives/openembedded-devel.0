Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3MA-0003y9-HW
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:32 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so2175479eaa.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=z2bGcUl1Vm8W3K7ZjLt37rSHSRs8EZ7J9b3oaggLxTg=;
	b=uonQ+OeC6jw+uqkzmecpWNlrLRHxu6vKDRDfC/qRwXC55dLdhG6n5qYqYXoMCg83go
	tzKbLBNMmDggyUi7Qw+uzYVj7yy8g0OtbDsNBycznnOud1Yz/FN1XlscbJuPl2nr7anS
	WNuuvAwpdGftrYLEO1MaTQUYWs0zeNmHfsAsHRGjhDd2mw2LOqkaoyjV5wxeX48j/M/m
	rQIp2GeOJa8Xvfilyt/+EiTCdWg/3Z7kowi/1OUhFZkKcku3o//GfqkvsDRL9J3BP6ot
	IMRCw0xhtsXKykEEP4LueLTodgBkxO7k9Fwl3dg8CFEXNe5noNi8/7nLBxlwORhbsVqa
	c86w==
X-Received: by 10.14.176.66 with SMTP id a42mr53145107eem.34.1358719906943;
	Sun, 20 Jan 2013 14:11:46 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:46 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:28 +0100
Message-Id: <703dceb01a7ef01f30dca7c50902acfa6560372b.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/5] linux-yocto_3.2: convert ktype/standard to explicit ktypes/standard/standard.scc
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
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc   | 2 +-
 recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc     | 2 +-
 recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc | 2 +-
 recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc | 2 +-
 recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc   | 2 +-
 recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc
index 4cb0a6d..40cd6ca 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE akita
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware akita.cfg
 
diff --git a/recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc
index 50e17af..c72f5b5 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE c7x0
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware c7x0.cfg
 
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc
index b225485..a164a0b 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE collie
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware collie.cfg
 
diff --git a/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc
index 3ad4d30..d017624 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE poodle
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware poodle.cfg
 
diff --git a/recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc
index 06daf5d..31d9a0d 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE spitz
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware spitz.cfg
 
diff --git a/recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc b/recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc
index 066fdce..735ec1d 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc
@@ -2,7 +2,7 @@ define KMACHINE tosa
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 kconf hardware tosa.cfg
 
-- 
1.7.12.4



