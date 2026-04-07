Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E051DFB5197
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 05:47:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71926.1775533292437921917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 20:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dzMKSEVU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8557271aef=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6371NwDf2477736
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2026 03:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ONm567I4niMc6s0YmQPr
	VMLH+QBTTLzDRd6OUqVqPEc=; b=dzMKSEVUWSGHpdE6kkGB/aGPGhF3HjiezlJX
	CYP6VASbgT3Xfqn8539bo2wLqm/9hutdnOtRoG/gzA1vDXRoGm3CmH57C350BCi+
	CMtODH9MT8zEkfyO58rGFgu5NU18nz6cZ2mc7j33fzcJg1+ykeS+qGH6u2CuX3w1
	WTShnCgzbENLGQLyc0wX0MjG3shpHSXInnr2i/y/fl0CoTuw8fCq5Mqey847p+Qc
	RUvETgzT5bzxK5LR2fXk2iC8/mXf+/Tdvw98QvtarhZPK1qISev3s0zxqvRHxlgz
	x+r0hK3drIPOglaSAh2xN/E+f/tClRWWgfeQ6LPeTg3pwr9g1g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqg72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 03:20:40 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 6 Apr 2026 20:20:38 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 6 Apr 2026 20:20:38 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [meta-python][PATCH v2 1/2] python3-stopit: Fixed the deprecated pkg_resources issue
Date: Tue, 7 Apr 2026 03:20:37 +0000
Message-ID: <20260407032038.1474520-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d47808 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=889ON5VdELLomIsbo-4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Rn1hcXEHdTt9uhxe_dZOrjEBimUNnAYA
X-Proofpoint-GUID: Rn1hcXEHdTt9uhxe_dZOrjEBimUNnAYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfX+j6DCkH2zQlI
 wpGbw2aR+y2imY9FrnSfxOg6fEQPTvxcbP2Y86d+3i4oQG3vYo8kdrVUP9qMFflaD5FnnKOKrJN
 i8e1Q+ZjaHm5lSo2Z0R3TwodVCdTa+gZrisElH+N1hIhYDjAHBUzwFDveX+qZ4azk1FTvRklBB3
 yt3TS1ZIh5xbAW8h4B/05/m9vmXPk1Sc8PHSY0S1N2GmP/sHBTuQq+bjlNlEZLtegQyc0qbrbAr
 E7KbQ5QbztNQcoLhZ8sh+37vAZzN5X4/YZ0/3aliuZf8uKRYfUlVbERk3Yx9SoO9hhUkf7c1cLm
 iCoRUkEop8BkxfkPloxqFqLOhNK9hJgTAPLC/bl3it+GjweYBWzUq2MeK88W7PhyZ/DbQbY0Cig
 9NrHsDk5jsFHx1zmFS2TENylSrYtpoJsTtv5GtlQOhQpkZL3Z2IrUW9H+bMeM5EPFPR+C2TbPAN
 ZwuemQS4izFBACh/Vag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 05:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126073

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


