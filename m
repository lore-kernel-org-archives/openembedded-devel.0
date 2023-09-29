Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A601EE728CF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 17:43:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24274.1696009422581032539
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 10:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lwBjovS6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8636bada3f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38TGnpnJ029819
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=wXMDxQ64bObPdf7UfuD3ySIJNDwhNqkHSF/FPpJ2ACs=; b=
	lwBjovS6CDvKFx3OJbyEh0RZTeDUDEc9WU9JJqjU1gcWivBgpLQeXX22NN+6PU0a
	LGvqfFAuj+DOkFVczixtP0XkMOamRZHOLgMd/HOjuI6EleoT7T/JQoAywkOtrvB/
	QH1l8rPVobYg9+3I8KeYo3EAlP+hXSP0cbbSqZr0g7Viw3bKSG1R6QL2GhiHWUrx
	/hYNXXX7Wu+58xa2YA/Kdw707iI7md3D4a9+xLi96zcjns0OPUa8Ux26TChziYiN
	F8cbt720k5HSnXk6WMtapNif/pRfePxTcWoByoiHGa+J6eBVhGcMYHwHiulDNOM6
	8Rif0R7xviCpY7aJL7QkqA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06ede4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:43:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 10:43:38 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH V2 2/3] samba: fix CVE-2022-2127
Date: Fri, 29 Sep 2023 17:43:20 +0000
Message-ID: <20230929174321.3060914-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230929174321.3060914-1-archana.polampalli@windriver.com>
References: <20230929174321.3060914-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: sqzJfmty6eGItJKMwn3TOGv-2i5WYXvm
X-Proofpoint-ORIG-GUID: sqzJfmty6eGItJKMwn3TOGv-2i5WYXvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_16,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309290153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105257

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-2127.patch           | 44 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
new file mode 100644
index 000000000..e94d5d538
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
@@ -0,0 +1,44 @@
+From 53838682570135b753fa622dfcde111528563c2d Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 16 Jun 2023 12:28:47 +0200
+Subject: [PATCH] CVE-2022-2127: ntlm_auth: cap lanman response length value
+
+We already copy at most sizeof(request.data.auth_crap.lm_resp) bytes to the
+lm_resp buffer, but we don't cap the length indicator.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=15072
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+CVE: CVE-2022-2127
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/53838682570135b753fa622dfcde111528563c2d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/utils/ntlm_auth.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/source3/utils/ntlm_auth.c b/source3/utils/ntlm_auth.c
+index 02a2379..c82ea45 100644
+--- a/source3/utils/ntlm_auth.c
++++ b/source3/utils/ntlm_auth.c
+@@ -574,10 +574,14 @@ NTSTATUS contact_winbind_auth_crap(const char *username,
+	memcpy(request.data.auth_crap.chal, challenge->data, MIN(challenge->length, 8));
+
+	if (lm_response && lm_response->length) {
++		size_t capped_lm_response_len = MIN(
++			lm_response->length,
++			sizeof(request.data.auth_crap.lm_resp));
++
+		memcpy(request.data.auth_crap.lm_resp,
+		       lm_response->data,
+-		       MIN(lm_response->length, sizeof(request.data.auth_crap.lm_resp)));
+-		request.data.auth_crap.lm_resp_len = lm_response->length;
++		       capped_lm_response_len);
++		request.data.auth_crap.lm_resp_len = capped_lm_response_len;
+	}
+
+	if (nt_response && nt_response->length) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 11b6ade40..b71c4b3fc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -35,6 +35,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2021-44758.patch;patchdir=source4/heimdal \
            file://CVE-2023-34966_0001.patch \
            file://CVE-2023-34966_0002.patch \
+           file://CVE-2022-2127.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.40.0


