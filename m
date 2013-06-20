Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 62B2E607F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 23:37:26 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so6853350pbc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kjAY6MY5Kfxdv0dK5HxPpL9bmci+L8J/6BeI+Y5gzSM=;
	b=nebUihDR4l8VXhPZq0vloe6wLHMHIqminunp5KTZ9/YPUGsjeXcbHnxy56/a51bhCB
	GKzx22Qijcx3uk88Lp96P9qCHpwc8PAfA/3cpeR4zJbaEtjg+3Yn0hc4/tr+O9Rru3Be
	rKGk/SsWfJeUvwwCNRC+fDoI2ETx/XvWwKR2+ROgnKdaSsU31Us0HfgR+biAJBM5sNSN
	Q3uHsLEWfkTM56/3LmZLZbXaGmR1KRxWIdCyIsql1twW4E1z6EHt9mFHVnxO25LepkAP
	cLkdx2oJyLI05UhpooRWZMecv7wf+/VUwRquiuwerf6yuBKMu1DSkplrvGz9wp51qNWJ
	naoA==
X-Received: by 10.66.139.198 with SMTP id ra6mr13583249pab.140.1371771447658; 
	Thu, 20 Jun 2013 16:37:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ib9sm2041771pbc.43.2013.06.20.16.37.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 16:37:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jun 2013 16:37:13 -0700
Message-Id: <1371771433-9858-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libzip: Upgrade lzip_1.13.bb -> lzip_1.14.bb
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
X-List-Received-Date: Thu, 20 Jun 2013 23:37:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lzip/{lzip_1.13.bb => lzip_1.14.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lzip/{lzip_1.13.bb => lzip_1.14.bb} (85%)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.13.bb b/meta-oe/recipes-support/lzip/lzip_1.14.bb
similarity index 85%
rename from meta-oe/recipes-support/lzip/lzip_1.13.bb
rename to meta-oe/recipes-support/lzip/lzip_1.14.bb
index e04b6dc..d6e1be4 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.13.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.14.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "2f401e995c36cca05bd1805aa9c28231"
-SRC_URI[sha256sum] = "c73d36c0a926b71d484eacc192262a1d209674e3f903016f2c74a2bcbc5c28ac"
+SRC_URI[md5sum] = "39a4b06952ee45274525dc0582cdd651"
+SRC_URI[sha256sum] = "7ff5cc521560edb2a0a6cdf258cf3afdaeb1dbcc354d96d011d0dd7ec584cbe7"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
-- 
1.7.9.5


