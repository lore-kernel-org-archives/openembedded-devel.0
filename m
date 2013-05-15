Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UcQnu-00017x-Cf
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 03:47:38 +0200
Received: by mail-da0-f47.google.com with SMTP id k13so644847dae.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 18:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AbI56AHwHmcmxlELJ5M9HkIaHIUh2SLhnOuGAReGblY=;
	b=Byw7hygzjJUHnDLNwaFV8yv6W6c8F7Gg8RotDAzApkju5BK8QGzYpE/wtQ6z0KQFdK
	pb1YxhXsf6TqMPWDIg5CtaYLci+FwWwgAgX5tVV0FctLgI3nWbQPkhiF7kCGei4muMix
	y4QZtWKwaSQVI2TzTHkyL2DYnWG2BY86xvgcqFczzwJ1jc1kIojlUQRODQKeA7UI1nTS
	LYJWyeIgp/LqB2nPA/xkRsEwmKs8ktVUj3JBwPVU0sLvVyTMgDiR1JixKomD38IaMjlV
	uOl3O3x4afWLFaR2JqC5zTJgFEjeAb5I+XQlEBnoBFNtQ3hJ2+MTNSYOmgl/pf3tH828
	K33w==
X-Received: by 10.68.201.39 with SMTP id jx7mr14258533pbc.186.1368581321720;
	Tue, 14 May 2013 18:28:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id r6sm999315pae.18.2013.05.14.18.28.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 18:28:40 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 11:41:15 +1000
Message-Id: <1368582075-17580-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH] dmidecode: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 01:47:44 -0000

A newer version is available in OE-Core.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-extended/dmidecode/dmidecode_2.10.bb    | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb

diff --git a/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb b/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb
deleted file mode 100644
index 3437ef1..0000000
--- a/meta-oe/recipes-extended/dmidecode/dmidecode_2.10.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
-SECTION = "console/utils"
-HOMEPAGE = "http://www.nongnu.org/dmidecode/"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
-LICENSE = "GPLv2"
-PR = "r2"
-
-SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2"
-
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake DESTDIR="${D}" install
-}
-
-SRC_URI[md5sum] = "3c9c4d55a40b78600f3b43bfa64616f9"
-SRC_URI[sha256sum] = "4d74a3e93353320317a424816f9a045df06d9ed4b5b80881e16fdfcc74c9e2c0"
-- 
1.8.2.3



