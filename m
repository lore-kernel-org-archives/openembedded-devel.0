Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D13CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:20:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12567.1758874801806453870
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lD/Xfe81;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6DArw1238173
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1oldRp/jApuZNzERyCjeIjdjc8JId/s27AlMDKcWc0w=; b=lD/Xfe81kO2/
	+4eWE8mWmKaM6QJiieOTpGCB4uDbWQeztfIJYJyGVlLdcyCzRgvSakxarfj+c3mB
	ad2ZZYOfm4WrmfUfBWsu5pFoxKJ6s/4hjdms0DumjGpieQmD0AGVSMyeWitnQWTc
	mhvB3mr69dNGPLSdQ9VZ0we7rssAQZSRAwZPTuP+IkCh0IN6w7BjNRnzj3Xrxny8
	2gkQLzznAUBvRcGQG6WSASsQa+CDknHcW1xzQFHrsw/9g2xrnyTJ40DrvajxGAwM
	aEwNOC8R4mnByHEug804FxEmESggZlbzYAwBFDVRUfmSbx8j0WMiY/1GHSy1GU60
	+X7PWYXqAg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8j74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:19:19 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:19:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v4 5/6] python3-pandas: fix reproducibility issue
Date: Fri, 26 Sep 2025 16:19:13 +0800
Message-ID: <20250926081914.3127272-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081914.3127272-1-hongxu.jia@windriver.com>
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NiBTYWx0ZWRfXyanqJfsGAT5c
 /Co4w8Hx4ygHLXoVQn9hSBuVbgid/6Hp74dQILQc0/Cd2McLKdCIIgduJmmmu5YA7whRWr2CGnk
 fdlycUtXTjAnlj0GmxDq4O2H++8C63c1wbpqYvE4FaCHI0f0Le1W66DkhWH2649U7JJYnklFRd4
 6evlH7Evp8BEM/XoSG0LnpYC/ikhGtqNleP3E5pbjcN7/gNKDJceeA9vK1nE1Nimiw3rA3fQXGi
 A8ze64cpCHvefdiz+IXH2E5/1ENZQuZWStSBEk2QsTKsxSpWdsrhtlVziaNbUd4fugpB6SFLssZ
 OjlxM5x+T5eIB08NsAXFJDu0YUrhZvFYqvqLSvErWgibsFaYBdY3DzrOH7smGFitk5/TPqI+ssm
 22VM2QQUM7Oc/o9E9cAFWLkXUyfBqA==
X-Proofpoint-ORIG-GUID: pq0p0AeS_KMy977Ck6Oul_efw5IvbBO3
X-Proofpoint-GUID: pq0p0AeS_KMy977Ck6Oul_efw5IvbBO3
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d64cb0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zIdP9HlweL3MVMreXwYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119904

The type of new_value is either `npy_timedelta' or `int64_t'
In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
..
npy_timedelta __pyx_v_new_value;
...

In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
...
__pyx_t_5numpy_int64_t __pyx_v_new_value;
...

Explicitly define it as int64_t to assure the generated source is
reproducibility between builds

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-reproducibility-issue.patch      | 43 +++++++++++++++++++
 .../python/python3-pandas_2.2.3.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch
new file mode 100644
index 0000000000..deadacafa9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch
@@ -0,0 +1,43 @@
+From 80274cd3a0746ddc5421643dd40d47bdf3c6a68c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 26 Sep 2025 15:47:53 +0800
+Subject: [PATCH] fix reproducibility issue
+
+The type of new_value is either `npy_timedelta' or `int64_t'
+In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
+..
+npy_timedelta __pyx_v_new_value;
+...
+
+In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
+...
+__pyx_t_5numpy_int64_t __pyx_v_new_value;
+...
+
+Explicitly define it as int64_t to assure the generated source is
+reproducibility between builds
+
+Upstream-Status: Submitted [https://github.com/pandas-dev/pandas/pull/62459]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pandas/_libs/tslibs/timedeltas.pyx | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/pandas/_libs/tslibs/timedeltas.pyx b/pandas/_libs/tslibs/timedeltas.pyx
+index f6c69cf..34ac9e7 100644
+--- a/pandas/_libs/tslibs/timedeltas.pyx
++++ b/pandas/_libs/tslibs/timedeltas.pyx
+@@ -1820,6 +1820,9 @@ class Timedelta(_Timedelta):
+ 
+         disallow_ambiguous_unit(unit)
+ 
++        cdef:
++            int64_t new_value;
++
+         # GH 30543 if pd.Timedelta already passed, return it
+         # check that only value is passed
+         if isinstance(value, _Timedelta):
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index f1df026c5c..60cc01800f 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
 SRC_URI += " \
             file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
+            file://0001-fix-reproducibility-issue.patch \
             "
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
-- 
2.34.1


