Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDA796B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:59:56 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id g185so25019102ioa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=EVtmvpxj89reF/D+HtQM8xp2OWnbCCVS+KAsg0Pch5Y=;
	b=QzgjaHglGRpN4I4o0CNz/drIEvNbO0ceLBhF7/JqYctjqvqSZoy/c8/yg9rpQ5FOzM
	I6H7Va8kIy/Hxbojxm4+M/LnkurUC8cF9dUr0TvUc5AHUS2ZzWKGKdMJJN5HJVPib9Pt
	Qlh4lVYGc9itv77x/S/xYXWPVwKd3pWlcuaHea+vJs9BD9NhHh+vXFq38MaUJc4WAknO
	zuvabd8NnYc2Uov6N7bArjcvfYp/r3yJxz3LD+gL5XCqY09e9i5ke2g32YmaJACJIFIl
	3PrygbJHJ31WeMB5bn1pF5PSpmqjMCRKdVq6PjOTRHyuDR0LspqmGrY5nCd7E2AwyEPT
	qE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=EVtmvpxj89reF/D+HtQM8xp2OWnbCCVS+KAsg0Pch5Y=;
	b=ZZfzrhuhGQwXn6bNqsgyZfUd53wwYNMAYV2EXuHf35xHvbcOV3RZ4E818WkGJ3CLhX
	L62fVzYpdWlI1SoyU5fDspS9sObQqCti50a1QokvAIZPUSNQtpjnDShaFZ0YR/4UlfjG
	J4wBB7kcF1MVd5ugvD3Km3dJVXyFaXxO9PutOHZZOPIQQoUxmUmFRrQGH/NelUgWzEHk
	D4LTJ1OCFkoRcCkiZqH3JM1vkC8vmxsuoh1FjynApMcvK+Q1PSAwkk++XQwHd41l8T34
	7ZwxXfYPRjcOy9Zq8iqzNSHrKllU7jza6J97qpYa8f8A/Al63mLM12CbpjUyhW4nSF74
	j9yg==
X-Gm-Message-State: AOPr4FWpeueSo+ED18acAWgfxgx9/dAxkIWYFttXjxoJgTO1H2gYxyR092VbaBpcJsTWYQ==
X-Received: by 10.107.59.75 with SMTP id i72mr19850768ioa.108.1461013197687;
	Mon, 18 Apr 2016 13:59:57 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	207sm22442437iou.33.2016.04.18.13.59.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 13:59:56 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 17:00:50 -0400
Message-Id: <1461013253-2350-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 2/5] libtdb: Update to latest stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2016 20:59:58 -0000

The update of Samba requires a newer version of libtdb, so update it.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-support/libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb} (87%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
similarity index 87%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
index c6a689b..bf6698a 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
 SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch"
 
-SRC_URI[md5sum] = "e3741a19c427255acd1e92c5e09d9df7"
-SRC_URI[sha256sum] = "a64d95ca0cc06a28fed24c6e952aed7660cae04983108735d6bc30b925136412"
+SRC_URI[md5sum] = "fa4c9e2f59fcf41441285bca5f5ab481"
+SRC_URI[sha256sum] = "0605ac0427eac9c23bf61ebfd8206a07d5ece198498eab1769cd0cfb6e7de6b1"
 
 S = "${WORKDIR}/tdb-${PV}"
 
-- 
1.9.1


