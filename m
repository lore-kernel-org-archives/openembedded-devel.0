Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3263677B8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v658JTkM029866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:30 +0800
Message-ID: <20170705081133.6496-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 07/10] uftp: set NO_EC if openssl not support ec
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:28 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Distro feature openssl-no-weak-ciphers is introduced to make openssl
disable weak ciphers support which include ec algorithm. So set NO_EC
for uftp if openssl doesn't support ec.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/uftp/uftp_4.9.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb b/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
index 1166f9a..6272792 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "9e9215af0315257c6cc4f40fbc6161057e861be1fff10a38a5564f699e
 
 DEPENDS = "openssl"
 
+EXTRA_OEMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'NO_EC=1', '', d)}"
+
 do_install () {
 	oe_runmake install DESTDIR=${D}
 }
-- 
2.10.1


