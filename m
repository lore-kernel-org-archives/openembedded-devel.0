Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id C79A072828
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:52 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id n8so7390884qaq.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=G7jWEv2drp5g+ZNn6iMZGHshdTS14AoM7vzoAEdqpAA=;
	b=IrfgvP77rOyrKPxUutI+MdxankM3wLgDCSgErxCN1jOL8Zwba8lseLQEbZje9ydbws
	6UwOSrXKHboOc5gTKRqKdmmRknTLLcmy/g9HPRInZZPKcKh62H3mMTLBiZjm8Q/dPaU1
	vjI1YugOBxmnZBivtFpnSNMB/pYypAFv7RU8nlEl3BupJZNQv+uDk/XGAGO0jcLPjEim
	ThXLrN/SJj8Jr53SET4W2v9iJnskDYkyivmcSJAxGWjZl/M0ZN+Yb7QVe9w7Y6wkzn4a
	W4IFF9k3eqR739EX0qWHvCU5NnYXdehw9CNV01z9O6k2huU4FDeUupZgkKOTr6LcV5rK
	RTBQ==
X-Received: by 10.224.131.4 with SMTP id v4mr69694963qas.99.1419621713156;
	Fri, 26 Dec 2014 11:21:53 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:40 -0200
Message-Id: <1419621700-1102-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 12/12] t1lib: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:52 -0000

Fix following QA error:

,----
| WARNING: Recipe t1lib, LICENSE (LGPLv2 GPLv2) has invalid format,
|     LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index 86cc166..90a0290 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "A Type1 Font Rastering Library"
 SECTION = "libs"
 DEPENDS = "virtual/libx11 libxaw"
 
-LICENSE = "LGPLv2 GPLv2"
+LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://LGPL;md5=6e29c688d912da12b66b73e32b03d812 \
 "
-- 
2.1.3


