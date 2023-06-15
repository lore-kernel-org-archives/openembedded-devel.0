Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BEBEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 10:07:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14609.1686823634579577428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Mih3Dl17;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55301e784d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F8o7qr030797
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=sj88OVh2xNWE7/De/nVZhdyBLRx1wohq3vm+hTqBQnM=;
 b=Mih3Dl17VS5A03dNvd61Gkvv8Ixm2i1SFPEOpY1QtrwYMPNiEzalJJZHo1Tb3ZHE6A9I
 GDVfpeOORKwLu+mcAuyTiLtTOtQMF/P7BTpajhXvYdC7mhCKjn9513jHWU9ElA8BqHpQ
 fnMyD0C1zTEHvPwNjkRduIu1LOLkmVFIxMPjIGHMC4k1K/OWcoFrUvMxpKTIlkz/uuOh
 cei8vclsGU6V6u8t3pJz6Bo4267KtiRRsem575VUHJ04k6+fTkuX/jVLPJhv/jFpl/Rv
 gXs8JYd5KIhHUXnrVlkpJGpNFqd/KSWJ1I6b8lJDqwpjkBMNMmXG6iD22jONovzWpgyg bQ== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4g584s9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:13 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 03:07:11 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41916
Date: Thu, 15 Jun 2023 10:06:58 +0000
Message-ID: <20230615100658.543762-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Lv8_H78Fm7NXZKLh-slYwnqjqqknS6XB
X-Proofpoint-ORIG-GUID: Lv8_H78Fm7NXZKLh-slYwnqjqqknS6XB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=752 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103295

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service
vulnerability in Heimdal's PKI certificate validation library,
affecting the KDC (via PKINIT) and kinit (via PKINIT), as well as
any third-party applications using Heimdal's libhx509. Users
should upgrade to Heimdal 7.7.1 or 7.8. There are no known
workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-41916.patch          | 41 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
new file mode 100644
index 000000000..055e4060e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
@@ -0,0 +1,41 @@
+From eb87af0c2d189c25294c7daf483a47b03af80c2c Mon Sep 17 00:00:00 2001
+From: Jeffrey Altman <jaltman@secure-endpoints.com>
+Date: Wed, 17 Nov 2021 20:00:29 -0500
+Subject: [PATCH] lib/wind: find_normalize read past end of array
+
+find_normalize() can under some circumstances read one element
+beyond the input array.  The contents are discarded immediately
+without further use.
+
+This change prevents the unintended read.
+
+(cherry picked from commit 357a38fc7fb582ae73f4b7f4a90a4b0b871b149e)
+
+Change-Id: Ia2759a5632d64f7fa6553f879b5bbbf43ba3513e
+
+Upstream-Status: Backport
+CVE: CVE-2022-41916
+
+Reference to upstream patch:
+https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03af80c2c
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/wind/normalize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/wind/normalize.c b/lib/wind/normalize.c
+index 20e8a4a04b..8f3991d10e 100644
+--- a/lib/wind/normalize.c
++++ b/lib/wind/normalize.c
+@@ -227,9 +227,9 @@ find_composition(const uint32_t *in, unsigned in_len)
+	unsigned i;
+
+	if (n % 5 == 0) {
+-	    cur = *in++;
+	    if (in_len-- == 0)
+		return c->val;
++	    cur = *in++;
+	}
+
+	i = cur >> 16;
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index cc07d51dc..fcec63752 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0007.patch;patchdir=source4/heimdal \
            file://CVE-2022-3437-0008.patch;patchdir=source4/heimdal \
            file://CVE-2022-45142.patch;patchdir=source4/heimdal \
+           file://CVE-2022-41916.patch;patchdir=source4/heimdal \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


