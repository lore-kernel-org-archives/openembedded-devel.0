Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF381601F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 04:44:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R4ijPi004970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jul 2015 21:44:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 26 Jul 2015 21:44:31 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 12:42:35 +0800
Message-ID: <1437972155-21003-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] strongswan: upgrade to 5.3.2
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
X-List-Received-Date: Mon, 27 Jul 2015 04:44:47 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

5.3.2 includes the fixes for CVE-2015-3991 and CVE-2015-4171

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../strongswan/{strongswan_5.3.0.bb => strongswan_5.3.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.3.0.bb => strongswan_5.3.2.bb} (92%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
similarity index 92%
rename from meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
index d858ca2..a231a90 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "c52d4228231c2025d9c320d0e9990327"
-SRC_URI[sha256sum] = "824da31a1ff89ac2500d56705e6f9ce06fe5260f9caaeb1da35ea13a8691d284"
+SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
+SRC_URI[sha256sum] = "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
 
 EXTRA_OECONF = "--enable-gmp \
         --enable-openssl \
-- 
1.9.1


