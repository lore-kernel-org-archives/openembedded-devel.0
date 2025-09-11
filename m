Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725C8CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 10:37:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43266.1757587067757298195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 03:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZNyGM5l2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13490b2759=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58BAJI1o3186447
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 10:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wctrVgaHdvAe8EIdNE6/aXbpvmr+zq0Nr3cSNPTn7c4=; b=ZNyGM5l2BiU+
	zy6Cc+qXrteUGRNh6xPYwOjZHGW3IsItW/cNP4e5u+eW/spJ2CV2CclpNhHJzV7g
	qtsmX14FiPf0rUtWMPvSvWgwUmV41SBaPUMmZiCzs2NCW9RUJokBbbnaBFEqdDJh
	h0ZDXMjER3NUOdtYLfIt+EDauxe6xT96Ax8yOHInPVFM9FHXRHzfY/miZEHL82xZ
	8BlT5+Gi8kuJD3HaU4NEhTpUSq32Ga2IaFAvDQg6oTjwIrdbhCIHfgjFvl8FFksq
	GdvOgVq6raFe1+1Iclpf7SRvoww1ebxLMpXaodSiv+Rjgtodlb44LYICKvM3lnNc
	mJLqYW1IyQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490a5w5s3x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 10:37:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 03:37:42 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] libssh: fix CVE-2025-5987
Date: Thu, 11 Sep 2025 16:07:05 +0530
Message-ID: <20250911103705.252836-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250911103705.252836-1-divya.chellam@windriver.com>
References: <20250911103705.252836-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: v-GXWUQUPO8wy2piYLXkugvkkqZybM3e
X-Proofpoint-ORIG-GUID: v-GXWUQUPO8wy2piYLXkugvkkqZybM3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA5NiBTYWx0ZWRfX2l77UHh/gf4c
 fGCzuNMk/6ty30/avHJVtJJcJRJga4S5FkHgtB3khy7KaCxwMTGB0a5s0/fM/rrR/7ePewpWGf4
 stfIRXcflSDfQvKPPmeTITSasieBYA0y+8XDTxy0gZMtutaEnZSNadvFcodYmujs6lwhMiCW09V
 I7gQ3G81YYRXjUDOwqSrYJVLgQVDV0J6CqJh07Lo6VYcQxFHBw6lD+Mmf0MG8AspCztlqWA0bxL
 ImopM72v239K6+8OG9cS9ODuNa6hhdAwKw++HsvBVM2E8sk4YScsMkb9Nat2pbHPbIbE+jb/yRJ
 7UUglcZ5WnT03tz/jjfPbWjpjf98Ee+8eI16LmFAWZD8Bqg11qBmoTDj1n+2lw=
X-Authority-Analysis: v=2.4 cv=AMtZH25w c=1 sm=1 tr=0 ts=68c2a67a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=xNf9USuDAAAA:8 a=nar8ntqeAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=_9gtbkrcAAAA:8 a=1E69uE0ZlsvtWQdOJBwA:9
 a=RptMqvEBejqe73AKBt4K:22 a=FdTzh2GWekK77mhwV6Dw:22 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 10:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119360

From: Divya Chellam <divya.chellam@windriver.com>

A flaw was found in libssh when using the ChaCha20 cipher with the
OpenSSL library. If an attacker manages to exhaust the heap space,
this error is not detected and may lead to libssh using a partially
initialized cipher context. This occurs because the OpenSSL error
code returned aliases with the SSH_OK code, resulting in libssh not
properly detecting the error returned by the OpenSSL library.
This issue can lead to undefined behavior, including compromised
data confidentiality and integrity or crashes.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5987

Upstream-patch:
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=90b4845e0c98574bbf7bea9e97796695f064bf57

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libssh/libssh/CVE-2025-5987.patch         | 37 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
new file mode 100644
index 0000000000..08395e0e7d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
@@ -0,0 +1,37 @@
+From 90b4845e0c98574bbf7bea9e97796695f064bf57 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 6 May 2025 22:51:41 +0200
+Subject: [PATCH] CVE-2025-5987 libcrypto: Correctly detect failures of chacha
+ initialization
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+CVE: CVE-2025-5987
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98574bbf7bea9e97796695f064bf57]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/libcrypto.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index 76e067d3..69a850de 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -771,9 +771,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
+         SSH_LOG(SSH_LOG_WARNING, "EVP_CIPHER_CTX_new failed");
+         goto out;
+     }
+-    ret = EVP_EncryptInit_ex(ctx->header_evp, EVP_chacha20(), NULL,
++    rv = EVP_EncryptInit_ex(ctx->header_evp, EVP_chacha20(), NULL,
+                              u8key + CHACHA20_KEYLEN, NULL);
+-    if (ret != 1) {
++    if (rv != 1) {
+         SSH_LOG(SSH_LOG_WARNING, "EVP_CipherInit failed");
+         goto out;
+     }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 357b59ec98..aa69d3a3e2 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5372.patch \
            file://CVE-2025-4878-0001.patch \
            file://CVE-2025-4878-0002.patch \
+           file://CVE-2025-5987.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.40.0


