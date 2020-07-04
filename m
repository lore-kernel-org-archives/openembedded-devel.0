Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.19031.1593870674344991595
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2020 06:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=BdDcdudN;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1339-171.w193-250.abo.wanadoo.fr [193.250.150.171])
	by koncepto.io (Postfix) with ESMTPSA id 2458360362;
	Sat,  4 Jul 2020 15:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593870671;
	bh=UpHb5S8cH2qE43aUmCkAAgjHLUX6mKB1PfPSW3pQ+C8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdDcdudNUF7xZarsmZMQqBqHn5QAnOnSh43tn9IXuTANHZjHmeECjR8b5LPgeLrkI
	 kCv1Ugp+mlPt3YiQLs2XTajH/caz9rgKUjYpbvWb1y3flZFGcwhnPLioTqtXrx6RQe
	 ML+dyFrWiqEssgeB7ieg+i9k0v9/edARjMm3xGkhupUeTu/J++9MZXkPuxERViX/T8
	 nyf4oocs+GG5FCp9VaaJ7xjZMUjRpV438eJFFXrVFXj/IEUjRy+R9HKV92mEaubBRP
	 vVMVkpeO3i8myK8/zQHw/bwK11up2XnatcOraThE3tlCh+IxpumZEjVbPl0B2cVNfw
	 A6BXrFDwINtfw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] xxhash: upgrade 0.7.3 -> 0.7.4
Date: Sat,  4 Jul 2020 15:51:07 +0200
Message-Id: <1593870667-26940-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593870667-26940-1-git-send-email-pjtexier@koncepto.io>
References: <1593870667-26940-1-git-send-email-pjtexier@koncepto.io>

License-Update: copyright years updated

-Copyright (c) 2012-present, Yann Collet
+Copyright (c) 2012-2020 Yann Collet

See full changelog https://github.com/Cyan4973/xxHash/releases/tag/v0.7.4

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../xxhash/{xxhash_0.7.3.bb => xxhash_0.7.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xxhash/{xxhash_0.7.3.bb => xxhash_0.7.4.bb} (78%)

diff --git a/meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb b/meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb
similarity index 78%
rename from meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb
rename to meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb
index 865adc5a1..6e74e49bf 100644
--- a/meta-oe/recipes-support/xxhash/xxhash_0.7.3.bb
+++ b/meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01a7eba4212ef1e882777a38585e7a9b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
 
 SRC_URI = "git://github.com/Cyan4973/xxHash.git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "d408e9b0606d07b1ddc5452ffc0ec8512211b174"
+SRCREV = "173e50be0509c6fb6c1bb74d95049ef61d7fdced"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0

