Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A29F770B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 02:55:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9R2tnNE001162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 19:55:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 19:55:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Oct 2015 10:46:58 +0800
Message-ID: <1445914019-23995-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445914019-23995-1-git-send-email-rongqing.li@windriver.com>
References: <1445914019-23995-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] pure-ftpd: add PACKAGECONFIG for libsodium
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 02:55:50 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
index fa592dc..c1f1504 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
@@ -18,3 +18,5 @@ SRC_URI[sha256sum] = "7be73a8e58b190a7054d2ae00c5e650cb9e091980420082d02ec3c3b68
 inherit autotools
 
 EXTRA_OECONF = "--with-minimal"
+PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
+                       ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
-- 
1.9.1


