Return-Path: <chris.d.garren@gmail.com>
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com
	[209.85.161.47])
	by mail.openembedded.org (Postfix) with ESMTP id 313957D5AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 13:29:31 +0000 (UTC)
Received: by mail-yw1-f47.google.com with SMTP id v127so4886723ywe.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=CNeE6dP0mtGIG1ISKhkLYPV+5tf5dhqQoUr0/Cul6MU=;
	b=so0/Grg4PfWGEZnSgwzdvI9SxObOPd1W3XvxRyu/veqNRR9CeE2CcVAaVujqjC4PQo
	pWMn1d74Ykukk49yusgqxCNt0iMsYzRqYuycGKSMsh204O91tA9BObwsdKfEHbg32WPZ
	jlZDtQmUb/x3TtB44Ib1MrNgoCg/FAFygul/J/5IciQVacpDdnL9Vdnt6gbkyG47/kUf
	uwvPMiamZSY0H2RPtZ62rO9pPvmBZiWz2TDjAetboXh0Yn7grwKah8BvlJCy4gp2KX1E
	mpOklxkGI6YMkK81cexW/qpPgry2Ln/SiVraYmTS9xEEZhFoGMTwbe8MgtGyetHX/Bdo
	KtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CNeE6dP0mtGIG1ISKhkLYPV+5tf5dhqQoUr0/Cul6MU=;
	b=Xj4vB5qNaO8vS0piMfe6imqrghngSXpQGFz4NJ8K1W21NbnBfOwWxuS3zQBsXQ8qAj
	AHKFlqjyKmfEEcvAmqeuty1SgRrLipduc4FtEzBIy3hvzYw11OslaSBDvoZQQjfitkOC
	5rEx9QujsVRhsg5mkhAkJRs30BeMMl6t9K/xEYfU3kybMfcQA5jtBH/TcoenyKhChAIc
	+HbbCv1lUEluhaGmYNAQeE+Ryo0ScGWINosjCmLiOj8bYJswwuZChUddHf+CTT/aLJkT
	B2zsVHuxUzweONjghAj26V49z9KU1VS+nOI4d835i87RKYf7rxzVqCLlMlvlWKcNg4w+
	FnEw==
X-Gm-Message-State: APjAAAXEXAmXYra8O2DdD8oNHLptoWAgYtkCIzBTEqk2ehSSHx/HfDTy
	mn1wQWWIi42fejELWco1myhxfQES
X-Google-Smtp-Source: APXvYqwufbnWu7ePxyaT36ka5tdLpDyEkYNbTCEoZhTQ4Gu1hXgnuO0lQQXHwU8C8Bdik02eKnYBoA==
X-Received: by 2002:a0d:dfc2:: with SMTP id i185mr22680767ywe.11.1554730172736;
	Mon, 08 Apr 2019 06:29:32 -0700 (PDT)
Received: from localhost.localdomain ([207.67.30.60])
	by smtp.gmail.com with ESMTPSA id
	f190sm19359546ywb.98.2019.04.08.06.29.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Apr 2019 06:29:32 -0700 (PDT)
From: chris.d.garren@gmail.com
X-Google-Original-From: cdgarren@indesign-llc.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 09:29:05 -0400
Message-Id: <1554730145-5313-1-git-send-email-cdgarren@indesign-llc.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH v2] python-cryptography: Move linker flag to .inc
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
X-List-Received-Date: Mon, 08 Apr 2019 13:29:32 -0000

From: Chris Garren <cdgarren@indesign-llc.com>

Move the -pthread linker flag to the .inc file because it is
needed for python 2 & 3.

Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc       | 2 ++
 meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 2c1ac1c..d7e5ae9 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -3,6 +3,8 @@ HOMEPAGE = "https://cryptography.io/"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
+LDSHARED += "-pthread"
+
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-cffi-native \
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
index 1959233..f64e51d 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.4.1.bb
@@ -1,8 +1,6 @@
 inherit pypi setuptools3
 require python-cryptography.inc
 
-LDSHARED += "-pthread"
-
 SRC_URI += " \
     file://run-ptest \
 "
-- 
2.7.4


