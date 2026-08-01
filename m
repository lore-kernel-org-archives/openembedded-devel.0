Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B796DC55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13734.1785620740520694988
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUcS/asI;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2177983a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620740; x=1786225540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KE6Qq/I1a5+qimT3BqXiQUbx24714GbdXd6AA1AiT8U=;
        b=jUcS/asI8Cyb9CjH2l2Mlr4232f0QyQavaKKLbk+7hug8ZqrppPGv+R67Kafm7NUY1
         Kt/pbzhnVaibI5KU35gpKRHlW9MR4IZwwItLI7xiHqDaG81QLkIT1+8kLyIb9sWW0Ue6
         00JpTgdCfsg4BbIHftLEHiwzo+uWSfD4ggJLsCjwuQ1IYMNc6d3hLmdQc1OiVG1aF/Ac
         Lak+26hdgCZO3kdK0S+FAqTO2ve9WQV+ShKjhcKRBL8fY/poZPCDNYqZp3iWC168iY4d
         i+RyNelnK9kD839ofh6Cr4FeWWCARR2hSy8CpfVa88ACHiDECxmqF50TcrFuIrpVkqeq
         wwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620740; x=1786225540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KE6Qq/I1a5+qimT3BqXiQUbx24714GbdXd6AA1AiT8U=;
        b=gDEePsQa7r4wzb08ZNNikM0tWAsAU9qbST4SoRJZp9BdXsFYh+g1EoHfJFa8LdMXs6
         s76APgme6egQB7PdzMEQ+8KmOr3srEF6hXnWwj2E8gyNGcIhIqkRksHcm4297HpOynx+
         jfUkXCIWSpnduNjLlJhfcdirIC1gh80BA+M5AO8qXm1zPEkY5pX4BwA3sPfCBiqCoZxI
         BylmRZ3Yd5Ve1/zTJ66BnmkwBoQ4hO1oqxLDfeedXbmmP6VuJbTa7+VNUM0oSGydhHS3
         J3S9L0xR/7ck+IyC+mC/+wZwqd/1P/0pahfOZ7Md5ncyKmlb1lYD+YvQbFF22TOHCJmG
         8DLA==
X-Gm-Message-State: AOJu0YxMelcavPqeNYkdFTfuAQ6ctBh3AhB0vSZ8GneUEAUZnKbSOCzx
	CowxG0W6H+r8ZrY6bfsMLGVTvLi+mBRofhtxSzBPwp/hbuI1j7QmoGyW8cxL5VWg
X-Gm-Gg: AR+sD10gGDZKR/QEiHy1+v8BRnJer0AE+0LIl5LTb0ojHVfOyFv5sWMyGYo2h/8ZYFm
	VLggvQ/qhE13SlcmKPgYFE/8y/4Cz5V2645xC0ikij17I0K/Qs4/fx3ZPVlA84VyPJwJUoPmxUc
	u5SjNoLifAF5hneVFb6qZgnZv4YsTmWxIlZ3IvEaCHxOFzsfgScNbznjaVA93YO1IP0bczVb9R/
	klSmD2vjx9FfhkGqLFDMSn+Nl3cwKgV7KWBZIz8liml4XYMo8vJfLzAfJBg8sWp85V5q8gC7fdX
	NH/nrQ9urTr2oeyLcp8oiFUQXlLWOI8WBMTJN4UbLVtvasLn/WkOmTVXCVeGIita7ZQkejLpNry
	chm++KwzYbcShcaw/cWTtUf/7mHEXbCMh1GPnnDcZBOMx7qGKYTsuYBSJ+Ms+F/Jb2akM3D3SU/
	JoFYBRKU7ksIABcn9KP0AiPX/GZAYCDvhOjR/1+q6lDHNYSCQoD/Qo8F2Lz03oPpDfpLb+Zp6Ci
	Dx5CWmq39dPytCV5gZYWBP0sa6epU/JlzAEMQ1qPheouVFNVjIvy6iB/yvSYKzdTB/B+Gbjgldf
	7QWsfQa6F3F//Htol8HOHh1jjD62LSGusllQ8gtLtJuaRZVrV94a/k+PiTyr1SdIaOKiVRiFDRv
	Fbw==
X-Received: by 2002:a05:6a20:54a1:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c92a8134eamr4651069637.42.1785620739795;
        Sat, 01 Aug 2026 14:45:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 12/31] ncmpc: upgrade 0.49 -> 0.53
Date: Sat,  1 Aug 2026 14:45:07 -0700
Message-ID: <20260801214526.788343-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128629

Upstream changes (git log v0.49..v0.53):
 * New Interface / PageContainer abstraction; screens migrated to
   Interface::Alert() and ScreenManager::Alert(); removed the obsolete
   global "screen" and the old screen_status library.
 * FileBrowserPage now formats its prompt with libfmt; charset cleanups
   (drop Utf8ToLocaleZ).
 * TextInputDialog reworked (options struct, KEY_RETURN/LINEFEED
   forwarding in "fragile" mode, history handling).
 * Bundled fmt subproject updated (11.0.2); translation updates.

ncmpc 0.53 now formats strings with libfmt and its meson build pulls fmt
as a subproject; with wrap downloads disabled the build failed with
"Subproject fmt is buildable: NO". Add fmt to DEPENDS so the system
libfmt is used instead of the meson wrap.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../musicpd/{ncmpc_0.49.bb => ncmpc_0.53.bb}                   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.49.bb => ncmpc_0.53.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb
index 626897aa3b..0c8f450687 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.49.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.53.bb
@@ -9,6 +9,7 @@ DEPENDS += " \
     ncurses \
     libpcre2 \
     libmpdclient \
+    fmt \
 "
 
 RDEPENDS:${PN} += "python3-core"
@@ -33,4 +34,4 @@ PACKAGECONFIG[outputs_screen] = "-Doutputs_screen=true,-Doutputs_screen=false"
 PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
-SRCREV = "f81f875fc5785383d24f54fb9bd3cf06efd915a4"
+SRCREV = "b6b1116709a6981d432cd2455bff4c35e4b96213"

