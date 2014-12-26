Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 633A87264D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:39 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id w8so7273641qac.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=7I8VifZP1yYJPqDUgNMzeesEZk4jQU5wSrU46M8EKL0=;
	b=AXjKiaqgleSRj4ezgHxpNeMT0BdBq7rtKiTm96v0lufZMqTXvQopPzTVSsFjmZj3JY
	t6yorOjunI1NnvZcVr2NOCx2PSx3jrR7ShqoU8kapy1ELKs5+qoT5n6YfS4yRWp2VBwr
	SoOjrDDcg970KLRIEnx8Ksc3DuZoFGPOygZLNIZbMH7vfeK20/4ealF+HetuUCSTkRl1
	c+1vvU/PROHXRaVnIh6jPVKSKksW+QbXRwo88XTZQ7yDtjrYZIjUOASCAUHQieZqfPfg
	jLvcI2KDGyQM8ztctNBxKfWminz6Zacyu6NAlR0e6atMfKnel+oMLzh9vZGU6YFEdoJh
	3fKg==
X-Received: by 10.140.88.48 with SMTP id s45mr66986975qgd.28.1419621700189;
	Fri, 26 Dec 2014 11:21:40 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:34 -0200
Message-Id: <1419621700-1102-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 06/12] libutempter: Fix license format QA error
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
| WARNING: Recipe libutempter, LICENSE (GPLv2 GPLv2+ LGPLv2 MIT) has
|     invalid format, LICENSES must have operator "([&|() ])" between
|     them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
index e1dccd6..30a6896 100644
--- a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
@@ -4,7 +4,7 @@ This library provides interface for terminal emulators such as \
 screen and xterm to record user sessions to utmp and wtmp files."
 HOMEPAGE = "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
 SECTION = "System Environment/Libraries"
-LICENSE = "GPLv2 GPLv2+ LGPLv2 MIT"
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2"
-- 
2.1.3


