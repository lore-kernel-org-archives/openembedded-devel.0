Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDB677D11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t3so958275pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2nZLlKQ2OA21KPV2CRmClnnZkwMxymd3I+4BZ04JR6U=;
	b=ioUsrL0ZlRmZ2HX8yhWsHdPR5qt0Vp2JvE+WXnCS4p181wcZyRXWhuelrCBTSscaPH
	T6KOm7IN8+QX5aEmp31X3f9HEKlUNge7lsTMY9g7vjzmGxEDznT43Vs9Z5EWb8rP01rL
	aUmCdr1lMv9fxHBXD3zIeP62p/8lDIaMb+efq93JGBPtswXdPI9Gc2ktcu9W18rOwo4e
	r4FN5WkbUzIKPljM3ilYbKg6niwsq/iBNGDFLHBnyxax/fo0D8LkthMD5dSLeX7A/JcY
	AXcqDLfQAIIztCqaUHX3grbxkhfRqVBoiShL5zTw1AWaIcPlLPPiHEXFOGAGO6Qfsbj0
	Bawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2nZLlKQ2OA21KPV2CRmClnnZkwMxymd3I+4BZ04JR6U=;
	b=Grfb7qxw1Q3CmtMpXWdpu+WQiIqDZm14bzaFsBSIhMTlG/aIl1sh54q/1Ei0AW7Sj5
	Lz2LDkcbPOtimNxafKLEyfIXidu6ZotApABIMx+5fXwfp1EoLeX9gZxA9P4Oa3zkVEDA
	D/OHJsfKipcUm9Se3lBUewfuxcU3lMjvGdX8/08li2KG8F0tbGd5uOaJUgJKcA8zpog/
	VtniTHA4tqbC/F9d2qCtOWxz1noyzvkE7rVktwKibQElv2GnrjU8UN+LCnwJXuzEW8UJ
	zCIbPA1nPpBS3aqQn4O+SIAHTkxDpCQckqNuRGFHchcoCeKv72dSi/HUwtJqo0KDCHsi
	A2mw==
X-Gm-Message-State: AHYfb5hHSbKWiGA8i+O4Y/WdKJQBraSNoEU6/DXtFHOJ5MN/oJbK6BIN
	8FZLkfxttg42l8Nq
X-Received: by 10.98.156.150 with SMTP id u22mr7617961pfk.237.1503610719090;
	Thu, 24 Aug 2017 14:38:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:24 -0700
Message-Id: <20170824213829.41431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/6] mpich: Define PERL variable and pass to configure
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:38 -0000

Fixes
QA Issue: /usr/bin/parkill contained in package mpich requires /mnt/a/oe/build/tmp/
hosttools/perl, but no providers found in RDEPENDS_mpich

also move BASH_SHELL in same realm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
index 4537a66e0..4a2c37723 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
@@ -12,8 +12,6 @@ SRC_URI = " \
 SRC_URI[md5sum] = "f414cfa77099cd1fa1a5ae4e22db508a"
 SRC_URI[sha256sum] = "0778679a6b693d7b7caff37ff9d2856dc2bfc51318bf8373859bfa74253da3dc"
 
-CACHED_CONFIGUREVARS += "BASH_SHELL=${base_bindir}/bash"
-
 RDEPENDS_${PN} += "bash perl libxml2"
 S = "${WORKDIR}/${BP}"
 
@@ -26,6 +24,8 @@ EXTRA_OECONF = "--enable-debuginfo \
     --disable-fc \
     --disable-fortran \
     --disable-cxx \
+    BASH_SHELL='${USRBINPATH}/env bash' \
+    PERL='${USRBINPATH}/env perl' \
 "
 
 inherit autotools-brokensep gettext
-- 
2.14.1


