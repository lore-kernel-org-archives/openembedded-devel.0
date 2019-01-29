Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 969167C308
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 12:12:51 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3E7E55C1501;
	Tue, 29 Jan 2019 13:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548763968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=cYRb1eotQrVhpiHS069Cy/T4vxKlNCG+BZ9Rn/qH0P8=;
	b=FFIxpk6qMpu8yWi3zCnbNRhRixIzBV2xg/aB7nl6VcEwWSNnLTqlFnxuDOiUeUhw3ERpZ5
	JS6VKV/4H9HSudoPjJy8aTiEtl7Ifw3GHGQ8m6lnfBOXCA7H3nX/JP7FNjOA8QddhabH1l
	MoWkQE6Lh0Wgq4wV+kSpsTdcd03JXlQ=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 13:12:41 +0100
Message-Id: <20190129121241.38883-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190129121241.38883-1-stefan@agner.ch>
References: <20190129121241.38883-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>, lixin.fnst@cn.fujitsu.com
Subject: [PATCH 2/2] python3-vcversioner: remove egg generation
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
X-List-Received-Date: Tue, 29 Jan 2019 12:12:51 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Remove egg file build. This got introduced with commit fb1696372ff9
("python-vcversioner: Error Fix for recipes depend on
python-vcversioner"). However, it seems that this was actually not
related to the missing egg file, but to the back then missing depends
on python-vcversioner-native. This got fixed in commit 12d09665bbee
("python-jsonschema, python3-jsonschema: add vcversioner-native
dependency").

It also causes issue when trying to build a reproducible build with a
timestamp of 0 due to limitations of the ZIP file format used by the
Python egg packaging.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-devtools/python/python3-vcversioner_2.16.0.0.bb       | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
index f6372c8d5..149078c51 100644
--- a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
@@ -9,12 +9,4 @@ SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa
 
 inherit pypi setuptools3
 
-do_compile_append() {
-    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
-}
-
-do_install_append() {
-    install -m 0644 ${S}/vcversioner*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
-}
-
 BBCLASSEXTEND = "native"
-- 
2.13.6


