Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772A5CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11786.1758870604953787188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l+MCrrAC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364797e57=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q59uxc1135257
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=F/MatDqsBF3GII4mkbjT
	JqaAXk7u2iHypjVV25jnDG0=; b=l+MCrrACxqe/2a9WRvujmDWmeQbBUrLH+Gq4
	3zIk4Fzc0al4sjficVRSTwIQUg6Eds6R97sMAc0ORMT0s5BFN6XkZXkcFDVHYI79
	nHtrdznUU5UJ1z+wkl8477hs9IO9XBuOu8l2rp52a3d7IMu0CptaFaLDbc6QZjNt
	CQSgdDc3W82Ng5QbivUEdo7lhU3Zxr6BvaKx2ksMEeoz1cdUBpD61AlaiCbV1O3q
	ezTzJNOv2kZju/wHle1Le8I4pRVUPlFZU425M2iC6KrxEtCbs287nyG9tMWsB+uR
	EwYg+Enx5h3ELle5CTc8tg13PIg0uN/qgqYYgyfFk0GjO2r+cg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8g63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:10:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 00:09:22 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 00:09:21 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap[PATCH 1/1] polkit: fix CVE-2025-7519
Date: Fri, 26 Sep 2025 12:39:55 +0530
Message-ID: <20250926070955.1049088-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA2NSBTYWx0ZWRfX3Fka9cCREay5
 Ab+kUFJGLSV2yRgXon41+wlo794VV/aV+fmpY/lmwfHekcMz6XxeUV5/XMfGh6nlfR7LgzyOycN
 b4FPX42PnP7vSwA52fwJ2E6Kk0+AWqtAA2WrCtunfsqlJOGzyfSJeYwX+lo1LB1p/682iTnte7r
 BiOtAUkZdvcmE5sHHX8NOfX2CCjENKCZVEbcQlmb39ptdEekIvBMva4UWwcUxCuA8b2D5GYu5g2
 FUCX+HVLd07ODAoKgmMBnWVNsJoFBCPMpHTrC9Wt/CQXHoZg/TSCXoZjIUSiiOju6pyxVNCiETM
 XfOn4iSJ8TZuAJKgpHQZWOFVNw95L0dzQOpnrWvcTC5WgKIGt5/6hLhWf3lI8dE0ouUXOF/lr9T
 XK/54M1K8HFomkmkn7ODOKXhR694nA==
X-Proofpoint-ORIG-GUID: xXxRD-3jT3ycNMUkYy9i5ekcpE4_P0_X
X-Proofpoint-GUID: xXxRD-3jT3ycNMUkYy9i5ekcpE4_P0_X
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d63c4b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=ThauUFfizAOFXK_lL9MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119893

From: Praveen Kumar <praveen.kumar@windriver.com>

A flaw was found in polkit. When processing an XML policy with 32 or
more nested elements in depth, an out-of-bounds write can be triggered.
This issue can lead to a crash or other unexpected behavior, and
arbitrary code execution is not discarded. To exploit this flaw, a
high-privilege account is needed as it's required to place the
malicious policy file properly.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-7519

Upstream-patch:
https://github.com/polkit-org/polkit/commit/107d3801361b9f9084f78710178e683391f1d245

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../polkit/files/CVE-2025-7519.patch          | 34 +++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_124.bb |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch

diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch b/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
new file mode 100644
index 0000000000..78945a88fc
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2025-7519.patch
@@ -0,0 +1,34 @@
+From 107d3801361b9f9084f78710178e683391f1d245 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Fri, 6 Jun 2025 13:25:55 +0200
+Subject: [PATCH] Nested .policy files cause xml parsing overflow leading to
+ crash
+
+CVE: CVE-2025-7519
+
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/107d3801361b9f9084f78710178e683391f1d245]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/polkitbackend/polkitbackendactionpool.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/polkitbackend/polkitbackendactionpool.c b/src/polkitbackend/polkitbackendactionpool.c
+index 43f89cb..f4acca9 100644
+--- a/src/polkitbackend/polkitbackendactionpool.c
++++ b/src/polkitbackend/polkitbackendactionpool.c
+@@ -739,6 +739,12 @@ _start (void *data, const char *el, const char **attr)
+   guint num_attr;
+   ParserData *pd = data;
+
++  if (pd->stack_depth < 0 || pd->stack_depth >= PARSER_MAX_DEPTH)
++    {
++      g_warning ("XML parsing reached max depth?");
++      goto error;
++    }
++
+   for (num_attr = 0; attr[num_attr] != NULL; num_attr++)
+     ;
+
+--
+2.40.0
diff --git a/meta-oe/recipes-extended/polkit/polkit_124.bb b/meta-oe/recipes-extended/polkit/polkit_124.bb
index a597b40ee3..3709aa0ef4 100644
--- a/meta-oe/recipes-extended/polkit/polkit_124.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_124.bb
@@ -5,7 +5,10 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
+SRC_URI = "\
+     git://github.com/polkit-org/polkit.git;protocol=https;branch=main \
+     file://CVE-2025-7519.patch \
+"
 
 S = "${WORKDIR}/git"
 SRCREV = "82f0924dc0eb23b9df68e88dbaf9e07c81940a5a"
-- 
2.40.0


