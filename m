Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4B38A734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:10:19 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so20819093pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+NqA2IJ7CpGvBjyCQ/JCDX6ky2W+3kzEHMlrbryOF8A=;
	b=SQh6R6IOmwiqyrCoMDwXar0SjZZv4qZ+SBNydxwOJ1DlmB828EgzYgeSycIC66PUvd
	lPIEorL3/94smtMbg4YxrdSigqD5b//KRxJLVNyzl7jMJX9Im+foGguhuHCqiTqh3iAd
	lF5X9XZCVHCGPWE8cSsXnQpevzwhp32ED5cyppWeiFjQp62GfPc5Zt2AGFDqXN0pNFz0
	2GQ5Wj9CSZHvIu5qvG8pcarLfEg1U4YquQehwtn38rTNfN/3LjwsY5HRzoi8yPh8POM5
	S/zbuHFvdkqIw51joNS47q2ajPaXK20kPQeQCLD2yKdqDIxF1VOnYZBkuVBGsoniW7Lt
	JYVw==
X-Received: by 10.70.103.230 with SMTP id fz6mr65474015pdb.1.1433387421360;
	Wed, 03 Jun 2015 20:10:21 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k13sm2018242pbq.79.2015.06.03.20.10.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:10:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:09:47 -0700
Message-Id: <1433387388-7660-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 4/5] luajit: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:10:20 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index 48137e3..05456bb 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -27,6 +27,7 @@ EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_i586 = ' HOST_CC="${BUILD_CC} -m32"'
+EXTRA_OEMAKE_append_i686 = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
 EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
-- 
1.9.1


