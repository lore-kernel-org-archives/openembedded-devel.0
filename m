Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DF9CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:46:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27887.1781812003779207501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G+Zpqg9H;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490c1915793so10855995e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781812002; x=1782416802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hygwk1uKb+bd3TnqkO+NYJYmB9AmjiLofweGzZKCc/Q=;
        b=G+Zpqg9HKb3LsN/wvM8wVkm4+WOPSyw0+Qzvc+JG9om4qlT9X6PBucoXXVKPg/xvAp
         d7b7J2NTPc9+0tyiwgIrrmvHI1L2fPuJ8+WqOVTeiHdpscWdxYz7F5KAOXILVXGxQR7e
         zpB4tyjk2rQR63tAKJjGw5PW2W9aoBiE6O/jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812002; x=1782416802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hygwk1uKb+bd3TnqkO+NYJYmB9AmjiLofweGzZKCc/Q=;
        b=mDB1qCq+uv++fSd5iJuX3109x5QtlJzrPqIlSzje7jKgJcF3hP/3dMmfA+MiGo4QA0
         XE0ijoQxnAphMCb1/7ndL9Ll5ve8WYe9hLhFCjlVLe+fYUoEAES462lwnuMqsn+LH0oG
         N+2h1MtPMKqGK0tWeo50tMET8wEttOCYAqUYarORZCLDS8nI/VNojLa7TKtEc0lZuB5t
         G0P7r01DeNCmbEaZONEpO5psD3+nG8Ig7DCXICAehk/zYxBFn0eMVzPiA/Lj/1Gsanjb
         fXn4b7b6Ue/gGc9gkb7mALW1kVA9LOGS0+ZHQSb3MvRJMg49O4t81DbsP+FT/Yff87wQ
         ohzw==
X-Gm-Message-State: AOJu0YzyVO7lmfCFTon45kFaKBPUWmvgphZksyS+sGesQnEQsD3+QTUh
	WYYce4645SaSvSfkBa1w/KeARsKitxRS7HDG/BF43jhfWFMZi3cZJ1TQD/syjnBlr6c/svgDNXr
	pGkE2
X-Gm-Gg: AfdE7clri4g1D33G0pP4dauVZhyVKYMDeqsKJbg6YrsOCTZjX+3RGhjBeN3ZbVbx/+z
	j3V7gvC55fy8CIRC+fnBJ/oo0GDoC3RgVMMaTyJINtamS/jGR0Oly7tH2EvNvlgvIj2KVo8QQjP
	v9ja0CVbG30y7BXIlI82Xp38qbQQvkPFlXeMAkhG4UisfjNtSuYIDKoS9txB95iOVBr61s627Yj
	KEu3F98AMQolilbQ7SF785TAUXIICu4+9RZDWhDF4puKYXJI7EvKlOuB+M0DQz4MYt+eJb3p1VS
	W4Tb2gG3AECNQ+Hgf7eJigW1YbBR0LM2vkKidxvm7YjC/+e8srEbvWwmH28DLebdIyQobc3Y7RZ
	e/xTMxBHwMFuOE78hutFEjVmuSivtpKkU5nNioqgbfzS8ryg+RTN7Ygk++ROT6ASVScHC48ZY6v
	acBnHHS5et+dPUDrutUFLGAyqerA==
X-Received: by 2002:a05:600c:6095:b0:490:e60b:5fb5 with SMTP id 5b1f17b1804b1-4923f5a32bcmr15734695e9.34.1781812002051;
        Thu, 18 Jun 2026 12:46:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fce9561sm11889395e9.5.2026.06.18.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:46:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-autobahn: Upgrade 25.12.2 -> 26.6.1
Date: Thu, 18 Jun 2026 22:46:37 +0300
Message-ID: <20260618194638.1802073-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618194638.1802073-1-leon.anavi@konsulko.com>
References: <20260618194638.1802073-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 19:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127668

Upgrade to release 26.6.1:

- Bump vendored FlatBuffers from v25.9.23 to v25.12.19, restoring
  the version-sync with zlmdb 26.6.1
- Commit the binary schemas (reflection.bfbs, wamp.bfbs) to the source
  tree and ship them as-is; the package build no longer runs flatc,
  which fixes cross-compilation from the PyPI sdist
  (e.g. Buildroot/Yocto/aarch64)
- Add just generate-reflection to regenerate the committed binary
  schemas with a version-matched flatc built from deps/flatbuffers
- Add just check-flatbuffers-sync and a unit test exercising
  check_zlmdb_flatbuffers_version_in_sync()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_25.12.2.bb => python3-autobahn_26.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_25.12.2.bb => python3-autobahn_26.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb
index 4a25d0fa88..f9239b4904 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_25.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
-SRC_URI[sha256sum] = "754c06a54753aeb7e8d10c5cbf03249ad9e2a1a32bca8be02865c6f00628a98c"
+SRC_URI[sha256sum] = "66b27e066a8ea265541eb07fd964e3116e2b8f51d797eea8a46b55c07fd81a07"
 
 CVE_PRODUCT = "autobahn"
 
-- 
2.47.3


