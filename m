Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3F7719B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:59:21 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h201so24191820qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tAY/cqn4MHLB4ks5IrJmP+63mLEMQGY802iorGd7Pno=;
	b=Z6HQmAZ8oxQZpxJOsjBHKQKUHa/acVuwH7sOBkpHTmCAzx/lkOYX3HGtDQjN4NmWl5
	sqPLBngFakoq5exYVODzLmsbHUv7YR8L/MTBQw7x3EqlqZ771Oq+icJxB5+De7N2iSoE
	6shR5i8v+5j32qEtJyxycwUl+gk58hjBrvxaVXLsuhgYqG2lEhQEEqcrFGLEsqpjdydg
	gIBAEiMy5Vygjw2e6ReUZEwvITfD7fqxKKqFojsYo9JY1Q2b7e1PDfdtWgI+uLedDzuA
	ojV13namGKl6Y7y3AEmAE6CbVA98KLOgu1LjTn70neMcSvFOVL77rQ6rKqHabz98tJ0d
	LFpQ==
X-Gm-Message-State: AKaTC00AY9MWwjwd78F7ivHpXOlOfeR+FDslE8YaaE7JJFpkLowlzHl7GxNfeBC3xTMY8A==
X-Received: by 10.55.73.75 with SMTP id w72mr804018qka.321.1479351562646;
	Wed, 16 Nov 2016 18:59:22 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id u13sm452845qtc.37.2016.11.16.18.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 18:59:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 21:59:14 -0500
Message-Id: <1479351554-31739-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-setuptools-scm: update to version 1.15.0
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
X-List-Received-Date: Thu, 17 Nov 2016 02:59:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-setuptools-scm_1.11.1.bb             | 18 ------------------
 .../python/python-setuptools-scm_1.15.0.bb             | 13 +++++++++++++
 2 files changed, 13 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
deleted file mode 100644
index 2a3b97d..0000000
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "the blessed package to manage your versions by scm tags"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
-
-inherit pypi setuptools
-
-SRCNAME = "setuptools_scm"
-
-SRC_URI = "https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
-SRC_URI[sha256sum] = "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
-
-
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
new file mode 100644
index 0000000..45204c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
+
+SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
+SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
+
+PYPI_PACKAGE = "setuptools_scm"
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+
+
-- 
2.7.4


