Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2F5C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 04:08:35 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.53047.1702613307411108460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 20:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OkZFm60G;
 spf=pass (domain: mvista.com, ip: 209.85.210.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9dadc3dc0so295313a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 20:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702613305; x=1703218105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HqG3QtTrdpo/sM7YWylDZmTpZmAkdXR+6z0tIlqJEP4=;
        b=OkZFm60GZK+5yney1NeYb87GcMBajfTtiPeRDEO07KlOUXTF1d2t2602n6hJD/2t2L
         IJpxTIk0Paz3pLkqH7q4cYFKzUKt+1674xRlCOrxma0a9DCwjtAhVyrbl5S2WrjNWba+
         dSwzdgeVWJL6K+sl5T6kkHUuR1KyQcZ58CSgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702613305; x=1703218105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqG3QtTrdpo/sM7YWylDZmTpZmAkdXR+6z0tIlqJEP4=;
        b=FRnPAP4Cg0meylIWgxn0t03L8Wlqin6RpyeIiwk+8zQorvdT8DxYW+VXTyuFPCI7NU
         LLLnRHuRLtmOD2D25oQsyPCGONgqmlgq7e4UoACfPD9E/9BIsLS4D4fhY0sUf+Cpv7J9
         wZpkd5OaKHLczYNrLR2Ei9Am2p7wR92xpFX9f49f9UL12uMAnTSZ2QrAVymibch815Iu
         qLK2KDfdDA7M8Cl1mpLPpI3jFQY+FIFKV4FD+FZ05vd+KTh58oF0qZOSDUGMKKKFgYmd
         qlZwNQSG1sSgr90lyhN9t4SV6vFlX4gRDVpvFTqcTjCg/+gDZ0JqDLpOwBijcRIVQ8Wb
         cUrA==
X-Gm-Message-State: AOJu0YwD5MMLIute4018FypCOhKFPNliBSerl2BZ+zca+l0w6l9etgKB
	O8oeSfrsoG3f/sNkb9x56Gu+PgkSZd62Ry0Z8kY=
X-Google-Smtp-Source: AGHT+IH6pRq9ZFSGHpMdGX/2J8m52+76XuK1Qgaidz3nlIFRlMLGDYQSWDm/zBTeJvO5/wPWUbh91g==
X-Received: by 2002:a05:6808:6506:b0:3ba:dc4:2f5a with SMTP id fm6-20020a056808650600b003ba0dc42f5amr8581505oib.116.1702613305607;
        Thu, 14 Dec 2023 20:08:25 -0800 (PST)
Received: from MVIN00020.mvista.com ([122.174.153.115])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a734800b0028ae9cb6ce0sm4061559pjs.6.2023.12.14.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 20:08:25 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] strongswan: Backport fix for CVE-2023-41913
Date: Fri, 15 Dec 2023 09:36:01 +0530
Message-Id: <20231215040601.391295-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 04:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107486

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2023-41913/strongswan-5.3.0-5.9.6_charon_tkm_dh_len.patch]

Reference: https://www.strongswan.org/blog/2023/11/20/strongswan-vulnerability-(cve-2023-41913).html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../strongswan/files/CVE-2023-41913.patch     | 46 +++++++++++++++++++
 .../strongswan/strongswan_5.9.6.bb            |  1 +
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
index b8d44db26..c4ff80973 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-enum-Fix-compiler-warning.patch \
            file://CVE-2022-40617.patch \
+           file://CVE-2023-41913.patch \
            "
 
 SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
-- 
2.25.1


