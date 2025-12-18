Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B408FD6D220
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:34:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40856.1766061291117532883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNibfI7k;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so4080985e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 04:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061289; x=1766666089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqpuBJa7kmx5dxniQ2o8LpaPXNwNjwRXiVaNUFs7ViM=;
        b=ZNibfI7kDmlFE01x6PqMw/FC1ftcimmhcc9ff3+SvM3HirE3sRv36B4gK/JytfDHte
         yvgRpAv3r/eyFNyAi95QbTZBiDf49gxwDw851R9q84dowvJRKynyUbS23dNEkVhiFN51
         hMorL7+vFJVusW9Rkjh4a6Dt+RtNU3vwGCc3e1hbzl7am1D1HMCfHFxSlaZJF8VsZpS8
         nF3mO1AeN/rgCoSzZBP4xF1ampN5Hf80lSgjG9WvLy9edPin2cAhENelNYuJDu7ZeUSV
         WtaWf9rNOgzXHYuge62/oYaJyzIOwGKRIzm5zvtHTfA/0HPyNv5lGuXVrauoC4A0NyqG
         7uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061289; x=1766666089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqpuBJa7kmx5dxniQ2o8LpaPXNwNjwRXiVaNUFs7ViM=;
        b=AlO7IQbyekzn/Lok8Ob3IA3E1KxUrFr9iJ7QkyZpb7xBKX/GKolI5aBtJZiq6yY/WU
         P4XQGcbQ8CGPj+Q+u7A6G9Z0iWi92Te5S7oOHxMT7iHIAZx3L1upkALh5DcvkF0XGHup
         b62FqSkZ+UMZ2cswKgb2MSjpuznwgsm/r2b7OLT0q/zk5oJLIPAm6nJg81Atyj8k1nOq
         AUQalXGMaIuDEkP9H3D3ntPGIap/hI+quTqmM3DTWmPcLpsMU3Z1OuQleUhmy4b3Ak/Z
         nlFCDL9R8OWmrQJywb4/hSUsZp62wajJWKLk+ln8j0o2LEsb0FaxBhxLTqWmgrIhafBx
         39+g==
X-Gm-Message-State: AOJu0YxHTggn3b/XTDhUq/YUiPajxHVhOXKQcBfj82DBX06R6pTPvJJF
	wFVOM8eK/fVRybbi2+rwXteDkwZ9DszUFkp8WSaVso1u+eID1fnDi9phjL2nsQ==
X-Gm-Gg: AY/fxX6/+EItOVM6lmLut006yX9mZhBn8ba0Gn5ECAXhY8eFIX5JpJQACudyIMU5RyE
	7wLJvh9tqEvg8hgaEkRhg6Q7owqMbfRVQQ/eutlgVyjrAQKO6VEGxjsbktbciIn2lG0Wk+MYFRN
	MQAV9rDBIfiwXOUWBCMWO7ah6nEQrxO/wD8ElvJ3QW+WoUEJwGyyZhrir5dj7vI1gKuCiDizO0p
	zkGAG8jYkXfcXbXWIEIOnW8/4RaUILWIWOWc+BS/NnugCVP9p0eJmwjj9zQlqmpxYq9NZTp30Li
	TUb/wcHPbNnaTMFkx3NaUMd8eHDq0KD0qKNrt/NlOljUTsRyip+yeuA3dZa51649CJYEhpmmRuB
	mYn6L/nMoDtYdOYsYAIhG35oegGLNPtz2C1pKV6ZiuycIba5KhFN9AAwAJgRvVFszhZpHUILPn4
	UiO+5yGe+g
X-Google-Smtp-Source: AGHT+IFW8l7Sh/gfprJE5TTr+puoe0hXT29sYl9PKQTij8BSYrRoYP+3pa60JGgKVEZRJwPMRyAiXg==
X-Received: by 2002:a05:600c:a00f:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47be3a79485mr21596345e9.31.1766061289383;
        Thu, 18 Dec 2025 04:34:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a3ec73sm12679035e9.5.2025.12.18.04.34.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:34:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH 4/4] thunar: upgrade 4.16.9 -> 4.16.11
Date: Thu, 18 Dec 2025 13:34:46 +0100
Message-ID: <20251218123446.3489941-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218123446.3489941-1-skandigraun@gmail.com>
References: <20251218123446.3489941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 12:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122763

Changelog:
4.6.11:
- Dont reload the view when text is copied
- NULL checks to prevent crash on malformed bookmark URI
- Use 'g_timeout_add_full' to set tree-view cursor
- Fix signal disconnect in thunar_window_unrealize
- Don't go beyond THUNAR_N_VISIBLE_COLUMNS while parsing col widths
- Translation Updates:

4.16.10:
- Fix signal disconnect to prevent crash
- Don't go beyond THUNAR_N_VISIBLE_COLUMNS while parsing col widths

https://gitlab.xfce.org/xfce/thunar/-/blob/thunar-4.16.11/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.16.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.16.11.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.11.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.11.bb
index 93c41aedfe..4826683a16 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.11.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d6f092e15264ee5af"
+SRC_URI[sha256sum] = "f47dde90b2e5e3e31920a4f57ddd3670282d0a90870a45e89148fce41b2a8a1b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"

