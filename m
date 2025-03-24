Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60816C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 22:42:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.52893.1742856138995231395
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 15:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XXLKU4xV;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so33596295e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742856137; x=1743460937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RKBqYHHWMGZs14h2Aouz6WAvO0hioYdJ2W6eqagyJI=;
        b=XXLKU4xVzKWIAFrCs2NtxjdcPCXFCZnd0CQ/w/33Ajp7OjzGuBEd64eI0ACo9fLBaN
         2VOQu+oYbJUaG7zUDrugjkS2GhEKg/NhzJaOpjRlw94LNeRSuOxn8uA23e4VOAH0DwNs
         uNpQ09ZM7SOapeZ9yacXFmFITEXbVBr2UlWvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742856137; x=1743460937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RKBqYHHWMGZs14h2Aouz6WAvO0hioYdJ2W6eqagyJI=;
        b=w3cqq25wvs6prSzk6+5dNc53cmuYfupjTxOM8gP8QyVIeUuKw26TpGDZaK26qbHq/V
         8aIYLJEHWNSzbSHvWP2/xdClDA+4zrw9qvTEqa21FsQOMbr/b4IrP+2lLSQWwRh8+F9+
         GEyu10YEcm4wN+/zVFVN5tHkwwYjXW3YJQ/8RAwepBMa5+3wZyiX/eQcvJ2CfHPqHlNj
         wf/aIN+3/MBgMiK+O8dENfqjNSgt5H1ohi547G1RTji8MnFTMZ2fa25P6CUyiVcSpw1b
         WqQ5xb3RyHIesscS3mwkfPRSJ2QH6wuuY1VqQ7ZNhFI1a2YcPdwp9gBgjnNeTXa8gVe6
         2yZw==
X-Gm-Message-State: AOJu0YyRj+VEahnS5s+TxB0t572P/qNZpalk5icUbArYty9KqqmttOPw
	0Xysqm/8Hb74smehAqzRJG2PMxJL7+CTJ8qtIvhLxIomesFbgGlaSZc7gcSLSdUqEvNoma3tn+r
	M
X-Gm-Gg: ASbGncu15uI+y/u3LvxVeWK5XMZmU+OWmHVGs+WPpMFPARUg4Iyk5gYNlUwIhMEE3Qa
	2F4BXp01Nx0XURzpFDLxg4uTxPcD3oZFAeHJ1P/0kDSmFxR9JQFBKcoo4xO5BwQtW6JZ7McRI56
	SvPUAHRFNpgSAzq6p6k150EK5UJyoYG7njp0fPAwhAx38kdMmAxED4fq3TXX2FW0PnwKXQ+PNv1
	nhoqXB0cgV//lZN1C/FxXf8PmtYKrDjgZ04VM4T1RVbqsmd0XWvhSuaioFJGvU/PwCOxQ9QV9Vi
	bD7IdTQShTBg1HlnpQ043wGUbouGooajmmIwCMvp4g4lmtvmPRlp7z2SRAA5jQJ/0kmC1NWG4yd
	7lymDfgYFPa/fyaiKkk5bxjHJIeWqHOMs0i/T4SjqsatQPxDGdosr
X-Google-Smtp-Source: AGHT+IHSMvnodjrn0OfrZ7hiIcQh6eZp1ledSRIYl2IvTgoew7f4ucvj51gEW5m13L+eUwXEn8yD2g==
X-Received: by 2002:a05:600c:4fc8:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d509e43c1mr136747265e9.4.1742856136841;
        Mon, 24 Mar 2025 15:42:16 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000ba3872bfffb24e94.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:ba38:72bf:ffb2:4e94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f99540bsm11999892f8f.2.2025.03.24.15.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 15:42:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2] poke: Fix the reproducibility of installed scripts
Date: Mon, 24 Mar 2025 23:41:57 +0100
Message-Id: <20250324224157.301065-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 22:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116212

From: Yoann Congal <yoann.congal@smile.fr>

Upstream does not support our default parallel "make -j install"[0]. So,
disable it with PARALLEL_MAKEINST = "-j1" to avoid non-reproducibility
where some scripts can be installed or not.

Explanation for the non-reproducibility:
There is a race condition between 2 actions at install around the
installed script in $pkgdatadir:
* Removal of existing scripts /usr/share/poke/*.pk
* Installation of default scripts in the same directory

Sadly, those 2 actions are not ordered. Depending on the build system
load, removal can (rarely) happen *after* the installation. In this
case, no script in present in /usr/share/poke/ when the install process
end.

[0]: https://sourceware.org/bugzilla/show_bug.cgi?id=32815#c1

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-devtools/poke/poke_4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.2.bb b/meta-oe/recipes-devtools/poke/poke_4.2.bb
index a31b6605a2..0ae392947e 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.2.bb
@@ -24,5 +24,8 @@ PACKAGECONFIG[mi] = "--enable-mi,--disable-mi,json-c"
 
 PACKAGES =+ "${PN}-emacs ${PN}-vim"
 
+# Disable parallel install as it is not supported upstream
+PARALLEL_MAKEINST = "-j1"
+
 FILES:${PN}-emacs += "${datadir}/emacs/site-lisp"
 FILES:${PN}-vim += "${datadir}/vim/vimfiles"

