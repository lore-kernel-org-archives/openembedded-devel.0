Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09E2CCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:33:31 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13503.1792118004136979182
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cWUvbIWF;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2653; q=dns/txt;
  s=iport01; t=1792118004; x=1793327604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0n/6+9+5uSWUsqv2ccszKoideczniJ1KkOUoo0q9hQM=;
  b=cWUvbIWFMCRG1Fyk6rNWrtuipJ2CzuNHVYZWfW2jSQWRu/DwqyYctHEl
   qlD7l8HbrdU07gYy5s/RCBle9I3h1+LjQ++kz2tomt88QL8Y21j1AbOPi
   gqUpYxBoJfKIXI0wggQlqEtGOfilVzf02EvZ09sgNrdyakMmXHLbJyWbc
   0VHAMxWNA0q0Xylh7rAKVvJ0/aS49TkAf9CUz+5wR3NrFhGvJ4ry7uXU+
   sGYi1C1nfcS7TeqyOMwU5o10H4YMpA0wJym3UpW/35zlX4nLsxzkNf/pa
   aEeDxu6gE+wEqMYnwx2Y58/BPSVU9rH3rV/ItQvMAl7o5ENEVOgxYIobk
   A==;
X-CSE-ConnectionGUID: QrZ22wAnRpKuM0aAowKtDg==
X-CSE-MsgGUID: XtMeh2JmTh+iFWFaegSl0A==
X-IPAS-Result: =?us-ascii?q?A0BbAwDZi9Fq/5D/Ja1aglmDTGBDSZNZAYJwnh+Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2ARgBLTBcRIMCAYJ0A7x4giyBAYMpAYFU2z4VBYEzhUCII3aEf?=
 =?us-ascii?q?CcbG4FyhH6ECoEGhXgEgiJ6EoJdlERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSEx6CMTQWeTCCJwWlcKEPCiiDdowilToaM6pvmQikWYRpgWg8gVlwF?=
 =?us-ascii?q?TuCZwlKGQ/gficyAjsCBwIHDgMLkWgCJgeBTwEB?=
IronPort-Data: A9a23:PEuLz6vfMWNg8fXdxrDatLSmQOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTyCPP7bYjH0fdp+OY+x9EgO7Z7czYNkHlFt+Hs3RC9AgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIww/xFWztR3
 PoiMBMQS0iKruWp466XRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4fXFJoPzh3Cz
 o7A11TlJxwabv6a9TrG81yTqObCkhj/AKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:dgJ+B67my3DTSn9XzwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:Prs4s27/uOEnaOm/WtsszVQmQJo6W3vn1FTNBhexIGF2a6G5RgrF
X-Talos-MUID: 9a23:ZPus8QoEkqnILkr0mdcezwF+EcpouYarNEBOkLs5lcCJOhd0Yx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535972832"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:33:23 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 1702D1800049D;
	Fri, 16 Oct 2026 02:33:23 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id B30C0CC1611; Thu, 15 Oct 2026 19:33:22 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 0/9] python3-pyjwt: Security fixes
Date: Thu, 15 Oct 2026 19:33:13 -0700
Message-Id: <20261016023322.344365-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131015

From: Hetvi Thakar <hthakar@cisco.com>

  Use this body before the automatically generated patch list and diffstat:

  This series backports the upstream PyJWT security fixes for the
  following CVEs to python3-pyjwt 2.12.1:

  - CVE-2026-101917
  - CVE-2026-101918
  - CVE-2026-102267
  - CVE-2026-102268
  - CVE-2026-102269
  - CVE-2026-102270
  - CVE-2026-102271
  - CVE-2026-102274
  - CVE-2026-102275
  - CVE-2026-103001

  CVE-2026-102268 and CVE-2026-102270 are addressed by the same
  upstream commit and are therefore included in one patch.

  Each fix was selected from the upstream commit referenced by its
  corresponding PyJWT security advisory.

  Validation performed:

  - The complete series applies cleanly to the Wrynose branch.
  - bitbake python3-pyjwt -c patch -f completed successfully.
  - bitbake core-image-minimal completed successfully.

Hetvi Thakar (9):
  python3-pyjwt: fix CVE-2026-103001
  python3-pyjwt: fix CVE-2026-102274
  python3-pyjwt: fix CVE-2026-102269
  python3-pyjwt: fix CVE-2026-102267
  python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
  python3-pyjwt: fix CVE-2026-102271
  python3-pyjwt: fix CVE-2026-101917
  python3-pyjwt: fix CVE-2026-102275
  python3-pyjwt: fix CVE-2026-101918

 .../python/files/CVE-2026-101917.patch        | 311 ++++++++++++++++++
 .../python/files/CVE-2026-101918.patch        | 122 +++++++
 .../python/files/CVE-2026-102267.patch        | 223 +++++++++++++
 .../CVE-2026-102268_CVE-2026-102270.patch     | 113 +++++++
 .../python/files/CVE-2026-102269.patch        | 133 ++++++++
 .../python/files/CVE-2026-102271.patch        | 136 ++++++++
 .../python/files/CVE-2026-102274.patch        |  63 ++++
 .../python/files/CVE-2026-102275.patch        |  82 +++++
 .../python/files/CVE-2026-103001.patch        | 128 +++++++
 .../python/python3-pyjwt_2.12.1.bb            |  10 +-
 10 files changed, 1320 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101917.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101918.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102267.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102269.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102271.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102274.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102275.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-103001.patch

-- 
2.35.6


