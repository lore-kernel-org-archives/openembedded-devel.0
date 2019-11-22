Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CC8477FCC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47KMP3247gz4s
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574440247;
	bh=DYIjBKRifmzhZ1XBWGUPbjCJIHtPBGzgn5Sz2SygYLA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HAy7jbLVisjDsdoLxoVOPw/GtXVWeRZ7MdO2o2t7oPSPhkn6QM0M8DHOGxU50isfI
	4VvlcaUK5Med/9aIBPlyEY4zHFJblJZL9gLVzJf8qeAtX3qswrxiEm/9ibZRu+uwPS
	iFxtVWzKnWqdkBLvnQKWKAw6XT7MY8P9Vg2f2Ym3XYgoJJcGJ3qzzOUq/g2XcCYtcC
	kqhXIMgTBtstCEvQGeo7+5iaMo3QX+LdAKvA7gPvzYRtD7iW4RRVAWxbPAGqklEJtU
	dCAYfsZO+Dosc/kvM/rtA1rHslKeCkyclrBxTG0xYzU0nSB6+wTM1MiQwdhgNhuXsC
	XSJhuL7H+Td9/ei/QaUqQhpkZ6gvesbcjZIViMNaObVr5eTZkt58TgZabdyw4zkRTJ
	3ByYN8XWNL17nMPRGYb6i8OAiw+Py4kAh9UJVnb3oVM2BJ3TGORMi9iuEITZ5unD8x
	pw5xg3CjSUJqRpGIiMWdNreVrpiIn05UzrtaB6M/5tbiBSlkX8epjvMf6tPUjjjROM
	BDEmrsl8eNY74D0wbM0R0eZd4Olus1HuoJ4gmtk3Js5cYszEsKD83lbcCKRcAneRan
	2IrIHX/TXyjWEKPoa+syNgx5oHd5YucPe3tyAFj0Fk5YzyPZtshAVcpmflFPJNNQW8
	NljoB62xO0u78BjfVmI2R59E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2019 18:30:45 +0200
Message-Id: <20191122163045.11693-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122163045.11693-1-bunk@stusta.de>
References: <20191122163045.11693-1-bunk@stusta.de>
Subject: [meta-oe][zeus][PATCH 3/3] python-more-itertools: Add PE
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
X-List-Received-Date: Fri, 22 Nov 2019 16:30:47 -0000

The recipe was downgraded to the last version supporting Python 2.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-more-itertools_5.0.0.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
index c66e55cac..6c44df40a 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -3,3 +3,5 @@ require python-more-itertools.inc
 
 SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
 SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
+
+PE = "1"
-- 
2.17.1


