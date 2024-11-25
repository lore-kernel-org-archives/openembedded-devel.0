Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DE9D58D57
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.20339.1732546452119898173
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiSltYgE;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6eeb31b10ceso45338267b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546451; x=1733151251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hivHmbOgsuzQpTLMIM72O38Hli6uRB4+Q0zbpm62Q6w=;
        b=WiSltYgE1pSOhabUfXjisB8vlmNBcVu9nYxKUDLYh6eZOoCHAZVOzh4limDnaTZ38S
         Emoir+2B0QnhBPNHbG5AUHXWAPpY2b99LUJ17yyfIaq5t3EzdER32KB1cpiLYhyWd/y2
         tevkvgLP937pTTnBof7wW4GkOdTCacvu7ftu+6iS2DAUJNZMFNCa576miLOY65txI8kQ
         OvvYXrC91YH7AO/cO2y3SaeCXBJcKEvpHW/b3r8JptgSmpyuc8la96b0G7UpiBkw7yvj
         AQNiNGjAqB+X9itrPGEzswOX5KuXUiSFnxXFJ2CvJBocGjtPJ28I9QrCQ8/llWs0MOwb
         hmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546451; x=1733151251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hivHmbOgsuzQpTLMIM72O38Hli6uRB4+Q0zbpm62Q6w=;
        b=W1kNgWsg18zU2JWnJN4YJIfQgdVwRxwIfOGHjOZ6aDwGEddeyZSFSt3KSPo+tJX2JU
         pJYIm2lyO2b5wR/zEx8cFPkFOtzEEKDrUnoqEJJo2bNomwKztNpeyeSH0AYbyfNRVNMb
         EtPkBoVxS62jaHDttne/5yYQ2U95c9jSnmdKFXATlHrMeHYXUdGLvQ2+9qPb8WMygbj0
         rZUcM2DxTvx3ofGpMiS6L5ZPmByZ5Fx9zpVkOvb8XEQ08XxMTOTIMbvY29LdfNwukgO5
         7F7UhBYN2wwVv1coyNiuAL1sVfp43KABba6V218G5f5UL/kvTZLwddpE7CGUY3iShcKL
         UkNQ==
X-Gm-Message-State: AOJu0YwNHWNphZUcn5m0cSSDgMHCRAQDmY+VUxUkacPpMXOKV6jr+NJR
	SIpiUcSI/brldeONyDmNsO/CPe0twAHNR8NgDfq4P57HslXJDk79Ig2V6Ilt
X-Gm-Gg: ASbGnct+gQ2Kyl6mZAFlar5cH3Vf/MKOigEo2RB15MrBwKIb6d7W7sQiihLY3+4Sg5Z
	VqMVlgYz/X8lyo7y9E8PwcgPnNgQhyLd95+k6hZWSyeXkp6C4fSaLO5WN3jgDdfCDkdm9Nr5nfh
	CXF5XjqklqcFxCZ1qB2gglc49nnSHqJ0j7AXS2Qxl7fxf5Zqm3UaHc9gcUjXEcmppNuaZNN6b1u
	vy30kgWx1JlT6vHyY7B+oPsqo5oApC3EBzC9eI0Pj5H40jLTHP1ZQ3x
X-Google-Smtp-Source: AGHT+IFM6emSrjM1KDQYrsiRt9lrkA4zY4lFTF0St0vS91J0C4sJ6o4GC01KmXDn7vo855OIijMpzA==
X-Received: by 2002:a05:690c:fc3:b0:6ee:f2fa:ba03 with SMTP id 00721157ae682-6eef2fabaf7mr64080897b3.0.1732546450708;
        Mon, 25 Nov 2024 06:54:10 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:10 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/7] garcon: Upgrade 4.19.0 -> 4.19.1
Date: Mon, 25 Nov 2024 09:53:02 -0500
Message-ID: <20241125145307.5479-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114039

Changelog: https://gitlab.xfce.org/xfce/garcon/-/tags/garcon-4.19.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/garcon/{garcon_4.19.0.bb => garcon_4.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.19.0.bb => garcon_4.19.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb
index 321f645b0..c4371a507 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.19.1.bb
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "e692f0d02294984c6b787e810a187c753a16f06ca87c68c0bb3de364ea3f6b0c"
+SRC_URI[sha256sum] = "5d4c9504a0c73b0f8f14b70875bd0ac5f280c99754e9c2e575031ca03cc87eb1"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.43.0


