Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE1FC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:23:01 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.42353.1635765779389841223
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HwrUzDgj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635765777; i=@fujitsu.com;
	bh=ThAaFZeXflr7aZUnahOAPz2eIbMisPVZ+1EV8ZS/bgE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HwrUzDgjo2zN+EoNf7nSqTdGfUN1lx8853gtm0vTovzc3yB9zmEVlRU0sM8FojVw3
	 4r4S31a0gb/BjjiAM8uHfR++BzSaOfFCp2Sg+A3K4Sn8FK8XzvuWsqK+dS4zeihp1U
	 kEBwM7OmF46l0579oLFn+01Bx93t0PYNbGZq8XR5//Gnh3yRY3sf0SSnTOqc2VZA+e
	 Cn+7gn4XQpvTCgYRfBzeY4XRv1mucbIH9c00x5o01tefNgwv9tT6udVozyjiTIG3ja
	 dM7FI48QKKiptOZ5jr4vuRtEMvQ10cbBXWjF/zbH5Teuv39+7HTvro/dDJwZnkBEBs
	 JWqhM1bzwPmew==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 8A/18-29929-11ECF716;
 Mon, 01 Nov 2021 11:22:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVVfgXH2
  iwd/f+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b71/uZCo7wVnT8DW5g/MzdxcjFISSwmUli
  y/c+1i5GTiDnBKPEia9yIDabgJrE9Fs3wOIiAvoSS2fvYQaxmQVUJF787mEHsYUF7CW6rkxgA
  7FZgOJfzj8GquHg4BVwkug+JQYSlhBQkJjy8D1YK6eAs8Spu3fZQUqEgEou9GqDhHkFBCVOzn
  zCAjFdQuLgixfMEK2KErMvN7NA2JUSq1b3MU9g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11gaSxgV5ilW6iXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwFFMKGZp2ML57
  9UHvEKMkB5OSKG/U0vpEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8KWeAcoJFqempFWmZOcC4g
  ElLcPAoifAuPwmU5i0uSMwtzkyHSJ1iVJQS570C0icAksgozYNrg8XiJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvMxngabwZOaVwE1/BbSYCWjxPrEakMUliQgpqQYmIU+fjqz4TOvvr/K
  ta93P2zQZGdw50dloHfllpbRK9VOme+q2J6IiV6s132hZpbhG6Ln3583p2nK37LN+ZCnZm2i9
  aPOJaJz0R+Fg9U3Gf36GXd01a3d2NOg6aH9kuLfxCs/GlFOPK2I+HXyfUmN8LdolTt+jXszVy
  630d4zZyhixy972NdtCBLsfeO7P870i1SO564TPMc+rq2N8X0vc0Jj8tOhf3PoJp9c5yJh+VQ
  tkN5FNkjo+tUTubZSRxPRggYBqEZYlyoeYTTJ9P/sotq6dWflu+RtG5+Ob2Ret4f5cY3jbXZb
  5rJzMiZ9MEzs+FMdnZC2av9Jv637z7RLPMkWPccaxrDwlenhxtRJLcUaioRZzUXEiAPAYBtJA
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-228.messagelabs.com!1635765776!244859!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18536 invoked from network); 1 Nov 2021 11:22:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2021 11:22:56 -0000
Received: from R01UKEXCASM224.r01.fujitsu.local (ex2k13_224.fs.fujitsu.com
 [10.182.185.122])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A1BMo7u006392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Nov 2021 11:22:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 1 Nov 2021 11:22:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] botan: upgrade 2.18.1 -> 2.18.2
Date: Mon, 1 Nov 2021 19:22:25 +0800
Message-ID: <1635765747-37718-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
References: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93696

Version 2.18.2, 2021-10-25
Avoid using short exponents when encrypting in ElGamal,
as some PGP implementations generate keys with parameters
that are weak when short exponents are used (GH #2794)

Fix a low risk OAEP decryption side channel (GH #2797)

Work around a miscompilation of SHA-3 caused by a bug in Clang 12
and XCode 13. (GH #2826)

Remove support in OpenSSL provider for algorithms which are disabled
by default in OpenSSL 3.0 (GH #2823, #2814)

Add CI based on GitHub actions to replace Travis CI (GH #2632)

Fix the online OCSP test, as the certificate involved had expired.
(GH #2799)

Fix some test failures induced by the expiration of the trust root
"DST Root CA X3" (GH #2820)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_2.18.1.bb => botan_2.18.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.18.1.bb => botan_2.18.2.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.18.1.bb b/meta-oe/recipes-crypto/botan/botan_2.18.2.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_2.18.1.bb
rename to meta-oe/recipes-crypto/botan/botan_2.18.2.bb
index 62872ff852..c41667b453 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.18.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.18.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=a02e03c8fa2c5e7b9b3fcc1b9811fd3b"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29"
+SRC_URI[sha256sum] = "541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


