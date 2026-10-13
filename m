Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2D1CC6B10
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:48 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3517.1791885580595251109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KwfQbeln;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1758583a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885580; x=1792490380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kl4iyfn1rSLP8mcMOluUdNGkgVtSTu7Y/Di6Nt6CjxI=;
        b=KwfQbelnYciOJTDtO3zsRkQf0T1rrryIRPGZTEVGE1vQW9Sim9QexzhfgJoic2xuOX
         zvqAd+IgAaPhQ7i1e8xD6/UqkxkXw4dzc2KGI2p8c2NYTj648o69E/motELFw3j/uQZF
         wP2UQ6mBGGqG9p6tTz6BFc6lufmY+NMzVN+rjpjwCA0gwjMHcFpVniqKFOoNfsOT9jGJ
         eE09zEkRB+zTd/1WJeLBktw2Ib613OvuGol/LqyLukXLSuzDUHn3YZS6urg16QLp3Bst
         sQoMxqPmmoHyaQFRgEJ26FMkXEFMkcbk65knKO/2WOmsDzQISO2zPbQMuyMSGWqVffsg
         uIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885580; x=1792490380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kl4iyfn1rSLP8mcMOluUdNGkgVtSTu7Y/Di6Nt6CjxI=;
        b=v8bye9yUv1gPldVLyc4TkCuMVporn+ewZXTAQ6ci6o2jwhPq4FI8826IOuAbv1yJY1
         g2QkLgPk4zEbhL9cnwZRzN+dvLzG/19TL5bEAH1p0zh8FuDSd1OIt2P5asLCdjZORTEo
         havUeIl6+liOZ6iL53ngryW0Faq5OGO2flMoPwU7eeVSbSkD7kGqOoJ76YXa2XcOj9RS
         hkJU7FOi4HZC4kRGCRVlfBqVroXno1hVGRH668qP00dLJRyPFTDtqAVkMYZUQuRJom5W
         DREEEw7CQZmUYu4AdHhzXbf5630LFAL+M5KxBa4HoP66CCrf/4SzrpL38YOE5io3X/+U
         hAYg==
X-Gm-Message-State: AFq9FYLH8SmpJVidURoP4pTHorj+Z/GIDomAoXGWkvwAQKjg/b1+OOFE
	i9iTYVdl8rmA6qp9Q0p6Km/zmJWxTXSSYy67A75bZJu8Ydtg/vgfsIfvyexwvQ==
X-Gm-Gg: AYBFou36ubDkGnj5ByvtlQrFnPpPY51rN60D57u+nesn9/hshaeqg8N9L3PZdWkTz35
	L/1vW7toMzydbbgmeQGz4QMuwYKv8pZOMmaye6G/SsO8XsddeqHqv/JGa5pFoPldl+F0BFRWpnd
	leQPn2LKxCfePao2zyg3ehGTxxqQW/ZsAhyHHTrVJFgBgDal1piID+LoN7v+FXflhMpE3IeYndH
	BW78o/9G9nE9apzuwDHpAWjrvs4xlnqjR2gIJrBnS14EyPSUdd060yLMlSGly1xJVcfBmmzpGjZ
	/o2XalwhKt7iUeNatI+r4qRNnVIbj0+VVt+qzTFG89B2ZsMeUNGVSyLRKhVxxuJBQ6GPv44gAAw
	9Jhc9PweXz4tUQz39FfF6Qbw/OPNcVjmls8dr+xIuxV5019aXSNGK00aptS6PJXCilkf8huwJIt
	ZktpJ1RNZBLa2qaXE+pPFmkFgzC6Q0CqjMyOfbAavWQTL1X9Nmnvjuu6UISG7dI3qxIFbPhbjNS
	CmSphkp+fGkPIjViTFcmGiE+SkIEXojfH2Li24=
X-Received: by 2002:a17:90b:3c8c:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ab3af94c34mr9434397a91.67.1791885579947;
        Tue, 13 Oct 2026 02:59:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 11/28] strongswan: patch CVE-2026-78124
Date: Tue, 13 Oct 2026 22:58:46 +1300
Message-ID: <20261013095903.3544906-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130844

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78124

[1]https://download.strongswan.org/security/CVE-2026-78124/strongswan-5.0.2-6.0.7_openssl_pkcs7_certs_leak.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78124).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit dd0ba33ed20b4245c82c19b19c55b3710384ce52)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78124.patch           | 34 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
new file mode 100644
index 0000000000..5e37ed671a
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
@@ -0,0 +1,34 @@
+From 36ce778a76b4b912699a52cf1109394fce109c83 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 15 Jun 2026 16:02:01 +0200
+Subject: [PATCH] openssl: Fix memory leaks after enumerating certificates in
+ PKCS#7 container
+
+This can be triggered via IKEv1.
+
+Fixes: 04884be3b5f7 ("Implement openssl PKCS#7 certficiate enumeration")
+Fixes: CVE-2026-78124
+
+CVE: CVE-2026-78124
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/49bf0725fa61198d1e29d5b4c2651c9190b2c10c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index b15c8d7..cefe1ae 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -132,6 +132,10 @@ typedef struct {
+ METHOD(enumerator_t, cert_destroy, void,
+ 	cert_enumerator_t *this)
+ {
++	if (this->certs)
++	{
++		sk_X509_pop_free(this->certs, X509_free);
++	}
+ 	DESTROY_IF(this->cert);
+ 	free(this);
+ }
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index a7636554a6..82cd4738fb 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
+           file://CVE-2026-78124.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

