Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 890B77C665
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 21:01:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id v21so2685733pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eEZMeA9++AhRtjGhTccQMQ1VWfElBmLmOaa+QpQoios=;
	b=H+NJgfe13ErLp73P7gs7xlvqmLX9rslcp+XK+TEigLwPWhB1Xsed4Z1M3Xx4HVNQAn
	bFKv5kv4K5wY3h8oMBLBwv5F/HZmbfanMwmneoH9vIRm/xlN3bTw3gCDEbzugylNSE9i
	G3aboLlWjAifrPO3NtsmYf/wj9hLARDg1JFPyARHsu+6H/zGJyLI/mj5YPrFZiRJcykv
	19JPUj0gEonXBCoq8LqDSbHuXGgVZO0zitb0WjY9hWCxEmLc1NCeQ+St5ZOXsTsYpVy4
	o+VOHwXznVsFIn9aKznhg5jV62sN2RK1YZCXp7MP+oWy2mzINwY1B5whWa7BdMShUAap
	mROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eEZMeA9++AhRtjGhTccQMQ1VWfElBmLmOaa+QpQoios=;
	b=sNf56M6x6o9s/Cws6N6cHM/n9UqiP57EGPtZSfvvZuCq3/gCb1aKGHCOykkkf/gMLr
	rT1R3uRc3cCYX75K7Mn0y1dJqDf0xxxtlRYeQYE7Va+kg8TdDnKYdQom2GsFrZNagC7W
	1QvcGjDyMuR8+/iu7b+XfdxHFdtIajKaBoRm+c2ZwGIq+3Pp9fBS1wgWJ0Y5XO/EBPko
	oshTYIOtL3XYfg9oHTUdZUQkjEtS4xI8VkmBzTPrinGb0Qbf6Zc099VhypT4yK1c5gJm
	2WCTwxA972+GCLzxIJaBsaWeEknGToTLhcU//0gz/kiyV1is4s2568gcUm34aR5o5tGH
	22PA==
X-Gm-Message-State: APjAAAU93wODl4XZYVirMiTsa/InFGXEaHJZrXzrARggAUAb932oy2mZ
	vDmALe2pX3xrqBe2wJWoYCoON9v8
X-Google-Smtp-Source: APXvYqxBHhLxGjInjGqEBhZwYW8Jv7WckMEvtL+TJ7h128VZpK79N05ymfdK2kU16cjxAi7QboNLjQ==
X-Received: by 2002:a62:b242:: with SMTP id x63mr40560989pfe.4.1552424514835; 
	Tue, 12 Mar 2019 14:01:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	17sm13284699pfj.80.2019.03.12.14.01.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 14:01:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2019 14:01:46 -0700
Message-Id: <20190312210147.1560-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-pyflame: Disable for risv architecture
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
X-List-Received-Date: Tue, 12 Mar 2019 21:01:54 -0000
Content-Transfer-Encoding: 8bit

Not yet supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyflame.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index b3b153c57b..d8d8349df1 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -14,3 +14,5 @@ COMPATIBLE_HOST_libc-musl_class-target = "null"
 COMPATIBLE_HOST_mipsarch_class-target = "null"
 COMPATIBLE_HOST_aarch64_class-target = "null"
 COMPATIBLE_HOST_powerpc_class-target = "null"
+COMPATIBLE_HOST_riscv64_class-target = "null"
+COMPATIBLE_HOST_riscv32_class-target = "null"
-- 
2.21.0


