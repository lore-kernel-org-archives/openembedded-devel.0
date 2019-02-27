Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED6E37CC69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:42:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1R8go3O015836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 00:42:50 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 00:42:38 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 16:41:50 +0800
Message-ID: <1551256910-119653-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] freeradius: add PACKAGECONFIGs
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
X-List-Received-Date: Wed, 27 Feb 2019 08:42:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add 3 PACKAGECONFIG

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index c17d56d..cee3b47 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -83,6 +83,9 @@ PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --w
 PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
 PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
 PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
+PACKAGECONFIG[no-ssl] = "--without-openssl,--with-openssl"
+PACKAGECONFIG[no-rlm-eap-fast] = "--without-rlm_eap_fast,--with-rlm_eap_fast"
+PACKAGECONFIG[no-rlm-eap-pwd] = "--without-rlm_eap_pwd,--with-rlm_eap_pwd"
 
 inherit useradd autotools-brokensep update-rc.d systemd
 
-- 
2.7.4


