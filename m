Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id C8CA376312
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 195DF3FCDB;
	Mon, 22 Aug 2016 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1471873623;
	bh=8eVFs7ciuoMiMFO1D17sEHOWP9RK9XPFJvaBbBfG/SM=;
	h=From:To:Cc:Subject:Date;
	b=OZQ97UHozz2pPUdSqaERFkMxvPyULrbOhrT2mKUXGNpKNGwY81hjWRby2DdSE2YmG
	/pFB77+7XYNeq2h2gQHVq8g1K0B2eFwdX04A1UM8r9Y+xXXsoqyqhkYJkJrfapW0tj
	8mYf+vCFoFoasfAd1NzIP0gqR1Pk12a8tZ/82EK4=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:46:57 +0200
Message-Id: <20160822134657.8496-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] pypi: update the base pypi url to use the package info without requiring the hash
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
X-List-Received-Date: Mon, 22 Aug 2016 13:47:03 -0000

From: Derek Straka <derek@asterius.io>

This is a backport of those commits:

7edad4def408cc1bd29d6a5a247e11af1180fc2e
e62215ef4e926e486f846d9167073bf16c8c6abe

http://permalink.gmane.org/gmane.linux.distributions.nixos/20158

This enables us to add newer python packages to krogoth.
---
 meta-python/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 659e1c0..cd27cd2 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -13,7 +13,7 @@ def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE', True)
     package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
     pv = d.getVar('PV', True)
-    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
-- 
2.9.3


