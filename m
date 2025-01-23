Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DABCC0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:13:59 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6700.1737620035798219121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LadnOhCC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so125162766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737620034; x=1738224834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og21Y263v3t5pj3DDv51d01Eq2jSvg+MyAp+a1jnY4k=;
        b=LadnOhCCm9QETTIZShoPyw+jXWln3gIfDfpnbkFytY2ETC+e/VSgkXp3fhAlkz2bF4
         j2YF0vaecSSBsP0mEkz7aymYxdc76eLSBlBbDCC/wsbm67Mhi0KBjPFR9ea3YUIQeIZR
         iFHCFT9XBDg9NyPIPOiL8Ra5QKmUppA59evWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620034; x=1738224834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og21Y263v3t5pj3DDv51d01Eq2jSvg+MyAp+a1jnY4k=;
        b=ec4DZ016+B30xZ8cPFudrH5rCxD+KDXML6ZzGVp5wTJBFX5IZ/2Dto/UP8ZLvc6Kr9
         NK4WGWdymyWsKgoXimkyMP8/r9b++zjGbbsm7Oi4zgTryfQT2x3nF3tZC/f9bzKE0Nr5
         QK/3mZEN8F0H9FTWcDbC3uLm5Z/ndbbzzugE+6A5TLYk5RmMk4h0GllRN2yhZ/livPIO
         Ti2ErEXq8Nl8sFJqNDAOqGGaoTIw3iWyMC/Jf6oM6Pic2jExkNpeFgAJB8WHwnORxtOZ
         xand5/mOdTVDRfTUcwO0Ygd18Rio1lxZ3OXtxHeB+mQWCqxP/Pe+nDsR6MeQnUdZrDJu
         EbqA==
X-Gm-Message-State: AOJu0YxLIr3mlH3wNyJZFdNE6wbuD+9wA1w3R8iSwhA85oboQUB1E7LI
	ln4BsHljcdOqduSmnD2AGLjZ1uHN8NE2IMu57LES3HS/BrLRd0u7kDtC3nKISxwFskSP68AD8rZ
	P
X-Gm-Gg: ASbGnctfC+q8SZIlyjhnWiBylS2Y3TPNr/LmlW8s1RUYW1XDfFmtfcuRW2jvm1xb6XN
	vKauwOy5k+aofLxyKxabsHs6F45V3CP5SSclhHZihtpUfI4zu2949NWolNbmxUBSDMP++GC3/Fk
	ZhQCNV9ojxUupnts1zsx75ow91swS0Omppcjz2w4M9nAE9bsxM4G7o83GNyhEiltfpX1+Zq/fHK
	5X3X/rI0Dgw5QAFSNafZ6zxTbHi4bs48l25VCm8LG9Mj/an5NgzdwUOlpRjYZpj13+wr0zCWdxe
	O0rhXZacSrEbtddGI4A=
X-Google-Smtp-Source: AGHT+IHxfia05k6tWqrG6KMPMDQZt4CeXrGOL30AjyzFmm4+1wPTaNN00L5hvHkfABuJYHb970N4Sg==
X-Received: by 2002:a17:906:c154:b0:aa6:834b:d136 with SMTP id a640c23a62f3a-ab38b165f91mr2544003366b.33.1737620034008;
        Thu, 23 Jan 2025 00:13:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290fasm1040414966b.103.2025.01.23.00.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:13:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-networkx: Upgrade 3.1 -> 3.4.2
Date: Thu, 23 Jan 2025 10:13:48 +0200
Message-Id: <20250123081349.3440231-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123081349.3440231-1-leon.anavi@konsulko.com>
References: <20250123081349.3440231-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115031

Use python_setuptools_build_meta and upgrade to release 3.4.2:

- Fix docstrings of dispatchable functions
- Fix draw_networkx_nodes return type
- Add disclaimer about LLM driven PRs
- Fix doc warnings from recently added docs

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_3.1.bb => python3-networkx_3.4.2.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.1.bb => python3-networkx_3.4.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb b/meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-networkx_3.1.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb
index 2f2c3cfc3d..33caf7529d 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.4.2.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4266362445d56549f7b8973d02e5f22a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=810f34d8853910e36388f63c0e87f0ed"
 
-SRC_URI[sha256sum] = "de346335408f84de0eada6ff9fafafff9bcda11f0a0dfaa931133debb146ab61"
+SRC_URI[sha256sum] = "307c3669428c5362aab27c8a1260aa8f47c4e91d3891f48be0141738d8d053e1"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
                    python3-decorator \
-- 
2.39.5


