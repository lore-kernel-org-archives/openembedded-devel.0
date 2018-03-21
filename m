Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B6C0671A5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026062"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F7EE48AE76A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:16 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:07 +0800
Message-ID: <1521603377-34881-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7F7EE48AE76A.A816C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] strongswan: 5.5.3 -> 5.6.2
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:16 -0000
Content-Type: text/plain

1.Upgrade strongswan from 5.5.3 to 5.6.2.
2.Modify fix-funtion-parameter.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/strongswan/files/fix-funtion-parameter.patch    | 6 +++---
 .../strongswan/{strongswan_5.5.3.bb => strongswan_5.6.2.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.5.3.bb => strongswan_5.6.2.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
index da96983..846e0c6 100644
--- a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
+++ b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
@@ -50,7 +50,7 @@ index ff33824..bd21446 100644
   */
 -openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 							diffie_hellman_group_t group, chunk_t g, chunk_t p)
+											diffie_hellman_group_t group, ...)
  {
  	private_openssl_diffie_hellman_t *this;
 @@ -197,5 +197,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
@@ -70,12 +70,12 @@ index 53dc59c..eb69eaa 100644
 --- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
 +++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
 @@ -44,8 +44,10 @@ struct openssl_diffie_hellman_t {
-  * @param p				custom prime, if MODP_CUSTOM
+  * @param ...			expects generator and prime as chunk_t if MODP_CUSTOM
   * @return				openssl_diffie_hellman_t object, NULL if not supported
   */
 -openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 							diffie_hellman_group_t group, chunk_t g, chunk_t p);
+											diffie_hellman_group_t group, ...);
 +openssl_diffie_hellman_t *openssl_diffie_hellman_create(
 +							diffie_hellman_group_t group);
  
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
index 97ebcd8..f2fe1f1 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
-SRC_URI[sha256sum] = "c5ea54b199174708de11af9b8f4ecf28b5b0743d4bc0e380e741f25b28c0f8d4"
+SRC_URI[md5sum] = "46aa3aa18fbc4bd528f9a0345ce79913"
+SRC_URI[sha256sum] = "e0a60a30ebf3c534c223559e1686497a21ded709a5d605c5123c2f52bcc22e92"
 
 EXTRA_OECONF = " \
         --without-lib-prefix \
-- 
2.7.4




