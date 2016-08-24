Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7EB731D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O9Mfl9023869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:41 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:07:01 +0800
Message-ID: <5e49968ccf39953dc4e0bd533bec20a524f82492.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/16] php: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 9d21c54..cd91940 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -70,7 +70,9 @@ EXTRA_OECONF_class-native = " \
 "
 
 PACKAGECONFIG ??= "mysql sqlite3 imap \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+"
 PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
@@ -91,6 +93,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
                        --with-imap-ssl=${STAGING_DIR_HOST} \
                        ,--without-imap --without-imap-ssl \
                        ,uw-imap"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
2.8.3


