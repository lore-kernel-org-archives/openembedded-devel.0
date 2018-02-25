Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB475782FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 19:55:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id g2so16727260qkd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 11:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fmcmRcvjDqb6VJNE9Dha+w/LDOyUbpfYhpZXqTAEd6A=;
	b=HrADmAOTDNulLZeUyeq4I/Z/EWJlNo0YidNIPPDBC/1nYWj8c49N0NNAyz16GciCZM
	0eBMmaHu6tbXD2aRf1Zia61YtgJe0d/Uuc6xSPHNTueWFZ5F9jAe0DVZfL+jZW4NQoic
	BNtI4lrZhRiygVgbDq7kZWSqUxKQEO0K35Srlvrp61hlehpAuY6fVeFuhsFzJSpttiHM
	eS9wqRBg5kqyP5k4orjVqyd+sXGkyAbmBsnFmlhslijZ+LbEC+mCPQPy3g1Alc9YW5BG
	4KQDuDtQTIZRSi0pLhkmVCwSgGnEURa2dpDiPgJOYJO8ERrJ6TWdEUV58XTcvhOkaSlt
	h/TA==
X-Gm-Message-State: APf1xPCiMLOJSSRJFOFN51oUMucnYyMBD3Vvwck9FrDfhpJKbfAU0jZP
	AU8DJVJOjBmweAwBl6ybz3mnX6n9
X-Google-Smtp-Source: AG47ELtzMnbe8p4sQlavbf22ZDWfwVqPnjuVc8rUujSKW7yqNaQzo8ZefLO6+e8CJYczVfGgSB1Ogg==
X-Received: by 10.55.87.134 with SMTP id l128mr12940504qkb.162.1519588545859; 
	Sun, 25 Feb 2018 11:55:45 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t10sm4210790qtt.11.2018.02.25.11.55.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 11:55:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 14:55:33 -0500
Message-Id: <1519588533-12368-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pexpect: update to version 4.4.0
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
X-List-Received-Date: Sun, 25 Feb 2018 19:55:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pexpect.inc                | 4 ++--
 .../python/{python-pexpect_4.3.1.bb => python-pexpect_4.4.0.bb}       | 0
 .../python/{python3-pexpect_4.3.1.bb => python3-pexpect_4.4.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.3.1.bb => python-pexpect_4.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.3.1.bb => python3-pexpect_4.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index 28d7b60..d1fac54 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRC_URI[md5sum] = "16aa4549136b2d1b2bf1e0e9788d75a6"
-SRC_URI[sha256sum] = "8e287b171dbaf249d0b06b5f2e88cb7e694651d2d0b8c15bccb83170d3c55575"
+SRC_URI[md5sum] = "e9b07f0765df8245ac72201d757baaef"
+SRC_URI[sha256sum] = "67b85a1565968e3d5b5e7c9283caddc90c3947a2625bed1905be27bd5a03e47d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.3.1.bb b/meta-python/recipes-devtools/python/python-pexpect_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.3.1.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.3.1.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.4.0.bb
-- 
2.7.4


