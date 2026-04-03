Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AD8D730AC
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 06:54:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4841.1775189933324401086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 21:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sC8TcQMx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8553de6577=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6333Ksox1866140
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 20:38:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ONm567I4niMc6s0YmQPr
	VMLH+QBTTLzDRd6OUqVqPEc=; b=sC8TcQMxdD7n2AQrrdx4BeYG6G5jCsDrgVV9
	DuhplUh9cBfQHdi2QwbeqsO3+1Yz5nGmLPHqJ0DY9GJAclgePYBfYcku4B/7koLX
	IyQUy0akWBBoLPCu5z2Prmqc5merNJQOsqC+uKhTf76DPdN/g/51gmn67tW7sCY+
	huFQH6pbzUC4jqbgrgNyXR21v9xspwCUH72QQdGBQ3k/BzuP+dWew/t6DY6VWtc3
	riiQa5/5TJUvTipWnwjKhD0+Ib294/LjShq7opD3V0PHeH0YCVp1UK3F7iegmvto
	C7rPtah8end8eqMr/9QaGvYpMQXwv95L59WGI9NQsFgLTk87fg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vgnny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 20:38:42 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 2 Apr 2026 20:38:41 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 2 Apr 2026 20:38:41 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-stopit: Fixed the deprecated pkg_resources issue
Date: Fri, 3 Apr 2026 03:38:41 +0000
Message-ID: <20260403033841.2186031-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-GUID: SlmbueXQX_jN6QsrzXKOp65aLP_AgJSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAyOSBTYWx0ZWRfX5RqVMYrYkHlG
 QBlPutUjUQu1f9NHd8CQEN2V6YauzV0Tzy44Rnzh1tFWsHnY+Enzv4hU/w/8TuNSiDTZ6Wzj1ID
 rPI/xVuPhqevO73VXLdkD1giLIoet8BbK5ZjAQKMLyK1PRvSK65JjRCF9kJhNlOT2XBpC8dvCv0
 Gxrb7B927KSMqH7gfS9bxnmM8T4xaS62Z4xNezT/Gfu2hHA+WZpeuT+JYJu3ovhg6EAMGRxMenT
 ulj3l0dFHMPT/tIww6LaNq3i1lsEnrEJNgHjs9XJVlImvHTxkK3jBD6crXmro4KjcdbMAqaljkQ
 HTcnq3atiUzMf/MM+hpTFSVr6ppOdqDJrABFUreHu2G6Ice5Vupsrp69KRwI5WEK4+E+6axhJIV
 4hPMg4luyFbJSHrkSMEhBz9/UgMBOR7/HEqRPfb+7uEayn6FvYNMiqXnWa5wLV5cYTz7GDjrLBu
 huhJMp0rMAd9qi7D+NA==
X-Proofpoint-ORIG-GUID: SlmbueXQX_jN6QsrzXKOp65aLP_AgJSs
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69cf3642 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=889ON5VdELLomIsbo-4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_01,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030029
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 06:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125971

From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>

pkg_resources is deprecated as an API. The pkg_resources package
has been removed from setuptools, so the way of obtaining the
version needs to be replaced with importlib.metadata module.

Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
---
 ...01-Drop-the-deprecated-pkg_resources.patch | 38 +++++++++++++++++++
 .../python/python3-stopit_1.1.2.bb            |  6 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch

diff --git a/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch
new file mode 100644
index 0000000000..4252386384
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-stopit/0001-Drop-the-deprecated-pkg_resources.patch
@@ -0,0 +1,38 @@
+From b72825c89724c2c3b4c9c60d90c9d4ad597eead0 Mon Sep 17 00:00:00 2001
+From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
+Date: Thu, 2 Apr 2026 08:40:26 +0000
+Subject: [PATCH] Drop the deprecated pkg_resources
+
+pkg_resources is deprecated as an API. The pkg_resources package
+is slated for removal, so the way of obtaining the version needs
+to be updated.
+
+Upstream-Status: Inactive-Upstream [lastcommit: Jan/2024 lastrelease: Feb/2018]
+
+Signed-off-by: Bai, Haiqing <Haiqing.Bai@windriver.com>
+---
+ src/stopit/__init__.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/stopit/__init__.py b/src/stopit/__init__.py
+index 6ca0180..5ddfa4a 100644
+--- a/src/stopit/__init__.py
++++ b/src/stopit/__init__.py
+@@ -7,7 +7,7 @@ stopit
+ Public resources from ``stopit``
+ """
+ 
+-import pkg_resources
++from importlib.metadata import version
+ 
+ from .utils import LOG, TimeoutException
+ from .threadstop import ThreadingTimeout, async_raise, threading_timeoutable
+@@ -15,7 +15,7 @@ from .signalstop import SignalTimeout, signal_timeoutable
+ 
+ # PEP 396 style version marker
+ try:
+-    __version__ = pkg_resources.get_distribution(__name__).version
++    __version__ = version(__name__)
+ except:
+     LOG.warning("Could not get the package version from pkg_resources")
+     __version__ = 'unknown'
diff --git a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
index a952722619..a83adffcd2 100644
--- a/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stopit_1.1.2.bb
@@ -2,7 +2,6 @@ SUMMARY = "Raise asynchronous exceptions in other threads, control the timeout o
 HOMEPAGE = "https://pypi.org/project/stopit/"
 SECTION = "devel/python"
 
-SRC_URI += " file://LICENSE "
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/LICENSE;md5=497c556f42b1355b64190da2f3d88f93"
 
@@ -10,6 +9,11 @@ SRC_URI[sha256sum] = "f7f39c583fd92027bd9d06127b259aee7a5b7945c1f1fa56263811e1e7
 
 inherit pypi setuptools3
 
+SRC_URI += "\
+    file://LICENSE \
+    file://0001-Drop-the-deprecated-pkg_resources.patch \
+"
+
 RDEPENDS:${PN} += "\
     python3-setuptools \
     "
-- 
2.53.0


