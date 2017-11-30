Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCA478682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 19:02:11 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d4so10099277qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 11:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GxDRIhg6+lqLY2Qi1z7vbo6EL4Ib00stpP+olCzFZgc=;
	b=NbeOcBf4CFPwhEa54qntWFIB6dCyX8svYDXZnFnoJekm0QqBym8fytpIRRrPejwU3p
	ilWatb4vIb7N3hI3djv64p8IxKJHMylK8lAJ1oQJJCSwyNdIqyhV5omvpO/6RUhjg3wK
	Klo0zQSZh5mTkH/EurgyaXwVizDnKlSOJHka5+q/4jXGqgp8dGgpnFw21OMQqJuqC/p7
	0FmcBJHBQMHqFJNfFwTcNevB1UZaiLtFXsdt6AIOISSeJ8ri5xQD1P1HlMNTCN2Lf0Io
	iIsMB7gHT0MJ/wVr4NBhtr5xZ6NlI7k9SHpF9if8B7abF+87lmY2hDVbycyuNbvnnib9
	jWVQ==
X-Gm-Message-State: AKGB3mISTDXr1e1eHDZNjVD0Jm1CCligPq8h53Ft7w2F0RvfbLizIuN3
	N7Ed2yKYImgTpGD0HepLjhC/xZEI
X-Google-Smtp-Source: AGs4zMYHW3VzzVM/lzfeYXu2dhll1lnP5JfGGTKqqO5OTwSHdlc4wL6iBg9euM5Te1HFKj1JM4DH2Q==
X-Received: by 10.200.44.187 with SMTP id 56mr5194562qtw.238.1512068532789;
	Thu, 30 Nov 2017 11:02:12 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id u3sm3380644qka.39.2017.11.30.11.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Nov 2017 11:02:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Nov 2017 14:02:05 -0500
Message-Id: <1512068525-10107-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: add a test package for unit tests
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
X-List-Received-Date: Thu, 30 Nov 2017 19:02:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pylint.inc      | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index c55bce6..5398ca1 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -10,16 +10,6 @@ inherit pypi
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
-                   ${PYTHON_PN}-isort \
-                   ${PYTHON_PN}-numbers \
-                   ${PYTHON_PN}-shell \
-                   ${PYTHON_PN}-json \
-                   ${PYTHON_PN}-pkgutil \
-                   ${PYTHON_PN}-difflib \
-                   ${PYTHON_PN}-netserver \
-                  "
-
 do_install_append(){
     rm ${D}${bindir}/pylint
     cat >> ${D}${bindir}/pylint <<EOF
@@ -30,3 +20,19 @@ EOF
     chmod 755 ${D}${bindir}/pylint
     sed -i -e 's:^#!/usr/bin/python:#!/usr/bin/env\ ${PYTHON_PN}:g' ${D}/${PYTHON_SITEPACKAGES_DIR}/pylint/test/data/ascript
 }
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/pylint/test/ \
+    ${PYTHON_SITEPACKAGES_DIR}/pylint/testutils.py \
+"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
+                   ${PYTHON_PN}-isort \
+                   ${PYTHON_PN}-numbers \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-json \
+                   ${PYTHON_PN}-pkgutil \
+                   ${PYTHON_PN}-difflib \
+                   ${PYTHON_PN}-netserver \
+                  "
-- 
2.7.4


