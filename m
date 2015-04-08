Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 002EE60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:50:36 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so72040993wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X2D3nvRt63tQjOS6yAzyz6t03jiia6ZFleUoeGXJjs4=;
	b=pzIi+9jKqwGJr2jCMMg1WFQDVr1CsRnFoJSePoReyM6ZjrAx6nY29Vay7h5WdIwezO
	ZDqiYj7mEVLS+9fO5ixqVSLThNKvQECNgSDeNhRsTbDf24BiBVYhZVQa5RVKcXycySd6
	EOnOSxdtutVXWbEFudGwoLz9+SPBQN8/QNsnhZSc0kxrA5Us3GifydJHvfPlYLLakp1i
	dGtKObpNUE6RcuYfBfq7eZenWR4oMMSvaKClynbsBJsqYXdDeGxmzVj3y7EY6kOWLRZa
	Js6ownT0UJMhXDpK19+uBCmia4p9Rj03UPEl2S8gK2m5SZ3y+5kJ51IibDL8guqVH5y3
	LD9A==
X-Received: by 10.180.102.228 with SMTP id fr4mr17092386wib.4.1428522637260;
	Wed, 08 Apr 2015 12:50:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n3sm4292374wix.1.2015.04.08.12.50.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 12:50:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2015 21:50:37 +0200
Message-Id: <1428522637-24201-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] enca: drop unrecognized --with-libiconv-prefix option
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
X-List-Received-Date: Wed, 08 Apr 2015 19:50:38 -0000

* fixes:
  WARNING: QA Issue: enca: configure was passed unrecognised options: --with-libiconv-prefix [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/enca/enca_1.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index 184b27e..bf19843 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -19,8 +19,6 @@ SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c
 
 inherit autotools
 
-EXTRA_OECONF = "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
 do_configure_prepend() {
     # remove failing test which checks for something that isn't even used
     sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' ${S}/configure.ac
-- 
2.3.5


