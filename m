Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13F797566C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2015 04:33:13 +0000 (UTC)
Received: by iesa3 with SMTP id a3so76968967ies.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 21:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qTCMap69GgIHwiSlvjDGKWkPplJ1QxfrnLTdxJFwL1g=;
	b=JnKWKM7pMpaAURn2pnx3jU5sDG9yNj3iX8t4uKRHS+SK32sXybWPZWMR1N26OtBWmx
	TabH5OU4i4LmWKQrfpI7mQT7HMsXjgms5Jgro9vTfipJL1PgjmZZd6sr22SXpzw9QUmE
	dupL6JPehfp0/+9uO+OMEepFDxUCguRWgHjae0/Fr9MSfuokANOF4T+hsLi/TPm7FwCR
	3JAVncr8XfBRHt2P4Ceo1+SfPFuz9gR+7qHkWxa7Ah/Nz72K/CTqilgo0VvFG+yQ8GyK
	tSAC+Ab+y9YKfX93fjeqfuh0IUm9/cLVqBWqRo09pK44TDZv6837KuWtp/TdWwOoFiqm
	60cg==
X-Received: by 10.43.5.74 with SMTP id of10mr18574470icb.67.1432960395155;
	Fri, 29 May 2015 21:33:15 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ot6sm3034533igb.11.2015.05.29.21.33.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 21:33:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 May 2015 21:33:03 -0700
Message-Id: <1432960383-16116-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtwebkit-examples: fix missing qtxmlpatterns dependency
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
X-List-Received-Date: Sat, 30 May 2015 04:33:18 -0000

The webkitwidgets/xmlpatterns examples depend on qtxmlpatterns.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebkit-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 7ae9fc7..9ee659f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://0001-qtwebkit-examples-enable-building-examples-by-defaul.patch \
 "
 
-DEPENDS += "qtwebkit"
+DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-- 
1.9.1


