Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E38CCD195
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:05:51 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.10609.1760515548924809053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GinRkbv9;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so5092781a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760515547; x=1761120347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9oGTGfJZfKqlinM8UxDrBA/C6HTApj9OJElSZlTk0o=;
        b=GinRkbv9P0x39/CKIQgorQ2Fy9birYMFP02ljtIUy+pwFSjfxMjyf5iDjo9wUMFmRN
         bKIq3pjAJkWBl71WyHLOF0HaaUp2+Xv37aHaGLFRTHC4qQCjEGcQT5E5w0dGah+Vmlbq
         F23j4t4F7gu7gxDJV63gj+ajrxJjvb6JtBNfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515547; x=1761120347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9oGTGfJZfKqlinM8UxDrBA/C6HTApj9OJElSZlTk0o=;
        b=pYoZ3/eyN5wz3a5P/HroIk3nxGIKdHirlqcNi6IE348LIC6aQZ6WyO1dN9ihiep/7L
         8RfYE76skH9pjmEq7tYQgmSWYZ4FZpqv1vWNtolNcsr+K8lBzY1vTWZ+JgLK2T4FAEF8
         T7cPTRWfv6UkPBIUgmXx4bm8EW9z3m00NVp6Tu3LrRNa0v3CiDL+ehW5B+Dqk7PMImOf
         Hq3+we1Ri6ocyEp/MYeO/KPo1R05weCnhmM/VuKEZkOVMrsbFUBvqK6Dkzd8UdpUZQHF
         4p6k2uKzouRcdzwyYFNF8Q4Zp5xfFqfD6Bu2ecM0Kng0ZMsGT4gxOnPf0HJOvQnw7LWQ
         GQSA==
X-Gm-Message-State: AOJu0YwH/F3TCVYuNbiJV6z/e35cJ4WtVAVIwx6coN1OEqiKzPQKGFJP
	tiEqGcMfXT63qKhwMzbXFRkD2l+65tZ/mL+eMb2nad6dYLsXuj1o222EZUHaQH9AgxF00hmKOc4
	KDTIa
X-Gm-Gg: ASbGncs3ju+ZhyiNRCae7hApo0JQw+pY0eCNAead0kz/atkKj6V/73WaE8aqBiwKaPB
	JFTquoqUl9ZWbQKR5wDY5Na7cQhI9+EcATeUvzIRkwm1MpnqUNyZG0w1/Hmv0rnArbRe1Q8lFtn
	ZeR5MvRMR/lmrlQIa2O4ZQQTHFf8oH/LgSSQwj3Fr7V4uRcAq4XuBwwnHx5XcAVV8JWbxbWG1Va
	PyYW4rOhvFaeGGqk1eZIG/+DFbarYdtpZCNTz42PpxTp5qT89RK2BvDZXFYKqPD0VOvLmrObZoF
	U+QByB+MdT2DYWKxqujihSW0S9Lykvnx07p/FOhFGohemh2Z180H6/IPQ5rn8N7rNyKwvggG840
	FaLOaEWzSQBhGD65+YsdytF0nwQ/QLwBmTnbM6M7hBHx4FZyHE6ZRLA8NIGOxAOZ9dw==
X-Google-Smtp-Source: AGHT+IELMiWEZbmOya45gxjgwlsICkUfgtucDZzW2vCmgN3uR6+e/LJ9I/4Ez915obK6pXGFG1IHqA==
X-Received: by 2002:a05:6402:51c9:b0:629:e50c:b058 with SMTP id 4fb4d7f45d1cf-639d5c52cdamr28461802a12.28.1760515546725;
        Wed, 15 Oct 2025 01:05:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1d644sm12977027a12.17.2025.10.15.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 01:05:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-setproctitle: Upgrade 1.3.6 -> 1.3.7
Date: Wed, 15 Oct 2025 11:05:41 +0300
Message-ID: <20251015080542.3607193-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015080542.3607193-1-leon.anavi@konsulko.com>
References: <20251015080542.3607193-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 08:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120697

Upgrade to release 1.3.7:

- Add support for Python 3.14

License-Update: Use LICENSE. No change of the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-setproctitle_1.3.6.bb => python3-setproctitle_1.3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-setproctitle_1.3.6.bb => python3-setproctitle_1.3.7.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb
rename to meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb
index e4a392726b..6abfcf8502 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb
@@ -5,11 +5,11 @@ Monitor)."
 HOMEPAGE = "https://github.com/dvarrazzo/py-setproctitle"
 BUGTRACKER = "https://github.com/dvarrazzo/py-setproctitle/issues"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a9efff04c3ae658687dd38e20398a20d"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "c9f32b96c700bb384f33f7cf07954bb609d35dd82752cef57fb2ee0968409169"
+SRC_URI[sha256sum] = "bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3


