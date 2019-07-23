Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 02D087ED76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 07:59:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so37524160wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4skncMrv9MmwnDMlHpy4KYjp3CNxqipEZF1JTerv+Ws=;
	b=bvLeRj+8sRxLv/0RKGZGzKZbKGE8tkNzvARlsddr4QyUIBHF1i7AUUugS5HFFa7mxg
	+tAdr0kJ+7Gmp8GNdiQQViiKIqXt+z/jZYG+qu4C26IMuK7nR6jJw41YqHygXBGNr9vB
	XH5RBZVMon6f27+AnbyhuqkvsSZTMrDlB/ldXmIu7DvsllYRx5hurRW0PROIrjoar4bL
	8ltaapXDvxWhxkCB8XMZvralypQXeXnzu83UO41NY3FTnYkB+xBv5w74k1fmmMYE9InX
	cjcxgC0DSqFfgfSd57aqxpyOOUYjBcesPpyeIO7IlPenS4ngw0VUlTFJGcH1sj5hG70m
	/2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4skncMrv9MmwnDMlHpy4KYjp3CNxqipEZF1JTerv+Ws=;
	b=cZ31kyofZY8QaOfp6mlng6DlazzhJFwRNKsfha9MUrlbi3+Eo8PTLzELLcVaZo5D0o
	uEiLFDaS0nZrLHOT6VYKfKfiPHqaZ58+Aaq8pyk2CS98Md7W3hw/05hPhkfuf34cQHay
	U2c+ZlfdX8dPMjq8Qe234nPuwVC121Qgs5iv2Zkj5EhitJItlNtfTBLLRE+t0oE7NCaM
	4WgneX1KXUEXpJJDs+29lF3dA03MWng4VVil5rUu/RTTsL0zJjodBqWmoSokEnOnLpBd
	U9qLaoJz/2RvGG46k+2hTXJDyvEw6zOtNi9knUaDHmERZDGe+9qQjbbIGoiStemOVv2J
	xxhw==
X-Gm-Message-State: APjAAAXsgAshj799NEVbk08L3Xj3+rDBt06o/ZXyhAwyIcQ4SRVwtW61
	62ibhAe06HI2ysqLBOYPfaEv+xyP
X-Google-Smtp-Source: APXvYqyAfytSDRHontxW+bcPz+hoGg2JCxejA7U27TLdBDcDHtqtN1QaDEMythFBs5gazNcgpDBegw==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr66541744wma.46.1563868782133; 
	Tue, 23 Jul 2019 00:59:42 -0700 (PDT)
Received: from localhost.localdomain ([93.68.218.127])
	by smtp.gmail.com with ESMTPSA id
	y16sm41039309wrw.33.2019.07.23.00.59.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 00:59:41 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 09:59:38 +0200
Message-Id: <20190723075938.31951-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: Do not export Werror from build system instead of adding -Wno-error to the same build command
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
X-List-Received-Date: Tue, 23 Jul 2019 07:59:42 -0000

---
 meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
index c13a632cf..53f6469b2 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
 DEPENDS = "openssl websocketpp zlib boost brotli"
 
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
+EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            file://disable-float-tests.patch \
@@ -17,5 +17,3 @@ SRCREV= "6f602bee67b088a299d7901534af3bce6334ab38"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
-
-CXXFLAGS += "-Wno-error"
-- 
2.17.1


