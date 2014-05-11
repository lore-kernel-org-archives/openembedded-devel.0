Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (unknown [209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 61AB760167
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:44 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id c11so6659871lbj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ureB2ODM8lCjiXhKspB459cTXHrNVrdqQZDZEH2pKwY=;
	b=DGgXv2uy977zR+hPqQ0ZThYd+Q6C6U4QtU1jBN8iHqEV3RVkBlYZsRoHa70XzxyOMX
	W25d5cb7yUTnrwwWWYmYJn7/ChWlnkZ3JsKn6GZVYpOeSAIQfgfUrNCRA3GVMTvxRRPG
	6azBI4YJvTt5lGt8k224Da/P44UcFAiv5DVMQYODyiJKASkDmw7dwKXsgLnVl4c7LFU+
	YVGEbvm2HQBb5FW96XoAq8l76BrIz021s0riy2Ync0lvEOXyAfX7vi8N7dqxF/4CxRXe
	VWl37J0Tbne41PBpP7KYZXKIwuBfrEKYd23nVLmvMkDxZOfcCJ/RGpCfcmru63tMlCo7
	mHTA==
X-Received: by 10.152.170.193 with SMTP id ao1mr7323841lac.27.1399790985427;
	Sat, 10 May 2014 23:49:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bj7sm9564313lbc.22.2014.05.10.23.49.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:44 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:04 +0200
Message-Id: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][PATCH 1/6] elementary: use B = "$S"
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
X-List-Received-Date: Sun, 11 May 2014 06:49:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_1.9.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
index 32ae663..4f24baf 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.9.3.bb
@@ -10,3 +10,7 @@ SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defi
 
 SRC_URI[md5sum] = "cc75bb1c7c4c49de120ec33e413130ce"
 SRC_URI[sha256sum] = "49f896066b72ba51eefd8e92f0b7e7b8e190b0dd26323b12cbd4f26216f578fb"
+
+# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
+# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
+B = "${S}"
-- 
1.9.2


