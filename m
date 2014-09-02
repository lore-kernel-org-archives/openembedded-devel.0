Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id B5B4A71290
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:35:57 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id rd3so14167227pab.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2014 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qU1Jmxa/XsLii+Iro4qQmdXwOd6tZefaq++m4tL/sSo=;
	b=tHn7Y28s5V5wNMZpxaER6RfHnYDQdeP1Ua7nXIBjv+9Ii57oz/7vVA47k4yXJqSdDX
	GrYnaFVZD0zaV3+bZl9sak7H376kQBxQ6TpFKutWHoQYyB5yf1Y1ITqakuZAYRGM8d67
	gGoR17eaYq2SFJvgFTMsPIxrtwqCzbLXkzUQ3eRGh/D3qN/eekDLgzOTw1GntKZbjxPP
	NVIbCKo9QlncO3O4lt6xihbnqyHImUwQaujohHH1brep3gBXH3rn5FOwvLQROswH667P
	k1tDyNfSEo1b1Gl6nrKcrbbV/pZ6c4oFK9X5Y1mIzcNe9Alnh/1dakVBQcOuMgFyOO/+
	jDKQ==
X-Received: by 10.66.182.227 with SMTP id eh3mr45742802pac.68.1409643358467;
	Tue, 02 Sep 2014 00:35:58 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id q1sm4253564pdq.67.2014.09.02.00.35.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Sep 2014 00:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 00:39:37 -0700
Message-Id: <1409643577-4088-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
References: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/5] meta-networking: Update layer dependency information
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 07:35:58 -0000

since python recipes are now spun out into its own layer
and there are recipes like crda which depend on M2Crypto
python module, of which the recipe is now moved from meta-oe
into meta-python, we need to express this change of layers
otherwise if you are not using meta-python then you end up
with errors e.g.

Nothing PROVIDES 'python-m2crypto-native' (but
meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
DEPENDS on or otherwise requires it).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/README          | 8 ++++++--
 meta-networking/conf/layer.conf | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-networking/README b/meta-networking/README
index 339d40e..e1ba27d 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -17,17 +17,21 @@ Dependencies
 
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
 branch: master
 revision: HEAD
 
+URI: git://github.com/openembedded/meta-openembedded.git
+subdirectory: meta-python
+branch: master
+revision: HEAD
 
 Maintenance
 -----------
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 39c2ceb..d99d738 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -14,5 +14,7 @@ BBFILE_PRIORITY_networking-layer = "5"
 LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core"
+LAYERDEPENDS_networking-layer = "openembedded-layer"
+LAYERDEPENDS_networking-layer = "meta-python"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.1.0


