Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E1CCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:11:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12469.1758874271762209012
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E20IprEA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q69rT11767034
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1oldRp/jApuZNzERyCjeIjdjc8JId/s27AlMDKcWc0w=; b=E20IprEAFaw7
	RFXWSqtCVWaNcNAC0h2h1SfDxsU2FLFa01IFQTfj0dnPJfZYn90dUnlkU6MIaeCG
	6nJRYJuTdMCHtJu6x4XFkDqfFaBua/pM74bwlYpkISshomrpRefDNbMAHdvQQp3r
	kphrBlIqG7mXxfSzW88EY++ZDXDy+0/Zoq0H//aRaqLo8ubr8JMz9sKDcuy59TT7
	IwgJj8kWeUaa2VzWXeEEgk5mvMVWO9kOKRXBmTt/4GWGAjoWhxKfzq1s28HZ+YQM
	cJRqlI7juAyCixqUn5HP39ENV2Di52nkYyt+jkaUcb2uRHXTuE1XMGUQ9DwTMAWW
	qL/dW7iRdw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8j1h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:10:28 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:10:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/3] python3-pandas: fix reproducibility issue
Date: Fri, 26 Sep 2025 16:10:25 +0800
Message-ID: <20250926081026.3104475-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081026.3104475-1-hongxu.jia@windriver.com>
References: <20250926081026.3104475-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ni3aKG-UdFEqbwfeQRniQGoksanXTHZq
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d64a9e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zIdP9HlweL3MVMreXwYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ni3aKG-UdFEqbwfeQRniQGoksanXTHZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NCBTYWx0ZWRfX/jZuTBrZxyld
 TAvNtAwC5z5IanFzpxF1oaKYPhwRtnkBfTHvdLiXTt/JvreIBxUkBQgZBdxsCDeQgV2xKfIiz4h
 WjzROMGYo9m6xjEH8bdlmijy25Im2btg4Z094ZeZhqGyNzBZcnhDiWOBKw0wIlul5UvfIEZL2yz
 E/KVMnDll9BjspOYFqwj/vNI8Im8Cbo8GqDh0T/kZQT3a8s311xL/5M5fSJsrv7a8BdvOF+l/Jp
 3Y3SlziAjEXkElkiNleYvoeaSbFD4sBKpCCvFIY4py05U21bNP9sIWmp4WPgW9G2/UwoqgMI3qZ
 MLLACccY0ZZNs+UKPbeofwiFRdya+DJS5dcUQ7N9SspIZ9ufcJyTdYRwQiTTM1RiasD+sPpm+6s
 Dofhq4VxdmV6AJJ3G/1FMy0OE5YceA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119896

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


