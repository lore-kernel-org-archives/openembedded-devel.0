Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExa-0000Fe-A6
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:15 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1482871ead.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+uvc8SDX23SrwjUR77/n1uRGMfBjXdgTrw8LZredNjk=;
	b=jC7n6f8Z7gT0eWSnPONW4ykX3RXKTz3ibu3h1x0aPRvpfRzLid6D2CefYCixnO6lR6
	d1I8z/tH8v9XZTQcuMo0NzXwb5oj8xONwZRvS2R19jTYwSGjnmfnN+d2ASpInPxpgLpe
	zxY+TXER+xAppMEPTt9mzCNDalLqB0WICRzL1j9avIIZS69UDrfBzKaWzmus8y9p4ffl
	FA2AvuuGSLUrNo4dmQC+qPDkiWDuvF40CF0gK1RnvnciZfoAUGx+9eeb0EmvgnBToJjV
	fZAUjpeiQhxPoHehTmjMNxwkDxE295wKq3KDw3X5YJQe5TWmacLfiUE2YIU6qvEWanXO
	78CQ==
X-Received: by 10.15.111.202 with SMTP id cj50mr23346015eeb.6.1365199259715;
	Fri, 05 Apr 2013 15:00:59 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.00.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:00:59 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:32 +0200
Message-Id: <3a3f8282996ee095e1d6f4c49a4d35a7f58b9ecc.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/6] zaurus: remove u-boot remnants from akita/spitz/c7x0 configs
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf | 4 ----
 conf/machine/c7x0.conf  | 4 ----
 conf/machine/spitz.conf | 5 -----
 3 files changed, 13 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index 0b31954..c881693 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -17,7 +17,3 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 MACHINE_DISPLAY_ORIENTATION = "270"
 MACHINE_DISPLAY_PPI = "216"
-
-UBOOT_MACHINE = "akita_config"
-UBOOT_ENTRYPOINT = "0xA1000000"
-UBOOT_LOADADDRESS = "${UBOOT_ENTRYPOINT}"
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index f5ec132..c0f07e1 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -20,7 +20,3 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "216"
-
-UBOOT_MACHINE = "corgi_config"
-UBOOT_ENTRYPOINT = "0xA0008000"
-UBOOT_LOADADDRESS = "${UBOOT_ENTRYPOINT}"
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index f585197..b2283ec 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -22,8 +22,3 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 MACHINE_DISPLAY_ORIENTATION = "270"
 MACHINE_DISPLAY_PPI = "216"
-
-# spitz and akita share same u-boot machine
-UBOOT_MACHINE = "akita_config"
-UBOOT_ENTRYPOINT = "0xA1000000"
-UBOOT_LOADADDRESS = "${UBOOT_ENTRYPOINT}"
-- 
1.7.12.4



