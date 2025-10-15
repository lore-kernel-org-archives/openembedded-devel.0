Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8C4CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 20:09:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.27964.1760558985645674503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 13:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAbtIF0I;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28a5b8b12a1so83535ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760558985; x=1761163785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJAd/6Jkiih/jtPucDfGmFLDMF1moAdChCdbgGH92M8=;
        b=dAbtIF0IOIHDJwEA7XpqoBnEB1svuPFfVJBd1NjGCZdDwp91rvjsoYG4VxIoIJN059
         d0+lOyboms8/G9MeDoWfypx9WDtycZ14P3xFwcy2WHG3bl+VzawV6HTo/bQYe2IUQk7R
         QK+y0AB1UCjZAobJZ/tbMZQfZKHdJySQPNANBs/IkeU/G2iQnKHNb5lJxvEnUgPv0ZfH
         0MRE7qmqRRTvSyZhU4QGG8FA1VA6yq8assuTOzxLiNvbs10WvW84DkROCsI6DcEPio1z
         HlXI/XjWK5USffe8zfH2qSwfwNigEDwh/PIx+gWGOyrYEiE4AmHsAVdS43peGF2kj/kZ
         kSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558985; x=1761163785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJAd/6Jkiih/jtPucDfGmFLDMF1moAdChCdbgGH92M8=;
        b=jKPeN42v6ICUMdWevoLj4z00lKgwicQyZ9pESx0e1Pfgt7FJTVkMyC1A6rn1jHZipT
         Fh4bfcv1+vg4J3Cxt2f8rZQebDPrFViwS0J4KqRaVGX+sEN7NQMVLVPsqPcLTj5KCvSk
         aMvRTvI9beWVGlba5k1T7AMNrsyFtP5Xx5iqwXQFxGo9H8hJxL+kI6k8jBp88YwdFUDU
         EawYQwtfygBB8z1oQX8kDmjJlJt45Sk9ycnbPNuP3MoobDSK/N4EMG6Q0n6ThqPyKw70
         AaMw0d7SNr/atHQHx6DkOK3cgyHoRxeV7590u0bZZ/ts5E4vErb6/gM4Ph7u+wBPg9tB
         uY2A==
X-Gm-Message-State: AOJu0Yxpe+J6Kmbq2T5f7LqM1Y9R7pJ8MWNvOlG01o6D7PcfU2syAjrZ
	sBg9sbJMa4fK39MybxZ6rd1B4djQSm0i/5oFdOz8A+DR6z/qka6ZZxWIqC13auoM
X-Gm-Gg: ASbGnctLuD2jtlNNXKyNQuhBik/wwpH206wA8sHa3aD0WIE8cZsKqA+W58x+js1obcV
	K3b6FSXUiLxUMK1CrjGJXV9IYb+BbeeRVTF9N0RmeMPMq3Wi5XrTgNIe9D/tEA1gEKvHNWObXDb
	9RSCWxgDKnZNgo8fUk/emzy70csw0x/Q4H9ycWlhei/Z95za9d2bFBa4KlcU3lPJEKQftF8oR5Y
	JeNeLJ/TNWyV+SEICEyVcTD4M1IYA0JWGwTr9h9nBFIbWLzYDdRgRsNMklhZa3QIkdtiD4w666w
	/bGAd17ns/YUNErTrJWiX/XcUqw5BpfqgdqFUpdKPCci+i0Gn5ha9YVzmynT0p/plkK9c7VhHAU
	epQevZnVlPhMGlsXQNN+J2fGj9EdRVEaZetSrW6O56wn+k7flrkZGrxUqXX3Wep+23IOKIa22fU
	C10cIGsaOwCo0kzXILxTnol5+BQyTSMEeWI0YQ25OZSbR9rPJQM6XUCH/zCkEqgmRli+kDZzcS
X-Google-Smtp-Source: AGHT+IE3PR6aRu0xYaEPwcUpG8SdKJEA1H93ORShaFLTvuP3md8TyZQsCK/3oohvsVHjUuF3VeXgsQ==
X-Received: by 2002:a17:902:e952:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2902735667emr380246535ad.6.1760558984494;
        Wed, 15 Oct 2025 13:09:44 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099313b28sm5181325ad.3.2025.10.15.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:09:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-lazy-object-proxy: Upgrade to 1.12.0 release
Date: Wed, 15 Oct 2025 13:09:41 -0700
Message-ID: <20251015200942.996584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 20:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120714

* Fixed testing issues when C extensions are not desired. Contributed by Michał Górny in #79.
* Added support for GraalPy. Contributed by Michael Šimáček in #87.
* Fixed testing issues on Python 3.14. Contributed by Michał Górny in #88.
* Modernized packaging to have metadata in pyproject.toml.
* Added Python 3.14 wheels.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ct-proxy_1.11.0.bb => python3-lazy-object-proxy_1.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.11.0.bb => python3-lazy-object-proxy_1.12.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
index ebf9f84951..b0296dfc95 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b44e35194fc96f303ff4302a2a5759dd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f0cd92fd68aacee0503822c05a3ee6a2"

 DEPENDS += "python3-setuptools-scm-native"

-SRC_URI[sha256sum] = "18874411864c9fbbbaa47f9fc1dd7aea754c86cfde21278ef427639d1dd78e9c"
+SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c124c0c61"

 PYPI_PACKAGE = "lazy_object_proxy"


