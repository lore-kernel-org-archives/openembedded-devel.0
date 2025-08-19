Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33889CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:14:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11218.1755602077963713768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0326f6ecb4=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57JA5s2q1134015
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:14:37 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48jgy6atu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:14:36 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 19 Aug 2025 04:14:28 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] poppler: fix CVE-2025-50420
Date: Tue, 19 Aug 2025 16:43:54 +0530
Message-ID: <20250819111354.2437799-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: y4kKJZp-pcnWcQDzWBa3X7BzH38yOrS-
X-Proofpoint-ORIG-GUID: y4kKJZp-pcnWcQDzWBa3X7BzH38yOrS-
X-Authority-Analysis: v=2.4 cv=da2A3WXe c=1 sm=1 tr=0 ts=68a45c9c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=Ai16GGQhjgwLQAW92vkA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDEwNiBTYWx0ZWRfX2rN8EQNKvKuI
 dofFYZ5xV+P992TDxGCLxDF4jIRjFYFqW1ofFA9LZMjF0AemikCbI08jne3o6RanwKRPPdTVlJ5
 A0YNWCIeqxca0UphgU0bIdI8fFDQGd4ZT3nGUv6Qhr7+Q4G4B3NxjuiZbStdoLtJ6cMmnSYD2Pr
 Wa1IAD654dJWKKCwIRIkW3/sfTT1oI7axaUEMCSmybqpvQ9eQBtjqV/iZJeWCJWeTgGW9mJYuCv
 MM/G9BRF0lVTlEEDaWVzpJo+O2N2yhieXb/9lo4Sg5Fa0u7rkYJMH1b8+ZvlgxjNsKWvGMaopAn
 ggaB2afLNI5WJamb4FW4r2hOJfHqR+AewQfxWVufu696qrqamGTqbZhhuT/byw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119002

From: Yogita Urade <yogita.urade@windriver.com>

An issue in the pdfseparate utility of freedesktop poppler
v25.04.0 allows attackers to cause an infinite recursion via
supplying a crafted PDF file. This can lead to a Denial of
Service (DoS).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50420

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/a7025904e3330dd6cf95f3664ef6fc77034cc5e1

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-50420.patch      | 38 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch
new file mode 100644
index 0000000000..a6396eeba2
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-50420.patch
@@ -0,0 +1,38 @@
+From a7025904e3330dd6cf95f3664ef6fc77034cc5e1 Mon Sep 17 00:00:00 2001
+From: Sune Vuorela <sune@vuorela.dk>
+Date: Tue, 29 Jul 2025 14:14:00 +0200
+Subject: [PATCH] Fix crash in pdfseparate
+
+Don't continue recursing in PDFDoc::mark* if things looks a bit weirder
+than expected
+
+CVE: CVE-2025-50420
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/a7025904e3330dd6cf95f3664ef6fc77034cc5e1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/PDFDoc.cc | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/poppler/PDFDoc.cc b/poppler/PDFDoc.cc
+index 872841c..a7c2e24 100644
+--- a/poppler/PDFDoc.cc
++++ b/poppler/PDFDoc.cc
+@@ -1818,6 +1818,15 @@ bool PDFDoc::markAnnotations(Object *annotsObj, XRef *xRef, XRef *countRef, unsi
+             if (obj1.isDict()) {
+                 Dict *dict = obj1.getDict();
+                 Object type = dict->lookup("Type");
++                if (type.isNull()) {
++                    Object subType = dict->lookup("SubType");
++                    // Type is optional, subtype is required
++                    // If neither of them exists, something is probably
++                    // weird here, so let us just skip this entry
++                    if (subType.isNull()) {
++                        continue;
++                    }
++                }
+                 if (type.isName() && strcmp(type.getName(), "Annot") == 0) {
+                     const Object &obj2 = dict->lookupNF("P");
+                     if (obj2.isRef()) {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 81574177e0..7a6666936e 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-43903-0002.patch \
            file://CVE-2025-52886-0001.patch \
            file://CVE-2025-52886-0002.patch \
+           file://CVE-2025-50420.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.40.0


