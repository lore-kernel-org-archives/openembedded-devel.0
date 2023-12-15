Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707BEC4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 10:13:48 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.59718.1702635219771237966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Rw3pKoE2;
 spf=pass (domain: mvista.com, ip: 209.85.210.52, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6da45aa5549so395832a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 02:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702635218; x=1703240018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy9TL6sU0rFA5/qCuOSSU0HHREVp8zd+KbGk9lwOnuo=;
        b=Rw3pKoE2mLEFtX2vQswAKV68fcvHAi9u9gOKh9kEfgYljPY/I19GH1BXDNauw0DdD4
         TZmhpApaEKh/qyyV+/sJDoo1oqCNcU4gdad6817ZHWp2DK26Lyiuo52VzWWhSMzPUzVM
         OTdTfBvsdmGmkPyvl1lBL7DRTk0OpJ8wnJpIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702635218; x=1703240018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy9TL6sU0rFA5/qCuOSSU0HHREVp8zd+KbGk9lwOnuo=;
        b=QzNFBcEzuikxK8GfTsXEwXUEt4irERlUBT+VVWP8gyvQ70owWhk3Rfn9Tz2DJFSDzZ
         3i8yIfsGh+uv7w8bmQrxcZmxDkgnKuRizi9ZHGmxe57hRQcQHinzXZWioRe0J9eEVpOH
         3UH5ZBuY6tAQlwSiAjbFo8XxENEy+TXVrMl+lAzfPrUgnb6dvS97U0KFUBnEqmP4mv5O
         VSYqDVS9dyx7fsu9NcFfTy/h0osQfH8cVaX2WhLrxFdmGlsEFp9hnc/8CcgtAxFhq40T
         v4OUAz7dzGLkNE2Gjk+JtCXvXvmQRqC8X/9PshgDi11J3VpaMmNKe9TKc8zYInZfK2Ti
         0ToQ==
X-Gm-Message-State: AOJu0YwhrHWPdCSSkyu/HXW66pnu1xCQyiPjdLarjKbmPZ4nF0g4ZX4N
	GbdPB55uiYzhJ998aJyDPKpdt8qlA7zhYJDsf/8=
X-Google-Smtp-Source: AGHT+IGjhZDlByn2lSNq64QLao2rGoiThQS6OibX4LpVqK83d0/tLGudepurqZjJ7J+3JMcDuViBTQ==
X-Received: by 2002:a05:6830:160c:b0:6d9:d535:f28b with SMTP id g12-20020a056830160c00b006d9d535f28bmr12737291otr.15.1702635218101;
        Fri, 15 Dec 2023 02:13:38 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c0f:7eed:1e55:99e6:364a:afa9])
        by smtp.gmail.com with ESMTPSA id s16-20020a056a00195000b006cb574445efsm13224588pfk.88.2023.12.15.02.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 02:13:37 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] strongswan: Backport fix for CVE-2023-41913
Date: Fri, 15 Dec 2023 15:43:18 +0530
Message-Id: <20231215101318.580279-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 10:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107515

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2023-41913/strongswan-5.3.0-5.9.6_charon_tkm_dh_len.patch]

Reference: https://www.strongswan.org/blog/2023/11/20/strongswan-vulnerability-(cve-2023-41913).html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../strongswan/files/CVE-2023-41913.patch     | 46 +++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch b/meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch
new file mode 100644
index 000000000..c0de1f158
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2023-41913.patch
@@ -0,0 +1,46 @@
+From 027421cbd2e6e628f5f959c74d722afadc477485 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 11 Jul 2023 12:12:25 +0200
+Subject: [PATCH] charon-tkm: Validate DH public key to fix potential buffer
+ overflow
+
+Seems this was forgotten in the referenced commit and actually could lead
+to a buffer overflow.  Since charon-tkm is untrusted this isn't that
+much of an issue but could at least be easily exploited for a DoS attack
+as DH public values are set when handling IKE_SA_INIT requests.
+
+Fixes: 0356089d0f94 ("diffie-hellman: Verify public DH values in backends")
+Fixes: CVE-2023-41913
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2023-41913/strongswan-5.3.0-5.9.6_charon_tkm_dh_len.patch]
+CVE: CVE-2023-41913
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/charon-tkm/src/tkm/tkm_diffie_hellman.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/charon-tkm/src/tkm/tkm_diffie_hellman.c b/src/charon-tkm/src/tkm/tkm_diffie_hellman.c
+index 2b2d103d03e9..6999ad360d7e 100644
+--- a/src/charon-tkm/src/tkm/tkm_diffie_hellman.c
++++ b/src/charon-tkm/src/tkm/tkm_diffie_hellman.c
+@@ -70,11 +70,16 @@ METHOD(key_exchange_t, get_shared_secret, bool,
+ 	return TRUE;
+ }
+ 
+-
+ METHOD(diffie_hellman_t, set_other_public_value, bool,
+ 	private_tkm_diffie_hellman_t *this, chunk_t value)
+ {
+ 	dh_pubvalue_type othervalue;
++
++	if (!key_exchange_verify_pubkey(this->group, value) ||
++		value.len > sizeof(othervalue.data))
++	{
++		return FALSE;
++	}
+ 	othervalue.size = value.len;
+ 	memcpy(&othervalue.data, value.ptr, value.len);
+ 
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index c11748645..9f676d0b1 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2021-41991.patch \
            file://CVE-2021-45079.patch \
            file://CVE-2022-40617.patch \
+           file://CVE-2023-41913.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.25.1


