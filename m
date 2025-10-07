Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081B7CCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 04:46:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11674.1759812374825981232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 21:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GqtA9VTe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2375c254ad=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5974OfTo2789196
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Oct 2025 21:46:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=IWQ2lW/sLilrSLgVg7yk
	2xwgmGXHk4hl+b0nOuoWzcc=; b=GqtA9VTenMAC7uX/MAdRI/k5OBHbniNHlcfD
	ZE5QjYxDL2P9bLthF3E2UsifKKzkvBS48WCdm7RnsEwrK+egZaIioLVd+OgYUjiY
	2KK3jLQptDPDHLCiTlEZum/ER3dFtVev9t+bpk+FCdSFPn9VTLQBiIfbyRI93PiQ
	stLEeiLlY/1/FFV64rNDrXrSl76jBGYc5p99QBzCUxmQBnBzyn0/aQklhDG7uQTH
	VD6ndG/PoBw6XWAzT7YllL70UoqOu+Fuy77UMrDh/MDC2KR1UmP67Jph/4oNE1Id
	SOqFO8HkPt2BSq8a0Gu3jYAwrWdYeoEhxVdG+01jnmibtOodUA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jxuwjc4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 21:46:14 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 6 Oct 2025 21:46:13 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 6 Oct 2025 21:46:12 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/2] python3-django: Upgrade 5.2 -> 5.2.6
Date: Tue, 7 Oct 2025 10:16:07 +0530
Message-ID: <20251007044608.1006175-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UMLQ3Sfy c=1 sm=1 tr=0 ts=68e49b16 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=ArP49Si0AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=lWX2f3XPAAAA:8 a=RcF1hM59ZU10_DxtF3gA:9 a=glZLBWN_5F3qvmUqPDV8:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=JNcmbD5CRP_GvhbQn_Yr:22
X-Proofpoint-ORIG-GUID: qEm39_mBIG89-3PUGez4XHD3F-dFv1Ri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDAzNSBTYWx0ZWRfXwMEGlrjY+qsy
 Hkh1gSNcTlv6c4/i/Qi9S6gboz1T4gPYi5EGV6golAxkD2n5ic/gT/nIZPQ83HheujMTEm9awSb
 rNwOe61It8g71L4ilh6PWOjOgzVvyekEr8W4TnsDyxOKcpra6NY0FYTay9BLFG5gxGF2dnarcRT
 godshEIkZwa72zK6jlm5QLvZzc9tC2Tq0VNjvWmiMTde+BHH+spZwhE4360je3bJHv1nLXRfn3O
 6jkp3Hmufx9vAvsQQOLiMYxGfSU+XWK8yIKzIdzskrthpXqVp4Hqh+qb4D/qga4ljgrwoyy15CM
 lVnQSE6V3Dyxx3GCkwMIKX1PPi7ffQVp1q9ivRWbZ1oJ6i+6ys6eTUE2nRSFSe6IsKowRnwINfq
 HJCSneof4nfCqoRKfD/b4HALKqHEvg==
X-Proofpoint-GUID: qEm39_mBIG89-3PUGez4XHD3F-dFv1Ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510070035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120317

From: Soumya Sambu <soumya.sambu@windriver.com>

Release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.6/
https://docs.djangoproject.com/en/5.2/releases/5.2.5/
https://docs.djangoproject.com/en/5.2/releases/5.2.4/
https://docs.djangoproject.com/en/5.2/releases/5.2.3/
https://docs.djangoproject.com/en/5.2/releases/5.2.2/
https://docs.djangoproject.com/en/5.2/releases/5.2.1/

Drop patch 0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch:
already present in the upgraded version.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python/python3-django.inc                 |  2 +-
 ...ated-setuptools-to-normalize-package.patch | 27 -------------------
 .../python/python3-django_5.2.6.bb            |  9 +++++++
 .../python/python3-django_5.2.bb              | 13 ---------
 4 files changed, 10 insertions(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.6.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index cde32be477..c6475d2079 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-PYPI_PACKAGE = "Django"
+PYPI_PACKAGE = "django"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
deleted file mode 100644
index 4e28f59d8a..0000000000
--- a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3ae049b26b995c650c41ef918d5f60beed52b4ba Mon Sep 17 00:00:00 2001
-From: Nick Pope <nick@nickpope.me.uk>
-Date: Fri, 6 Dec 2024 18:32:39 +0000
-Subject: [PATCH] Fixed #35980 -- Updated setuptools to normalize package names
- in built artifacts.
-
-Upstream-Status: Backport [https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index f10d15d20d..b9e82334cd 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=61.0.0,<69.3.0"]
-+requires = ["setuptools>=75.8.1"]
- build-backend = "setuptools.build_meta"
- 
- [project]
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.6.bb b/meta-python/recipes-devtools/python/python3-django_5.2.6.bb
new file mode 100644
index 0000000000..644d825705
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.6.bb
@@ -0,0 +1,9 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b"
+
+RDEPENDS:${PN} += "\
+    python3-sqlparse \
+    python3-asgiref \
+"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.bb b/meta-python/recipes-devtools/python/python3-django_5.2.bb
deleted file mode 100644
index 8a20448e22..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "1a47f7a7a3d43ce64570d350e008d2949abe8c7e21737b351b6a1611277c6d89"
-
-SRC_URI += "\
-           file://0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch \
-"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"
-- 
2.40.0


