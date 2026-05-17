Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7E1CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20215.1779006269542578832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SALfAbUy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jhJFkkN4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H3wIXS2749800
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAt2VWIjgXh
	30PeLozXoxGj+dn6jiQBqKcQ7370H+as=; b=SALfAbUy+cd+KX3A5+0NV6SMekD
	sOacURRoOsn3FpEOZRVwBMNa3/m/U6lfiFAAQxR5lXz9eqL4s6SaLd1HxA/gvjJM
	d9QEDdGX8YJu+6acIUdnf6x41LhOcmoWMPxv5qHNVHSZScIy1MDsE20SDDAEm+tP
	IHlshbXxZX/222lenCjkIOFTJy9/ZYd4lm4gbn/ESAcXMi+95qECaN5OeClF7RM7
	RzuWv94v9aQV36hzOG2gpGPMTogS7ydPXobvacu2izWmCDGKEV1ZOitGBdluSJEm
	mKSZZlPNWRDumnzoQo97dMfC86FzhLioJayBVqXLI3VnNgApIqXRUD734FQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01jg6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so1006607a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006267; x=1779611067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAt2VWIjgXh30PeLozXoxGj+dn6jiQBqKcQ7370H+as=;
        b=jhJFkkN4gXAjpe8LKcG45C0PNqOT0+m/jWG6pk/nr0op9LHxdHYsggw2AV4L/1MXJY
         eHexK5rk5PU8Oft0Kjj0qp5wpGGCVMnpJG5nFATbVe60vo5A4dioBjgoIUql5n1mzVwl
         smxeAVPYdK/PJ4bhEYWy9gXgcuzEzavOKOEaEAJaVCLkeb37q3jfJNjGNfDoiwlLyVuC
         tWTqAYSaBvKqtvYaNGEtu8rTrATcZeIO7NNn3e04Y9nDKO0IO1/pDALFcY14uwSzpbzi
         tZl/KbrEgQQAIMtUKhYx3Jm1LdDBnRgJ4WRtUHmpsn02VOYma8ZwGEptmC+LcmZ5BBz9
         vcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006267; x=1779611067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wAt2VWIjgXh30PeLozXoxGj+dn6jiQBqKcQ7370H+as=;
        b=FuY5RfHyimCCEinthY7Iv8QshFJ7xUy24Fol+cFvt68v9WUc+ZaiLuSUrVESaELU2/
         dKql1ev8itHCqQ+RmHdi6DvhzZi+WVi7IFRWaOSk5eBF9hR7jXpTv86i3ZWrAaaIkK24
         HdHpUf/HifUqLw4P1VhlUZDHJOY9aNIRSUa6gzrnOdgMT5UIbeT/dJfy14ELPgrrRQjh
         9U/d5r0fx3Hd/p2FXgKwVEaQ2FEK1ddO1sUpfE3AXLN7brsMWhTNW9uzA78MJq75jGo+
         5BAL67r9F4gRbPx9zQynpjdX629PvVZ4HGaDr+YWyGuzP2vhqtHZeZSDeRLV828FTDLk
         GVCg==
X-Gm-Message-State: AOJu0YwB22SxWvcw50rt9mx7nBpaP4GQbJnHfD6Y3sPg1GLd+0CesSZ1
	3VhrX1+xMfnPkbuhvoTn+k5xg7A9zx42Ul9xmQ90fT7jwM+x7Qk31DEJSm7blznYWuvlRXMBDIY
	ItjxutXoxInEuc+eOHlT/Js8f6tzw/rTpNEineZLzN051RWhK+8+GV8AHLsJo6KVuBLGNJL1mP/
	L30kVsmSZj7ILCh1QG2VaAyA==
X-Gm-Gg: Acq92OGm5FDUT0xABztiXr/4IC97YJIjiKjHJ+jRRl6zCWsb/qdgUWE4Xmk5+W1jbOh
	hIr2EOQD8EeexA/2ziL5UzpXGd6rf471rogz4uy3GnFgyCsKpC09bsCik+GJzlr7kq2jGIFDTGW
	P2StjOYGxiIBbwHL5P37nLv18tIgd02aE1Wcizbu9gOZQbLInBgoGy9yX7ZzVCXVQpSx+1oypEZ
	rx7fVNBjOuICSfbuBB7SUaU2Xd/QJuI2nQiwtaCwZOIj16kqkaIVMPVRSKgDkW9FeeoqFWVcwU9
	4CIwaylksshGBqw2VMfiXfTeoTpgvFmELDmlEk8h8ddCB/LUAiG9D/c7Ibmw1cS6I/zQ0m7Y3ye
	3aYmg73D3xvSI+mlDycYZLOKInp64+Egpu2eItmy6sC2GoAgND4Ac
X-Received: by 2002:a17:90b:2e04:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-369519fe820mr11232767a91.8.1779006267315;
        Sun, 17 May 2026 01:24:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2e04:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-369519fe820mr11232755a91.8.1779006266757;
        Sun, 17 May 2026 01:24:26 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:26 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 18/29] pkcs11-provider: fix build error on 32 bit systems
Date: Sun, 17 May 2026 13:49:46 +0530
Message-ID: <2eb4b4676292d25fc10e701874762d643e99e3ce.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XKZ0YhSU5oVMHrWG2X5sy_Bl6dziHN7M
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a097b3c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=HHBHslvIaBnq7a7NW5MA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: XKZ0YhSU5oVMHrWG2X5sy_Bl6dziHN7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX/Pa3Tgcrc+Qu
 boeS6Ylq9s+TaGm5BzpWPRUn8dAcIBgoMEENcYATukZSaOlWPRALgKyuDtnFBzVAElXMAdz60tk
 iQlrEDkgRX0Jy0+YU1xMvjKz5VswMArDGZNcGla19YWaFDIDsHltdESojN5xw1y+YTm4ex7cKQr
 4SIKGKAkwwejkXIvrH3ey8397LOzjO92FYOaM8gZFtJa1g+mRWGR1Dy/LWX+UAZautm2oXHmjIN
 NVoaBGGkEF3kheiEA7LtIkV01qREUmaUbZNhO+PF+m1gCutOz/h0SfJyr+6tRMSDWRQigeHRKMM
 txtNEUOB2w539k/ngRaO0eZfX4kPXIL3zEFKgOomVaMpURch1zXLvRB5oUzRy4Y8uESjdcOWDtI
 F1TLVpUBgCUwXt46ctiCfPMJ57L2JdbPh/DMxeVWsCHe41mrfHCcMt3uEFDMncJaPGOQGoQfPJ9
 5f3WF5Aihk57zWYEzAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127031

From: Fabian Pflug <f.pflug@pengutronix.de>

PKCS11 Provider did not build on 32 bit systems. Fixed Upstream with
https://github.com/openssl-projects/pkcs11-provider/pull/689

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3608cfdc5b3374ffe31bae81ce25ec69d9d20252)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...-Fix-i686-build-failures-in-cipher.c.patch | 62 +++++++++++++++++++
 .../pkcs11-provider/pkcs11-provider_1.2.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch

diff --git a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch b/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch
new file mode 100644
index 0000000000..479608b8f3
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch
@@ -0,0 +1,62 @@
+From aec4fe7e3c4d18cd5d0f98168df5884a141c6b69 Mon Sep 17 00:00:00 2001
+From: Simo Sorce <simo@redhat.com>
+Date: Thu, 19 Feb 2026 16:08:56 -0500
+Subject: [PATCH] Fix i686 build failures in cipher.c
+
+Update AEAD functions to use CK_ULONG pointers for lengths and
+introduce a temporary size_t variable for OSSL_PARAM calls. This
+corrects pointer type mismatches that caused build failures in
+Fedora Rawhide i686 scratch builds.
+
+Upstream-Status: Backport [aec4fe7e3c4d18cd5d0f98168df5884a141c6b69]
+
+Signed-off-by: Simo Sorce <simo@redhat.com>
+---
+ src/cipher.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/cipher.c b/src/cipher.c
+index faaa51b..4ccd3ad 100644
+--- a/src/cipher.c
++++ b/src/cipher.c
+@@ -867,7 +867,7 @@ static CK_RV tls_aead_get_data(CK_MECHANISM_PTR mech, data_buffer *explicitiv,
+ 
+ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
+                           const unsigned char **in, size_t *inl,
+-                          unsigned char **out, size_t *outl)
++                          unsigned char **out, CK_ULONG *outl)
+ {
+     data_buffer iv = { 0 };
+     data_buffer tag = { 0 };
+@@ -906,7 +906,7 @@ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
+ }
+ 
+ static CK_RV tls_post_aead(struct p11prov_cipher_ctx *cctx, unsigned char *out,
+-                           size_t *outl)
++                           CK_ULONG *outl)
+ {
+     data_buffer explicitiv = { 0 };
+     data_buffer tag = { 0 };
+@@ -1475,15 +1475,16 @@ static int p11prov_common_set_ctx_params(void *vctx, const OSSL_PARAM params[])
+                 return RET_OSSL_ERR;
+             }
+ 
+-            int ret = OSSL_PARAM_get_octet_string(
+-                p, (void **)&gcm->pIv, gcm->ulIvLen, &gcm->ulIvFixedBits);
++            size_t iv_size;
++            int ret = OSSL_PARAM_get_octet_string(p, (void **)&gcm->pIv,
++                                                  gcm->ulIvLen, &iv_size);
+             if (ret != RET_OSSL_OK || gcm->pIv == NULL) {
+                 P11PROV_raise(ctx->provctx, CKR_HOST_MEMORY,
+                               "Memory allocation failed");
+                 return RET_OSSL_ERR;
+             }
+ 
+-            gcm->ulIvFixedBits = BYTES_TO_BITS(gcm->ulIvFixedBits);
++            gcm->ulIvFixedBits = BYTES_TO_BITS(iv_size);
+             gcm->ivGenerator = CKG_GENERATE_COUNTER;
+         } else {
+             P11PROV_raise(ctx->provctx, CKR_MECHANISM_PARAM_INVALID,
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
index 1bdb4445e5..d95706d9e3 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
@@ -19,6 +19,7 @@ SRCREV = "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
 
 SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
 
+SRC_URI += "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
 
 inherit meson pkgconfig
 
-- 
2.53.0


