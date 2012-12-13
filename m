Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHho-000702-7Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522452eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WzQeFcZgCk6EhJ2GtM7/6DTBtu04wmOTOw9N1/5tpaw=;
	b=k9HywdtMWzcnUazBIxaiFbKKAzVXzUvKk4kdhbE8zHUw6iUtwh7HY3dCtIYDiBan3x
	9HLwVxW8EfzW02ig2BGtSadVPKPrPdekJP5rqdq+Vc+Eqp++9P33FN4roSTF2fcPBvrt
	SSwY/kJzmxcuW5IQMkIanFlDGezu5jbyXB5/WgbP+sy/6kMDhnmD1BCHgcjnZMfGCKUs
	C10hdXslepeNdcwVwofM9xRiWd9WFJ13Z2sdWRbDOUUvi7/dUy+MLfVyNAvAahEiHZM3
	AgqNpLkE1jeWTlV83aD+HFwSO9cq/2eVqUKhC0ux+krEU7o6ROfKzK4G9MWmakZd9U86
	M0LQ==
Received: by 10.14.221.5 with SMTP id q5mr9176006eep.33.1355438525098;
	Thu, 13 Dec 2012 14:42:05 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm5698640eep.1.2012.12.13.14.42.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:47 +0100
Message-Id: <5c5716844fc55ebd9805604ca767c2c18059aadf.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/11] pixman: drop bbappend with only PRINC left
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 22:56:41 -0000

* pixman in oe-core was upgraded to 0.28, so upgrade path is OK

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
deleted file mode 100644
index d9f1c29..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-- 
1.8.0.2



