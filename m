Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D34E2784FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:09:20 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x58so11646963qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1YTitakzPXY6FIdQ0zI185Ds0ZBJjjFyo9UF3PVs4Hk=;
	b=cwBaFkbrQb9blEGVzM7zQ0XKe3awy4HjRWuRC8AWelmNmGun9M4e9yBZXV19rcMoLP
	woH+1/zEkk3Pth/NNHbtL929NCKPrY3fXajlG7YFWLTMcfN5KLyRfG8Q4Hor3hTu93+Q
	PU3jUvBfw6lkDc80YLU29C20e9yOHlldZHhJGB82GM0/jjrRUTxW7/hmb8MrvFxuIK0s
	ryH+/tvKOuF4MmTi5GqCp7QAzOZ8gAPZxsHXxeA89kcPzN9Cd4smTAlECcLWuxg2VZdU
	ha/eWg8R5YL0gZE1UcUnfZmGt0fz6bXlNRoIvTJlT7wCI6vRXXQKvENxjPlBWOJIqhE9
	sL0w==
X-Gm-Message-State: AKS2vOyt+YYwXqIzAo4ZzUaWjGms6YJ4zw9957jW8RjziUhuutwzJQU/
	duRRwV84OQBZiHbXkpI=
X-Received: by 10.233.223.65 with SMTP id t62mr14704687qkf.80.1497632961593;
	Fri, 16 Jun 2017 10:09:21 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	r74sm1787687qka.40.2017.06.16.10.09.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:09:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:09:11 -0400
Message-Id: <1497632951-17308-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-setuptools-scm: update to version 1.15.6
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
X-List-Received-Date: Fri, 16 Jun 2017 17:09:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-setuptools-scm.inc         | 4 ++--
 ...ython-setuptools-scm_1.15.0.bb => python-setuptools-scm_1.15.6.bb} | 0
 ...hon3-setuptools-scm_1.15.0.bb => python3-setuptools-scm_1.15.6.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-setuptools-scm_1.15.0.bb => python-setuptools-scm_1.15.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_1.15.0.bb => python3-setuptools-scm_1.15.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index 3249870..81bbf33 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
-SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
+SRC_URI[md5sum] = "f17493d53f0d842bb0152f214775640b"
+SRC_URI[sha256sum] = "49ab4685589986a42da85706b3311a2f74f1af567d39fee6cb1e088d7a75fb5f"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
rename to meta-python/recipes-devtools/python/python-setuptools-scm_1.15.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.6.bb
-- 
2.7.4


