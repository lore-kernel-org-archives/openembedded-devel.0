Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8837CCC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:42:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S5gIOB013350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:42:19 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 21:42:18 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 13:42:12 +0800
Message-ID: <1551332535-158589-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
References: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
	<1551332535-158589-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4 V2] freeradius: Add PACKAGECONFIG openssl/rlm-eap-fast/rlm-eap-pwd
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
X-List-Received-Date: Thu, 28 Feb 2019 05:42:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index c17d56d..5ab9a3f 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -68,6 +68,7 @@ EXTRA_OECONF = " --enable-strict-dependencies \
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    pcre libcap \
+                   openssl rlm-eap-fast rlm-eap-pwd \
 "
 
 PACKAGECONFIG[krb5] = "--with-rlm_krb5,--without-rlm_krb5,krb5"
@@ -83,6 +84,9 @@ PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --w
 PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
 PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
 PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
+PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl"
+PACKAGECONFIG[rlm-eap-fast] = "--with-rlm_eap_fast, --without-rlm_eap_fast"
+PACKAGECONFIG[rlm-eap-pwd] = "--with-rlm_eap_pwd, --without-rlm_eap_pwd"
 
 inherit useradd autotools-brokensep update-rc.d systemd
 
-- 
2.7.4


