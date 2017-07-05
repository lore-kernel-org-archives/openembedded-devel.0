Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0A3571985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JSC3012734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:29 +0800
Message-ID: <20170705081133.6496-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 06/10] opensc: add PACKAGECONFIG openssl
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:27 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add PACKAGECONFIG openssl to enable or disable build with openssl for
opensc. Check DISTRO_FEATURE openssl-no-weak-ciphers. If it exists then
remove PACKAGECONFIG openssl for opensc.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/opensc/opensc_0.16.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
index fd67181..fa7c81d 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
@@ -21,6 +21,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+
+PACKAGECONFIG_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'openssl', '', d)}"
+
 EXTRA_OECONF = " \
     --disable-static \
     --enable-openct \
-- 
2.10.1


