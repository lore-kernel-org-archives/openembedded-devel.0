Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10D517874E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w637Ld5S027583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:39 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:38 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:22 +0800
Message-ID: <1530602486-4522-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 4/8] python-ldap: upgrade 2.4.41 -> 2.4.45
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:38 -0000
Content-Type: text/plain

License-Update: removed CVS-Id lines

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python/{python-ldap_2.4.41.bb => python-ldap_2.4.45.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/python/{python-ldap_2.4.41.bb => python-ldap_2.4.45.bb} (77%)

diff --git a/meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb b/meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb
similarity index 77%
rename from meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
rename to meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb
index 3dbc8b1..dde8a52 100644
--- a/meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
+++ b/meta-networking/recipes-devtools/python/python-ldap_2.4.45.bb
@@ -14,9 +14,9 @@ DEPENDS = "python openldap cyrus-sasl"
 PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools
 
-LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-SRC_URI[md5sum] = "18db2d009150ec1864710fea3ed76173"
-SRC_URI[sha256sum] = "6d430ecf040f2fc704ee316d3390cb1f5419c191371e1e131baef54a0e42cef0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
+SRC_URI[md5sum] = "6108e189a44eea8bc7d1cc281c222978"
+SRC_URI[sha256sum] = "824fde180a53772e23edc031c4dd64ac1af4a3eade78f00d9d510937d562f64e"
 
 do_configure_prepend() {
     sed -i -e 's:^library_dirs =.*::' setup.cfg
-- 
2.7.4


