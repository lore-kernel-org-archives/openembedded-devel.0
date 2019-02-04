Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0F37C324
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 15:02:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43tWC166Rqz28
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 16:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1549292526;
	bh=16WUvItM3CPafCFKJ8Z4OFS4n9wusbGe8pq1ppmhJcU=;
	h=From:To:Subject:Date:From;
	b=myKspMf6oiO9tj1oER8gLJPXL+aLqudXdLNvD2mjWNCPpltVUqokoR9wdfGDsac4V
	x9F08gxdKl+XHHEIx7HldqQhkWbnSYfGoq6kwBnnhd+1uyONPg3XDTCGT93patWxMG
	BNt/3VwPUW7DfZIeKbuQf3+GDYDRz+KPE0fXXUjBNNH6Ik4JOkTYd+5kpdQymX0XId
	LNzp5JhLBUevByTNSH3XpYS48OCqF4u+xjYnBUPrg3mcrp36G24EuQZicmrSQYztgE
	yMN+6h3+GHbFAWRBXRwM9osxx7Hb/l1aNtUuV8KutobYnGygoaBQT2V7C/nYkRXAKx
	qCCqgfkp52zbaaoG4mJiodkYw9zYne2CPqUMrQd8mymlB4zV6B+4vE5+Kkrki64wq/
	MQPnJv5oCpjR77CMVugjjNnYIFxwjlN9QHKiRgVKXYiaxRt2YygX4VHeLBpCojIIuq
	s+d7l+jWFS+S5ek+zT7YHCA/7n66r3xw0uFZazv2njevyUF5mU0OY92Nto+7x5FheP
	jJhxUXnq6A8eKH93q3LLVtt4tWQR+aTE9OvnzBuZLLHi9XHcX+JMQQySWmqAU0+uzH
	bhzQdesGEWW5CkNRfMOBubRI/rWFLv+maw7fU5uNYYlMPgIuYZztmbD0DnEr+bEZH7
	0cWGwQnL5M6rtr6YKPXJ4/JQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 17:02:04 +0200
Message-Id: <20190204150204.18007-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][thud][PATCH] wireless-regdb: update 2018.05.31 -> 2018.10.24
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
X-List-Received-Date: Mon, 04 Feb 2019 15:02:05 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
index 2b990db3c..e1aa9a517 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
-SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
+SRC_URI[md5sum] = "b81bd1f6525a4806a707881aa3dda63f"
+SRC_URI[sha256sum] = "0d3e845ac77d21aac9b88642c3dd043a83e3920d706b63d5e5c31dffdbec9116"
 
 inherit bin_package allarch
 
-- 
2.11.0


