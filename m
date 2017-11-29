Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8DD878055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 20:17:23 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id a16so6025634qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 12:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bo+bt5kV26AxMN1KWGJN9lUszpLvHcv6/IvFnqSuZHA=;
	b=iN4hBVKu9jETaxZ8FNAt00bMx0+Eayj3MPgB0CQ8rdhrAwu8H2O7Qd5LjxH2sPzNpH
	E/8BpyHtF+etLnQVU7G7BQ8tnFn5G/UwS+NOyx+bXSBb8W9TPCCHZZid/942TlXcHvbi
	61gEI7HrwSw1C7xEtVQCRbF5h/8cNf3WL5yvMAnoPHX0MDV/OK0R/teZnZaqTbsKI7OT
	II19xJsw/yVXgJ9bMZnHx3PmTKGJ1Kbc7fvTI1vXGbkUaRO3d//XPSFD3kP4gyfxEYoy
	hNRXPuUroNsQOlCRa0wcfny3wjCFSQ1tnvYThNT/lOISa3eeFI5pUgSfhkUd0qTq778I
	T6Qw==
X-Gm-Message-State: AKGB3mLP/RdNprwRFcfs0V5oynYlQuTksB+Y9DnfDKxaOr8HagKXunUT
	HFFqiS4r4fDRAAbN4zkjw6KuYCpZ
X-Google-Smtp-Source: AGs4zMalEc109Dr0Kzu494JwSdHDJ/rGHxXULKBh0ZHvbiGLLCSa3mAic1tBaIsjIZfoppjU7UK5JQ==
X-Received: by 10.200.51.46 with SMTP id t43mr136357qta.75.1511986644331;
	Wed, 29 Nov 2017 12:17:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id d9sm1343894qti.94.2017.11.29.12.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 12:17:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 15:17:16 -0500
Message-Id: <1511986636-24853-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] pyrtm: break samples and unit tests into separate packages
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
X-List-Received-Date: Wed, 29 Nov 2017 20:17:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 72f0921..2272da9 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -10,7 +10,26 @@ SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14e
 
 inherit pypi setuptools
 
+PACKAGES =+ "${PN}-tests ${PN}-samples"
+
+FILES_${PN}-samples += " \
+    ${PYTHON_SITEPACKAGES_DIR}/rtm/samples \
+"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/rtm/tests \
+"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
-    "
+"
+
+RDEPENDS_${PN}-samples += " \
+    ${PN} \
+"
+
+RDEPENDS_${PN}-tests += " \
+    ${PN} \
+    ${PYTHON_PN}-unittest \
+"
-- 
2.7.4


