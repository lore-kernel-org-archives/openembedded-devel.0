Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 2608F71994
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 15:55:01 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v81FoNs2018753 for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2017 10:55:03 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2cpwqvew2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 10:55:03 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v81Ft2tS004525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2017 10:55:02 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 1 Sep 2017 10:55:01 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 1 Sep 2017 10:54:55 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Sep 2017 18:54:55 +0300
Message-ID: <20170901155455.4807-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-01_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709010227
Cc: Will Page <Will.Page@ni.com>
Subject: [meta-networking][PATCH] vpnc: Reduce lifetime value to widely-compatible value
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
X-List-Received-Date: Fri, 01 Sep 2017 15:55:02 -0000
Content-Type: text/plain

From: Will Page <Will.Page@ni.com>

Current proposed lifetime value (2147483 seconds, which equates to
MAXINT ms, or ~25 days) is rejected by Fortigate vpn devices because
"peer SA proposal does not match local policy".  It seems default
policy for these devices constrains lifetime where similar VPN devices
don't.

Reducing the lifetime from its current value to 28800 (exactly 8 hours)
causes it to start working with fortigate devices.

Signed-off-by: Will Page <Will.Page@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../vpnc/vpnc/0009-reduce-lifetime-value.patch     | 42 ++++++++++++++++++++++
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch
new file mode 100644
index 000000000..2bed55041
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch
@@ -0,0 +1,42 @@
+From 39925f090c21ab571ebc6ec250696f7f7093a2a6 Mon Sep 17 00:00:00 2001
+From: Will Page <Will.Page@ni.com>
+Date: Wed, 30 Aug 2017 18:14:00 -0700
+Subject: [PATCH 1/1] Reduce lifetime value to widely-compatible value
+
+Current proposed lifetime value (2147483 seconds, which equates to
+MAXINT ms, or ~25 days) is rejected by Fortigate vpn devices because
+"peer SA proposal does not match local policy".  It seems default
+policy for these devices constrains lifetime where similar VPN devices
+don't.
+
+Reducing the lifetime from its current value to 28800 (exactly 8 hours)
+causes it to start working with fortigate devices.
+---
+ vpnc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/vpnc.c b/vpnc.c
+index 36dd0f3..3e0fcba 100644
+--- a/vpnc.c
++++ b/vpnc.c
+@@ -1135,7 +1135,7 @@ static struct isakmp_attribute *make_transform_ike(int dh_group, int crypt, int
+ 	a->af = isakmp_attr_lots;
+ 	a->u.lots.length = 4;
+ 	a->u.lots.data = xallocc(a->u.lots.length);
+-	*((uint32_t *) a->u.lots.data) = htonl(2147483);
++	*((uint32_t *) a->u.lots.data) = htonl(28800);
+ 	a = new_isakmp_attribute_16(IKE_ATTRIB_LIFE_TYPE, IKE_LIFE_TYPE_SECONDS, a);
+ 	a = new_isakmp_attribute_16(IKE_ATTRIB_AUTH_METHOD, auth, a);
+ 	a = new_isakmp_attribute_16(IKE_ATTRIB_GROUP_DESC, dh_group, a);
+@@ -2561,7 +2561,7 @@ static struct isakmp_attribute *make_transform_ipsec(struct sa_block *s, int dh_
+ 	a->af = isakmp_attr_lots;
+ 	a->u.lots.length = 4;
+ 	a->u.lots.data = xallocc(a->u.lots.length);
+-	*((uint32_t *) a->u.lots.data) = htonl(2147483);
++	*((uint32_t *) a->u.lots.data) = htonl(28800);
+ 	a = new_isakmp_attribute_16(ISAKMP_IPSEC_ATTRIB_SA_LIFE_TYPE, IPSEC_LIFE_SECONDS, a);
+ 
+ 	if (dh_group)
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 6f92acd06..ea2179985 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/ndpgroup/vpnc \
            file://0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch \
            file://0007-add-error-API-when-error.h-is-not-on-platform.patch \
            file://0008-include-sysdep.h-before-net-if_tun.h.patch \
+           file://0009-reduce-lifetime-value.patch \
            "
 
 PACKAGECONFIG ?= "gnutls"
-- 
2.14.1


