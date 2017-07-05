Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D4FFF7760A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:00:42 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v31so30712245qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jul 2017 07:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RQf4XkEYLWgV7HQSWj5kreXapr0NPIRuClQcZj6EtuU=;
	b=k8sS3pL46uy8ySZ+VUlltsApdWI3gjf5iurmh+Tdnlt0YuDgamKe0vRGLs0DEdHrbJ
	BfkuR5J8a04Jro8JY+qeOU8ivnf3wnGSE/9VWJJa2pFlAtxZMjloV4SGxgOOe+E+JyHc
	4OTE6UmD5vj9G8j4vUwnLydWubvCTPrUgHdCevxqLK7lrkcFN5R1VcX4w56brIWZlv2M
	my4ebihGJX1JI8CgxcSwBIQJxiG+hFXfqEJJUeHltLi8hCQ2YTRcXgip5qdxlPcbfzF0
	qzs3kksx1d4LypbXAyFYlIJML/Prt5GLRx02/SYMksZnTfPwiQRsP+/cqWW5L/dSfh2h
	PB9g==
X-Gm-Message-State: AKS2vOzuiFnKJx8FdgnyjeunjsCOWjb/t2PJ1YcZs4MApeA//2cXPl+u
	Pou+Xz07ObgE8vZyJX4=
X-Received: by 10.237.39.33 with SMTP id n30mr57208737qtd.149.1499263243309;
	Wed, 05 Jul 2017 07:00:43 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	q90sm16646267qki.11.2017.07.05.07.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jul 2017 07:00:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jul 2017 10:00:21 -0400
Message-Id: <1499263222-25342-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-pytest: update to version 3.1.3
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
X-List-Received-Date: Wed, 05 Jul 2017 14:00:46 -0000

Updated license for copyright changes and verified terms

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc               | 6 +++---
 .../python/{python-pytest_3.1.2.bb => python-pytest_3.1.3.bb}       | 0
 .../python/{python3-pytest_3.1.2.bb => python3-pytest_3.1.3.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.1.2.bb => python-pytest_3.1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.1.2.bb => python3-pytest_3.1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 2826838..2279596 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "c4d179f89043cc925e1c169d03128e02"
-SRC_URI[sha256sum] = "795ec29fbba70b22a593691ce8bcd4bdde2dc96e8099731f73c7d8bb3ce879bf"
+SRC_URI[md5sum] = "35356e6e31cbd8318e8b2a8340a90b72"
+SRC_URI[sha256sum] = "095e1832f7e424563c95daf4d8d3c865052b80e139cdd2f9610a986ee8526206"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.1.2.bb b/meta-python/recipes-devtools/python/python-pytest_3.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest_3.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.1.3.bb
-- 
2.7.4


