Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 01B126BE13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:35 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so338390eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=CJZy0RwxdsKbASFUmajqs6IsGFowkgf8lFx9GZS5Zyc=;
	b=k36qc6B2hyk7ZPE2nd0iEg1NGsvDWh0qelyEx/1izv4Dtmaj8uRPQ7J1cMESSK3Bdf
	bhTSYQnK/3Xz3DPfrjrO86KV1+VPAURDtUIbPgooYOmhZJAbj0JIYH6MNKCKrOCEOpuZ
	sO242NpS3yMrl6tOC3TCQwefThn02w51p8K/uUxZxTmKgywb9Zogpm+C4WFEq4dEW+Eu
	EDVoacM5OeUSQQUMSK7JwpLTxIa78LTJ0Uu6apW3otr+rWiJGKDtQyhuGFh+WEZbNADv
	D3f1XgK6r43IsFxVi6zCVBSMNDhn9gPBSNcSTqYdcxZsal/dioQrM7OkccY1bH01WNGu
	uZpw==
X-Received: by 10.14.99.193 with SMTP id x41mr5397393eef.52.1377791496430;
	Thu, 29 Aug 2013 08:51:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm47160354eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:28 +0200
Message-Id: <402d7aab868d4f9e1a67f88298445a23c2cc3dde.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 35/66] openmotif: Add PACKAGECONFIG for jpeg and png
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index ef92b33..1f01215 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -15,6 +15,10 @@ SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc1
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
+
 EXTRA_OECONF = "X_CFLAGS=-I${STAGING_INCDIR} --disable-printing"
 
 PACKAGES += "${PN}-bin"
-- 
1.8.3.2


