Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id B6BD47C080
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 18:36:24 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id m1so8488811pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pOOfFMjQiFQRAO0DQxI9pqdiY16H7K08QMZo1OjWYy4=;
	b=fcZDdHoKLNqZnivnOdcAsY7XO3wfkcFlct5kNXjdmhLbIOvtTVDUb/jgCpRLsRDr4m
	YU91MPdTnoInpPjKvhCH1ERXDh1L5jX/dFRcuxWR73yZ/t7+3rNAffjm5LNIsVoklPHI
	3yH9mcdypkSI2RBRiWHbelG2HY5e6s0rbQl6Yrrrw2B/OlxVwHzuKeXcrYkHmr/sh2cQ
	hKqqI10J/wO2YRygvKfDzw/aQuz5s9QfdPlBWnzRHZ6GUGMAA+ISemTnFoJ/rdEvZwyn
	loPqISuI8EH3pK1DDBD85o+H6NP9XKOmgODhavd6QxDUrn4iPYxGwnlWjM+ZEcSprzdV
	MEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pOOfFMjQiFQRAO0DQxI9pqdiY16H7K08QMZo1OjWYy4=;
	b=DKISv6N9LwVkQifcmNtu9u6LJYuT2c3MjeUNpwMW9qPsY7QDb9dxTOy4xU7nyFQGbw
	6xlTu7Sxbsp0Mw0S/htKr/J0VkGj9ncTdsQbCZy7fTKkEd4sHztgCU8MKrqy1JxFRcK4
	0A9sjlgyJ+kdQoviHSyaUAh286KhI1jDdsZaVjMQtD1Zjn1jqP5pBZb23Zs5e3PN1u5P
	oBAyFKQLiYWpoIeiApeLuhfWyUOGHKK0bcGTGDypgi90VA5/i9XNUVGzS2xRYUkN1+2L
	1zGvUsu+Mlb176NiZ/JQzlmIQS+NlSJ51Mp8YDcqGbpM2+biPTDsmKfsrgI5hfZlRpK+
	poBQ==
X-Gm-Message-State: AJcUukeSEI5tJ5uOaMRQNHH+G1+74JlNvbx9O4dFXV8wb+e8cFeug0Jz
	cEQcoAxN/YxKAk/Z1qv/KLlB9VU5PkI=
X-Google-Smtp-Source: ALg8bN4Atwh9I/xz8QcRhNWqLGznP6QA3iKSDP05jOw+zuf4ezOhDJsQczaI72h0tTD9Cu9wL90smw==
X-Received: by 2002:a63:c748:: with SMTP id v8mr10450506pgg.108.1547404585364; 
	Sun, 13 Jan 2019 10:36:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	b10sm125519877pfj.183.2019.01.13.10.36.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 10:36:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 10:36:15 -0800
Message-Id: <20190113183616.16462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH V2 1/2] python-pbr_4.2.0.bb: Define src uri checksums in recipe
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
X-List-Received-Date: Sun, 13 Jan 2019 18:36:25 -0000
Content-Transfer-Encoding: 8bit

There moved out from inc file in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Correct the checksums for real

 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
index a4b56cdbdf..32487723b1 100644
--- a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
@@ -1,3 +1,7 @@
 inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
+
+SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
+SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
+
-- 
2.20.1


