Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB09972AFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 23:49:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07NnmwU002625
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Jan 2015 15:49:48 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 15:49:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Jan 2015 15:49:46 -0800
Message-ID: <1420674586-7077-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420674586-7077-1-git-send-email-liezhi.yang@windriver.com>
References: <1420674586-7077-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] openldap: fix for new libtool
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
X-List-Received-Date: Wed, 07 Jan 2015 23:49:54 -0000
Content-Type: text/plain

The new libtool's ltmain.sh is in build-aux.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/openldap/openldap_2.4.39.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
index 8752395..5f5de5e 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
@@ -147,7 +147,7 @@ PACKAGES += "${PN}-overlay-proxycache"
 CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
 
 do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
+    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
     aclocal
     libtoolize --force --copy
-- 
1.7.9.5


