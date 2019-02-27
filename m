Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601C171B99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:42:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1R8gFkv027990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 00:42:15 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 00:42:15 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 16:41:48 +0800
Message-ID: <1551256910-119653-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] krb5: add PACKAGECONFIG disable-pkinit
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
X-List-Received-Date: Wed, 27 Feb 2019 08:42:14 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
index c770f7b..f0561df 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
@@ -44,6 +44,7 @@ PACKAGECONFIG[openssl] = "--with-crypto-impl=openssl,,openssl"
 PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+PACKAGECONFIG[disable-pkinit] = "--disable-pkinit,--enable-pkinit"
 
 EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
-- 
2.7.4


