Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07937721E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jAhs025594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:11 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:05 -0800
Message-ID: <085d37071ddae351b291defbfdf2cd536ec56a8b.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 1/5] openldap: fix for new libtool
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
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


