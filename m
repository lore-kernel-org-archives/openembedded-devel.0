Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 234256B814
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:49 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so180880ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VvzDuxnSMzuh4wvT9c4wj5iu3QPhmT1bSjetwcplU7U=;
	b=wU1mxDbYGFl1DM22fVbD3qG6BnwosfAJpQ08xbxz0v/aMjA8+GK3BxxPE/nq4FRBJa
	rz6RKh306YfUsfWgCLvipk3ZdS7nvK57dawLLjf//EGWrs4h9mWMJqdOWMPTUHRF9DWX
	85Gq9xIA5h87SNhx/0GrQXfnN1QR+x5XngACYC8hz+ebBSKb1QEuiHtdmjMmKanaMkAR
	9UzvuUiAuHj3NSnrwY9BMv4JimGXFSLXpWXq67jPJUnsk7epXqclkKcH9jiEi2HfeP0q
	TylOa7DKfUCOrQCWP18whWLqW6d93tR2hmJxYMMfKZwPx0mKJlYTl0Yd9nEM0ZkKKdSO
	EsUw==
X-Received: by 10.14.38.14 with SMTP id z14mr20907126eea.49.1376551190600;
	Thu, 15 Aug 2013 00:19:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74956387eev.14.2013.08.15.00.19.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:23 +0200
Message-Id: <4dcb1f0088a6ff3062ec3f335b4cee592b31fa56.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 43/60] links: add PACKAGECONFIG for bzip2, lzma
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:50 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/links/links.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index e77e2c4..78d7ec7 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -10,4 +10,8 @@ SRC_URI = "http://links.twibright.com/download/links-${PV}.tar.bz2 \
            file://ac-prog-cxx.patch \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,lzma"
+
 inherit autotools
-- 
1.8.3.2


