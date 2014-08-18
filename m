Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA08065DD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:05:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I75432005646
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 00:05:04 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 00:05:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Aug 2014 03:05:02 -0400
Message-ID: <1408345502-16283-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: uprev to version 5.2.0
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
X-List-Received-Date: Mon, 18 Aug 2014 07:05:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* removed two patches which were already integrated in 5.2.0:
  strongswan-4.3.3-5.1.1_asn1_unwrap.patch
  strongswan-5.0.0-5.1.2_reject_child_sa.patch

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch | 28 -----------------
 .../strongswan-5.0.0-5.1.2_reject_child_sa.patch   | 36 ----------------------
 .../{strongswan_5.1.1.bb => strongswan_5.2.0.bb}   |  6 ++--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.1.1.bb => strongswan_5.2.0.bb} (87%)

diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch b/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch
deleted file mode 100644
index 374f2cf..0000000
--- a/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-strongswan: asn1: Properly check length in asn1_unwrap()
-
-Fixes CVE-2014-2891 in strongSwan releases 4.3.3-5.1.1.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
----
- src/libstrongswan/asn1/asn1.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libstrongswan/asn1/asn1.c b/src/libstrongswan/asn1/asn1.c
-index d860ad9..9a5f5c5 100644
---- a/src/libstrongswan/asn1/asn1.c
-+++ b/src/libstrongswan/asn1/asn1.c
-@@ -296,7 +296,7 @@ int asn1_unwrap(chunk_t *blob, chunk_t *inner)
- 	else
- 	{	/* composite length, determine number of length octets */
- 		len &= 0x7f;
--		if (len == 0 || len > sizeof(res.len))
-+		if (len == 0 || len > blob->len || len > sizeof(res.len))
- 		{
- 			return ASN1_INVALID;
- 		}
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch b/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
deleted file mode 100644
index ad3459e..0000000
--- a/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b980ba7757dcfedd756aa055b3271ea58cf85aa6 Mon Sep 17 00:00:00 2001
-From: Martin Willi <martin@revosec.ch>
-Date: Thu, 20 Feb 2014 16:08:43 +0100
-Subject: [PATCH] ikev2: Reject CREATE_CHILD_SA exchange on unestablished
- IKE_SAs
-
-Prevents a responder peer to trick us into established state by starting
-IKE_SA rekeying before the IKE_SA has been authenticated during IKE_AUTH.
-
-Fixes CVE-2014-2338 for 5.x versions of strongSwan.
----
- src/libcharon/sa/ikev2/task_manager_v2.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
-index ac3be90..a5252ab 100644
---- a/src/libcharon/sa/ikev2/task_manager_v2.c
-+++ b/src/libcharon/sa/ikev2/task_manager_v2.c
-@@ -780,6 +780,15 @@ static status_t process_request(private_
- 			case CREATE_CHILD_SA:
- 			{	/* FIXME: we should prevent this on mediation connections */
- 				bool notify_found = FALSE, ts_found = FALSE;
-+
-+				if (this->ike_sa->get_state(this->ike_sa) == IKE_CREATED ||
-+					this->ike_sa->get_state(this->ike_sa) == IKE_CONNECTING)
-+				{
-+					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
-+						 "unestablished IKE_SA, rejected");
-+					return FAILED;
-+				}
-+
- 				enumerator = message->create_payload_enumerator(message);
- 				while (enumerator->enumerate(enumerator, &payload))
- 				{
---
-1.8.1.2
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
similarity index 87%
rename from meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
index cfa9abc..0997fd0 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
@@ -9,12 +9,10 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
-        file://strongswan-5.0.0-5.1.2_reject_child_sa.patch \
-        file://strongswan-4.3.3-5.1.1_asn1_unwrap.patch \
 "
 
-SRC_URI[md5sum] = "e3af3d493d22286be3cd794533a8966a"
-SRC_URI[sha256sum] = "fbf2a668221fc4a36a34bdeac2dfeda25b96f572d551df022585177953622406"
+SRC_URI[md5sum] = "5cee4ee1a6ccb74400758b3ace54d46e"
+SRC_URI[sha256sum] = "b00c30bd2e60ff2e5fc85f54bbad54fe246585812fdf212dbe777a5258da26ce"
 
 EXTRA_OECONF = "--enable-gmp \
         --enable-openssl \
-- 
2.0.0


