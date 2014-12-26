Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id E49C7727E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:37 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id w8so7239462qac.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=iUQj6FZaGARMVBlfCgBRwlQ8KrUqnI/hsosGwTQJ5MM=;
	b=fHk5P2gm1spqWmiy9zejYEhURjcn53IXNzc+oiNwipQ4//GodyAxlEH6j8M+RnseOq
	4V5yNh4pnGjA+b0zxQrrx+pZGBBCv2YTtsgQNtRViXmr5kwpKl7UOp+588BCmsvI3Cad
	+wNSVl6IiFZ1gxxOqGvKTpy3lreTOndZMPkyzXnFLX7R+cl56khfGPWYHefU6CctDolp
	px9hTFYNK1tPfijgHRd2SITP/t4amB7ZX45t54oWpwTbXZdDRZQXgov3hx9iSGzre53G
	XtALd9bm1wwbT8ykgMyhUnPwcoNSaxfgHv6ix0g5vrLZKV5avZqxtREZjtx/tWKSB7Rp
	N4XA==
X-Received: by 10.140.108.201 with SMTP id j67mr68059617qgf.89.1419621698181; 
	Fri, 26 Dec 2014 11:21:38 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:33 -0200
Message-Id: <1419621700-1102-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 05/12] log4cplus: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:39 -0000

Fix the following QA error:

,----
| WARNING: Recipe log4cplus, LICENSE (Apache-2.0 BSD-2-Clause) has
|     invalid format, LICENSES must have operator "([&|() ])" between
|     them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
index 6201774..c9c5c67 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
-LICENSE = "Apache-2.0 BSD-2-Clause"
+LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65053a46f707ee2b93f09ad22f692170"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
-- 
2.1.3


