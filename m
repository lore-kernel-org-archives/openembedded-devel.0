Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6044F73D60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:45:12 +0000 (UTC)
Received: by wizk4 with SMTP id k4so111089053wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X2D3nvRt63tQjOS6yAzyz6t03jiia6ZFleUoeGXJjs4=;
	b=Dt4bUm4/Vkk/OIJwCPD5EG3XBAfrh+kMOavMDcGTYha5BjZwpNZ1J0gRJSytLMIpkl
	FPuGvXKsY1dNLOPyCvExUEH/pl2h/7DHU2N+1udzCXvyp/V3E5zyYPU/nyMNTtAxIWdo
	T2MlnIK4ly3xcd0IyRX/sEwFhr/IfQXHWpGXEwGS5MRcbEf7MTKRezV/O+w6DvN9GrlF
	bnorbiRzPkBHnz1Vl3Pr31GuED5TlMEAWqvuO5RQiYvJMVVCCl2F8vw/RpjrNw+1kvfY
	EpSn9L5/M9P9KB/zfqde2dHE6FSC0XlRwTG7ERZkM3NYzf3+//GM/oF7H6D8xUCxh37w
	qjKA==
X-Received: by 10.194.133.102 with SMTP id pb6mr24593077wjb.97.1430160313568; 
	Mon, 27 Apr 2015 11:45:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ei4sm12757014wib.22.2015.04.27.11.45.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:45:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:46:06 +0200
Message-Id: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][dizzy][PATCH 1/4] enca: drop unrecognized --with-libiconv-prefix option
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
X-List-Received-Date: Mon, 27 Apr 2015 18:45:12 -0000

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


