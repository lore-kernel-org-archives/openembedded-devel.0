Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E05CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 16:02:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12381.1760112118569216888
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 09:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MXH+ylt9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237833f9bd=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59AC0Hnx2643578
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 16:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zz8++n/33tNKSnj83gZV
	qfKci9DGDMn+vX2FnKXIEec=; b=MXH+ylt9K0R3/G7pvvkVkGLZ44phFrsdBAaX
	IQywRMMoaiy6drb60PnyNFhPkKqlV5vPBQgW1eviWLRDOYAgQa6C/kr5PdgiQZFp
	EG8FFS7txcFz0spRi5nuDXUpFv38z3+QZKS+yIy66P63rZC/KzLNMNKmAS8uINW2
	py03endBuxKD+CUQEJLw8tPtJWwnyQjSEo58PkJ7JDLRs4V12zPmoNejdipgL956
	DjUvtPELWCHA3UhFMUMGJhsWQGGc7fDJxyQLvn2rEswnDlQOqtUK94H+ZPvMwSDk
	62abNq0k+lvKIVB/rc675vO5gzeKtf+bVd+EzZoOz+YE59257w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37tbx2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 16:01:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 09:01:50 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 09:01:49 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] iniparser: Fix CVE-2025-0633
Date: Fri, 10 Oct 2025 21:31:45 +0530
Message-ID: <20251010160145.3480964-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e92df5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=6REjHfDHAAAA:8 a=NEAV23lmAAAA:8
 a=iI-VeWDlIyAZzZgNlSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=YgGNCU-cUY5RZCWjKzqT:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: rBYPbMH-CLmCvzcefHmlY9HEGwlpPAkF
X-Proofpoint-GUID: rBYPbMH-CLmCvzcefHmlY9HEGwlpPAkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA5MiBTYWx0ZWRfX8hTiP7tCaAVH
 RCBK71833QcHINa/wVZTcgK4dbYcE7wbhiVjten8IHBcJOqq0ZF50cdZoxOzGAzwV7x11E5dPcI
 KFfHWAu/H4FzXOfU1Nk5oml5dN3Ifwoj5H4d9UAMNpiMyLZlBxN8mHnmYOj0aSsBm7CESaOoquN
 P0X2HfhjsmkWkhBaXZXJUp+ZecTIfPpRHFW35wLZw/C3aJqbV8mlrgk8+OJrfVpuWn2tACVkWbt
 r9K/ml1bAeBl7RQU4yqKGBm349+mCbhbIMduhiUpWpDstzV0KM0eLngqX9c1WX9eqFQa7iNgpOm
 Jn7csyQi5E3YwV3dKUFgvNf2oSipfDVjZz3CUsUQdfoK6JruzwzQ8d9II+kWTcgGbgU2TRnAr/1
 /737CvThr8fMfeOtfmdYxOsWj2j2BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59AC0Hnx2643578
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120481

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap-based Buffer Overflow vulnerability in iniparser_dumpsection_ini() i=
n iniparser
allows attacker to read out of bound memory

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-0633
https://security-tracker.debian.org/tracker/CVE-2025-0633

Upstream patch:
https://gitlab.com/iniparser/iniparser/-/commit/072a39a772a38c475e35a1be3=
11304ca99e9de7f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iniparser/iniparser/CVE-2025-0633.patch   | 38 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2025-=
0633.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.pa=
tch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
new file mode 100644
index 0000000000..acf744049b
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
@@ -0,0 +1,38 @@
+From 072a39a772a38c475e35a1be311304ca99e9de7f Mon Sep 17 00:00:00 2001
+From: Lars M=C3=B6llendorf <lars@moellendorf.eu>
+Date: Sun, 26 Jan 2025 08:48:23 +0100
+Subject: [PATCH] Fix heap overflow in `iniparser_dumpsection_ini()`
+
+...reported in #177
+
+As suggested by the issue reporter this is fixed by returning from
+`iniparser_dumpsection_ini()` in case the length of the passed section n=
ame
+of dictionary to dump was bigger than the size of the internal buffer us=
ed
+to copy this string to.
+
+Changelog: changed
+
+CVE: CVE-2025-0633
+
+Upstream-Status: Backport [https://gitlab.com/iniparser/iniparser/-/comm=
it/072a39a772a38c475e35a1be311304ca99e9de7f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/iniparser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/iniparser.c b/src/iniparser.c
+index dbceb20..2aeecf4 100644
+--- a/src/iniparser.c
++++ b/src/iniparser.c
+@@ -301,6 +301,7 @@ void iniparser_dumpsection_ini(const dictionary * d,=
 const char * s, FILE * f)
+=20
+     if (d=3D=3DNULL || f=3D=3DNULL) return ;
+     if (! iniparser_find_entry(d, s)) return ;
++    if (strlen(s) > sizeof(keym)) return;
+=20
+     seclen  =3D (int)strlen(s);
+     fprintf(f, "\n[%s]\n", s);
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe=
/recipes-support/iniparser/iniparser_4.1.bb
index 7c23b514bd..9d433047a9 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/ndevilla/iniparser.git;pr=
otocol=3Dhttps;branch=3Dmaster
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
 	   file://Add-CMake-support.patch \
            file://CVE-2023-33461.patch \
+           file://CVE-2025-0633.patch \
 "
=20
 SRCREV=3D "deb85ad4936d4ca32cc2260ce43323d47936410d"
--=20
2.40.0


