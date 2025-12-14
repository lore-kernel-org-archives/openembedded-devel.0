Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFAAD59D99
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 18:04:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30040.1765735491536033293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 10:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R7sF7pYo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444390f874=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEHvkC92344344
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 18:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MD3Wv48cMYwSyyqfbS4G
	lj/8qVg18e+JGIX5/p0Hq2g=; b=R7sF7pYoEpAzawFX5j2Jj+qccR4qqyrIh1TW
	UyW76AtZx7hoC9zcm7ygf4w/iFAffWi2ZFXhPLn1iTbXZ/kWv38o5yxGhjh7muwg
	1q6S6yaoxIKdQfj2/0jorO/rYcmQBpmeNgdOskaFaR1BHbvVamuG0LBRwIYaS3XK
	FC9PsfUVuizl3rkXo4dfIQPKM2PZACFiu9x8koSzQYRmOrIOWmqgkadBvOTkkhpc
	6Yb8EeOwOLT6oExpxPa0QPUN4CrFqaqA8LQMBYSUdWFIx33I3JC7uFFDx202O7+m
	y+B3FnICkuZ/hb3fe9UJ1r32lZAkRbG0I36MJ5Y82rlnQ1a9jw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0h6x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 18:04:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 14 Dec 2025 10:04:49 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 14 Dec 2025 10:04:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH] mbedtls: fix CVE-2025-47917
Date: Mon, 15 Dec 2025 02:04:46 +0800
Message-ID: <20251214180446.2682162-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE2NyBTYWx0ZWRfX72lckLc8Qqfl
 WZSt80GPamgwlmOHPgEHTNPebdojBTO5VIdWtHgG3OV+01O/pPDXk+i1JUh684ivxJMrmxuezdj
 f2z6/JR/Sioog5LW4nPojvEhm7k/tLUfjaqSlFD8iYoEyvAdVV7gkHgZsPo0xk9FtcDyv2fcDwL
 qhNB3Gb5T/zw/fWgFNLbqwDtcIF8qMudPJ4RUFFTqHIhhrtCTfHga9GrhndVeW43QA0BC/h0K7Z
 llf4xfsf+swrjSbjvKqpnxKDBxsaaQnW/wh6XTcpdShK1I3g/m4gvzHAsF22SRfBdglTQxHLAQ4
 B728IJj+sDqc5yMBbTlc61X6aMeOarg51ruNtcJsmNoxODUY7+UiEBIfuav7RSl+XQBUWk7irX7
 7hB0RlWv2/WvKrAW7vJbifn7Ndhz5A==
X-Proofpoint-GUID: vL0Hb4WDvKQ0tzkMDQBw8y32Zd27PHQ5
X-Proofpoint-ORIG-GUID: vL0Hb4WDvKQ0tzkMDQBw8y32Zd27PHQ5
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=693efc42 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=McYcvuQCY6QHsMojYNUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140167
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BEHvkC92344344
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 18:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122652

From: Kai Kang <kai.kang@windriver.com>

CVE-2025-47917 is that the function mbedtls_x509_string_to_names() takes
a head argument and performs a deep free() on it.

Backport patch to fix CVE-2025-47917 and drop the modification in doc
file and comment in header file which lack of context.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mbedtls/mbedtls/CVE-2025-47917.patch      | 52 +++++++++++++++++++
 .../mbedtls/mbedtls_2.28.10.bb                |  1 +
 2 files changed, 53 insertions(+)
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
index 62e6c90f63..53462953ef 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -26,6 +26,7 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "2fc8413bfcb51354c8e679141b17b3f1a5942561"
 SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Darchive/mbedtls-2.28 \
            file://run-ptest \
+           file://CVE-2025-47917.patch \
           "
=20
 inherit cmake update-alternatives ptest
--=20
2.34.1


