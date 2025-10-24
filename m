Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3429DCCF9EC
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.29.1761328676397683908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTamLu5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47103b6058fso17572515e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328675; x=1761933475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPwIeDWxI6WbzGCibIj7IfXJA8adpMKO/F2a7syHb8E=;
        b=TTamLu5nFTg42OfSxmsDee9L3h9gDKJRTRx18FJEzmvD48sAx7Bwu8U0sFpZPNXw8C
         PoMuNBC23LKPkvRGrcH8/YlBR8YXggaKlRARbpv4BUM1cp39wg18Fj0Yj2pLsQYa3ss5
         YYoJhD6K7wkwt18vgNiyC+C9+7SxLliDnL3cNAS6SBPqtzSCP+VggEilXXlrSU9Wv9nV
         gm6SyMzf6EXZz8FWNGkdz7zYyhHYIB7Cl1alTaBuVPVQxehqPvvIkIfkWHtY4ZYH9cF7
         NwBDkL+z6tdI1nXpYb62SBDBZyKWxTOswPv313SzUcwdN7Vwt4BDXClFuhlu1cb7j7qr
         F0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328675; x=1761933475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPwIeDWxI6WbzGCibIj7IfXJA8adpMKO/F2a7syHb8E=;
        b=RD+99KwdD20iXaX4M6JTjZHmVML462cbHgQ6HdVUuHPAr5y9LtOaM+XkiOjMBH8jPF
         7m9/nTcG/Wb2KbxjAR4j95v9v88oDBBbYiXrb4orOzF0ek21bQMjPM30DEJoUvQrlmA2
         aAQn3caf4kULrLqHh4WIoxoWQBskbsEjjiAIVgTgrn/zHS+AVNHM/mJyYx9OFkaaeSF6
         HVWJmgIUdtg9K6EIHohZfV1zFr2M/yOV1UWYdt3yr0XL+rnwuOgFmpuOyFBONtfz6Jet
         geWD9hSQGItE9VG8d4P/JaXzXIxd3PnlZwoH6FzT+iOLd1707t+HKE3a6BK4srN02RFn
         wcOw==
X-Gm-Message-State: AOJu0Yxy4OTp2Idq9ukKuhvbHiYLU/1ZVTRFsHREpjAWLY2lkCliKNjy
	DwXFisE1ywFq/Bl2jjr9y/ZDn7l/gvDwCdePMKn/8qiSBUSMH+mam+P5P0Lsvw==
X-Gm-Gg: ASbGncv1katHOUgKRMuwwsRhtTGJuLB2xpttRjgmgYop4L5ZW9WV9vcC8VKb0ZsovsO
	4L8Un2Kz+S7Y+e5PqFoWml6loQ63z3+yKjXH4X9lX9xtT106BXwesrgfhF95eqjNLJYx9PLjyia
	zjXk/X5N9RfbB3FiqMFc1H3O/f4su/1AAPnKi3T2nuaGOAvLXPy9qLWyTGAfjnFAqkuqfwIx0xU
	ZmQjrCsmNJsipegZS5tGm1uxWCtaB9kADCzHmv2qaEyD3uRlr1F6KO9ldxjXhTIx0TriWOSZe7D
	JqZ2XFOd1eDiH8lvqZ1jnJHx3szbWgxw4H80k3yjZesFGca+2nLK6B8iI+oOLo0f31gznWMg6g3
	5g/hNP6IkqLTQ+S0B53pkfTe7rxWAhVX+yXEVbPgEmiJCDVW53zIc43VWXd3PjnHvXStSyeW4Y5
	c5bhFzi3Ky
X-Google-Smtp-Source: AGHT+IFavI93EcT19tjYoH1QBObCG9OE2MxCAcLdcyI6oase2anIWMS6IE0cnboccLJbVC5GHZGAOQ==
X-Received: by 2002:a05:600c:4694:b0:46e:37d5:dbed with SMTP id 5b1f17b1804b1-475d2427d73mr32884585e9.12.1761328674760;
        Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 09/11] libtest-deep-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:45 +0200
Message-ID: <20251024175747.704498-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120967

Add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc   | 2 +-
 meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 02c239d9fd..a26b91379c 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -28,6 +28,7 @@ PTESTS_FAST_META_PERL = "\
     libstrictures-perl \
     libsub-uplevel-perl \
     libterm-readkey-perl \
+    libtest-deep-perl \
     libtest-nowarnings-perl \
     libtext-diff-perl \
 "
@@ -43,7 +44,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-dns-perl \
     libnet-dns-sec-perl \
     libnet-ssleay-perl \
-    libtest-deep-perl \
     libtest-harness-perl \
     libtest-warn-perl \
     libunicode-linebreak-perl \
diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
index 414f0efe3d..93b2e5a1f5 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.205.bb
@@ -46,6 +46,7 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    perl-module-extutils-mm-unix \
     perl-module-if \
     perl-module-lib \
     perl-module-test-more \

