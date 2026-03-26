Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C458710A88DF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51225.1774539156224369035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FD6K/lZu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fb112c09so11468385e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539153; x=1775143953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYH43WEeql9IqkEDimxV8ZP1jfkMgd1HP3CTeUcEgIM=;
        b=FD6K/lZuPLjH22g7hae3mqi9Jy6QglppPayuhtrlalQvHkvkvf6t6Aic+n+7pdTiS/
         vOW9sM+1+urz2PQv5ApHRT9Ke+4V2seLImrV3HQfpNTGED/642eWQP8o9Qm2SIuB3IwO
         mZmNUWBJhlqnm1D8602VVJw0dri4FECzUQFX6SLpXXlunXbSTD722q/bv/jW/Wzp0aDq
         wkiXxmEkXqyo826T+B9u+8M3L/oMfiE/LDPUN7C1HruF4vFIYiqbLhdATCEV5zQFByZp
         EwnG3mpQ5tHbDSxKhAW/3MXtRfU4QRZg1UM4wTdWzEVdQwtJb/hRiLa6tyQXKsqHMpzc
         2amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539153; x=1775143953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYH43WEeql9IqkEDimxV8ZP1jfkMgd1HP3CTeUcEgIM=;
        b=sDtEWnyAkJr2FDW/eAIVTHQpmhrIBngSZPbbElKfPf3vgM8Iqot3e+o4l5rS3aVhmm
         cnEDrbZhBfC2/oSlycRwyVkQCwEyDDuTpzQ2ldGZfhCcMWNJouWKhdkqpsrUv9Yp1WlB
         ESDpa29Imoc1T8Yt+iB7QLCQAcTZ2MgjigUpkkZ8S8GuYrzbJDMUJ/n/d7HyvmHIYktH
         r47Z8QEJSvwdL6gMuE2JZA07FoUvmQmd8lOcjSQN3lQjwB7LExybNMxU/NRl+lU3V/6W
         hYFPoy6CFpnQaHxoi/ETE6LxV0F7x5Qv3LEbBOcbmHUjq1S66T3LoaNuqRFG/XMGDilo
         T7DQ==
X-Gm-Message-State: AOJu0Yy/CYvVVmV4uxSlbDFk3T6EL/z1tXj2/Xs47ruPxsN7GMXhOdhU
	/y+i4t/Egfg0VJNaIwhdsaFpCppX8HKsLBcxvHais7WAw1F9TwUm2R2MP2QOBQ==
X-Gm-Gg: ATEYQzyUGR833AIXx6SpWloBM7D3IBYFIrJ7HsSAFOudtQXA0+hCvia3V98iozEhj4p
	E2tmZTXIWgBtdBtBQh3RCwu+Jymqlb8E8sNhOHk0uKbuiBzsEP93MpkMGgbqm2ZOTxzA0gsdAfO
	bunkg4WgGLcLJFtW1a0clHW6eE262bNYwjt4nDpIKn977ZXmbXycLW07qKUkDBQA9bqdTpKHAEx
	5NuTAgOFED/7LDsZYhfOs7D0a54KZwFDnxejZXVkCXO2bEeDxwhUtoI9XFyCCpjjD0DAEZM1yfB
	B/487O+4aENvdlslwds+5HqIuRtl8osl8w+Qx7ATjD5LhvvOSN3JS9VSDBTIQE7bA3u0nNa9WcX
	YYRFVPoekRCk55SZOFimbsUQP8EieoZrR777bHqW8akojUZIskb+JMm1p19eZJcn81LZZTMQEvG
	s3JvkoKS2zmdpcgg==
X-Received: by 2002:a05:600c:a40e:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48716042b35mr94512185e9.22.1774539153171;
        Thu, 26 Mar 2026 08:32:33 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:31 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-oe][PATCH 5/6] fontforge: Allow different PYTHON_ABI set for native and target
Date: Thu, 26 Mar 2026 16:25:09 +0100
Message-ID: <20260326153210.2245962-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326153210.2245962-1-zboszor@gmail.com>
References: <20260326153210.2245962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125758

The enablement setting for Python free-threading may be different
for native and target builds.

Use PYTHON_DIR_NATIVE for BUILD_LDFLAGS to use the native build.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index ce529e3e7b..d6d70aed9d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[readline] = "-DENABLE_READLINE=ON,-DENABLE_READLINE=OFF,readline"
 
 CFLAGS += "-fno-strict-aliasing"
 LDFLAGS += "-l${PYTHON_DIR}"
-BUILD_LDFLAGS += "-l${PYTHON_DIR}"
+BUILD_LDFLAGS += "-l${PYTHON_DIR_NATIVE}"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.53.0


