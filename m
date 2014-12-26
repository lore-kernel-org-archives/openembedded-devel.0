Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id DEA8372828
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:48 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id k15so4993964qaq.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=zc6aadvB9GwDKURP3KE8ulhgE8wXRwCOujAuPl5rlhU=;
	b=zTfmE+rV7ZVG+6IJUYmpkgNF/Z3B4uTWKUuecgDq0oRoSfzVUWXL87s63TUg+PVE9M
	BU31bPzGL+aN9bH4C9tDjzYaK+a5tAG6puuzW5oW7cUASrqtZKO8qglDQoHR8O7rKXmv
	NhgJlPittncGEOLR8nLLX0M+b/5rcG8SBzFeqfmTgIrd34hbUhzHJypSv3V7Hf00DJbf
	fHravShHzhNuXzkFpNP3vCzA55sPHOzL6MPayjNq1s3akrgmBhDqs8qormjafUi3GyFR
	ygu5FYRlAhWU1lc7kYZ+UB3KO+sTavblVz53rTe47zpwS/ATEzHqPvKRrY4E0yXTYsDF
	B+3g==
X-Received: by 10.224.38.71 with SMTP id a7mr60013487qae.24.1419621709386;
	Fri, 26 Dec 2014 11:21:49 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:38 -0200
Message-Id: <1419621700-1102-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 10/12] ttf-sazanami: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:49 -0000

Fix following QA error:

,----
| WARNING: Recipe ttf-sazanami, LICENSE (Public domain) has invalid
|     format, LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 2d413ba..efdcec8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -5,7 +5,7 @@ SUMMARY_ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
 SUMMARY_ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
 AUTHOR = "Electronic Font Open Laboratory (/efont/)"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
-LICENSE = "Public domain"
+LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
-- 
2.1.3


