Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id A1FA1612D1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 14:29:36 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so3289475pbc.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dSt/nBKt2IAKG9Lz40x8aS40us+O+lXCL0c1x4/vojE=;
	b=d8WJzdJWO0D8Y/zuJzIByaHuOctRqLS+QGKt80t6PkHq5gWhhNKUkxkBuUl4SIYuGm
	7FG2sQHeGmekjfTqelthj4ROdKXFZhOH7SNhVYn8NOSelok7E5ujvqR+iiaXeat/AeuU
	HdJnFWsnFpOaKCnpNXpwTedDLrfFJZnfs8iI6ND95KNYRbFtsqEXDbECgr41Tv9tsxGk
	DuHMIvDRbcwcColIvI9hPz4FLTM2VJkAUz0gDvgP1UyguAT+1gAiZ2yiXzCt758uzakG
	yoONkNdqyy82d7U5BftSYrZ9cYB1EbX7Z0dijAscqWO1EZCLqPe2i97eiixnt96rz4dy
	DfjQ==
X-Received: by 10.66.139.227 with SMTP id rb3mr16301241pab.121.1372516177749; 
	Sat, 29 Jun 2013 07:29:37 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	xl3sm13132379pbb.17.2013.06.29.07.29.36 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 07:29:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Jun 2013 07:29:16 -0700
Message-Id: <1372516156-6648-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1372516156-6648-1-git-send-email-raj.khem@gmail.com>
References: <1372516156-6648-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH V3 2/2] libxi_1.7.1.bbappend: Remove
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
X-List-Received-Date: Sat, 29 Jun 2013 14:29:36 -0000

This bbappend was generating native version of libxi
which was used by older chromium recipes but they are
gone. So let this go as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend

diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphics/libxi/libxi_1.7.1.bbappend
deleted file mode 100644
index c90046b..0000000
--- a/recipes-graphics/libxi/libxi_1.7.1.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-BBCLASSEXTEND += "native"
-- 
1.7.9.5


