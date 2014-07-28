Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08FE865F01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 08:17:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S8H7cq022885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 01:17:07 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 01:17:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jul 2014 04:17:05 -0400
Message-ID: <1406535425-28139-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: Security Advisory - strongswan - CVE-2014-2891
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
X-List-Received-Date: Mon, 28 Jul 2014 08:17:07 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

strongSwan before 5.1.2 allows remote attackers to cause a denial of
service (NULL pointer dereference and IKE daemon crash) via a crafted
ID_DER_ASN1_DN ID payload.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2891

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch | 28 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.1.1.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch

diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch b/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch
new file mode 100644
index 0000000..374f2cf
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/strongswan-4.3.3-5.1.1_asn1_unwrap.patch
@@ -0,0 +1,28 @@
+strongswan: asn1: Properly check length in asn1_unwrap()
+
+Fixes CVE-2014-2891 in strongSwan releases 4.3.3-5.1.1.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ src/libstrongswan/asn1/asn1.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/asn1/asn1.c b/src/libstrongswan/asn1/asn1.c
+index d860ad9..9a5f5c5 100644
+--- a/src/libstrongswan/asn1/asn1.c
++++ b/src/libstrongswan/asn1/asn1.c
+@@ -296,7 +296,7 @@ int asn1_unwrap(chunk_t *blob, chunk_t *inner)
+ 	else
+ 	{	/* composite length, determine number of length octets */
+ 		len &= 0x7f;
+-		if (len == 0 || len > sizeof(res.len))
++		if (len == 0 || len > blob->len || len > sizeof(res.len))
+ 		{
+ 			return ASN1_INVALID;
+ 		}
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
index 821d965..cfa9abc 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
         file://strongswan-5.0.0-5.1.2_reject_child_sa.patch \
+        file://strongswan-4.3.3-5.1.1_asn1_unwrap.patch \
 "
 
 SRC_URI[md5sum] = "e3af3d493d22286be3cd794533a8966a"
-- 
2.0.0


