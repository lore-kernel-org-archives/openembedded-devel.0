Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C348C54E60
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 11:44:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6540.1710243882266304107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 04:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jQeodK8x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3801dd7d66=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C70ThC026658
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 04:44:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=mEoEB
	UCzoKE4YVNCpLYFez331RcrUfPCixPQZ5ufgi0=; b=jQeodK8xJxVJ2gv1UKngI
	jXThrfHwgFyghHP7YYapef3R9xSaARcjVzc9pqWAz/r5oXE89ygjyeydI27FAGZl
	ljg7i6g1SPsP8XUbUQo3OKRpDKHwIxtm6Mqntv4F4N3lZrke5rR5g5px6uTgyFsZ
	SNxg5WrkWavz+a6HMaPemrJLzvD2vMAIzeaQNcul+vwjDNA17X/4lIb/mc/zCmVm
	7wO9lRbiqzIXwOKU6D9F7yaUjKnKL3MIT/sVy11e8li8NCeUmVoPV2u/ezxZCmxE
	zYRNHycsOPQWe7PsMhai2wlWqsEJzeZPC28JN6mqDwQg7oPZp1crAz+Cgz3DLcuB
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrkx4afk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 04:44:41 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 04:44:39 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] c-ares: fix CVE-2024-25629
Date: Tue, 12 Mar 2024 11:44:23 +0000
Message-ID: <20240312114423.2555939-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: VWaS-XSlB-v5BRTXy1MVNqc74DJYaxRm
X-Proofpoint-ORIG-GUID: VWaS-XSlB-v5BRTXy1MVNqc74DJYaxRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 11:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109276

From: Yogita Urade <yogita.urade@windriver.com>

c-ares is a C library for asynchronous DNS requests.
`ares__read_line()` is used to parse local configuration
files such as `/etc/resolv.conf`, `/etc/nsswitch.conf`,
the `HOSTALIASES` file, and if using a c-ares version
prior to 1.27.0, the `/etc/hosts` file. If any of these
configuration files has an embedded `NULL` character as
the first character in a new line, it can lead to
attempting to read memory prior to the start of the given
buffer which may result in a crash. This issue is fixed
in c-ares 1.27.0. No known workarounds exist.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-25629
https://github.com/c-ares/c-ares/security/advisories/GHSA-mg26-v6qh-x48q
https://security-tracker.debian.org/tracker/CVE-2024-25629

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../c-ares/c-ares/CVE-2024-25629.patch        | 34 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
new file mode 100644
index 0000000000..4c97eda3c7
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
@@ -0,0 +1,34 @@
+From: a804c04ddc8245fc8adf0e92368709639125e183 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 11 Mar 2024 14:29:39 +0000
+Subject: [PATCH] Merge pull request from GHSA-mg26-v6qh-x48q
+
+CVE: CVE-2024-25629
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/a804c04ddc8245fc8adf0e92368709639125e183]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/lib/ares__read_line.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lib/ares__read_line.c b/src/lib/ares__read_line.c
+index c62ad2a..d6625a3 100644
+--- a/src/lib/ares__read_line.c
++++ b/src/lib/ares__read_line.c
+@@ -49,6 +49,14 @@ int ares__read_line(FILE *fp, char **buf, size_t *bufsize)
+       if (!fgets(*buf + offset, bytestoread, fp))
+         return (offset != 0) ? 0 : (ferror(fp)) ? ARES_EFILE : ARES_EOF;
+       len = offset + strlen(*buf + offset);
++
++      /* Probably means there was an embedded NULL as the first character in
++       * the line, throw away line */
++      if (len == 0) {
++        offset = 0;
++        continue;
++      }
++
+       if ((*buf)[len - 1] == '\n')
+         {
+           (*buf)[len - 1] = 0;
+--
+2.40.0
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index b6cdd801e5..838046146f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
            file://CVE-2023-31130.patch \
            file://CVE-2023-32067.patch \
            file://CVE-2023-31147.patch \
+           file://CVE-2024-25629.patch \
           "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
-- 
2.40.0


