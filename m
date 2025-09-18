Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D344CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 05:14:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6685.1758172479399389492
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 22:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NVB/6mpB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135658e2b6=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4dx7a2869709
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RiriD/pOT3u4UlHZWXKdVnbVIvU3Nr2dsG0L5VqF8Nk=; b=NVB/6mpBQ9k/
	Ur2zVYoMcei07iZzGhnEscPckxlUEcuSi2zbg7fHsgQhkqqriPEN4KrmAPQL1zoR
	PV7LalFAD3Lk4qqrk9/Pv3YuHcIxiiBt4fPmYHi4PnuIi/0w2JR3aJ30dvITx8Qg
	wqXYp0MWkiVFUH7FUj+J6jcTclTgts31F6U90rMKfVlvBZco5/B7XccEIhABSyut
	sLeGIS0505ruSSjMqylHoD2ZUmCgEdnKpzLT5zTg+FtwEiv3a7l+ydgnogUTTNu5
	+yjjHpL6DBULcsQ5+7nOikgllybA6fOiMJDqX6AzXBbcOFjPCEu2jNmtaSrY49Sq
	FnKmCSOtdw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwrsnj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:14:38 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 22:14:35 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH v2 2/2] libssh: fix CVE-2025-5987
Date: Thu, 18 Sep 2025 10:43:51 +0530
Message-ID: <20250918051351.2815039-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250918051351.2815039-1-divya.chellam@windriver.com>
References: <20250918051351.2815039-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: Dvk4fPbB30UPMBrQwkyiWk_2Xa0N7Lgz
X-Authority-Analysis: v=2.4 cv=Sdr3duRu c=1 sm=1 tr=0 ts=68cb953e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=xNf9USuDAAAA:8 a=nar8ntqeAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=_9gtbkrcAAAA:8 a=1E69uE0ZlsvtWQdOJBwA:9
 a=RptMqvEBejqe73AKBt4K:22 a=FdTzh2GWekK77mhwV6Dw:22 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA0NSBTYWx0ZWRfXwc/n/0SBEfJ0
 RxJ5G7ekIx+MWMSLgJdtB8vmMW7lHQ3+IOQFXBcyogImsSKEs9JR4pnB/jhHzKk7S87g1ajxhA2
 CEcZtQuqb0Z0dBn5RtlQkuOyDBYrxjUnt5wHD/FhEIaFuByWkgl8OmS+gkiF/p0eRF8A7SfpYvI
 ROA00EMaJZeXMBJMnqDQBibZonx+mzKsb7QqAk+7YvTf8g8RT8sJB821PDwVK7eeevqYlcsu5DH
 8S+Ag0dXK0RB23433k0lR5Lecv4i9dWQ1Gnh0Xq8i7hNqBEjZNIFzfSf39YlvRbHxjwvr+BpXCj
 pAbKg2tO3Eea06WdC5snSs5hJW0MCdMw2bdpPkzRaszJps93f9D6iHoNACUSxE=
X-Proofpoint-GUID: Dvk4fPbB30UPMBrQwkyiWk_2Xa0N7Lgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119519

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
https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98574bbf7bea9e97796695f064bf57

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
index 6932da5175..bf91e69bc8 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-4877.patch \
            file://CVE-2025-4878-0001.patch \
            file://CVE-2025-4878-0002.patch \
+           file://CVE-2025-5987.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.40.0


