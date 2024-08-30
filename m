Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9E9CA0EDB
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5159.1724990318364528506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gjGG65GS;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2021a99af5eso11610515ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990317; x=1725595117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRqUe2zyMZ14X3kikQr+23NUSDxmmq8ftQv8hok4tzo=;
        b=gjGG65GSiG3LixtWkPDbeJ+r8o+kgQurNR+KeCgJu6ZrpV1dPcOOZlw+m4GT6Kqad4
         214aHnf+wj1NH5km2X8DaVMxqGHDDn3ZIyKhMprprBuh5usoDKmUzjrZJJuNu/dGbd0F
         Klgdv57SqlRvECHpkkcZ+FXMZkJNg5vfeXGuFMnYT62reUs3VWNGHBVyp5AjAhEJy6Ol
         HjnMEcr/MFL1DWboj2eclOMf/TOI6KLrMf6XPQOyQne7TeG3iXQDuk9EYZFrkYNMm/T3
         ieSB4r3PvfVNXmB2vCKC5RmcYS7oMwZjbl07DWEZMiwKxsOL1LTbWxd/2lnXZgNVj3oD
         5g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990317; x=1725595117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRqUe2zyMZ14X3kikQr+23NUSDxmmq8ftQv8hok4tzo=;
        b=N/IhXU2A18GSkAQohWmHUgZyiY6wcp3twkqo8JQ1Bl+dtqmDYQaodoVN4yBCZ/lln4
         WLfwMxqx26LgtwWN8qlZgP1j97GrU/S+XRtl2wsRN5kJcL2Iv25zDncDT/97i7+dH4cI
         XUfnM0GeK5x11kGLjaX6k7NlhKycVpAI6DNKAgDBw2OcDf4JYJ2RppO7D13phSNZHPgw
         BrjReOTx9V5jdT1sPB0P6l/tUmEoUEc2NrLikSgt2VZqgBmX+mo8qIln2VYV0V4/S8lH
         DTk6a4xBMiWHYbcJNvSiyhWGqfQl3P2r312WSVxwn6XotLAaltr+A50k9lXG+b0LT8fW
         bfYw==
X-Gm-Message-State: AOJu0YxZKkTyFhnTsJTm3NV3cHjzLI8eZA/0pbcRp3BuRaEJANt/wEKF
	sHdaTrSqSEcbiAWTH4WM0Hou0YMNZ1hY22aSdDDgL7Mj78nEZuLQqSmAN71I
X-Google-Smtp-Source: AGHT+IETjDHu2hWFjcyIZmvz6KjwroawJmDXvAD5kNizGlWfN0HmDKw0OOOjztsVAM2XNLTBqEX+Fg==
X-Received: by 2002:a17:903:2287:b0:202:4047:e419 with SMTP id d9443c01a7336-2050c33a4b6mr57778455ad.25.1724990317489;
        Thu, 29 Aug 2024 20:58:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 6/8] libmpdclient,mpc: Upgrade to 2.22 and 0.35 respectively
Date: Thu, 29 Aug 2024 20:58:25 -0700
Message-ID: <20240830035827.406391-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112045

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicpd/{libmpdclient_2.20.bb => libmpdclient_2.22.bb}        | 0
 .../recipes-multimedia/musicpd/{mpc_0.34.bb => mpc_0.35.bb}       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.20.bb => libmpdclient_2.22.bb} (100%)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpc_0.34.bb => mpc_0.35.bb} (100%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.20.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
similarity index 100%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.20.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.22.bb
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.34.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb
similarity index 100%
rename from meta-multimedia/recipes-multimedia/musicpd/mpc_0.34.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpc_0.35.bb

