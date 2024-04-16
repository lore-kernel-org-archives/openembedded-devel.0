Return-Path: <RahulJanani.Pandi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD88C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 10:41:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16923.1713264079072033624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 03:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oJQh2D9W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4836aeed74=rahuljanani.pandi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G5s6x8016109
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=BHf3q
	wlpaPU3RiHHqEJCgCtL0lJelMh2ozYpUfobzHQ=; b=oJQh2D9WgdxMk2vNSn1fh
	ZclOr1kj0TcetXWX90UIf6vaL0SF0tpig+oBbdB3VCQmEmSdAGDqm6EPmwHrAi0P
	lPE2pYz7R3snK17EoVU/XUkzC4jyRTAW1ZHN5XZtihuxlo7mEHMZWivrMPCsRLen
	J+Q3ptHPmfw7sVkh6jAn69J7veC8ww8qoA+W+UesPT1seZPk1dfzm9211DzJLmxu
	x80kj+rmoZEPMUeB5mYOuISW6ltFM1iMVfKe0a7b1rV6t8kj8HextQB0ftDGoeZ4
	wn1tlW77LW+YhKykXZcuawlBkE/0Bmatp68HT2seUCwlCvfnIy3t20uMGDyue5se
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8yaqr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:41:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 16 Apr 2024 03:41:16 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 16 Apr 2024 03:41:15 -0700
From: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-django: fix CVE-2024-24680
Date: Tue, 16 Apr 2024 10:40:54 +0000
Message-ID: <20240416104054.2336674-1-RahulJanani.Pandi@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UlhKL5lT8YbMB1IQdLBJbXktC8rH0XMb
X-Proofpoint-ORIG-GUID: UlhKL5lT8YbMB1IQdLBJbXktC8rH0XMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109972

An issue was discovered in Django 3.2 before 3.2.24, 4.2 before 4.2.10,
and Django 5.0 before 5.0.2. The intcomma template filter was subject
to a potential denial-of-service attack when used with very long strings.

Since, there is no ptest available for python3-django so have not
tested the patch changes at runtime.

References:
https://security-tracker.debian.org/tracker/CVE-2024-24680
https://docs.djangoproject.com/en/dev/releases/4.2.10/

Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
---
 .../python3-django/CVE-2024-24680.patch       | 48 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch
new file mode 100644
index 000000000..aec67453a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch
@@ -0,0 +1,48 @@
+From 572ea07e84b38ea8de0551f4b4eda685d91d09d2
+From: Adam Johnson <me@adamj.eu>
+Date: Mon Jan 22 13:21:13 2024 +0000
+Subject: [PATCH] Fixed CVE-2024-24680 -- Mitigated potential DoS in intcomma
+ template filter
+
+Thanks Seokchan Yoon for the report.
+
+Co-authored-by: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+Co-authored-by: Shai Berger <shai@platonix.com>
+
+CVE: CVE-2024-24680
+
+Upstream-Status: Backport [https://github.com/django/django/commit/572ea07e84b38ea8de0551f4b4eda685d91d09d2]
+
+Signed-off-by: Rahul Janani Pandi <RahulJanani.Pandi@windriver.com>
+---
+ django/contrib/humanize/templatetags/humanize.py | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/django/contrib/humanize/templatetags/humanize.py b/django/contrib/humanize/templatetags/humanize.py
+index 194c7e8..ee22a45 100644
+--- a/django/contrib/humanize/templatetags/humanize.py
++++ b/django/contrib/humanize/templatetags/humanize.py
+@@ -71,13 +71,14 @@ def intcomma(value, use_l10n=True):
+             return intcomma(value, False)
+         else:
+             return number_format(value, force_grouping=True)
+-    orig = str(value)
+-    new = re.sub(r"^(-?\d+)(\d{3})", r'\g<1>,\g<2>', orig)
+-    if orig == new:
+-        return new
+-    else:
+-        return intcomma(new, use_l10n)
+
++    result = str(value)
++    match = re.match(r"-?\d+", result)
++    if match:
++        prefix = match[0]
++        prefix_with_commas = re.sub(r"\d{3}", r"\g<0>,", prefix[::-1])[::-1]
++        result = prefix_with_commas + result[len(prefix) :]
++    return result
+
+ # A tuple of standard large number to their converters
+ intword_converters = (
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 8c955e6bd..cbd2c69c0 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2023-41164.patch \
             file://CVE-2023-43665.patch \
             file://CVE-2023-46695.patch \
+            file://CVE-2024-24680.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


