Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1922C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:42 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.727.1790224416374566366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Do5w+nZ7;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc4c3304833so760372a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224416; x=1790829216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+X8IxMYmMycn6JsDTax5c7WqoUCis5/wvpTpU1NeCw=;
        b=Do5w+nZ7CzUzIPH9MVn9ZzrZnV7HRU8RxFUmqDzlgqIBtjrZtk6jVdZFcfaW6J0taz
         msR6IE+LEqGnmK+bBZh2E4kIm5ly1UPkBDPhPedASFP2z3NLteQj0OUNFVUyfKmlFlzC
         EFRtJ7Mr/FHff2MdO1HuJiRvF5i346aaQaH7PLWnuvVE64wwBC9aZUiUOJnyG9FbQzq6
         nmKyVPKUG6zYXq5QeaUkDnxwp2wjhYp93/pxZEnUiheAYm1PxCAibKDuJ3Cptv7tbKCf
         ZSWJLwESXHheQoyCvYTwytGds310LYBvDtHisxyRP0yoFrdh9yiuaZA7dFTD4RvfuaxT
         v+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224416; x=1790829216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+X8IxMYmMycn6JsDTax5c7WqoUCis5/wvpTpU1NeCw=;
        b=qQ9fGr9P0qdhldQsr9hMF6SzmCstpv6MIH8XcAGgcU0tbkJMKTeP/CMx8a9OSS2IQp
         DrGnEDINSj1N6xB9LN309hsgKFHLyebrEhgt22QuAsepSuAwxLBSbDYWM/8ImrhldJUg
         i6hdJQgYaQeb7OxgwC7ZMYK7K6uR9fUdQFD6RfaexFGUGU9bU6xeoicaGdkmNGbqIGzW
         293WbVEfBkcYErD+Z2di6xiYiMtG/JAucd1onBUF3DQs874ppqXDIiBk5LdARFWSLcYa
         Sq8XYcDXCByAX8KFxahKBfBo70bLd+a3NeOqhkBvcl+IIHHgewSaAxi7JYgVj3M6w6x8
         DIJg==
X-Gm-Message-State: AFuF++lx6v6UAhoGIgUuhmVkkSfwQjAMSynQ9bsuXPRARFlxF8d1xyBG
	ymwkQV0g4gPKzvfJ/sOyu+b4GhZCtAbpRDXHPud8O7zKCOP7UzUVwGzdYhtvog==
X-Gm-Gg: AYBFou1q42yP30/xxSrOqp7nMUMPXdNvLwp/tnGzBOXwkbrNhW8HprWF6vmTncRhHrX
	4SB3g8iQkm6K/19A0xsGr5xeG/k7Qs/tTdXhw2H81LMixN2gJlwfMdpweNqK73f0g2SIV/qe4u3
	ow+HtKQjHXZe+pNF1BWBd1K8/Z3JTevjIe/T2U+FdttqSq6sL39w/wtWol3KsTxlvDxctnmOM2e
	dbQI0el7YWW/mjmGTbs1KDHh0zRgGlhXKUs+0Re5XrNRH2UW5WVBauI3e6uosjtPoCg/ptq3eYK
	8OlJ1oV3C73v/TJO8T3Z1RL7dkb2g87Fb/bSEJJ63vYXvnoNOac4pdatfmbwCiUSXxACg5HNBrj
	0NH/0Lorf0SmjX5blUB6SOdlhdoGiaTmPUhkQZ5ej3PVMezSFhDv7C3EE0VRzv0SRI7SmoX4hOz
	isCDvtPpURDgQOnuLA5y0aWGxykYGJ+U1mSdCjhF2sXw8+vWc8gncEk2wmZ7yjNGOAMC3CW6Bmx
	F/NgH1szIRUJ+bNScJsnt8=
X-Received: by 2002:a05:6a20:ce44:b0:3dd:a196:906d with SMTP id adf61e73a8af0-3de0e93798dmr1022463637.55.1790224415697;
        Wed, 23 Sep 2026 21:33:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 7/24] strongswan: patch CVE-2026-78126
Date: Thu, 24 Sep 2026 16:32:57 +1200
Message-ID: <20260924043315.1663186-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130255

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78126

[1]https://download.strongswan.org/security/CVE-2026-78126/strongswan-4.4.0-6.0.7_eap_aka_sync_fail.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78126).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78126.patch           | 37 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
new file mode 100644
index 0000000000..9d4ce09d38
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
@@ -0,0 +1,37 @@
+From 13aa926cad7ec7f668249b6513c938b8c2e95af4 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 4 Jun 2026 10:00:02 +0200
+Subject: [PATCH] eap-aka: Only accept AKA-Synchronization-Failure if expected
+
+This fixes a NULL-pointer dereference if the client sends such an error
+before the server issued a challenge and allocated this->rand.
+
+Fixes: 26e246769224 ("ported EAP-AKA branch into trunk")
+Fixes: 4735965fc048 ("EAP servers check if the received EAP message was expected")
+Fixes: CVE-2026-78126
+
+CVE: CVE-2026-78126
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/7bedb451346261370256d390a8c155b86e4b455d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/plugins/eap_aka/eap_aka_server.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libcharon/plugins/eap_aka/eap_aka_server.c b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+index 0712ccc..95d4b03 100644
+--- a/src/libcharon/plugins/eap_aka/eap_aka_server.c
++++ b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+@@ -505,6 +505,12 @@ static status_t process_synchronize(private_eap_aka_server_t *this,
+ 	simaka_attribute_t type;
+ 	chunk_t data, auts = chunk_empty;
+ 
++	if (this->pending != AKA_CHALLENGE)
++	{
++		DBG1(DBG_IKE, "received %N, but not expected",
++			 simaka_subtype_names, AKA_SYNCHRONIZATION_FAILURE);
++		return FAILED;
++	}
+ 	if (this->synchronized)
+ 	{
+ 		DBG1(DBG_IKE, "received %N, but peer did already resynchronize",
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index e7a5370f03..82dbd3367c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
+           file://CVE-2026-78126.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

