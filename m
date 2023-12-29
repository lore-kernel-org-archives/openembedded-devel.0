Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEAC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:49 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.156016.1703876569091645166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chbeM8EX;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e82f502a4cso45944097b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876568; x=1704481368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJNDVDRrO9sKpZTB55c91+Ep/FvQCP53nojLAKWglxg=;
        b=chbeM8EXbIVzhxrncGeFIx2g24VN+Cuk7DDdtHHjJulCz1ldN/N7tzyLNq2k1WIv4k
         fLNAyCZIGVqx205XF/KvOyG5XbQQJ+bLelRNW0LrCr4vLxUXwmFzpDkVh0gtFaTHR4Yi
         YbHoqA80iZtpq9px1Ek+AldNGW3yxUd21k8to4wbpWzBYux5inCxnRftTA18XkkjcvAF
         9p6zPmCGe7JkltVR8xCQ2f658iCpaorohWonKEwMF/r+RfonaDxuihzj5H/WKIWTMg+d
         BJmyjsjIySJFatROVR4Kbbu7sLHGv0JiDnJsni/9BoySEL1PJ48J2EypsIj65FrjWrT8
         6j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876568; x=1704481368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJNDVDRrO9sKpZTB55c91+Ep/FvQCP53nojLAKWglxg=;
        b=EFfjY3kdo8ZdJlNkohYAQtuXz9rgEtiHt2TnFbMvbm5p6MLD0KlFopXmfMY3E6PB6z
         JYtM4hHhBmzl/6wF3KYMfMTMUn6y6wS5k91NnOXD6N+AXsLRUFhLk96R0WcfkHcLbmdO
         D9IaPdau95dhDoygrN5bjAFc5badWE+hckY8haQMVxBXCKSOibSNPhzDEy6lEYIAlonJ
         NIziqZ1liKzadsFNDzVrhWcOauthhAxT6uKQq+dFBpXQGKvzUVo7RWXPGq8w/B5D1Hc2
         /R/e1p1r7kZITgsDGw4T3USdyaxKCunD2XBy2nbvT71fl5zgU95KNyUbKooVbn1CZ7PH
         70FQ==
X-Gm-Message-State: AOJu0YySfl3ZCtYW8Mlyu4mGpgJiTDZBPKELUb3Rna/nVZfivAmmB16y
	5KIrSpuT84hhejL3lTZyWFKIlqpZIFBzHA==
X-Google-Smtp-Source: AGHT+IE8IKt7LAdQaMYBVchsMXxleiFp5CbGW5LLDVnTh0LoGIYFmrQb/y8zEfFk9ERzQbZRDaxg8w==
X-Received: by 2002:a81:6fd7:0:b0:5d9:7528:e3a7 with SMTP id k206-20020a816fd7000000b005d97528e3a7mr5206277ywc.84.1703876568068;
        Fri, 29 Dec 2023 11:02:48 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 15/17] strongswan: upgrade 5.9.11 -> 5.9.12
Date: Fri, 29 Dec 2023 14:02:28 -0500
Message-Id: <20231229190230.135480-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107897

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a vulnerability in charon-tkm related to processing DH public values
  that can lead to a buffer overflow and potentially remote code execution.
- The new `pki --ocsp` command produces OCSP responses based on certificate
  status information provided by plugins.
- The cert-enroll script handles the initial enrollment of an X.509 host
  certificate with a PKI server via the EST or SCEP protocols.
- The --priv argument for charon-cmd allows using any type of private key.
- Support for nameConstraints of type iPAddress has been added (the openssl
  plugin previously didn't support nameConstraints at all).
- SANs of type uniformResourceIdentifier can now be encoded in certificates.
- Password-less PKCS#12 and PKCS#8 files are supported.
- A new global option allows preventing peers from authenticating with trusted
  end-entity certificates (i.e. local certificates).
- ECDSA public keys that encode curve parameters explicitly are now rejected by
  all plugins that support ECDSA.
- charon-nm now actually uses the XFRM interfaces added with 5.9.10, it can
  also use the name in connection.interface-name.
- The resolve plugin tries to maintain the order of installed DNS servers.
- The kernel-libipsec plugin always installs routes even if no address is found
  in the local traffic selectors.
- Increased the default receive buffer size for Netlink sockets to 8 MiB and
  simplified its configuration.
- Copy the issuer's subjectKeyIdentifier as authorityKeyIdentifier instead of
  always generating a hash of the subjectPublicKey.
- Fixed issues while reestablishing multiple CHILD_SAs (e.g. after a DPD
  timeout) that could cause a reqid to get assigned to multiple CHILD_SAs with
  unrelated traffic selectors.
- Fixed a possible infinite loop issue in watcher_t and removed WATCHER_EXCEPT,
  instead callbacks are always invoked even if only errors are signaled.
- Fixed a regression in the IKE_SA_INIT tracking code added with 5.9.6 when
  handling invalid messages.
- Fixed adding the XFRMA_REPLAY_ESN_VAL attribute twice when updating SAs.
- Correctly encode SPI from REKEY_SA notify in CHILD_SA_NOT_FOUND notify if
  CHILD_SA is not found during rekeying.
- The testing environment is now based on Debian 12 (bookworm), by default.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 077489fda8f27336942457da1eaa022804f327c2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
index fb1bea2d87..87d12bc6c8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d"
+SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


