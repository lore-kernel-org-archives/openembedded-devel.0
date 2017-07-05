Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 024B271985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JWIT012745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:31 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:32 +0800
Message-ID: <20170705081133.6496-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/10] poco: disable package configs NetSSL and Crypto
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Distro feature openssl-no-weak-ciphers will disable openssl des support
that causes poco compile failure. Disable package configs NetSSL and
Crypto for poco if distro feature openssl-no-weak-ciphers exists.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/poco/poco_1.7.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.8.bb b/meta-oe/recipes-support/poco/poco_1.7.8.bb
index 1b83735..c48f967 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.8.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.8.bb
@@ -34,6 +34,7 @@ EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
 PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip"
+PACKAGECONFIG_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'NetSSL Crypto', '', d)}"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
-- 
2.10.1


