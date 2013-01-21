Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxM3J-0004AF-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 19:25:40 +0100
Received: by mail-pa0-f54.google.com with SMTP id bi5so3560425pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZmBjRsJl/HACCjnnOvI7KoqVXDaNpXzQEKLOxfHwcmM=;
	b=kq/DIpMRYdGZrH+cvfQPp0HGBDMXEZil7l/CagwJ2BbSqFmMd/I71JkaARxJebHfyh
	Z2GnflRI1CY53XRlE9kv4C+36c0P765GW819dQgbjf/3QuRLoRbZuii6Ioz7ncqeFaJs
	Pazcm615kdfBHSNHhVjxl4G+3jHVOfnZpCRHWe4i2qb0X4VWNyx2/T/p25Lox3yQjmdc
	Y84uYEf+v8wyq40eyiO9rmAzDUw99AzhRc1bXkdZEsMpBtSyRKaizEDa+V0aZf1FNkpH
	2iyjXOVmzELi63epH/xvyFuGmqcQzw0kE4urLeD8WiLYXpM7M6yk319CUxmZ+TU0aGPj
	Phsw==
X-Received: by 10.66.77.201 with SMTP id u9mr49047557paw.80.1358791771765;
	Mon, 21 Jan 2013 10:09:31 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id e6sm9678276paw.16.2013.01.21.10.09.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:09:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 10:09:21 -0800
Message-Id: <1358791761-10966-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] kdepimpi-base: Remove mutliline commented code
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
X-List-Received-Date: Mon, 21 Jan 2013 18:25:42 -0000

This is now reported as error by bitbake and refused to parse.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qtopia/kdepimpi/kdepimpi-base.inc |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/recipes-qtopia/kdepimpi/kdepimpi-base.inc b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
index 27cc237..1a78c40 100644
--- a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
+++ b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
@@ -30,10 +30,6 @@ LIBS+=-L${S}/dest/ \
 LIBS-=-lzlib \
 LIBS+=-lz \
 "
-# That changes will be needed for KMicroMail/PI to get it build with OE libs
-#
-#             LIBS-=-lkmicromailwrapper LIBS+=-lmailwrapper LIBS+=-lopiecore2 \
-
 QMAKE_PROFILES= "all.pro"
 
 SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde libkcal libkdepim \
@@ -42,11 +38,6 @@ SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde libkcal lib
         gammu/emb/common \
         gammu/emb/gammu \
         "
-#        pwmanager/libcrypt/mpi  \
-#        pwmanager/libcrypt/error  \
-#        pwmanager/libcrypt/cipher  \
-#        pwmanager/libcrypt/zlib \
-#        pwmanager/pwmanager \
 
 inherit palmtop
 
-- 
1.7.9.5



