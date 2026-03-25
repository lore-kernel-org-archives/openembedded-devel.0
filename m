Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0CC106B516
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21202.1774441281412124343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SWRBVnKB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so8710665e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441280; x=1775046080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iDkvGIWdAIENHX2pwtCzyrHb8vX4sCk/T5FmCcYf1E=;
        b=SWRBVnKBOejc5BpRYsncADj8o3sO1RiC74pwyoBQT+FXneonXx5Wta5sYyn6DLGVJ2
         ij+ioxwlptylQzga7cJwE54bdpNNGvSL6R1CZ/kOFz8msjHn0R5044bXq6+Wd1SAo4rS
         DNQ/fcIHLV5GUw6MThnHgDkH23MtW4AYWNF+qtN0qRE6RRVmZq3bahTsfcSr6T+lDL+e
         c1/8Nuu6LWRywM4df5mZStwzg6rmN6dgKPjz8GXHhoOyzF/cMm21Fyc7ykBY3RbaI47f
         EFjaNSDqjPt5dGhHXKn8F+V7GvtheAgT/EnOvd+qzIcD+eUlxy/6V9tx8ZtvndUipjDI
         fFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441280; x=1775046080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iDkvGIWdAIENHX2pwtCzyrHb8vX4sCk/T5FmCcYf1E=;
        b=SFjo/GdeoidRku72qUObFRV4nkshwPZGu5mP3t0qWbGKpUKIDbdjgOvOvz7+XEZ1nl
         XjFLUFYTCpXyVb7C32a5Uf+FdkDgR7HyfdnKEehokxMY9Y1zl6IklyVk+m76FbVQSxUx
         MJ1v4AU3o3L6n4KK1q+E81ZmCC5jKBtfouLMojcbbZaE1fvS/1rNGXOLHr7exFM33Sks
         /Lh6GZbNALjuLgOCmEIvHRxSfEWspZ3JEbq/QcFeTW4ZfxEq13lboq7Na17Oev3ECaYW
         U7UIMGfBJBMZSSJcjg0VxU0CO4lY0fHW6MkCwSlBWSODYMEbTXcbuMBRTT4xdpQjoAAQ
         ERmg==
X-Gm-Message-State: AOJu0Yzojdmak66hsqnlRX+WWH+irn1jLJndgbYGYvE0flepOvrBFTkg
	wyA+7fpGe1VYkxa4bnMZj2z/O1Yfuhf+QLpqIQdpOVeD+i938A5k3Gxm19OwYQ==
X-Gm-Gg: ATEYQzyFomw6LU4BZRtReINssUWGNI9Vmh2yxBTmzMc5WCvNbqWb8zve7cOQVbOI0sN
	dB8FMIsXZ9TNQTzxJxvCFzCVdslT/pGT3ZoHAq5XpvowzAlOR5XQORUS+EykGZX3eLBHycNk1Hm
	nIfmNaJ7yy7ye+mUOvlI+vyUT94Uf91X5dJP5jhbKt7TQhjO2WWGyZf8ATRX3Y/yvB6hlNQ9nzk
	jzuyTvTdUL1WSLRIz4mFoXwpaHyJuV2X992b32zuePq7ypbbkf+t6cPhOOH0zv7tExRl9MSoqL2
	l0be3O5tRAgHW2Sjhk6FRK3U9JP/8++H3Co9EJM5/70W6Udsm+YvkpZ8lHldbbvxLg/YAloYXEF
	sKCWwMc8pYZL3guZg+uHvFF6brmI9ratxYAUhZAVvhOA9EKBs+z3x2251GoW9bjR4NwF14xOAg5
	KEAIpS7BWm3vgadA==
X-Received: by 2002:a05:600c:1e88:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4871603a058mr44868195e9.8.1774441279487;
        Wed, 25 Mar 2026 05:21:19 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 13/15] audit: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:39 +0100
Message-ID: <20260325122046.1211090-14-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125620

Use PYTHON_DIR for FILES in subpackages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.1.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/audit/audit_4.1.3.bb b/meta-oe/recipes-security/audit/audit_4.1.3.bb
index 12636045d4..21dc9cef70 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.3.bb
@@ -65,8 +65,8 @@ FILES:audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
         ${base_sbindir}/audisp-syslog \
         ${localstatedir}/spool/audit \
         "
-FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
-FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/*/.debug"
+FILES:${PN}-python = "${libdir}/${PYTHON_DIR}"
 
 CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
 
-- 
2.53.0


