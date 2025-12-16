Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3DBD5C0C9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 02:57:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13127.1765853871512161047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 18:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dJm0dDXr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44458000e2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG0efYN2945651
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 18:57:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1ZX3EgK1309zHQ9C+krt
	QK9fRrO9Es5v3LUCjlhI9eA=; b=dJm0dDXrFhBCC3xMJdaKZoB1YTNLVnohnPxx
	g9qrQizgTl3yLgrYXbXI2BKWE4MdtMUV2CJRP+IMDAvg6oVsKY2KQrlWK+OOWclM
	aRP1Ny6t0QiNBsxgIDWORAsIFymUog8tNNuu0Brq2vDZntDzH+altlCOqVnYlG9c
	LjLZUUe2X5VGnSiEVyo4xFKp+Ds44cLSxPDSp2LKO8dk8RkQa2dcgQkt5OXAXqtX
	ZbIHdZ3z526VerQazXa/L9TMNhhg7cstZpE8FYKgmF9+scAJZe51jrhHe4CUg+2K
	KUl1Od9mv8UUPqYufwHrhyNQyr7/MXSWpyKp5d0DLXxD9qPZHw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b14a5jdkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 18:57:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 15 Dec 2025 18:57:50 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 15 Dec 2025 18:57:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] mbedtls: fix CVE-2025-47917
Date: Tue, 16 Dec 2025 10:57:44 +0800
Message-ID: <20251216025744.263522-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: WEWWh6D6uH7dljo7NA-7cZJgQRL_LQR5
X-Authority-Analysis: v=2.4 cv=bs5BxUai c=1 sm=1 tr=0 ts=6940caae cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=McYcvuQCY6QHsMojYNUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDAyNCBTYWx0ZWRfXwbFgzkjnpmxW
 b4wuDC3mcnWchb+Jh6oCQGdAAYgGetBVyY5luKLCTOnNgF1bweQqDEZ8csHV6j3DG9mTsVuiMCA
 9Srnza05RcdCJcRc7JsFZn0fEI0vZGNTSxFlm393QqsfEibI+ZcSYcmknmUnYNrht+WtE6tPD5y
 9X0yZsOX4947WBSFc9Vm/R/v1CXBU0KYuSjYoiUjyCxM/cx64rS4Tn7eFIGUoOqVgQzXjRRjXvA
 fbOUxp2CIG965rZ4prFC79zRKOiRrDfYCzvkZK+5MrQJ/oUrbD8vMk0B8BGhC2Nr29QZeXRgekn
 M5p08fv6HyMz1i89ErRAsYSrrCIsG6+0r0P+qV89/q4ExLnpws/heDZSZMQdnvTWW9oNEvkEbok
 QJgQHaorBYcT4zh4WVCuZEu+IVTpjQ==
X-Proofpoint-GUID: WEWWh6D6uH7dljo7NA-7cZJgQRL_LQR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BG0efYN2945651
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 02:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122675

From: Kai Kang <kai.kang@windriver.com>

CVE-2025-47917 is that the function mbedtls_x509_string_to_names() takes
a head argument and performs a deep free() on it.

Backport patch to fix CVE-2025-47917 and drop the modification in doc
file and comment in header file which lack of context.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mbedtls/mbedtls/CVE-2025-47917.patch      | 52 +++++++++++++++++++
 .../mbedtls/mbedtls_2.28.10.bb                |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
CVE-2025-47917.patch

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-202=
5-47917.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-=
2025-47917.patch
new file mode 100644
index 0000000000..75c4829191
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2025-47917=
.patch
@@ -0,0 +1,52 @@
+From 19d2c9165a13decf754177adda2bf59fd0e32aa1 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Manuel=3D20P=3DC3=3DA9gouri=3DC3=3DA9-Gonnard?=3D
+ <manuel.pegourie-gonnard@arm.com>
+Date: Mon, 5 May 2025 16:41:52 +0200
+Subject: [PATCH] Fix undocumented free() in x509_string_to_names()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Now programs/x509/cert_write san=3D"DN:CN=3D#0000;DN:CN=3D#0000" is no l=
onger
+crashing with use-after-free, instead it's now failing cleanly:
+
+ failed
+  !  mbedtls_x509_string_to_names returned -0x2800 - X509 - Input invali=
d
+
+That's better of course but still not great, will be fixed by future
+commits.
+
+Signed-off-by: Manuel P=C3=A9gouri=C3=A9-Gonnard <manuel.pegourie-gonnar=
d@arm.com>
+
+CVE: CVE-2025-47917
+
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/43=
a1e73]
+
+Backport patch to fix CVE-2025-47917 and drop the modification in doc
+file and comment in header file which lack of context.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ library/x509_create.c                          |  8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+ create mode 100644 ChangeLog.d/fix-string-to-names-memory-management.tx=
t
+
+diff --git a/library/x509_create.c b/library/x509_create.c
+index 839b5df226..420e36b81b 100644
+--- a/library/x509_create.c
++++ b/library/x509_create.c
+@@ -122,8 +122,12 @@ int mbedtls_x509_string_to_names(mbedtls_asn1_named=
_data **head, const char *nam
+     char data[MBEDTLS_X509_MAX_DN_NAME_SIZE];
+     char *d =3D data;
+=20
+-    /* Clear existing chain if present */
+-    mbedtls_asn1_free_named_data_list(head);
++    /* Ensure the output parameter is not already populated.
++     * (If it were, overwriting it would likely cause a memory leak.)
++     */
++    if (*head !=3D NULL) {
++        return MBEDTLS_ERR_X509_BAD_INPUT_DATA;
++    }
+=20
+     while (c <=3D end) {
+         if (in_tag && *c =3D=3D '=3D') {
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index f62e93a930..a323607367 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -24,7 +24,9 @@ SECTION =3D "libs"
=20
 S =3D "${WORKDIR}/git"
 SRCREV =3D "2fc8413bfcb51354c8e679141b17b3f1a5942561"
-SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Darchive/mbedtls-2.28"
+SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Darchive/mbedtls-2.28 \
+           file://CVE-2025-47917.patch \
+           "
=20
 inherit cmake update-alternatives
=20
--=20
2.34.1


