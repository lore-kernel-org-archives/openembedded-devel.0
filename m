Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80214605D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 02:28:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R2SdG5013960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jul 2015 19:28:39 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 26 Jul 2015 19:28:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 10:26:28 +0800
Message-ID: <1437963988-8923-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] strongswan: upgrade to 5.3.1
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
X-List-Received-Date: Mon, 27 Jul 2015 02:28:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

5.3.1 fixed the CVE-2015-4620

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../strongswan/{strongswan_5.3.0.bb => strongswan_5.3.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.3.0.bb => strongswan_5.3.1.bb} (92%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.1.bb
similarity index 92%
rename from meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.3.1.bb
index d858ca2..abe9141 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "c52d4228231c2025d9c320d0e9990327"
-SRC_URI[sha256sum] = "824da31a1ff89ac2500d56705e6f9ce06fe5260f9caaeb1da35ea13a8691d284"
+SRC_URI[md5sum] = "66f258901a3d6c271da1a0c7fb3e5013"
+SRC_URI[sha256sum] = "83fa7b004e65356ff5bb755d9d0e03901d578a99e90b6328a350a4335a32f6de"
 
 EXTRA_OECONF = "--enable-gmp \
         --enable-openssl \
-- 
1.9.1


