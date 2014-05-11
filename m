Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f174.google.com (unknown [209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id CD2A0601A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 14:42:55 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jw12so7551208veb.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RVwhYbIZslxOXwYxqQrw2dgP114amG2U//R16u0IKzM=;
	b=G4gyeJEgXnWUp511z8I9oma9HdqRwpw850i6zVKIkzSmgkYAphe8acBuDFfJ2P98qt
	ClMDNu2aOdA1g+VErhnKUxGfFc0KGsy5BH+9g7ddznBJ6HxO8NISpkU4TmGr5gHXb9X0
	fMBZhw+f60ZJRvWc81hYn8sLrkqxSgTI7/WdTzLtxN/KmQpvsoNjXi9f1tTcN5NPBN/R
	+SM3JEdv5XaX8c5X5ByxChQSSe2XBLRPfSpewVYv45ZDJsMaHg4Tyxh6l+eO1bMN2LiP
	LUMKkos+1BdT/s/pbhnIb0pVam+iNnkSEcR9hu6+uTCmqu8nktHgAKceR3RYgBt6CmXl
	DVLw==
X-Received: by 10.58.178.130 with SMTP id cy2mr244312vec.55.1399819376446;
	Sun, 11 May 2014 07:42:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ix8sm7925041vdb.18.2014.05.11.07.42.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 07:42:55 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 16:43:14 +0200
Message-Id: <1399819395-2128-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399819395-2128-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399819395-2128-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/3] mongodb: add libpcap dependency
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
X-List-Received-Date: Sun, 11 May 2014 14:42:57 -0000

* fixes following issue from test-dependencies report:
  mongodb/mongodb/latest lost dependency on  libpcap

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index d990da8..149f582 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -3,7 +3,7 @@ LICENSE = "AGPLv3 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libpcre boost"
+DEPENDS = "openssl libpcre boost libpcap"
 # Mongo uses tcmalloc on x86_64, which is provided by gperftools
 DEPENDS_append_x86-64 = " gperftools"
 
-- 
1.9.2


