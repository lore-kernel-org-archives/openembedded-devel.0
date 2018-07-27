Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E90D778CDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:12:11 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id v17-v6so3963430qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ODGpZ0+sGRMPR648sfn73d5cLc0kIDMEGbNba+pAe+A=;
	b=lQJnhYIggXJxxMPZgMlPhDjAIXxwmEe6phg+m1aXP0zfZOcuDGAmqlXXgu/Rr+aaLH
	I3kfNhMm0p3B6/rdV540KeTRaZqvz3DpJV4B3kiG71S0mUOefl9isX/xLiYIVTONOpZR
	JsUMUSCMmtVa7MZd/Bj3MBL5h3K5x3lmJ6Gk5RLouu1u7IDD/ijtnE1yXM77n8k3hrhR
	EAk55/LPrUFuCjLoVqmWIYacY7KRTmZlH3oxPkNWZXyUHwHU/hoCJMXpele4CG7NY/u5
	lQi/hKCo9HIiffkt2EcHh+AUgpnugf3V95FIGkL4ICLm+Wwq2Gb9V4Mw7wUyN0mMJomB
	d7JQ==
X-Gm-Message-State: AOUpUlEldUgcFxkb3Uzuui/DyVlhMBNFQsIq2pl2GTB/PY1O6uEnpOGD
	TnXI+ASbDOiqtYMXDDdxzrmjx2dqH0o=
X-Google-Smtp-Source: AAOMgpeowG4vXCOuePP4+Yb6nm9NLu7qdMzKtm2ylB69kioniKS8EBBPMOYeBYYnoIQmUTRR1F67kA==
X-Received: by 2002:a37:c207:: with SMTP id
	i7-v6mr6916947qkm.292.1532718732412; 
	Fri, 27 Jul 2018 12:12:12 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm2643419qtq.93.2018.07.27.12.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 12:12:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 15:12:04 -0400
Message-Id: <1532718725-15312-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 2.3
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
X-List-Received-Date: Fri, 27 Jul 2018 19:12:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_2.2.2.bb => python-cryptography-vectors_2.3.bb} | 0
 ...ptography-vectors_2.2.2.bb => python3-cryptography-vectors_2.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.2.2.bb => python-cryptography-vectors_2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.2.2.bb => python3-cryptography-vectors_2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 4e59b20..d1e254b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "189bee4491a1856169790e8683f269be"
-SRC_URI[sha256sum] = "28b52c84bae3a564ce51bfb0753cbe360218bd648c64efa2808c886c18505688"
+SRC_URI[md5sum] = "294d44f32885a6b97d5f9cdd7ffc73a3"
+SRC_URI[sha256sum] = "356a2ded84ae379e556515eec9b68dd74957651a38465d10605bb9fbae280f15"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.2.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb
-- 
2.7.4


