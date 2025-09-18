Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268EECAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:16:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8000.1758179754026129797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vh78TiIK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13563ce15f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5pIo03550499
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 00:15:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wjblS+x03jqwaELBmNIA1ZiYBoCtL5WZRyBtx4gUNVc=; b=Vh78TiIKl080
	7sOAA5oKutRYF1Jp7KhpB/QL6cnkiCnbiXWkGjAW34gOkS7Y/TJEZT6RyqA9dZut
	v8Sbrd63qVi6XuSk1V+7jlcIVUzRtAs1RIwoVyR8QFNT6T9/3uL+T6DyOLm8md84
	QCckWxPMvTs2EDUymM8W/IaEHWKiToHeQtunk5DVWKIXRFa+ZsmZ5lwy+XhEbWw4
	jsdQ5csspMCYKAH2yhOQMReb97Uha7TKgB7Bvnh+QXPTlnGcRPHotOZKNAemxmtJ
	K25Q1vGy3IdIsVkfjSbw7bJDr/X8edUh/rN3SWdK6n14X8gpy/SXYkhpWpe0J3Z/
	oOsTf53cxA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1qjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 00:15:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 00:15:53 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 00:15:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 4/4] python3-yarl: support reproducible
Date: Thu, 18 Sep 2025 15:15:48 +0800
Message-ID: <20250918071548.3934769-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918071548.3934769-1-hongxu.jia@windriver.com>
References: <20250918071548.3934769-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: glyqlWAVRhxTfinaYq2qTryXrG0WfYDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA2NSBTYWx0ZWRfX5Pme50mDrKpO
 G+UDpKl45Kq0jIwvkr0h4CiWQMV6XsnLkoFjYZMzi6l0qHv8N5fS/8EvqHAZd1RRFaSwzhaRsFS
 No0uZMbfisvdYG77KABgHu4Yui6CQ1HRJeWuPazxt6LuO3ZAWMJ5QtlW4yPnXwMdINXSl3ZcRbf
 YrIHvB970BD4+/ebhLL/LDimzMhOcjH6Wsils94BNiFxeW4QlQDQa+pYDKeToVPxsJ0RuuwwVsN
 6b972U0T6O0QEJzj8HqKObQoh2ZVTLz2Ya3cKDnzuIeQrlB341gLr84xMn5NO5dshGgR3JAqo8B
 IdRGhTzMSnWVSez9nM+54MkujjjnqkxWv6Cupg5EqPbfB9s4ozVcDH8ihFcqA0=
X-Authority-Analysis: v=2.4 cv=WvsrMcfv c=1 sm=1 tr=0 ts=68cbb1a9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=mL1YNQHE8x6IF4yIovkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: glyqlWAVRhxTfinaYq2qTryXrG0WfYDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119532

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

Note: To support reproducible, it also requires oe-core commit [1] to be merged

[1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D3&d=3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
index bbf9e3d782..6eedcf0f82 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
@@ -9,6 +9,10 @@ PYPI_PACKAGE = "yarl"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta cython
 
+SRC_URI += " \
+    file://0001-build-wheel-in-place.patch \
+"
+
 DEPENDS += " \
     python3-expandvars-native \
 "
-- 
2.34.1


