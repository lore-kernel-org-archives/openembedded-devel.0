Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9546FE909C1
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:14:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14402.1771341287969557081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eBLmrE7n;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48370174e18so28518685e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771341286; x=1771946086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDAkN3TiXM7J71gmMyfBYLPCTtaAI9gFECb7PkIAinU=;
        b=eBLmrE7nVDxCTAawS5nNele/Bi96byidgw6R4IzvgcFF2VYvkc/KaM/mHc85eOzeWv
         xruKp345Ao7lC9CJ100OX3R8VbsJtaJhJFmWAo0whGTDSm4IW6SCbX7eto4nTOtWjxpq
         xZIKf9EXG1F9zJ55jvRSFCTQJPbSsTgm99Xfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341286; x=1771946086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDAkN3TiXM7J71gmMyfBYLPCTtaAI9gFECb7PkIAinU=;
        b=BOHJTIie/KbDCuZiFIr4B3Lh1Sh4XA04dXtaXt7c+dicxN40LiltQUVnztKAiYU5n0
         QPs/c7eCM5G0zx1ZSjCr93HqsDdavqfv3uKGXUV669eKtyCF0VPUB1H+jeDZVbw1FXn9
         O6vhlyOS2WpGM15y9qJI3W+LTv+mpTcCOIZs1Xmwn/ND/8OilMoTmrLskOjKqHCdRL35
         ya9XO2qzKdPXc9OfW+aVc+i3Ky4ram5KAutyz2Py+/nVe2KAMv8e+ZoxjfIP7Za8/KDG
         wjfg/p6fu5ILKtNaqz7zQYLeXB0tngF7xLiAd6jl2HJGzllQ10bwiXgmeKt8R9zcQ216
         QxvA==
X-Gm-Message-State: AOJu0YzZf4sLrlNfn/MOqgfhLQb+s1LaupGgrQ/gUISrLzPe0fX3+4c/
	PUaPwzJpKGQ+x9iepu3OdVDICYGE6Y01+OLMYikyJ2899LuayDdbPTrkzDgY6EBvDn9Q7y/fFGI
	rJU23
X-Gm-Gg: AZuq6aIoeiPA3xLhzrjcgcgEjjZycu2a07dwRf8DMoUU8sDsXc0q5g5HdoLHqtX5gG9
	R+RruH6i/9C1VsralU2Hy1P1FghaUttGiZ7oHezg7uMf5D5KtWSVfqZvxTZX3Tf5WYm3+OwFLEn
	XFe1Jwou/jnCniy3RvlkErwhEcyId/TbJfHMYF5i8DVkQzPNnKX6eEHQxEeP1WJLcZPY6Rvdaiv
	5Q4lirraHfnOngKrKhVamEh+izQDX2sKDgKPhweKtSTCvIVYUQ9gazrUaVDR2FXNZqE6B7biFSM
	AFK2Y2R1dJb2xc6yrp8fnUUygV41y/2fV9mAbzbKf4kX0ABbPDHk/8QfJWuXaDBLTrpQRCAqDg9
	XWkftxUpzx7Rd978SZkggZuhMaPT0dnVeXUxp5yKgHTqtPcrIhVAFwJy0SJEQ8AAYueIdllGRye
	g0tBlnoDQD/fN81nGs9b+VR5dGTYGRxG7NCjL1
X-Received: by 2002:a05:600c:698c:b0:483:5a29:9678 with SMTP id 5b1f17b1804b1-48379b8bfbamr170168485e9.2.1771341285415;
        Tue, 17 Feb 2026 07:14:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm32169581f8f.37.2026.02.17.07.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:14:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-limits: Add recipe
Date: Tue, 17 Feb 2026 17:14:37 +0200
Message-ID: <20260217151438.2960648-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124459

Rate limiting utilities. Add recipe for release 5.8.0:

- Allow explicit keyword arguments for storage options for
  username & password for storages that support it.
- Allow explicitly specifying startup_nodes through keyword
  arguments for all redis cluster storages.
- Support IPv6 addresses in cluster locators in storage URI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-limits_5.8.0.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-limits_5.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-limits_5.8.0.bb b/meta-python/recipes-devtools/python/python3-limits_5.8.0.bb
new file mode 100644
index 0000000000..0439a0e132
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-limits_5.8.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Rate limiting utilities"
+DESCRIPTION = "About Rate limiting using various strategies and \
+storage backends such as redis, memcached & mongodb"
+HOMEPAGE = "https://github.com/alisaifee/limits"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2455d5e574bc0fc489411ca45766ac78"
+
+SRC_URI[sha256sum] = "c9e0d74aed837e8f6f50d1fcebcf5fd8130957287206bc3799adaee5092655da"
+
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} += " \
+	python3-deprecated \
+	python3-packaging \
+	python3-typing-extensions \
+"
-- 
2.47.3


