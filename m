Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C41CFEFB67
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:44:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98916.1772207033277773206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UIQextek;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so16904735e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772207031; x=1772811831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQKwlrSlu/gbOE0EG97Ql8I7SHjqqsHApwJOtjhyMMw=;
        b=UIQextekJ+kD5U5+fZ39Y2VTkI7zh9k+uHOIiGTtCTNAVbYUqDbHVsF9SkyAT9F74a
         j5BXo3NFsT/NOSasWhOs3sz1sFt6tzfhHJe+L2JUGTVXRazItvpZe+T8+6JuNL0FyyFL
         ShrAvs0OMmXpxLJXvCIzYN7gCaACpiBldqFQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207031; x=1772811831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQKwlrSlu/gbOE0EG97Ql8I7SHjqqsHApwJOtjhyMMw=;
        b=r82y29YCEAOL1JZoONgm8JJ/J6dU3O2fNP++XNyvAn3AzswRyIGGK8Zu6S7OkYDqiF
         KFOCeVUtoWhMIYj1MHMCcFkIIpHAmbhALsNVeORKMjOsZ3gIiY39Fjfmhe48DJFMhRR4
         ZiMlMYVZoNJpm1Aq1vShKdzRGRfBKgOmLEenz0CPlbYJRcRdterhd0CkQ9hZw+cZq09V
         cQ/ZmEJNDIh4qhrjNYODuYAWC/b9Bf8yw1IVd0K7JYZU66pCASWvZc8MPDi+Lph6SvYd
         t47CkKf+aO8clqAeQFYzTB6abZnI8HP/rxDK19CrqDjIyDn0VpyQyWoVvMM6jOiE9q0a
         bU8g==
X-Gm-Message-State: AOJu0YzZbNqQ4hhQwCj0BmjRqhrNLUfDdUfa/lhz3dUD3B+h2k6ySX3h
	SQzLYi/8l+AF8GeCcODD2lrGGijeP4xH5qmwZc/yaqoHsw6mj6vHpsdmgpr1WKoH7y3B30S9BGa
	zW6aU
X-Gm-Gg: ATEYQzxeukgp+zOk4ewUwKgJFD7Qp8MYRAfLPAukkA0lt7W1ekp8hhZP6aeCQKH9kyd
	AUFrt+NZg1HlsHahuDqNGmEshVREkhS3fMy7Qr4O32aj2U6dXibPbtQB8R9PCNmuoXctk/p/moj
	uurQRmPowhrYO2r1IFEm7HHxgXA4vmvPn7QQEDyq+H3fuCla334ntTu6pJIPLdafa8ZHSZivAHc
	k2MZSSNt2r0oRCr10IYB6Ne5ii27cmSN1fY/qX9MSNRsLthi8xXu6qmgRCn7XMYR4y6MXpxA4KA
	CfVVBQwl9EO8QjtLto04dltRhuyruAJtrqf7Su+iVlAwuMm5GzGqa640E2JEYjTwHAvA+Tn90le
	BpTrR7DIhjKnHJXV88tX752FXAJWK+44wtZiKqoRc7VI68iaeQzi5+G9MeHtiTyzmQMXn7/Xhpn
	3/blIKpyggNzsGDv8NyiYUkW83HxiXdugyiLH5
X-Received: by 2002:a05:600c:1f06:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-483c9bc42c7mr49979425e9.14.1772207031204;
        Fri, 27 Feb 2026 07:43:51 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm245845115e9.13.2026.02.27.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:43:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-cmd2: Upgrade 3.1.0 -> 3.2.2
Date: Fri, 27 Feb 2026 17:43:43 +0200
Message-ID: <20260227154343.3923152-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227154343.3923152-1-leon.anavi@konsulko.com>
References: <20260227154343.3923152-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124766

Upgrade to release 3.2.2:

- Updated rich_utils.ANSI_STYLE_SEQUENCE_RE to only match ANSI SGR
  (Select Graphic Rendition) sequences for text styling. It
  previously also matched DEC Private Mode sequences.

License-Update: Updated copyright to 2026

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_3.1.0.bb => python3-cmd2_3.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.1.0.bb => python3-cmd2_3.2.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
index 911d0989ff..8da18f904c 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "cce3aece018b0b1055988adaa2b687ac9c1df38bfd2abfc29dbeb51a9707de33"
+SRC_URI[sha256sum] = "602a10c7ef79eae2b7c8b3874b8ac3a32d9278ceb90c997a2eeb9fc0041ab733"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3


