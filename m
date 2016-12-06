Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2B0F719CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 03:26:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB63QSLp010880
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2016 19:26:28 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 5 Dec 2016 19:26:27 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Dec 2016 11:25:24 +0800
Message-ID: <20161206032524.9670-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: add dependency icu
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
X-List-Received-Date: Tue, 06 Dec 2016 03:26:27 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It calls icu-config to detect icu support in file makedefs of postfix.
The compile results are different depends on whether icu has been built
already.

postfix should provide Unicode support, so add dependency icu to solve
the problem.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index c00c77f..03b7985 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "virtual/db libpcre openssl postfix-native \
+DEPENDS = "virtual/db icu libpcre openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-DEPENDS_class-native = "virtual/db-native openssl-native libpcre-native"
+DEPENDS_class-native = "virtual/db-native icu-native openssl-native libpcre-native"
 
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
-- 
2.10.1


