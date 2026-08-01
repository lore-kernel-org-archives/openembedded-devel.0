Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19822C55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:20 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5260.1785589931566743951
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=niXFicke;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485b358552so2176323b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589931; x=1786194731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoMq6QVMfwW45sT4BeObxesoCHkH3TzXnn73zVUO1AI=;
        b=niXFicke8wEZ6LUd+a88nJ13uXXfaZ70rt7bCTBlKpQz/89y5OHAzeQqiC9QfVlmxO
         d/A034xEaz9y1cy9MYmYIadXPWPNuP/HpEkPFoeaMQUoalt7XBcjfvnyIIm5qp7Lo/me
         weNmjWYNJlB0GUMsm2pFdE1u/QVGYkxrLcda8cDW5NZQWkvShEDz4St+Ijk4LmOX44AI
         bwDwoOH+mdlULsmPAatiwjblGf3wYCQMlcpK/pETObB9eQkikSQS/3RGTTldc3CuZ9z+
         Sm8G5X1kFd0wT92CG79UhL9JuGWxsgI8tYPemr6HcBvSn6oeAaFPUwkuJU5191eIltZD
         gv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589931; x=1786194731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoMq6QVMfwW45sT4BeObxesoCHkH3TzXnn73zVUO1AI=;
        b=Hp47SEuQjI7e0aZPU1+bKee/t21OV8HQCJK74SNMpCfRKmCz6KGPu87jOsr07YIGbW
         MoXx+c/+yiUxEMjmPCRdggrtpkLUeZqMYbGADQMhDeS/S/6qXOQMSrOa0oEKU84iK+dr
         fMJAIV1KHhBROnOiwTSdjwGXapyHl2xT3b50+4g4X+rKB2oFDuOsRyhA4BazH8OlqQHa
         8PJEI5dJ6EywcAtsaO8hhM23g1Ij+S0P+N5FLmRiM9OMsoblAEX7ift8ND7kA7m4EPN4
         mswIs3CiSfyffaBqpn6LOEq/9MLkdWtZUm+6v4D2EVskEwukYtNn//y/lokgbOjUfVEN
         vmuQ==
X-Gm-Message-State: AOJu0YwS1d5CPs7dvi23wIH38A7pLQcFyIwl5TbMZbso05r29gtXEZyg
	FbczCBmLxrusQRs7Febr/wqY98cWXQWYruvc+1jgvMtIZTCHp43VE/hk+ex1nZ5H
X-Gm-Gg: AR+sD139CyqU9XmFay95WUiJGUwU4qOGZnALYASqXqETS0RbIJeswdea78Svs3ilcr6
	oZqFAKC6tRFQEa422t03KtwCQ59k4bI+X58NWGqgN7GoIkWSKeKVTXmT5nvKZ10+urD+Wy9XcW+
	p0feJ+bqiEFghjWVPhGXYktbBhOsZpFqr1v3gs/8ifuq31qduRLxhL7guIx1Ze4xxX0DB8xECLU
	rSMx8R28gbMDWZd6aOokmQlnVHlC1rWZctBh4jGH5XS8W6zkgYMfW2/hkkeY9xuyv5IyQDzw9oF
	wjLJTYGRjgqXScJSxHZN5B71aDtb4qbLhDa1+oOptiTBhyZXdfOVIrZcXa4l+kn3wG4IavYX4k9
	tccxhBNQtEtkhlSwHVrNpeNnpsL/lj11xIAhaXJHUEt6mqa4ClrQdEQB6Nio1Fa739adP56B0S9
	8G9Jh8Rx8xckNRY7TxeADeVK/Okuj00fRE9DL9yk07lY+YDqUcfdMnAksSQdK96mZZpMTj1f9Yq
	5lRB/GWjKg0
X-Received: by 2002:a05:6a00:4b0d:b0:845:da74:5d7c with SMTP id d2e1a72fcca58-84ee480aa3fmr3046739b3a.32.1785589930913;
        Sat, 01 Aug 2026 06:12:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 9/20] gupnp-tools: upgrade 0.12.2 -> 0.12.4
Date: Sun,  2 Aug 2026 01:11:27 +1200
Message-ID: <20260801131138.3299410-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128603

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.12.4/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
index 739e3885c2..c6ba2a7ed4 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
@@ -8,7 +8,7 @@ inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
-SRC_URI[archive.sha256sum] = "4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c"
+SRC_URI[archive.sha256sum] = "2c7f6f538fb36a15322be532217e5de161182c943c0a8b0da4458cf970b4092f"
 
 PACKAGECONFIG ??= "av-tools"
 PACKAGECONFIG[av-tools] = "-Dav-tools=true,-Dav-tools=false,gupnp-av"

