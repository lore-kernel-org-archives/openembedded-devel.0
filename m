Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852BFCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:46:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1856.1763415986811112846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 13:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mfzO7QBq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3416e21d6e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBFWh02644462
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=W/OO5+QAJLuarPZxr13y
	+g8XTdt5dYKMhaKzLVw5gmw=; b=mfzO7QBqvFTqsWB40dMyB9vPk5Egk2NeTAh8
	UzbpPpIRSaQRDr8dxh8ktwJw4nzLfxb5pAu53bfZB1RFu9yM9SD/cXEstkDNTj8G
	OnCqBoIC/bSuUdAAcaRugcGe/zWNIZpM4Co4vX2Cos7Y509s+wVQxD2gTUCw1t8l
	TPgt7Z3Q66vfynt3Xsk3oIUBszSCoMIPgXxsaTlsK3dUtwJE4S0gayqxBHcS/S1H
	ozTuiym+1Q91DfU5IQRiRSTUwWj/JluCbzNkKSxokuUaoLAp1b3moP8CV1xVS2QV
	4uCH9AJo9UO7Jju8YQ+4FTNGqPxNCGHw9B+tgBVaWhzDXAqC6Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg8aexb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Nov 2025 13:46:24 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 17 Nov 2025 13:46:24 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] iperf3: Upgrade 3.18 -> 3.20
Date: Mon, 17 Nov 2025 16:46:23 -0500
Message-ID: <20251117214624.941380-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE4NCBTYWx0ZWRfXwsPNoN/xbbqQ
 OpQ/nLPhdZATqLnDHpbU3xMQX4bwupxy2/ph1xV8c6gEg/RMEUdoo8m5DcPIJ8YecRKrRhxAsAF
 FFTeSMQoJo2koJXamR2ahMR3H8KtFTU0rezbm0grbobTm3wwPF7DsmvQMDW/b0vuApDZ3X+p3YA
 LZMEQJ3xS4yerpwNdMojTLZF9GJKdNB1wO9hq2Vp9EZFWjzDc/m9xPV60AAMlHjmXOG34gvaQAW
 iKKgO079iqau9e3TqM0ynR0Sxz7eYv881Y7/HNHn0a7IduI3jayP3zNy0HAq425whAEbs58khn6
 qoYaldv22iHJ4h2EihfQwraYK1wsBnv85iy9OESA9QYHseT9GKXiOvFrfNpwd8NgprT9xQ9OPUT
 4qNnz3Y51/VnPIYPbvo9YG2j6dMbFQ==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=691b97b1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=vtXoPY2jAAAA:8 a=4p4M9BhCAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=cmWlzMUdAAAA:8 a=pGLkceISAAAA:8 a=htThzEhkz5d2H0e7JE8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PJ70nL-FM-IA:10 a=s4FxMMpuSwg4a78zj2vJ:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=93ApFmx_MQ_BoSUK457J:22 a=bA3UWDv6hWIuX7UZL3qL:22
 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-ORIG-GUID: zwFjfxb2D78Gr5X6u89vkiWZbcTgl3vW
X-Proofpoint-GUID: zwFjfxb2D78Gr5X6u89vkiWZbcTgl3vW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170184
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AHBFWh02644462
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121785

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Change summary from:
  https://software.es.net/iperf/news.html#iperf-3-19-released
and RELNOTES links:

iperf-3.20 fixes a number of bugs and also adds some minor enhancements.
  https://github.com/esnet/iperf/blob/master/RELNOTES.md#iperf-320-2025-1=
1-14

iperf-3.19.1 is a security fix release to address three issues reported
by Han Lee of Apple Information Security.
  https://github.com/esnet/iperf/blob/master/RELNOTES.md#iperf-3191-2025-=
07-25

iperf-3.19 includes support for MP-TCPv1 under Linux, keepalives on the
control connection, support for the MSG_TRUNC receive option, and
a number of minor bug fixes.
  https://github.com/esnet/iperf/blob/master/RELNOTES.md#iperf-319-2025-0=
5-16

Drop 2 CVE patches that were backports.
Drop 0001-configure.ac-check-for-CPP-prog.patch
which is merged in:
   https://github.com/esnet/iperf/commit/beadb59b90e8

License-Update: The only changes were:
  =E2=9D=AF git log --oneline 3.18..3.20 LICENSE
  9f6dc21 Copyright updates for 2025.
  edf5c75 Fix typo in LICENSE

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../iperf3/0001-fix-build-with-gcc-15.patch   | 66 ---------------
 .../iperf3/iperf3/CVE-2025-54349.patch        | 80 -------------------
 .../iperf3/iperf3/CVE-2025-54350.patch        | 24 ------
 .../iperf3/{iperf3_3.18.bb =3D> iperf3_3.20.bb} |  7 +-
 4 files changed, 2 insertions(+), 175 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-buil=
d-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5434=
9.patch
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-5435=
0.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.18.bb =3D> iperf3_3.20=
.bb} (79%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-=
gcc-15.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-wit=
h-gcc-15.patch
deleted file mode 100644
index d3f3e712c9..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-gcc-15.=
patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a46630d4e373e9a3ef974c1b67767f6816c66572 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 10:13:02 +0000
-Subject: [PATCH] fix build with gcc-15
-
-Upstream-Status: Submitted [https://github.com/esnet/iperf/pull/1805]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- src/iperf_api.c | 8 ++++----
- src/iperf_api.h | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/iperf_api.c b/src/iperf_api.c
-index 7fb741e..4bb5b2f 100644
---- a/src/iperf_api.c
-+++ b/src/iperf_api.c
-@@ -599,25 +599,25 @@ iperf_set_mapped_v4(struct iperf_test *ipt, const =
int val)
- }
-=20
- void=20
--iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callbac=
k)())
-+iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callbac=
k)(struct iperf_stream *))
- {
-         ipt->on_new_stream =3D callback;
- }
-=20
- void=20
--iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callbac=
k)())
-+iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callbac=
k)(struct iperf_test *))
- {
-         ipt->on_test_start =3D callback;
- }
-=20
- void=20
--iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callb=
ack)())
-+iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callb=
ack)(struct iperf_test *))
- {
-         ipt->on_connect =3D callback;
- }
-=20
- void=20
--iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callba=
ck)())
-+iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callba=
ck)(struct iperf_test *))
- {
-         ipt->on_test_finish =3D callback;
- }
-diff --git a/src/iperf_api.h b/src/iperf_api.h
-index 1313142..df10c38 100644
---- a/src/iperf_api.h
-+++ b/src/iperf_api.h
-@@ -213,10 +213,10 @@ void    iperf_set_dont_fragment( struct iperf_test=
* ipt, int dont_fragment );
- void    iperf_set_test_congestion_control(struct iperf_test* ipt, char*=
 cc);
- void    iperf_set_test_mss(struct iperf_test* ipt, int mss);
- void    iperf_set_mapped_v4(struct iperf_test* ipt, const int val);
--void    iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (=
*callback)());
--void    iperf_set_on_test_start_callback(struct iperf_test* ipt, void (=
*callback)());
--void    iperf_set_on_test_connect_callback(struct iperf_test* ipt, void=
 (*callback)());
--void    iperf_set_on_test_finish_callback(struct iperf_test* ipt, void =
(*callback)());
-+void    iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (=
*callback)(struct iperf_stream *));
-+void    iperf_set_on_test_start_callback(struct iperf_test* ipt, void (=
*callback)(struct iperf_test *));
-+void    iperf_set_on_test_connect_callback(struct iperf_test* ipt, void=
 (*callback)(struct iperf_test *));
-+void    iperf_set_on_test_finish_callback(struct iperf_test* ipt, void =
(*callback)(struct iperf_test *));
-=20
- #if defined(HAVE_SSL)
- void    iperf_set_test_client_username(struct iperf_test *ipt, const ch=
ar *client_username);
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch=
 b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
deleted file mode 100644
index 61e1888685..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Subject: [PATCH] iperf3: Fix CVE-2025-54349
-CVE: CVE-2025-54349
-Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313b=
ab0b9b3fe03513ab54f722c8a3e4b7bdf]
-Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
----
-diff --git a/iperf_auth.c b/iperf_auth.c
-index 72e85fc..91c4133 100644
---- a/src/iperf_auth.c
-+++ b/src/iperf_auth.c
-@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_P=
KEY *public_key, unsigned ch
- }
-=20
- int decrypt_rsa_message(const unsigned char *encryptedtext, const int e=
ncryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int u=
se_pkcs1_padding) {
-+    int ret =3D0;=09
- #if OPENSSL_VERSION_MAJOR >=3D 3
-     EVP_PKEY_CTX *ctx;
- #else
-@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encrypt=
edtext, const int encryptedt
-     keysize =3D RSA_size(rsa);
- #endif
-     rsa_buffer  =3D OPENSSL_malloc(keysize * 2);
--    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize);
-+    // Note: +1 for NULL
-+    *plaintext =3D (unsigned char*)OPENSSL_malloc(keysize + 1);
-=20
-     BIO *bioBuff   =3D BIO_new_mem_buf((void*)encryptedtext, encryptedt=
ext_len);
-     rsa_buffer_len =3D BIO_read(bioBuff, rsa_buffer, keysize * 2);
-@@ -322,11 +324,12 @@ int decrypt_rsa_message(const unsigned char *encry=
ptedtext, const int encryptedt
- #if OPENSSL_VERSION_MAJOR >=3D 3
-     plaintext_len =3D keysize;
-     EVP_PKEY_decrypt_init(ctx);
--    int ret =3D EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
-+
-+    ret =3D EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
-     if (ret < 0){
-         goto errreturn;
-     }
--    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_b=
uffer_len);
-+    ret =3D EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffe=
r, rsa_buffer_len);
-     EVP_PKEY_CTX_free(ctx);
- #else
-     plaintext_len =3D RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *=
plaintext, rsa, padding);
-@@ -337,7 +340,7 @@ int decrypt_rsa_message(const unsigned char *encrypt=
edtext, const int encryptedt
-     BIO_free(bioBuff);
-=20
-     /* Treat a decryption error as an empty string. */
--    if (plaintext_len < 0) {
-+    if (plaintext_len <=3D 0) {
-         plaintext_len =3D 0;
-     }
-=20
-@@ -386,7 +389,7 @@ int decode_auth_setting(int enable_debug, const char=
 *authtoken, EVP_PKEY *priva
-     int plaintext_len;
-     plaintext_len =3D decrypt_rsa_message(encrypted_b64, encrypted_len_=
b64, private_key, &plaintext, use_pkcs1_padding);
-     free(encrypted_b64);
--    if (plaintext_len < 0) {
-+    if (plaintext_len <=3D 0) {
-         return -1;
-     }
-     plaintext[plaintext_len] =3D '\0';
-@@ -394,16 +397,19 @@ int decode_auth_setting(int enable_debug, const ch=
ar *authtoken, EVP_PKEY *priva
-     char *s_username, *s_password;
-     s_username =3D (char *) calloc(plaintext_len, sizeof(char));
-     if (s_username =3D=3D NULL) {
-+	OPENSSL_free(plaintext);
- 	return -1;
-     }
-     s_password =3D (char *) calloc(plaintext_len, sizeof(char));
-     if (s_password =3D=3D NULL) {
-+	OPENSSL_free(plaintext);
- 	free(s_username);
- 	return -1;
-     }
-=20
-     int rc =3D sscanf((char *) plaintext, auth_text_format, s_username,=
 s_password, &utc_seconds);
-     if (rc !=3D 3) {
-+	OPENSSL_free(plaintext);
- 	free(s_password);
- 	free(s_username);
- 	return -1;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch=
 b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
deleted file mode 100644
index 12ca38b830..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Subject: [PATCH] iperf3: Fix CVE-2025-54350
-CVE: CVE-2025-54350
-Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661=
da0bbaac04493fa40164e928c6df7934a]
-Comment: Patch is refreshed as per codebase of 3.18
-Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
----
---- a/src/iperf_auth.c	2025-09-12 10:21:48.186090000 +0530
-+++ b/src/iperf_auth.c	2025-09-15 11:13:21.123222080 +0530
-@@ -28,7 +28,6 @@
- #include "iperf_config.h"
-=20
- #include <string.h>
--#include <assert.h>
- #include <time.h>
- #include <sys/types.h>
- /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
-@@ -152,7 +151,6 @@
-=20
-     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines t=
o flush buffer
-     *length =3D BIO_read(bio, *buffer, strlen(b64message));
--    assert(*length =3D=3D decodeLen); //length should equal decodeLen, =
else something went horribly wrong
-     BIO_free_all(bio);
-=20
-     return (0); //success
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/re=
cipes-benchmark/iperf3/iperf3_3.20.bb
similarity index 79%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.20.bb
index a8c74c1b45..7d4d6beeb8 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.20.bb
@@ -10,17 +10,14 @@ SECTION =3D "console/network"
 BUGTRACKER =3D "https://github.com/esnet/iperf/issues"
=20
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9873a72f714e240530e759e103ac=
7b2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db51332d7f45357a9410daa9a14a36=
55f"
=20
 SRC_URI =3D "git://github.com/esnet/iperf.git;branch=3Dmaster;protocol=3D=
https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
-           file://0001-fix-build-with-gcc-15.patch \
-           file://CVE-2025-54349.patch \
-           file://CVE-2025-54350.patch \
           "
=20
-SRCREV =3D "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
+SRCREV =3D "0711330bacfaf1c2a804be66e7ecc26f481ede5d"
=20
 RDEPENDS:${PN} =3D "libgcc"
=20
--=20
2.34.1


