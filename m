Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954BBD3941A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 11:59:14 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13968.1775131147564948699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 04:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JsNYGLJs;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76c60c7502so389844a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775131146; x=1775735946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1kk4C22Cq/U1PZdl0jB2Q3VnF5jdhZ581lophpRtjo=;
        b=JsNYGLJsRp+ep0eOhPC+dcAQ5hVdM4jNaYDk5f6eCTn2Du2v7FebMI7zZQGVoa3cUO
         Srl7zALPF1vXktAtvkXHjZ5apK/j8oaiUNPZtk0h87SjHAyisIRVZL6oWl0bvKorRbox
         237o2NtKcnvncYXJnuuhO1A74heSA+0tvYuBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131146; x=1775735946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1kk4C22Cq/U1PZdl0jB2Q3VnF5jdhZ581lophpRtjo=;
        b=Hiqecnq0vGDlKUtYRI9ouWn9cjmglzyxys+gfvPY9RkKofTRZjCzF6NN5ePLISIXuD
         LVMaR1iR/PHg0nNd3dljhBINwTIZfyXOyT2Thgal/pelBmTNlxKv5U0P/jl9yaLx/rVh
         1rD/DyaggiHLX7Cdak9AAo5yLwaMaSsJ8c8MDZSsk7EON76ihHVWxQbiiMk+7vXEc9xZ
         P50R4YRtO8Fuims5fAJyDbzLbo9Crld1xVoPXuh0sZPEILQX6x19ajaZ9veoVefmRzg2
         K7QGyC6h92BXIhdDPDQJZlZ+bCpHEeoXLocG+dUbM4VDr8d+h1Z6Q6YyOXPamdoeMxdo
         ambA==
X-Gm-Message-State: AOJu0Ywq8/M7AAvDoqD7r+vGMCBBHbr9ZziPA6QkLR62WL9zri8g73Ze
	qpKRMYJw/iDWvP1/vGGpCWgYBXlZbd9XDglQY0CEr6/fut1AGBZGEsRm3OY7RXpfk4U4Q2RRnlV
	NIhmDt1o=
X-Gm-Gg: AeBDiesWVQfispmWR58xeF4AHp3fIxXbiYnQwcXMPDSIKV6YgTDua3Y6PUZ1Jv7Zedo
	rX9GNQcCzFZNWoSauHICyBzhXqXFmji2oNiLdVOSD1rJ4wviBg5Z+YO8y9TdXHVLYQWJI3l0eY3
	jSWbweyS5/AywJgjJvV84f7lbiB4z4H8TokhJfXEVjxpAKb2F+x6MtJnX97Fi0vab1hhdD8CRj0
	eQSsO6uqYIm5xpy/a9vS7A7KleGgVVd7UlLlYYixKXyV6uJ/g0gNwxNSneyF9BzosSACGFM5nFX
	j7+lOVUkph8nPnNHBAcOcwu/tCV/TPXichFwjl+4mrnz7P6wnQKqxqyCibZFvCHUg7iz5UaoH5r
	R4d5kduYY2rci31L1Xkx4O/+7F8G3GHYOAJJppullQjvnq/pufE2EbNvqSpZToK+9qG9AzvLUub
	DH9IbA+yhiBAFy49lMmonm5dlAhEbmu5+ZtcL2ZZQ=
X-Received: by 2002:a17:903:2b03:b0:2b2:58d9:3f3d with SMTP id d9443c01a7336-2b277dc34a1mr21493675ad.8.1775131146279;
        Thu, 02 Apr 2026 04:59:06 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:1ab6:137a:d6ee:8373:3de6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d20bsm28309055ad.16.2026.04.02.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:59:05 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch] strongswan: Fix CVE-2026-25075
Date: Thu,  2 Apr 2026 17:28:57 +0530
Message-ID: <20260402115857.609116-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125964

Pick patch according to [1]

[1] https://download.strongswan.org/security/CVE-2026-25075/
[2] https://www.strongswan.org/blog/2026/03/23/strongswan-vulnerability-(cve-2026-25075).html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../strongswan/CVE-2026-25075.patch           | 50 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch
new file mode 100644
index 0000000000..46ce5d5ad2
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch
@@ -0,0 +1,50 @@
+From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 5 Mar 2026 12:43:12 +0100
+Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
+
+The length field in the AVP header includes the 8 bytes of the header
+itself.  Not checking for that and later subtracting it causes an
+integer underflow that usually triggers a crash when accessing a
+NULL pointer that resulted from the failing chunk_alloc() call because
+of the high value.
+
+The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
+in a buffer overflow even if the allocation succeeds.
+
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+Fixes: CVE-2026-25075
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-25075/strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch]
+CVE: CVE-2026-25075
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+index 06389f7ca73e..2983bd021ded 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 		chunk_free(&this->input);
+ 		this->inpos = 0;
+ 
+-		if (!success)
++		if (!success || avp_len < AVP_HEADER_LEN)
+ 		{
+ 			DBG1(DBG_IKE, "received invalid AVP header");
+ 			return FAILED;
+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 			return FAILED;
+ 		}
+ 		this->process_header = FALSE;
+-		this->data_len = avp_len - 8;
++		this->data_len = avp_len - AVP_HEADER_LEN;
+ 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
+ 	}
+ 
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 4592381a36..820a1ad9e8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2025-62291.patch \
+           file://CVE-2026-25075.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.43.0


