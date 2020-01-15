Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 341BD7F971
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 15:54:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00FFrm8e006263
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 07:54:09 -0800
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 15 Jan 2020 07:54:00 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 10:53:58 -0500
Message-ID: <87o8v4lnqh.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [meta-oe][PATCH] keyutils: upgrade 1.6 -> 1.6.1
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
X-List-Received-Date: Wed, 15 Jan 2020 15:54:18 -0000
Content-Type: text/plain


Signed-off-by: Matthew Zeng <Matthew.Zeng@windriver.com>
---
 .../keyutils/{keyutils_1.6.bb => keyutils_1.6.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/keyutils/{keyutils_1.6.bb => keyutils_1.6.1.bb} (92%)

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
similarity index 92%
rename from meta-oe/recipes-security/keyutils/keyutils_1.6.bb
rename to meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
index 572143a5a..0a8c2e483 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
            file://fix_library_install_path.patch \
            "

-SRC_URI[md5sum] = "191987b0ab46bb5b50efd70a6e6ce808"
-SRC_URI[sha256sum] = "d3aef20cec0005c0fa6b4be40079885567473185b1a57b629b030e67942c7115"
+SRC_URI[md5sum] = "919af7f33576816b423d537f8a8692e8"
+SRC_URI[sha256sum] = "c8b15722ae51d95b9ad76cc6d49a4c2cc19b0c60f72f61fb9bf43eea7cbd64ce"

 EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_ARLIB=1 \
--
2.24.0


