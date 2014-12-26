Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C55C7264D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:41 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so7317065qgf.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=REtFZHdOr4pofPxMBBJaiBXuns5RmDb3EB3awTej/ok=;
	b=lCQXRdmgHXdPP6mKFXfBu8PK5op+uWYGVai1tRmKR++DwTQ0omLvNXUVCeQspjsbiO
	1bb2plAkB6gO7NgHCrZw1YVQ9G96dDMxvtXcivqrc6cNCXH4NDb/2tO4BqegvJRWIbT4
	n4LuL/BNJ/9fyslTf0SiuxDG+sFiOaTn8KSfWbd67hf+8o4PQTmQeFvBxg8vcTA5xono
	b+6+pXP2ARjOHdglUO0V2zydBYMGbU3s3Lzb/OcPpDOH+qtu4bDOEA6UuUWSGw/X6ZLY
	Ci0GBYvh20h2nCMrEiign4O7bgVHpNtP2lAZCYeXYahv+JAh3PLgxy09DSPFgN3WRP4P
	6lAQ==
X-Received: by 10.140.41.169 with SMTP id z38mr67346877qgz.56.1419621702179;
	Fri, 26 Dec 2014 11:21:42 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:41 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:35 -0200
Message-Id: <1419621700-1102-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 07/12] libftdi: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:42 -0000

Fix following QA error:

,----
| WARNING: Recipe libftdi, LICENSE (LGPLv2.1 GPLv2) has invalid format,
|     LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/libftdi/libftdi_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
index 641e5a7..d8b189b 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
@@ -4,7 +4,7 @@ including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1 GPLv2"
+LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM= "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
     file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
-- 
2.1.3


