Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD9C377B38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 05:06:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3C56hco008453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 22:06:44 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 22:06:43 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Apr 2017 13:08:20 +0800
Message-ID: <1491973700-5621-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libnet-ssleay-perl: add openssl-native to DEPENDS
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
X-List-Received-Date: Wed, 12 Apr 2017 05:06:48 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add 'openssl-native' to DEPENDS to fix the following do_configure error.

  *** Could not find OpenSSL

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
index 32d92ba..cf621aa 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.80.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=67d67095d83e339da538a082fad5f38e"
 
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl zlib openssl-native"
 RDEPENDS_${PN} += "perl-module-carp \
                    perl-module-errno \
                    perl-module-extutils-makemaker \
-- 
1.9.1


