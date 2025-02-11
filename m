Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BA3C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 12:57:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11603.1739278657747393867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 04:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fuio/pmk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso1586823f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 04:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739278656; x=1739883456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdJcCayfP3MiqsHDAdxpdT0Oi7seGR9mOynCoZUBIps=;
        b=fuio/pmkyJPkLKC52lstbhxwB3g1raX0q3K6fIWkHlmwab64vPUgaqiV+hJJHMsuzI
         OVlDtj0Y7H2vnykzWTFBjWXhufoognGhEeJohURD31t7LYww+BaGuW79kfePLTLrB2Gb
         OHQBrNah3bBuB97Fn8JlydgEFhE7veUI4QZDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278656; x=1739883456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdJcCayfP3MiqsHDAdxpdT0Oi7seGR9mOynCoZUBIps=;
        b=C85w2UUYdjyLcPgoFIIQKjw8691UlL0ZcvMHOm3HswVuH5vCKXjc7lUGWeyQLtk/BA
         cG5QvffWUhyZpW4DdnVbwAeBcOEr6Q2pQAfYYK+pVXJm8dNMSwTGyVYYnztKz25VQUfO
         sww8Oah4OumvYalDeX2cbbEEThrW+C3LV2A3t9r5Z4m3Y9mZ3tAEI+0wu3BMDwUX4kB+
         e7K/k4MmIlH3AG+M2zK/XbZJMQGHqkQscTOcLt8DsNwhKzJ2KliJ8fmhT5TGWgRM2Yhm
         u8JsIKWkAFb81N3Xjg8uzYyWVwykXarzeoPr1N4qqGpm7Xhf/7r+21RuU5gEoVI5ZvHm
         RRfQ==
X-Gm-Message-State: AOJu0YxJ/1/3rVH2OUDL7tNg8/6hNfs4SvHUFk13TE2ZJ6dae7B7jLi+
	tCTo6Hn7z8Qru/B9HEOH0RtN3pQCAvjTe1iejdYkhla0Dw2pGk6TLfHUyg6CjRpDB2E+j2cgmdq
	z
X-Gm-Gg: ASbGnctt3FWtI4Iv6ngykW3Wt0xBwi3EwMEK5JamXqtnIKuxjRKhd388BklqVhZNcEj
	t8pM3SiS2+XLG4wtIvSnkUY7FQPWLxfHl5xcSlQVFzn33wE2mEUSQcOzDDwsufZZpFCJK6ACtpD
	jg8S+/ELj8wn3ZAHJw1TaxFD4qSEuVkElwa++OeHUZTSSABaeuHKzfhtdIWEa3kaK8YxwMqBH0h
	/zxIl0QnkdpVtdJbOBFVDuDCPh35RlQzPsUnvIY1ro0Xk9AE4sLCchLFAK3X7Rj6HE3jGETFAwv
	mok2L5G9tlwXC7FiZdRLmO83slG3+w==
X-Google-Smtp-Source: AGHT+IFzDbrOpLX2wPQvGlC0b2DMAFshRx0vVyBpJOY5sZ/MgL55zjGfXWNpZuIDw+v2yv7xKDrRpw==
X-Received: by 2002:a5d:6da9:0:b0:38d:d222:ee70 with SMTP id ffacd0b85a97d-38de43b22damr2630205f8f.20.1739278655028;
        Tue, 11 Feb 2025 04:57:35 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm13929843f8f.6.2025.02.11.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:57:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-tomli-w: Upgrade 1.1.0 -> 1.2.0
Date: Tue, 11 Feb 2025 14:57:30 +0200
Message-Id: <20250211125730.3477099-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211125730.3477099-1-leon.anavi@konsulko.com>
References: <20250211125730.3477099-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115426

Upgrade to release 1.2.0:

- Always preserve decimal.Decimal type in parse round trips
- Better TypeError message on invalid mapping keys
- Unify type representation in error messages
- Improve import time by removing typing import
- Improve import time by removing string import
- Improve import time by lazy importing decimal

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tomli-w_1.1.0.bb => python3-tomli-w_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli-w_1.1.0.bb => python3-tomli-w_1.2.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
index 94ea20049f..55b56616db 100644
--- a/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hukkin/tomli-w"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
-SRCREV = "179105660c367874818f2cdd1e06ed98eea668f1"
+SRCREV = "a8f80172ba16fe694e37f6e07e6352ecee384c58"
 PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master"
 
 inherit pypi python_flit_core ptest-python-pytest
-- 
2.39.5


