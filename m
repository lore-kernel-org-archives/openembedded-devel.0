Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3433CCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 06:56:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11993.1762844167934830209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 22:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BSNYp7wP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3410ad4b76=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5b2vo038181
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 06:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yCIqgo4W0Krv1EbNzYgGIln82Z6rxQ8BB9AKBV5ZehY=; b=BSNYp7wPdtgZ
	eJBBlKdYCS59hsNYbcRP2qI7VL2puwpw33qOPyo7JVn2Zn+DF8kX4xoWyRms7aoV
	7bjpxHEphbqpO7sye9Dz/WH/4Z+ug4wG7/0K7pVrXe+QQubGBCWsXeBrsvOJGb4n
	GO8foq/VrOQIMzz+K9BQv+n+IkBW6zZt0c3TOddA1GNhoyWW5Lm85xqeUcn9iX3g
	Juq2yoxjygrfo8zTmVlCfZ1rJ358eaDyCkkVpKJGYCZuWOsieZT6hkhqLyIQ0MWz
	jnsNZbO9FjnClbIJdTaKZZG3Xjreokrtx3Bj/DsxvbpXYYM49FheO3PFdSwBIdO5
	nDSmqjgYvA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu92wgw-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 06:56:06 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 10 Nov 2025 22:56:05 -0800
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH  2/2] libssh: fix CVE-2025-8277
Date: Tue, 11 Nov 2025 12:25:47 +0530
Message-ID: <20251111065547.2723539-2-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251111065547.2723539-1-rajeshkumar.ramasamy@windriver.com>
References: <20251111065547.2723539-1-rajeshkumar.ramasamy@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA1MSBTYWx0ZWRfX84d20PO6pjoc
 2H7keibJMU5c8DqZKYWDb0hZ4apF10WQOnd+xN8TQu0WKDibPPo0UAyUJNb+F+N3tWC9Qjasa7i
 JohC+bIqRBAj5p6DbcUILlswdbBiAcsP9i0O+SRn/JSqEPJnohxRSJQve2JD95ZFhEsYotswKvQ
 4wb/3agstcWDbJyG+O5N+6nl/VW2ROSYN1eLBH1MeFNuj/d1Cuk68BBvtSpmWuRf1pGR12VEOo9
 kN3tXosuGvfnqGBRN+hytYtg31WR0ow4T1oYla51lNOY4lPbkpAVq/yJJMGCDiwsG3SDpfLeIrY
 vXMGW+8IeaXTsICMGCEwCM0klPha8r9y+sJ/w5GWlt+tvWBj8//PNLkmqROVhEc8RnX7v1dwNBf
 QWzHfMXXPd4rC5fKf/Fw8tmPMB6yDA==
X-Proofpoint-GUID: IiHtRlT7xlDHeuZoHVoDiieXACm3aKWZ
X-Proofpoint-ORIG-GUID: IiHtRlT7xlDHeuZoHVoDiieXACm3aKWZ
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6912de07 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=nar8ntqeAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=_9gtbkrcAAAA:8 a=20KFwNOVAAAA:8 a=ChA6VurdLZCkuldovTIA:9
 a=RptMqvEBejqe73AKBt4K:22 a=FdTzh2GWekK77mhwV6Dw:22 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 06:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121478

A flaw was found in libssh's handling of key exchange (KEX) processes
when a client repeatedly sends incorrect KEX guesses. The library fails
to free memory during these rekey operations, which can gradually
exhaust system memory. This issue can lead to crashes on the client
side, particularly when using libgcrypt, which impacts application
stability and availability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8277

Upstream-patch:
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 .../libssh/libssh/CVE-2025-8277-1.patch       | 57 +++++++++++++++++++
 .../libssh/libssh/CVE-2025-8277-2.patch       | 50 ++++++++++++++++
 .../libssh/libssh/CVE-2025-8277-3.patch       | 50 ++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  3 +
 4 files changed, 160 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
new file mode 100644
index 0000000000..30198df0f4
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-1.patch
@@ -0,0 +1,57 @@
+From 266174a6d36687b65cf90174f06af90b8b27c65f Mon Sep 17 00:00:00 2001
+From: Francesco Rollo <eferollo@gmail.com>
+Date: Thu, 24 Jul 2025 16:30:07 +0300
+Subject: [PATCH 1/3] CVE-2025-8277: Fix memory leak of unused ephemeral key
+ pair after client's wrong KEX guess
+
+Signed-off-by: Francesco Rollo <eferollo@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit ccff22d3787c1355b3f0dcd09fe54d90acc55bf1)
+
+CVE: CVE-2025-8277
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ src/ecdh_gcrypt.c     | 6 ++++++
+ src/ecdh_mbedcrypto.c | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
+index bc45adf7..b2e5390c 100644
+--- a/src/ecdh_gcrypt.c
++++ b/src/ecdh_gcrypt.c
+@@ -101,6 +101,12 @@ int ssh_client_ecdh_init(ssh_session session)
+         goto out;
+     }
+ 
++    /* Free any previously allocated privkey */
++    if (session->next_crypto->ecdh_privkey != NULL) {
++        gcry_sexp_release(session->next_crypto->ecdh_privkey);
++        session->next_crypto->ecdh_privkey = NULL;
++    }
++
+     session->next_crypto->ecdh_privkey = key;
+     key = NULL;
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
+index fa350028..f7b0301b 100644
+--- a/src/ecdh_mbedcrypto.c
++++ b/src/ecdh_mbedcrypto.c
+@@ -65,6 +65,12 @@ int ssh_client_ecdh_init(ssh_session session)
+         return SSH_ERROR;
+     }
+ 
++    /* Free any previously allocated privkey */
++    if (session->next_crypto->ecdh_privkey != NULL) {
++        mbedtls_ecp_keypair_free(session->next_crypto->ecdh_privkey);
++        SAFE_FREE(session->next_crypto->ecdh_privkey);
++    }
++
+     session->next_crypto->ecdh_privkey = malloc(sizeof(mbedtls_ecp_keypair));
+     if (session->next_crypto->ecdh_privkey == NULL) {
+         return SSH_ERROR;
+-- 
+2.48.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
new file mode 100644
index 0000000000..87a4b684a4
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-2.patch
@@ -0,0 +1,50 @@
+From 8e4d67aa9eda455bfad9ac610e54b7a548d0aa08 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 6 Aug 2025 11:10:38 +0200
+Subject: [PATCH 2/3] CVE-2025-8277: ecdh: Free previously allocated pubkeys
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit c9d95ab0c7a52b231bcec09afbea71944ed0d852)
+
+CVE: CVE-2025-8277
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ src/ecdh_crypto.c | 1 +
+ src/ecdh_gcrypt.c | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
+index a3c78469..bb4c3fc0 100644
+--- a/src/ecdh_crypto.c
++++ b/src/ecdh_crypto.c
+@@ -106,6 +106,7 @@ int ssh_client_ecdh_init(ssh_session session){
+   }
+ 
+   session->next_crypto->ecdh_privkey = key;
++  ssh_string_free(session->next_crypto->ecdh_client_pubkey);
+   session->next_crypto->ecdh_client_pubkey = client_pubkey;
+ 
+   rc = ssh_packet_send(session);
+diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
+index b2e5390c..e998a582 100644
+--- a/src/ecdh_gcrypt.c
++++ b/src/ecdh_gcrypt.c
+@@ -106,9 +106,10 @@ int ssh_client_ecdh_init(ssh_session session)
+         gcry_sexp_release(session->next_crypto->ecdh_privkey);
+         session->next_crypto->ecdh_privkey = NULL;
+     }
+-
+     session->next_crypto->ecdh_privkey = key;
+     key = NULL;
++
++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+     client_pubkey = NULL;
+ 
+-- 
+2.48.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
new file mode 100644
index 0000000000..9e1519072f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8277-3.patch
@@ -0,0 +1,50 @@
+From 1c763e29d138db87665e98983f468d2dd0f286c1 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 6 Aug 2025 15:32:56 +0200
+Subject: [PATCH 3/3] CVE-2025-8277: mbedtls: Avoid leaking ecdh keys
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit ffed80f8c078122990a4eba2b275facd56dd43e0)
+
+CVE: CVE-2025-8277
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ src/ecdh_mbedcrypto.c | 1 +
+ src/wrapper.c         | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
+index f7b0301b..ab323a7e 100644
+--- a/src/ecdh_mbedcrypto.c
++++ b/src/ecdh_mbedcrypto.c
+@@ -109,6 +109,7 @@ int ssh_client_ecdh_init(ssh_session session)
+         goto out;
+     }
+ 
++    SSH_STRING_FREE(session->next_crypto->ecdh_client_pubkey);
+     session->next_crypto->ecdh_client_pubkey = client_pubkey;
+     client_pubkey = NULL;
+ 
+diff --git a/src/wrapper.c b/src/wrapper.c
+index 6e15d54e..fc1110f4 100644
+--- a/src/wrapper.c
++++ b/src/wrapper.c
+@@ -169,7 +169,10 @@ void crypto_free(struct ssh_crypto_struct *crypto)
+         EC_KEY_free(crypto->ecdh_privkey);
+ #elif defined HAVE_GCRYPT_ECC
+         gcry_sexp_release(crypto->ecdh_privkey);
+-#endif
++#elif defined HAVE_LIBMBEDCRYPTO
++        mbedtls_ecp_keypair_free(crypto->ecdh_privkey);
++        SAFE_FREE(crypto->ecdh_privkey);
++#endif /* HAVE_LIBGCRYPT */
+         crypto->ecdh_privkey = NULL;
+     }
+ #endif
+-- 
+2.48.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 28e3fe2588..891b2c38ac 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -24,6 +24,9 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-4877.patch \
            file://CVE-2025-4878-1.patch \
            file://CVE-2025-4878-2.patch \
+           file://CVE-2025-8277-1.patch \
+           file://CVE-2025-8277-2.patch \
+           file://CVE-2025-8277-3.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.48.1


