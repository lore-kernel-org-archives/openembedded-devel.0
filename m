Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF2CD6057B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 14:31:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n184so18379388wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vwp4+2ELVMRcirMxg8ZqgP/lOv+dQ10xIFoNPOS9VN0=;
	b=xGJOxrv+khS+bE0uW1sOeOUhfzYef9tRcbjS5w2SDNttTmqbW9rV/kgHbstBgJ6uqH
	ES/16tOPgnCkFRwNROI96GdvVqNc7NSDMLW47uew6pZOrhV6gBBmsHdgeXoQ7m0M9ufu
	XO5iV1ywL//wK2xrLM/WxMaNZ/srQdoIFfxxnV2Lxyzz1GcZSKGtRyFbyuhjFo1oKX08
	TGzW5AQGtWzGU5a781j/Zx5hambyRSFARfGpqDyqPiiXljZxUfvze47siNdya91wKXpA
	pTJNQxhCwEZmqnBxclOtOiHaVkZFVZIw5gaZLRncYydQZCPR7FREAoyUr5P8KzTewfZe
	o2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vwp4+2ELVMRcirMxg8ZqgP/lOv+dQ10xIFoNPOS9VN0=;
	b=Ko8W9bVqWaFk9jAeI8l6QUFW7/URSBvXomxV0JWIBTXfjQ3qLVj9+bbpt5hpnSsJOj
	/y6fEU7k63YMLZVP0N7NY+6u4GPrBepe4R6jR/9UitBsYcDokzuwJG6sStIBVlJlz65k
	5ZXrPmwrypnNCzvoiW8DsrX3YCSVJbHyttOaf1dwGRSqEFVa/6A2xjhhJDuid7rbISpO
	ry0WqfTeN9pcvKY9ppZtesTSn+xeoNsEjEyTFj8jlwqYx23pLGb7BOwcCqTnGDXU27N8
	GI0GWGseeKTyQ0IGzMQXAnHmGuft1YJG6tP4cNCZgwPvJb3v5jyhRdt6BOSexX+rs25H
	HQLg==
X-Gm-Message-State: ALyK8tJAB5kInenP5eyVSOLSbbxaMikDn12GP76CZ82mwbWqaNyjHJTUeBoRtSBtN4Kflg==
X-Received: by 10.194.18.34 with SMTP id t2mr2468120wjd.180.1465569061136;
	Fri, 10 Jun 2016 07:31:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u70sm26192030wmd.4.2016.06.10.07.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 07:31:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:31:31 +0200
Message-Id: <20160610143131.22311-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160610143131.22311-1-Martin.Jansa@gmail.com>
References: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
	<20160610143131.22311-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] postgresql: blacklist because tcl in oe-core is broken for last month
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
X-List-Received-Date: Fri, 10 Jun 2016 14:31:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
index 54b660e..4a0296d 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
@@ -12,3 +12,5 @@ SRC_URI += "\
 SRC_URI[md5sum] = "8b2e3472a8dc786649b4d02d02e039a0"
 SRC_URI[sha256sum] = "b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39"
 
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-May/122095.html
+PNBLACKLIST[postgresql] ?= "Depends on broken tcl"
-- 
2.8.4


