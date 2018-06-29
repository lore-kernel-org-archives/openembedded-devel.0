Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A61C365D00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 03:18:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T3I5Wx023276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 20:18:06 -0700 (PDT)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 20:18:05 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 10:48:13 +0800
Message-ID: <1530240494-13129-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] apache2: Add PACKAGECONFIG zlib option for mod_deflate
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
X-List-Received-Date: Fri, 29 Jun 2018 03:18:05 -0000
Content-Type: text/plain

The configure options '--enable-deflate' or '--with-z' make
the package depends on zlib. PACKAGECONFIG should be defined
to clear the dependency.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
index c422092..b08e037 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
@@ -64,6 +64,7 @@ EXTRA_OECONF = "--enable-ssl \
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux --enable-layout=Debian --prefix=${base_prefix}/,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
+PACKAGECONFIG[zlib] = "--enable-deflate --with-z=${STAGING_LIBDIR},,zlib,zlib"
 
 do_configure_prepend() {
         sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
-- 
1.9.1


