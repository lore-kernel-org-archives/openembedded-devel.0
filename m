Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80464CD1283
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:16:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31607.1711523801606348514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Df5ZsmnV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3816ddbad4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R6ffnR002188
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=0/F44bCKCO3Dib+Yh7vt/TrMs6LdF1TVvXat7eUpOoY=; b=
	Df5ZsmnV0iujPYZnEtw16laR0mTnu8KW78HXV5hnQGFUttDQ7SD9MNx7cVPw06qF
	xgi8LzHzPs0LEmKx5iQmTLWJVV2s4RYARzOS37yLCjFQb9S1IquGSXiJX4tebAUF
	zGI1Y1y2VNtaFpD1ueKxjJxMaTgD0AGkCk6++h6Mnr2KBwffVN0Yhs8j1g6YkEyl
	N6KxZOvsfl7tNdGSFwXiuTe8FMPqxHYzh71YApg7cnhzPMSMSCpZTjq3M28p8b1q
	8J3+0elYLl/NxSL5sM0tJmgGx+Wq2sogD3Ap0BveqzNV+ydr41I1n2wEBgn8d0cD
	bhe9ucjCAOqJFojs4t/I4Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26mvpa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 00:16:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 27 Mar 2024 00:16:39 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 3/3] python3-pyyaml-include: Upgrade 1.3.2 -> 1.4.1
Date: Wed, 27 Mar 2024 15:16:36 +0800
Message-ID: <20240327071636.2207445-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327071636.2207445-1-mingli.yu@windriver.com>
References: <20240327071636.2207445-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QSM7PLhroXYZYWiHU-lk3bsHZhhNzjMC
X-Proofpoint-GUID: QSM7PLhroXYZYWiHU-lk3bsHZhhNzjMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109638

From: Mingli Yu <mingli.yu@windriver.com>

* Upgrade to 1.4.1 to make it work with setuptools 59.x as it doesn't
support pep 621 [1], so remove pyproject.toml and add setup.cfg back [2].

* Add python3-toml to RDEPENDS to fix below error:
 self = <yamlinclude.readers.TomlReader object at 0x7faceccdbd30>

     def __call__(self):
         if sys.version_info >= (3, 11):
             with open(self._path, "rb") as fp:
                 return tomllib.load(fp)
         else:
             try:
                 import toml
             except ImportError as err:  # pragma: no cover
 >               raise ImportError(f'Un-supported file "{self._path}".\n`pip install toml` should solve the problem.\n\n{err}')
 E               ImportError: Un-supported file "tests/data/include.d/1.toml".
 E               `pip install toml` should solve the problem.
 E
 E               No module named 'toml'

 ../../python3.10/site-packages/yamlinclude/readers.py:69: ImportError

[1] https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html
[2] https://github.com/tanbro/pyyaml-include/issues/43

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...aml-include_1.3.2.bb => python3-pyyaml-include_1.4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml-include_1.3.2.bb => python3-pyyaml-include_1.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
index 3a5bd99a7..6768e959f 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
@@ -2,11 +2,10 @@ SUMMARY = "Extending PyYAML with a custom constructor for including YAML files w
 HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS += "python3-setuptools-scm-native"
-SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
+SRCREV = "0f86bf16343d2ad52b53b793e0b35bb7ed7cd85b"
 
 SRC_URI = " \
-            git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
+            git://github.com/tanbro/pyyaml-include;protocol=https;branch=1.x \
             file://run-ptest \
           "
 
@@ -21,6 +20,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN} += " \
     python3-pyyaml \
+    python3-toml \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-- 
2.25.1


