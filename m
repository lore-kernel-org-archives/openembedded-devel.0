Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 887C965CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 20:29:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7KKT07a007243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Aug 2015 13:29:00 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 20 Aug 2015 13:29:00 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <akuster808@gmail.com>, <Martin.Jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 16:28:58 -0400
Message-ID: <1440102538-1561-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440102538-1561-1-git-send-email-mark.asselstine@windriver.com>
References: <1440102538-1561-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [[meta-ruby][PATCH 2/2] bundler: remove broad FILES definition
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
X-List-Received-Date: Thu, 20 Aug 2015 20:29:02 -0000
Content-Type: text/plain

This effectively reverts commit
4e8853ca05f797281469ae7c7ce0c0b3ccf0d7c1 [bundler: Fix QA new Error]

The original QA error is now handled by changes to the ruby.bbclass to
properly handle build_info and extensions directories that Ruby 2.0.0
now creates while installing gems.

This revert isn't specifically required but by removing this broad
definition of FILES the hope is that other ruby recipes won't copy
this behavior which can actually lead to other QA errors/warnings,
depending on what gets installed in the build_info and extensions
directories.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index 7d79544..31e72e5 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -26,8 +26,6 @@ SRC_URI = " \
 
 inherit ruby
 
-FILES_${PN} += "${libdir}/ruby/gems"
-
 RDEPENDS_${PN} = "git"
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


