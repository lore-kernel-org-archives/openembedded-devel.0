Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D78C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 16:08:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46018.1717776482597626896
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 09:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6888c8ef97=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457708bj014577
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jun 2024 16:08:01 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7xgsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 16:08:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 09:08:00 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 09:07:59 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cdrkit: fix incompatible pointer type error
Date: Sat, 8 Jun 2024 00:07:57 +0800
Message-ID: <20240607160757.2726296-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jUrxm63T8kSkE0ccbEsRCll1gBHFvPaV
X-Proofpoint-ORIG-GUID: jUrxm63T8kSkE0ccbEsRCll1gBHFvPaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_09,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 16:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110769

From: Kai Kang <kai.kang@windriver.com>

Fix incompatible pointer type error when gcc option
'-Wincompatible-pointer-types' set:

cdrkit-1.1.11/genisoimage/eltorito.c:399:41: error: passing argument 1 of 'set_721' from incompatible pointer type [-Wincompatible-pointer-types]
  399 |                                 set_721(&last_section_header->entry_count, nentries);
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         |
      |                                         char (*)[2]
In file included from cdrkit/1.1.11/cdrkit-1.1.11/genisoimage/eltorito.c:39:
cdrkit-1.1.11/genisoimage/genisoimage.h:507:21: note: expected 'char *' but argument is of type 'char (*)[2]'
  507 | extern void set_721(char *, unsigned int);
      |                     ^~~~~~

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |  1 +
 .../fix-incompatible-pointer-type-error.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/fix-incompatible-pointer-type-error.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 9fd91114d..bbce3e3bf 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-genisoimage-Add-missing-extern-definition.patch \
            file://0001-add-new-option-eltorito-platform.patch \
            file://0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch \
+           file://fix-incompatible-pointer-type-error.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch \
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/fix-incompatible-pointer-type-error.patch b/meta-oe/recipes-multimedia/cdrkit/files/fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..887a54f7f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,44 @@
+Fix incompatible pointer type error when gcc option '-Wincompatible-pointer-types' set:
+
+cdrkit-1.1.11/genisoimage/eltorito.c:399:41: error: passing argument 1 of 'set_721' from incompatible pointer type [-Wincompatible-pointer-types]
+  399 |                                 set_721(&last_section_header->entry_count, nentries);
+      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                         |
+      |                                         char (*)[2]
+In file included from cdrkit/1.1.11/cdrkit-1.1.11/genisoimage/eltorito.c:39:
+cdrkit-1.1.11/genisoimage/genisoimage.h:507:21: note: expected 'char *' but argument is of type 'char (*)[2]'
+  507 | extern void set_721(char *, unsigned int);
+      |                     ^~~~~~
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2010]
+
+[1]: https://en.wikipedia.org/wiki/Cdrkit
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ genisoimage/eltorito.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/genisoimage/eltorito.c b/genisoimage/eltorito.c
+index a804988..e48d58c 100644
+--- a/genisoimage/eltorito.c
++++ b/genisoimage/eltorito.c
+@@ -396,7 +396,7 @@ get_torito_desc(struct eltorito_boot_descriptor *boot_desc)
+ 			    (arch != newarch) ||
+ 			    (current_boot_entry->type & ELTORITO_SECTION_HEADER)) {
+ 			if (last_section_header)
+-				set_721(&last_section_header->entry_count, nentries);
++				set_721((char *)(&last_section_header->entry_count), nentries);
+ 			nentries = 1;
+ 			last_section_header = (struct eltorito_sectionheader_entry *)
+ 							(de2->table + offset);
+@@ -419,7 +419,7 @@ get_torito_desc(struct eltorito_boot_descriptor *boot_desc)
+ 	}
+ 
+ 	if (last_section_header) {
+-		set_721(&last_section_header->entry_count, nentries);
++		set_721((char *)(&last_section_header->entry_count), nentries);
+ 		last_section_header->header_id[0] = EL_TORITO_SHDR_ID_LAST_SHDR;
+ 	}
+ 
-- 
2.34.1


