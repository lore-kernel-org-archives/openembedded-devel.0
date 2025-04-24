Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C64C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 04:53:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7568.1745470428936561253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 21:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6209b1bf77=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O4oZK3001436
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 21:53:48 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhd1s0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 21:53:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 23 Apr 2025 21:53:47 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 23 Apr 2025 21:53:45 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] iniparser: Fix CVE-2025-0633
Date: Thu, 24 Apr 2025 04:53:41 +0000
Message-ID: <20250424045341.919932-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ZNDXmW7b c=1 sm=1 tr=0 ts=6809c3dc cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=6REjHfDHAAAA:8
 a=NEAV23lmAAAA:8 a=d1eiSLCphkrrlIFttSAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=YgGNCU-cUY5RZCWjKzqT:22
X-Proofpoint-ORIG-GUID: 9uLjCMlIGJlw0Rxj5gQRo26VnZq71cZY
X-Proofpoint-GUID: 9uLjCMlIGJlw0Rxj5gQRo26VnZq71cZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyOCBTYWx0ZWRfXwBhIBtRhw004 Pdih6ZulnpKXjUdgJVzNQbBsLWDulG7in5sj801617nivSJ0fWzTx7806+mz0uCWO0q5qGKJEaD 00FLU0WDNiDNPEs98bn6Qx4pWiIyFahxghcUEDFEK8wxGgnaVtoCyvvB3ukFYSGrleUBObCi3he
 Jl56tjKYlpqSoj95KENHJZ27ZnPz81t4AVSRcZCiXM29fRNN6zMcYNRrtfGj9pnZzdUg3C3JfNt uYlRmG/k10CasVCrOD9VYre76fnvSltATI6A+4YAYzRKIKw9nDsDZ1BO6TDE387xD5Ru2wIHMHs DkMrHdG7W3R9NNaWLyZkByzBw/n/P/YhjVUMJewJ8LaReWnDFeVLmg+IRrIhcVSTHsPxRXj2Uan
 5KceNiHyccEerYFOv9D66EQVZLDkqSdQO07A7t9VwtrLdYM02IxunmBtpBYgDXMEMTs846UF
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53O4oZK3001436
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 04:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117086

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap-based Buffer Overflow vulnerability in iniparser_dumpsection_ini() i=
n
iniparser allows attacker to read out of bound memory

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-0633
https://ubuntu.com/security/CVE-2025-0633

Upstream patch:
https://gitlab.com/iniparser/iniparser/-/commit/072a39a772a38c475e35a1be3=
11304ca99e9de7f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iniparser/iniparser/CVE-2025-0633.patch   | 37 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2025-=
0633.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.pa=
tch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
new file mode 100644
index 0000000000..a9d2a19b2c
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
@@ -0,0 +1,37 @@
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
+
+     if (d=3D=3DNULL || f=3D=3DNULL) return ;
+     if (! iniparser_find_entry(d, s)) return ;
++    if (strlen(s) > sizeof(keym)) return;
+
+     seclen  =3D (int)strlen(s);
+     fprintf(f, "\n[%s]\n", s);
+--
+2.40.0
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe=
/recipes-support/iniparser/iniparser_4.1.bb
index c80668d279..13a3a1f979 100644
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


