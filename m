Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378BACAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 11:44:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15376.1758887083933743658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 04:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=elJgjhhj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364ba7040=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58QBR2Fv1759272
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 11:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=IucV6QrgbRFjvHh7X8jZhTSi4fwZoYJ97Ut092JDdMg=; b=elJgjhhj3+1j
	niDD7F9QoC92op4PSYu9ys3+XGcPClsRFgVg5V4kl+qj94UHe3+9g15MBXnMmVXl
	YzKl/LF4Jyt6SXJbp9/LIBMtVhopAZn3lgFm6tud0O/PkJrepLvgGgoUXO0w40gA
	aZrn2zUGRMXT+YbCqCIAbICowg1BLaYAMX/N0tJCuMpEjkYlvjQfUjcCEpNO/4GI
	o4EcIiTlGvBI5MWYEYXftSOEf8AoYWytgW9c4trWXDaa3RpA1EsJ08PMVJgc1Njn
	Bu4B1tKClBbT2GJJfx5GkrAIP+kjGG9ANUOAKnPvH6F2zBnMPZhzUpQcFFMf/2hi
	LbiZK48NEg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8qsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 11:44:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 04:44:41 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 04:44:40 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/3] iperf3: Fix CVE-2024-26306
Date: Fri, 26 Sep 2025 17:14:29 +0530
Message-ID: <20250926114430.2425208-2-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250926114430.2425208-1-soumya.sambu@windriver.com>
References: <20250926114430.2425208-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwOCBTYWx0ZWRfXzEBCBHZTu4sM
 o5wUV9ouLK4Df5egNB9kUK6rIIs4VWm5snkY++6zs45KEmm8HnN9a0lqXtXXNMfTQILrLlWe54v
 IntCWAj9lslNacRWDXgss6NFlWjSpMd0lYcEnmItrwMufGWcmWb2rEWjDLYGxIO/x1CZPQS4z5k
 mpnmxhm8fKUrw3H/5kAswqRVPM5M73YeZlE+HettTE1UwDBYIY0NovRICOxDOZeZiAkMShVlCLo
 lQocUPF88Hbix6ZJTXfP4n8vmzZK2cM+wCMm+8Y+M3dGPNoXcUgzzL4E8yqVdbYDtxU6/AdgRVg
 vvO5oTPrFJhuIGl/3hcuBcrULTcrGGk3o8ArtAOVyeKKAvDRWyVGBGTc5clQjtbYP/6FOqSDOc1
 oS9UJtVB3oYJ9hzyJyg+Em+SufE7Pg==
X-Proofpoint-ORIG-GUID: IQkK7prwFZj--9u28e0g59cFH9mZlVb0
X-Proofpoint-GUID: IQkK7prwFZj--9u28e0g59cFH9mZlVb0
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d67caa cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=-HSFvP46uHVNKya2NyEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 11:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119908

From: Soumya Sambu <soumya.sambu@windriver.com>

iPerf3 before 3.17, when used with OpenSSL before 3.2.0 as a server with RSA
authentication, allows a timing side channel in RSA decryption operations. This
side channel could be sufficient for an attacker to recover credential plaintext.
It requires the attacker to send a large number of messages for decryption, as
described in "Everlasting ROBOT: the Marvin Attack" by Hubert Kario.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-26306
https://security-tracker.debian.org/tracker/CVE-2024-26306

Upstream patch:
https://github.com/esnet/iperf/commit/299b356df6939f71619bf45bf7a7d2222e17d840

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iperf3/iperf3/CVE-2024-26306.patch        | 218 ++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-26306.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-26306.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-26306.patch
new file mode 100644
index 0000000000..83acb918bd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2024-26306.patch
@@ -0,0 +1,218 @@
+From 299b356df6939f71619bf45bf7a7d2222e17d840 Mon Sep 17 00:00:00 2001
+From: Sarah Larsen <swlarsen@Sarahs-MBP.lan>
+Date: Wed, 20 Mar 2024 17:02:31 -0700
+Subject: [PATCH] Using OAEP padding instead of PKCS1 padding for OpenSSL. Fix 
+ for CVE-2024-26306.
+
+Special thanks to Hubert Kario at Red Hat for finding the vulnerability.
+
+CVE: CVE-2024-26306
+
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/299b356df6939f71619bf45bf7a7d2222e17d840]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/iperf.h        |  1 +
+ src/iperf_api.c    |  8 ++++++--
+ src/iperf_api.h    |  1 +
+ src/iperf_auth.c   | 26 ++++++++++++++++++--------
+ src/iperf_auth.h   |  4 ++--
+ src/iperf_locale.c |  1 +
+ src/t_auth.c       |  5 +++--
+ 7 files changed, 32 insertions(+), 14 deletions(-)
+
+diff --git a/src/iperf.h b/src/iperf.h
+index c3ce333..ae3feeb 100644
+--- a/src/iperf.h
++++ b/src/iperf.h
+@@ -308,6 +308,7 @@ struct iperf_test
+     char      *server_authorized_users;
+     EVP_PKEY  *server_rsa_private_key;
+     int       server_skew_threshold;
++    int       use_pkcs1_padding;
+ #endif // HAVE_SSL
+ 
+     /* boolean variables for Options */
+diff --git a/src/iperf_api.c b/src/iperf_api.c
+index a95e024..3915884 100644
+--- a/src/iperf_api.c
++++ b/src/iperf_api.c
+@@ -1097,6 +1097,7 @@ iperf_parse_arguments(struct iperf_test *test, int argc, char **argv)
+     {"rsa-private-key-path", required_argument, NULL, OPT_SERVER_RSA_PRIVATE_KEY},
+     {"authorized-users-path", required_argument, NULL, OPT_SERVER_AUTHORIZED_USERS},
+     {"time-skew-threshold", required_argument, NULL, OPT_SERVER_SKEW_THRESHOLD},
++    {"use-pkcs1-padding", no_argument, NULL, OPT_USE_PKCS1_PADDING},
+ #endif /* HAVE_SSL */
+ 	{"fq-rate", required_argument, NULL, OPT_FQ_RATE},
+ 	{"pacing-timer", required_argument, NULL, OPT_PACING_TIMER},
+@@ -1585,6 +1586,9 @@ iperf_parse_arguments(struct iperf_test *test, int argc, char **argv)
+                 return -1;
+             }
+             break;
++	case OPT_USE_PKCS1_PADDING:
++	    test->use_pkcs1_padding = 1;
++	    break;
+ #endif /* HAVE_SSL */
+ 	    case OPT_PACING_TIMER:
+ 		test->settings->pacing_timer = unit_atoi(optarg);
+@@ -2026,7 +2030,7 @@ int test_is_authorized(struct iperf_test *test){
+     if (test->settings->authtoken){
+         char *username = NULL, *password = NULL;
+         time_t ts;
+-        int rc = decode_auth_setting(test->debug, test->settings->authtoken, test->server_rsa_private_key, &username, &password, &ts);
++        int rc = decode_auth_setting(test->debug, test->settings->authtoken, test->server_rsa_private_key, &username, &password, &ts, test->use_pkcs1_padding);
+ 	if (rc) {
+ 	    return -1;
+ 	}
+@@ -2211,7 +2215,7 @@ send_parameters(struct iperf_test *test)
+ #if defined(HAVE_SSL)
+ 	/* Send authentication parameters */
+ 	if (test->settings->client_username && test->settings->client_password && test->settings->client_rsa_pubkey){
+-	    int rc = encode_auth_setting(test->settings->client_username, test->settings->client_password, test->settings->client_rsa_pubkey, &test->settings->authtoken);
++	    int rc = encode_auth_setting(test->settings->client_username, test->settings->client_password, test->settings->client_rsa_pubkey, &test->settings->authtoken, test->use_pkcs1_padding);
+ 
+ 	    if (rc) {
+ 		cJSON_Delete(j);
+diff --git a/src/iperf_api.h b/src/iperf_api.h
+index 171006a..052bc96 100644
+--- a/src/iperf_api.h
++++ b/src/iperf_api.h
+@@ -90,6 +90,7 @@ typedef uint64_t iperf_size_t;
+ #define OPT_DONT_FRAGMENT 26
+ #define OPT_RCV_TIMEOUT 27
+ #define OPT_SND_TIMEOUT 28
++#define OPT_USE_PKCS1_PADDING 30
+ 
+ /* states */
+ #define TEST_START 1
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 595f730..db48bbf 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -228,7 +228,7 @@ int test_load_private_key_from_file(const char *file){
+     return 0;
+ }
+ 
+-int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned char **encryptedtext) {
++int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned char **encryptedtext, int use_pkcs1_padding) {
+     RSA *rsa = NULL;
+     unsigned char *rsa_buffer = NULL, pad = RSA_PKCS1_PADDING;
+     int keysize, encryptedtext_len, rsa_buffer_len;
+@@ -241,7 +241,12 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)plaintext, (int)strlen(plaintext));
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+-    encryptedtext_len = RSA_public_encrypt(rsa_buffer_len, rsa_buffer, *encryptedtext, rsa, pad);
++
++    int padding = RSA_PKCS1_OAEP_PADDING;
++    if (use_pkcs1_padding){
++        padding = RSA_PKCS1_PADDING;
++    }
++    encryptedtext_len = RSA_public_encrypt(rsa_buffer_len, rsa_buffer, *encryptedtext, rsa, padding);
+ 
+     RSA_free(rsa);
+     OPENSSL_free(rsa_buffer);
+@@ -255,7 +260,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+     return encryptedtext_len;
+ }
+ 
+-int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext) {
++int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
+     RSA *rsa = NULL;
+     unsigned char *rsa_buffer = NULL, pad = RSA_PKCS1_PADDING;
+     int plaintext_len, rsa_buffer_len, keysize;
+@@ -268,7 +273,12 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+-    plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, pad);
++
++    int padding = RSA_PKCS1_OAEP_PADDING;
++    if (use_pkcs1_padding){
++        padding = RSA_PKCS1_PADDING;
++    }
++    plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
+ 
+     RSA_free(rsa);
+     OPENSSL_free(rsa_buffer);
+@@ -282,7 +292,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     return plaintext_len;
+ }
+ 
+-int encode_auth_setting(const char *username, const char *password, EVP_PKEY *public_key, char **authtoken){
++int encode_auth_setting(const char *username, const char *password, EVP_PKEY *public_key, char **authtoken, int use_pkcs1_padding){
+     time_t t = time(NULL);
+     time_t utc_seconds = mktime(localtime(&t));
+ 
+@@ -299,7 +309,7 @@ int encode_auth_setting(const char *username, const char *password, EVP_PKEY *pu
+ 
+     unsigned char *encrypted = NULL;
+     int encrypted_len;
+-    encrypted_len = encrypt_rsa_message(text, public_key, &encrypted);
++    encrypted_len = encrypt_rsa_message(text, public_key, &encrypted, use_pkcs1_padding);
+     free(text);
+     if (encrypted_len < 0) {
+       return -1;
+@@ -310,7 +320,7 @@ int encode_auth_setting(const char *username, const char *password, EVP_PKEY *pu
+     return (0); //success
+ }
+ 
+-int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *private_key, char **username, char **password, time_t *ts){
++int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *private_key, char **username, char **password, time_t *ts, int use_pkcs1_padding){
+     unsigned char *encrypted_b64 = NULL;
+     size_t encrypted_len_b64;
+     int64_t utc_seconds;
+@@ -318,7 +328,7 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+ 
+     unsigned char *plaintext = NULL;
+     int plaintext_len;
+-    plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext);
++    plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
+     free(encrypted_b64);
+     if (plaintext_len < 0) {
+         return -1;
+diff --git a/src/iperf_auth.h b/src/iperf_auth.h
+index ffadbf3..eedd45a 100644
+--- a/src/iperf_auth.h
++++ b/src/iperf_auth.h
+@@ -35,7 +35,7 @@ EVP_PKEY *load_pubkey_from_file(const char *file);
+ EVP_PKEY *load_pubkey_from_base64(const char *buffer);
+ EVP_PKEY *load_privkey_from_file(const char *file);
+ EVP_PKEY *load_privkey_from_base64(const char *buffer);
+-int encode_auth_setting(const char *username, const char *password, EVP_PKEY *public_key, char **authtoken);
+-int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *private_key, char **username, char **password, time_t *ts);
++int encode_auth_setting(const char *username, const char *password, EVP_PKEY *public_key, char **authtoken, int use_pkcs1_padding);
++int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *private_key, char **username, char **password, time_t *ts, int use_pkcs1_padding);
+ int check_authentication(const char *username, const char *password, const time_t ts, const char *filename, int skew_threshold);
+ ssize_t iperf_getpass (char **lineptr, size_t *n, FILE *stream);
+diff --git a/src/iperf_locale.c b/src/iperf_locale.c
+index 838086e..466f36a 100644
+--- a/src/iperf_locale.c
++++ b/src/iperf_locale.c
+@@ -156,6 +156,7 @@ const char usage_longstr[] = "Usage: iperf3 [-s|-c host] [options]\n"
+                            "                            credentials\n"
+                            "  --time-skew-threshold     time skew threshold (in seconds) between the server\n"
+                            "                            and client during the authentication process\n"
++                           "  --use-pkcs1-padding       use pkcs1 padding at your own risk\n"
+ #endif //HAVE_SSL
+                            "Client specific:\n"
+                            "  -c, --client <host>[%%<dev>] run in client mode, connecting to <host>\n"
+diff --git a/src/t_auth.c b/src/t_auth.c
+index 22c78ae..5104855 100644
+--- a/src/t_auth.c
++++ b/src/t_auth.c
+@@ -103,8 +103,9 @@ test_authtoken(const char *authUser, const char *authPassword, EVP_PKEY *pubkey,
+     char *decodePassword;
+     time_t decodeTime;
+ 
+-    assert(encode_auth_setting(authUser, authPassword, pubkey, &authToken) == 0);
+-    assert(decode_auth_setting(0, authToken, privkey, &decodeUser, &decodePassword, &decodeTime) == 0);
++    int use_pkcs1_padding = 1;
++    assert(encode_auth_setting(authUser, authPassword, pubkey, &authToken, use_pkcs1_padding) == 0);
++    assert(decode_auth_setting(0, authToken, privkey, &decodeUser, &decodePassword, &decodeTime, use_pkcs1_padding) == 0);
+ 
+     assert(strcmp(decodeUser, authUser) == 0);
+     assert(strcmp(decodePassword, authPassword) == 0);
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index 8961628792..6de6d6c0b8 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://CVE-2023-7250.patch \
+           file://CVE-2024-26306.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.40.0


