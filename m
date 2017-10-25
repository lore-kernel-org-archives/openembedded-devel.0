Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F121871A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:13:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o187so28523120qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GaOvQ6DhBJhSRzUMRkgh3ZAcPSVW5NR+BebhjOdcJJg=;
	b=eOeld6mNlaAw1JDyK/rCRHsIjTYmBxRdxLhehPto1Hkxwvat4bgQerqnFPpRA3Y3B6
	T9VM0QCaei/ZHZN8OhsBvTnDFO5w+l9yCyGXrgya9wJcCvieJN982CXQVTb9/fd+7rGI
	5v76jdQefh3lfXf3u2FEHHORMbwtFGFojvzthEGF1nnKupnVNF5FHWxIZ/b/hEr+T1VS
	ai7hbiS+1WXEkKICU8vryj1lWo9+zmYXt3TfoNzHbvwVrYxkAe8fc55duWGknIpP1jdH
	gGEb98zTpu5GqskYN1y5TDzjy8j0f8gVLrbRrO5mRELfpHv4RC9RtUonKheajuzhlUOy
	ixAQ==
X-Gm-Message-State: AMCzsaWJBS1f8Wis6k0ssQlc435cHh5GlB4kbmycKFtTfszIvN7SuXjj
	q2ZcvZCh5hV9w84lwPcYo39F3YFG
X-Google-Smtp-Source: ABhQp+RIwLbB6GbTOuaOasck6gT+aerN6IzYCilT6GyECNNTChFGlwyOoNsAjF2ewXARDJqyNbvUgQ==
X-Received: by 10.55.113.70 with SMTP id m67mr614230qkc.23.1508890425474;
	Tue, 24 Oct 2017 17:13:45 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id y9sm1027033qti.76.2017.10.24.17.13.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 17:13:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 20:13:38 -0400
Message-Id: <1508890418-18272-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.3.7
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
X-List-Received-Date: Wed, 25 Oct 2017 00:13:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.3.6.bb => python-pyasn1_0.3.7.bb}         | 0
 .../python/{python3-pyasn1_0.3.6.bb => python3-pyasn1_0.3.7.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.6.bb => python-pyasn1_0.3.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.6.bb => python3-pyasn1_0.3.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index dedb191..aa375f6 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "a2d01c561d4996055641bbbb74eda58f"
-SRC_URI[sha256sum] = "f0380ea97db0ede095a0dd87ce3003d46c197191f924206e43f776fc77e51f09"
+SRC_URI[md5sum] = "d58ecd0d9ff07218073c5acb12974254"
+SRC_URI[sha256sum] = "187f2a66d617683f8e82d5c00033b7c8a0287e1da88a9d577aebec321cad4965"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
-- 
2.7.4


