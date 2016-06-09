Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 13A7B6FF72
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 01:31:53 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v3so1942407qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 18:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RbNhjUoY2y4N1uvAc6ZvGU1yW81dK5tv7gDX3zhtzFw=;
	b=hIcC5VhLxnfY/1fsXt7LpV09Xnt6czxOPULLGkHYmRscyzyjKPz3XVJCaaQx4uuiLW
	uwHPAQ+bzYjmfxf6INZNVtkUwDthjriisDqBk3THZ7KGiu4x+7o4ILwip3RKZPPVFcHT
	0Zh0xLnzs+vU97jW5k1aFRu13Q1XOtzkViSYjP4PmC/fUMkvcVGXOH4QyBesNmDdulyr
	pIyqp4V7KwLxk1Wb0I6HjcbEB6Xoq2MFnd0Tct6L+RdHYyroyJ6ZQrcNFTAmG3mxe096
	wU2yGibVAwRIljhgr9j3GrxXDlWzegcaGLxFJr5fVSKHYLemyNVEq2tyOi1tjhW6eWWd
	C+1Q==
X-Gm-Message-State: ALyK8tKoeAHOJS5C+gIJvVRIaC1nZDSa5RdJO5tb0Ij2PBrZDVviUa8jkHVSz8PdjSegKQ==
X-Received: by 10.55.9.135 with SMTP id 129mr7415970qkj.74.1465435914086;
	Wed, 08 Jun 2016 18:31:54 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id
	k107sm1065720qgd.48.2016.06.08.18.31.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 18:31:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 21:31:42 -0400
Message-Id: <1465435902-3848-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] fwts: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Thu, 09 Jun 2016 01:31:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index b943d6d..197fe20 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -16,7 +16,7 @@ DEPENDS = "libpcre json-c glib-2.0"
 
 inherit autotools-brokensep
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c"
+CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
-- 
1.9.1


