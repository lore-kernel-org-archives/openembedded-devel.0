Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25511CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 06:35:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.68022.1754980544782044064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 23:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031926cd2b=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57C6XxEW466841
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 23:35:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvchg5f1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 23:35:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 11 Aug 2025 23:35:37 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 11 Aug 2025 23:35:36 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][meta-oe][PATCH] iperf3: Fix CVE-2025-54349
Date: Tue, 12 Aug 2025 14:35:41 +0800
Message-ID: <20250812063541.1174689-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YfJSPZ1Go3zpcwWUU7msrzGvbEJu1ukU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDA2MSBTYWx0ZWRfX99f4LrhF+U55
 R6PdRG+pdYS6EVrd2cU7rtsvhrpLuT9WeudGBB3I/HiekStWDtRaAophX6aK2TsxKGfZwnYNH2h
 XEqP0GbRt44SJbGg5+1fgeN0UQkE8fZLLU6IOfrJmxERtkv3WCRI5+URtYWqQrHvSvxmq8PG6I0
 jdm1I2acQpRc3W8lUjIHr3sBKL6MolisjnnNF8cBClaE7AnLnh79L5At7do4vOj2dsrGkjijHJv
 S7s9JDkjg3pxJGd7U8u/MZ231XjHSeB2JK/oJIMWGoWBGt6n7y677GGgUzvjw1V+VQJt5nwhCow
 NhLoNu/ETlzQspEYo21LgxucXiclkYz7Bz2EpKGIgUD/aansLihrwzq1a9+hGI=
X-Proofpoint-ORIG-GUID: YfJSPZ1Go3zpcwWUU7msrzGvbEJu1ukU
X-Authority-Analysis: v=2.4 cv=RPGzH5i+ c=1 sm=1 tr=0 ts=689ae0c0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8
 a=vtXoPY2jAAAA:8 a=k0GfeRJ4tlHh1RdrwsEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 06:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118914

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Pick commit [1] as listed in [2].

[1] https://github.com/esnet/iperf/commit/42280d2292ed5f213bfcb33b2206ebcdb151ae66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-54349

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../iperf3/iperf3/CVE-2025-54349.patch        | 98 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
new file mode 100644
index 0000000000..fbba42b04b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
@@ -0,0 +1,98 @@
+From 505181fd31501027460eb518d7e4d46498e048f5 Mon Sep 17 00:00:00 2001
+From: Sarah Larsen <swlarsen@es.net>
+Date: Wed, 25 Jun 2025 15:11:03 +0000
+Subject: [PATCH] Fix off-by-one heap overflow in auth.
+
+Reported by Han Lee (Apple Information Security)
+CVE-2025-54349
+
+CVE: CVE-2025-54349
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/42280d2292ed5f213bfcb33b2206ebcdb151ae66]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ src/iperf_auth.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 72e85fc..86b4eba 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+ }
+ 
+ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
++    int ret =0;
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_PKEY_CTX *ctx;
+ #else
+@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     keysize = RSA_size(rsa);
+ #endif
+     rsa_buffer  = OPENSSL_malloc(keysize * 2);
+-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
++    // Note: +1 for NULL
++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+@@ -320,13 +322,15 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+         padding = RSA_PKCS1_PADDING;
+     }
+ #if OPENSSL_VERSION_MAJOR >= 3
++
+     plaintext_len = keysize;
+     EVP_PKEY_decrypt_init(ctx);
+-    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
++
++    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
+     if (ret < 0){
+         goto errreturn;
+     }
+-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
++    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
+     EVP_PKEY_CTX_free(ctx);
+ #else
+     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
+@@ -337,7 +341,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     BIO_free(bioBuff);
+ 
+     /* Treat a decryption error as an empty string. */
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         plaintext_len = 0;
+     }
+ 
+@@ -386,24 +390,28 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+     int plaintext_len;
+     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
+     free(encrypted_b64);
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         return -1;
+     }
++
+     plaintext[plaintext_len] = '\0';
+ 
+     char *s_username, *s_password;
+     s_username = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_username == NULL) {
++        OPENSSL_free(plaintext);
+ 	return -1;
+     }
+     s_password = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_password == NULL) {
++        OPENSSL_free(plaintext);
+ 	free(s_username);
+ 	return -1;
+     }
+ 
+     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
+     if (rc != 3) {
++        OPENSSL_free(plaintext);
+ 	free(s_password);
+ 	free(s_username);
+ 	return -1;
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index 77b441e506..4e9f5f1f46 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://0001-fix-build-with-gcc-15.patch \
+           file://CVE-2025-54349.patch \
            "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
-- 
2.34.1


