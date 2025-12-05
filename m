Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0A8D37490
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2319.1764963972685081872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 11:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WbWiICig;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so25446225e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764963971; x=1765568771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0OwA38VBlQudpYG2sWD2xdGjWhmNTRfnujh0RxT2bE=;
        b=WbWiICigRH28nPxYGRS4AccbEo5lb4KZxOaHWLUAOZ4V7//h1mySmEzEGYTrnA55X7
         Ho/vz2M1oE7AMZyyRH0UetR0Ln2cFxXp6hzi0UBGFkb+mxn4njJ/3i48hxPVg86QYfZk
         ASs5dAKs2tjc1BGasWDqeo+PUrGMwuGZkmN/Oc3maFZciE5z5Q5FdXJi0cKCoCwA+8MD
         tPJeJk7vZL5IxNO2+UH5eRJB6WMUFe4plPuu2KUDfnYrLd8yx+HxpxD9HWPo2LtqHHfP
         g7avt08relTH5It4JACmIOFAMoUu2FUw61NTG6e1YWBlUKP0HNlduYZIMi2JrbuMHxOc
         bfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764963971; x=1765568771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0OwA38VBlQudpYG2sWD2xdGjWhmNTRfnujh0RxT2bE=;
        b=wQoqB1i+J/NhbK+4rC5U3dUfCCVvz5K2vZ6HNpTepflWe++p88uu3XIbld5yUv/zak
         G5SD0PofTZFZ4Y8KaAGGGuw3pWn66sJl172UGWOQgpmkhYVGUbHIEwvg4ywNtRAeGJO3
         l/tXww4/mmG00RC+X22wMugFFgvclq2soyrPYlOCwJep7CmLkRJ8k/G8sc/6N4f7+vJl
         Z2d7aHK2l+p7t8+ps9VM6y/HIVqHLx4ogphxibDAFSv+r2DCkpmCVEw2MFEJ1cKZ1Az7
         v8unNSOBg2UgLgCperpPi8vlAKdUCk5n/88MgN/IpTyzW7Mgkg2SMB2yNXDydK6BXjNl
         5Afw==
X-Gm-Message-State: AOJu0Yyu7zrwsw73Ta8Z0BTjUDiemCOl6pBp/FaMkP0bbULbA+YvTRSY
	eqB2CAu+K54v5akzG5bVG0mbbW8xs1sJJ8xTQ4AUA+MWrQHnJzKX8aFL972PUg==
X-Gm-Gg: ASbGnct7W/JKJCa4mTfwhJC54f8TnIM3L3emy/Px2xD9+19ePwB8gjzSgkTpVXxZNrM
	Tum0rC37tZKtjAYsT6wxA3W0NWfc3U/cuMhKaJeneg3Qf/Va/bqKTWpF5ep7Ggqf03cKrvuTm2W
	1/vH/w8BzxntltFqeFThcQHi+f/tYNWZjqPUH8mdC+rA5DuSJBRC7G91iZPNbWlDg0gM5EqeOgL
	mFfAI19JIVTPGFaAkwxWgqk0TK2ECdvdt9/fPsmwtfAT8UevsPL9RcMurxkdMem3fkcgqKOV70S
	FNoyVjhALQZkpJxehwo1PbpYUZQWB5ILvW9AVk5Moj/FDm/d2lUak/0lnrbr5NMgMNIXKk6SC75
	KFkpjK3c90Fg3mv5VgNUh1/oQoxHoepTBZI79X02YbQQqKtxyUsyWWjYnYE4lJxWMSlvQZdtklE
	0CSEXBWH7Z
X-Google-Smtp-Source: AGHT+IFiQVi3MdEzFSMPzipYMpbatppB7KAuUajOtDlYI+LWzMAnOzf+8lErwX+pT2Z4/kKfZoYRAw==
X-Received: by 2002:a05:6000:2084:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42f89f4540bmr391770f8f.40.1764963970818;
        Fri, 05 Dec 2025 11:46:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeadesm10435614f8f.10.2025.12.05.11.46.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/3] gupnp-tools: upgrade 0.12.1 -> 0.12.2
Date: Fri,  5 Dec 2025 20:46:08 +0100
Message-ID: <20251205194609.1546800-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205194609.1546800-1-skandigraun@gmail.com>
References: <20251205194609.1546800-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 19:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122359

Changelog:
- Common:
    - Remove deprecated libxml calls
- AV CP:
    - Remove some stray debug output
- EventDumper:
    - Code cleanup
- Uploader:
    - Fix parsing the Browse result

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gupnp/{gupnp-tools_0.12.1.bb => gupnp-tools_0.12.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.1.bb => gupnp-tools_0.12.2.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
index 4f6ff3fb97..739e3885c2 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
@@ -8,7 +8,7 @@ inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
-SRC_URI[archive.sha256sum] = "53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba"
+SRC_URI[archive.sha256sum] = "4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c"
 
 PACKAGECONFIG ??= "av-tools"
 PACKAGECONFIG[av-tools] = "-Dav-tools=true,-Dav-tools=false,gupnp-av"

