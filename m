Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA497780E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JPKA029863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:25 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:27 +0800
Message-ID: <20170705081133.6496-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 04/10] krb5: toggle configure option pkinit
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Toggle configure option pkinit of krb5 according to distro feature
openssl-no-weak-ciphers. openssl-no-weak-ciphers is introduced to
disable openssl weak ciphers support which include des. It could not
build plugin pkinit without openssl des support.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
index 61cdd60..013a7e1 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb
@@ -43,7 +43,9 @@ PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
-EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
+EXTRA_OECONF += "--without-tcl --with-system-et --disable-rpath \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', '--disable-pkinit', '--enable-pkinit', d)} \
+                 "
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"
-- 
2.10.1


