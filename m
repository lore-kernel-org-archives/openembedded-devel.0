Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1A2C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:46:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146581.1783331192588028441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=It3/PrbD;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47640541585so1725151f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783331191; x=1783935991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPd2jhHZQbifY2Gr758Kr3XF2qNMMRfnxv7FCesqq5I=;
        b=It3/PrbDo6LBtA+ypsp6sobYinVCCyY6lKyfLPb8dllF3gjpYXNwK+cWtqkuFCu08n
         5/JAR/El4YBjIwszJT/IGMTFxmHxXRMsB9jCu+hjPI4WwlgG05uV53h8jVLoGAU3z+Hu
         zB8VBug5a0WI5PfidXKZpq2KvlLSz+vlI2lNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331191; x=1783935991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPd2jhHZQbifY2Gr758Kr3XF2qNMMRfnxv7FCesqq5I=;
        b=hZWfvJpF9Sm04Q5RCi7bowW/z3WyipIJbzWC9iMMQP7hHwoPLxa25FSNRVAWDQHUyE
         q0hUkRTKS29dvnOXMGatRV9EHOZAE63jGBDeJ2Kod4PXxiLP+/w2bxZG4XVB7kznAUPK
         +Fv6iMYAT3mVGCVwxGsbEYeFdrza+ibhbdULGD42tXCxkqyCb70E003bDxObK75U9UZF
         iQrRBs+7ZDOhRVT2vWbz/D1DRdg3GYUeXlKpP3yOJe2VdBSd3fJBPWH/yaOJG/1XXi4h
         ViD5zAqqAfd8nYf+pfOw6ec+iTb+k9ZHnLlrUTZlcFSl5eCoRqMKSuI5hnirJNwlIyiT
         d3rA==
X-Gm-Message-State: AOJu0YzxvG4LZFYinJZUIs/ro2+OwIodaF8y7VBS1QCxyajCQtQRTHDr
	HpTKkx3HsSeczWaoVOHNPTfzkVsWvJ3duYpC653QGu4bXsL96Y4aaVRS6sOJUe43q+XXl+aKfbr
	ZtWIU
X-Gm-Gg: AfdE7cnkci+Vwq0i5CmyBRAYWuaFECti91KVkO1r7Xd+ZR/LXe9naZnoOfwjT4BwR0t
	liaUCWL4QcTouuvXfTt0OAWwtpfxwJX7TQ3Qm5nQsfXDd4wXlHuRfNx/rmi1711NpCps0c/pzsl
	pDjmGoAXHM7RhDiWc8mvgRaAx2D3+ftQVbkIlJHDekfRWWGq3HFf/9PMKgHf9YW47hY8iZOtVFT
	4QMt2a42ZFVJu1U8pE2hWcrgdYWaEWDDjvgWzrVPte2y5g2MnRZzoFDwJ+gATd4FYxbywaSuFLK
	WMLpnPFlVJRd8+T8JJlCD8Iv654akMjiZRl2/jykzYID0vEYc90MV4nnF2cZUKRsH+5ScuqKaiE
	TKzPBMZj2renCqHKvbKfnkU3MF4Wf5P+c4UBRXt8bdliTt7HSCTrku21N7q9uqRMnQ3byIcnFRg
	5t34oRTVZXjl5JGTlsA903mPAPs00xP1A9H2q5h2NSVAqE81iSMAhKmJNblQ==
X-Received: by 2002:a05:6000:2dc5:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-47aab29e5damr9962174f8f.33.1783331190758;
        Mon, 06 Jul 2026 02:46:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22638978f8f.14.2026.07.06.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:46:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-coverage: Upgrade 7.14.3 -> 7.15.0
Date: Mon,  6 Jul 2026 12:46:24 +0300
Message-ID: <20260706094627.1254799-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706094627.1254799-1-leon.anavi@konsulko.com>
References: <20260706094627.1254799-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128038

Upgrade to release 7.15.0:

- Since 7.14.0, reporting commands implicitly combine parallel data
  files. Now those commands have a new option --keep-combined to retain
  the data files after combining them instead of the default, which is
  to delete them.
- Fix: the LCOV report would incorrectly count excluded functions as
  uncovered, as described in issue 2205. This is now fixed thanks to
  Martin Kuntz Jacobsen.
- When running your program, coverage now correctly sets
  yourmodule.__spec__.loader as strongly recommended, avoiding the
  deprecation warning.
- Fix: with Python 3.10, running with the -I (isolated mode) option
  didn't correctly omit the current directory from the module search
  path. That is now fixed thanks to Ilia Sorokin.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.14.3.bb => python3-coverage_7.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.14.3.bb => python3-coverage_7.15.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb
index 1be553ca7b..bbc677ed52 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "1a7563a443f3d53fdeb040ec8c9f7466aed7ca3dc5891aa09d3ca3625fa4387f"
+SRC_URI[sha256sum] = "9ac3fe7a1435986463eaa8ee253ae2f2a268709ba4ae5c7dd1f52a05391ad78f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


