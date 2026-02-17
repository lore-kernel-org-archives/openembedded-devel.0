Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EA3E6816B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:31:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9123.1771324271847243936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FvZaTVR7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so37891655e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 02:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771324270; x=1771929070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCNCrhReeubOEOMaj9ts7WqvcAovoVmnoLpl0NFIHD4=;
        b=FvZaTVR72pZQbXz1dOCURH6bMAF941zZ8OIh/9FiiBbWWdr8tj7pigVRF+ewAMRv1r
         ZgxdLN+DmNZUD4XwmrOISW5Ez2lfdLzedhNabYSU/kE3xz4HmD0EJ0a3Gtfr20yGZ4/a
         ezQWgsEGoM/Yyje+/pdGYRXML3ae2dsoFRMAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324270; x=1771929070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCNCrhReeubOEOMaj9ts7WqvcAovoVmnoLpl0NFIHD4=;
        b=Ja8vGxQmDynq+PBoEm2NcSPjzfJao+MIUsNqxa2nF0+QqzxgaknrGjoZ/6Mt/CLfFF
         089KgWK5kcivNwu7FWGaLCK0wsBlj4Nzgs+P1NTd29fYZlGpbOfaHKdZ1WImwDm9JZfS
         vZsCeOoOkdV2Iz6bQqCvmwJg1wwdd5fnAn3v+G5UNRqpj2L7HBTh1pxkHVESrsMexUiG
         yoELmA5SHtBUpfbGq/zYGmOwlWdD2VBjX/JdBmsQL76Uqg+lUaGbuH6ngBlJOKuPt9QZ
         qg8Ju2rtp9ujfDoTdme9b3As1856Ol2Yx6XIRwyNFCoeKklNQXxWBSKCwmKheKq1qLJG
         G05A==
X-Gm-Message-State: AOJu0YxbTt/+WdyUjSiHTy3HvEhI5l4RJ0zXvlRaImzV/Cbxz6Mhg1oS
	FzD1Y0GHtxpchtljoSACgGyyRKLdkFzdvRFBDSx3ScH6zyfVBwjfnmZZLj9rjWI3Gz0vEhfU+YV
	ekmuI
X-Gm-Gg: AZuq6aIfgAQ/XbdGuhN2ANpdrvjYxZ9pxBJIaELTtMxO0VrszaMoZKYjC90QkdXWAC+
	uKcvc5y2YNbcGsYbKTw9MhdKTrpaX+qpN5M69CZSKsxv6zZSCjlB3ER98XYZnGdiLycgmfqErQT
	lpHjBp1/jn4UsoVVsTGcEV7vu6VZEaHxkWxjrE3+7TDjA4B+2Ev8RE+tNtusGU9EEF/hHHFjffc
	Qx7yTLQ0/+WVESw9hRuv1fWBnkI6+N76/4XYX1oFVg7ExwlbyKSaowYNKnNksVGMnWRexui8reA
	rLSK7c+19UvskFhdWncMdcf2Jt0XZU6r2e+0B1l3TTr2EwzXPTtmB+wr0tnJztym/yU3W+kMORy
	7+SgkDaIPmTUTc2t2/mRxBsJNOiZIKEuom4LIdMRzVaMrQuFiGPOP08ePYFf25g4YvrZwNzesi4
	9C9b4UevWLhNO0j90JITZ1ioRl9GLj+TqpK82/
X-Received: by 2002:a05:600c:c172:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-48373a5d591mr215654055e9.19.1771324269344;
        Tue, 17 Feb 2026 02:31:09 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm33305378f8f.31.2026.02.17.02.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:31:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pyperf: Upgrade 2.9.0 -> 2.10.0
Date: Tue, 17 Feb 2026 12:31:04 +0200
Message-ID: <20260217103104.2849723-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217103104.2849723-1-leon.anavi@konsulko.com>
References: <20260217103104.2849723-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 10:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124448

Upgrade to release 2.10.0:

- ReadTheDocs: use latest Ubuntu and Python
- Add BSD support for track-memory
- Docs: Update minimum Python version. Add matching badge
- Remove fallbacks for unsupported Python versions (< 3.9)
- Setup Dependabot for Github actions, bump checkout and
  setup-python actions
- Recognise CPython as a JIT implementation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_2.9.0.bb => python3-pyperf_2.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.9.0.bb => python3-pyperf_2.10.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
index 810e65674a..39b8ee8470 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "dbe0feef8ec1a465df191bba2576149762d15a8c9985c9fea93ab625d875c362"
+SRC_URI[sha256sum] = "dd93ccfda79214725293e95f1fa6e00cb4a64adcf1326039486d4e1f91caaa62"
 
 DEPENDS += "python3-six-native"
 
-- 
2.47.3


