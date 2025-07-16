Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BF2C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:46:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.15737.1752648392698260431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nt1+kFza;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31c38e75dafso5256896a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648392; x=1753253192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXu54kf+ZVfi/aHBVw439E/auPqfRuW8vwWzJUYICGY=;
        b=Nt1+kFzaMF9986xHra5BtWStu34xVaSD+2n8BpbhdyXYYmvpYvSTYrkUayc5bYgxHq
         Mk5NtxZpsvYsCsyt5I8kMt/stFxreKS0r9+kkt4LPL4H97AMTpQaSbHcb2FaYD8Bjbmy
         olW+A01pFgbuIrJE7VAhFrhXL04V5pW52Sc3tFaojjR1VCfl3wm41ZDEFRwgWdB2mZ8I
         Bk8ing0egSxd8zp9p6oWALujycvNR/3EDpPlbL3r/adQpwgD10HK1kW19aC2npGE2NCC
         8r1Peg9/99yX7E2tl6sjjoBj3WkdiAAOEfbJkwGRRcnTRUiDF9LM2kxWqnpzjTKI7Wjd
         Fclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648392; x=1753253192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXu54kf+ZVfi/aHBVw439E/auPqfRuW8vwWzJUYICGY=;
        b=IaxLUr3k6XRyKX9Mxzm8wq/Xse4UvFLfgyP4hU/jV42+xPjj+LAc4A0yWVv8vQAImy
         iy8EUrvx+EnYhk6+HinaWYuQDcQIWt0aWleMR3+Gq8o5ILzzrPvA3+iw1vC+zbcshBbw
         LK9Meo3mz8TLp8cCzADb7wNlJAWQY8IPJ7YBFx95ZiXb7942rDMHFgAqW9fuJ+VpjucA
         dAOPPGNLqYOKE3iVcKlmTNyFhBL5rX6j2sBJ1EzmV2E8+aeJHLsS9mK1/iegRZYy192N
         YyrwQhKdEXX+QDNr4fiB7qhE5/zizVxjUZ+fGJoBPymQClcWC18p91UBrlw80CH7/E17
         PheA==
X-Gm-Message-State: AOJu0YwtNAY/A25uk/JCo3RHndYrqwjtluvxZby+6qfHUxbDuronpfgm
	CX27nZQUjQJs5OnoctzYEd0rmwMUMQQ/99e6Wz7Fn2sRle47MzUVdTBnMTYSFzKWI7M=
X-Gm-Gg: ASbGncvXm4axsXbBXclVnxdP8mLWhKguKAICIlkmGXFzIolDi58EPnApgr0dKh+2LqR
	xQjIZ0cKrJbHf8CrxiZykEFAztLTqwpSLQ7VmdcP4rwIjCfbgxpjstx9dSy07jfRKKIAG6x97fT
	sIHzToIoV8TApTytG5HsZcDiTN2r86AwuXncxV7hhhOXSYx3fvexBy4xYHkVztE4aAzYzi1oKCf
	qYWAgXtE6FQfRAKGSNE0zl2g4VFRjUVI/sBzKAmoatl9ZaFhGz45S/pcI8EOHdXCygFhx0vllXq
	bavySwuYduLCZKcRJsu/YwlRIcpenA7s9eV6qB9HjxnKbtnxKonGA/EBZ2nXOCpJGNPIypkRLwu
	VV6qkJ7HaMKtecA==
X-Google-Smtp-Source: AGHT+IFX9KwhrVz6gpYzjkL6aCl3M7EwiowMgEym5eDOUIqEOATUXkt+wuWxJ/W3iNJgZMlXsGQL0g==
X-Received: by 2002:a17:90b:544f:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-31c9f2b5292mr2241389a91.0.1752648391656;
        Tue, 15 Jul 2025 23:46:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::730c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e424sm778208a91.40.2025.07.15.23.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:46:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] include-what-you-use: Move the recipe here from meta-clang
Date: Tue, 15 Jul 2025 23:46:26 -0700
Message-ID: <20250716064626.339595-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716064626.339595-1-raj.khem@gmail.com>
References: <20250716064626.339595-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118588

This recipe needs clang which is now in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include-what-you-use_0.23.bb              | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb

diff --git a/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb
new file mode 100644
index 0000000000..7c4392fdd1
--- /dev/null
+++ b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_0.23.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Include What You Use (IWYU) - Clang based checker for C/C++ header includes"
+DESCRIPTION = "For every symbol (type, function, variable, or macro) that you \
+               use in foo.cc (or foo.cpp), either foo.cc or foo.h should \
+               include a .h file that exports the declaration of that symbol."
+HOMEPAGE = "https://include-what-you-use.org"
+BUGTRACKER = "https://github.com/include-what-you-use/include-what-you-use/issues"
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=3bb66a14534286912cd6f26649b5c60a \
+                    file://iwyu-check-license-header.py;md5=7bdb749831163fbe9232b3cb7186116f"
+
+DEPENDS = "clang"
+
+SRC_URI = "git://github.com/include-what-you-use/include-what-you-use.git;protocol=https;branch=master"
+SRCREV = "fa1094c0b3848f82244778bc6153cc84f8a890f6"
+
+PV .= "+git"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE = "-DIWYU_RESOURCE_RELATIVE_TO=iwyu"
+
+FILES:${PN} += "${datadir}/${BPN}"
+
+BBCLASSEXTEND = "nativesdk"

