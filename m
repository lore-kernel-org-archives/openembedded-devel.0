Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED0EE9A04A
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:42:02 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14606.1771429313165617563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bNNtsRGb;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362d4050c1so6224231f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771429311; x=1772034111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJQkyk2CWyM3+vY75ZqnIcItUpvKWJY7hYgPpxah3kI=;
        b=bNNtsRGbJIojXH8EOFiAFE8j/f9Y2ATMHESSmxYnx5KYrZXOH2vxQ/+p63P8njFhVG
         YeSRucLTb9WYiC9Igk67K0qGBouSPfDEA7B1qi5Jtg6isLKC/LPQi476jyJlmHVrcSr+
         7BC9QyNyiQ7hAc2avPqwHk+FimyXSGhF2sN+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429311; x=1772034111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJQkyk2CWyM3+vY75ZqnIcItUpvKWJY7hYgPpxah3kI=;
        b=U2RlhIkMDnCi1HK9XjJHOxnSGdfGbVL+Mo/DyFbLCiCrWwNW5wcJTKAAQwrtpUjdfH
         mqAF9Y516w8ZW1qynE77c3bNolI/R2kPlL0wfW9/f2GFo/VKLroDYVVhrsKCIY8rEMg9
         83XbWD55GWIq4kiy+nLEKpNbWInupZoOFOz9nT58znCA1ofNuGwfPK6lvqvFRwsSk54r
         sUeIU59rB8MO22giQ/iH65mElcY1zfqLd7S/iDzPFppn+l7B9UtY5Q+tYc7r+ylIk8mw
         gcgv+XeDBqKSDFa0jpllZy1oM/XHXO3wCVgAQ4vAyjKJttxJZ1ckxOIiKfTMUp1StBYc
         xSWg==
X-Gm-Message-State: AOJu0Yx9JkOC3OdWQ0skQx/pHPlaSAXkVP1sfGLyFIzLdkgRSvs/nYNU
	NGgIhyAxOxgiQbfQktCHfjd5QjTDGLw7Hoju/dqqedOFtQb/2ogYqXHhdhxokybwMsJDE2d+DI1
	Cvos7
X-Gm-Gg: AZuq6aL6b4w5OyDA3FyfKNgMIcuI5enNX7XED8kpVcQ4yh9u2dBKELwXml00t7o9RXo
	kGOq9QQyd14mHmhMiuh2SkMwpyQ4wQ4pU2HKfELjDiOknRytUX8C9P0sc+UMK6AkwZAnhOyIGY0
	0T8jYtyWlcO66eXErdgfZVqIjoDoNm0ks9hZ8dTOXz3XTNdhbrzcUoPyKIwESx8Co3bR3S9MMuh
	SUl5qyCvsd2PxPRkRvLwe+xs1Lwr7D4eW9L59uu2V1eu9XYWdhDNsysFGU+/OSYRE9JsUwlqJVN
	WSqDv9t511IEkvAAr/1cURofMAZT+guiiNaVUkq6xkNjBpPcpEf4wiVn6s97I3XJ6WxJ8w4W7CX
	E/GpUZV9c2wjtqTl9UvLzZuT+/ZjIJj4j7HhaLX5vKcklt9v7iCOI3r7/TbLcHpPRI/uTBAhiyR
	k2jPl09k+qDRZik4gOkLysbsoPJQOY6YgCbilG
X-Received: by 2002:a05:6000:4284:b0:435:bcbe:d104 with SMTP id ffacd0b85a97d-43797913f31mr29975975f8f.34.1771429311093;
        Wed, 18 Feb 2026 07:41:51 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm45102522f8f.16.2026.02.18.07.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:41:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bitstruct: Upgrade 8.21.0 -> 8.22.1
Date: Wed, 18 Feb 2026 17:41:44 +0200
Message-ID: <20260218154146.3267220-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218154146.3267220-1-leon.anavi@konsulko.com>
References: <20260218154146.3267220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124488

Upgrade to release 8.22.1:

- Fix float16 pack/unpack on big-endian systems
- Compile wheels for Inten macOS and Windows ARM￼

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-bitstruct_8.21.0.bb => python3-bitstruct_8.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.21.0.bb => python3-bitstruct_8.22.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb
index 9431473548..62adcb35b8 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.22.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ff0be4968a45caf8688e075f55cca7a3fe9212b069ba67e5b27b0926a11948ac"
+SRC_URI[sha256sum] = "97588318c906c60d33129e0061dd830b03d793c517033d312487c75426d1e808"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


