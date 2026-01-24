Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14644D715CD
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 05:32:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13630.1769232739948211577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 21:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYxdkMfd;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so29264325e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 21:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769232738; x=1769837538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWbt5y1Jbjc7Uvod6HUVJAO0lm513i+YSsQCZ34YTVw=;
        b=cYxdkMfdp9m0VJr5pUyVEesvpWXclUzXGfaDBHTlxZwbvpJM47nnHAHgtn6XOS0Voa
         6ArNcK6K5heAwWMw0dcA20W+WBNnPl6gmMbOnWr7grMR8VHUf89wlDOdHyW24bcmF0y3
         bjjhV1LNvLfjLtx/BBNreLGznYF7En1SHw/DxJeW2Yuo5TKKXVxlRB4s/WxgB9ZiqUKf
         OJhxOZB+X0P0NEfuWIu6dZvyD6YncepGacWrCSF8AeI4dXOikSRak7Wo9JmZPrpF3Ose
         UeOkRLRditQP+yr8gsLKeehFCxN3C8i57hI7+WfUPG0GFh1okCMe7qGAEiOix8V1eY+J
         C0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769232738; x=1769837538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWbt5y1Jbjc7Uvod6HUVJAO0lm513i+YSsQCZ34YTVw=;
        b=TaV5TFYk9zoIwiGaCuQ6VOqz8G+OvMKQvaKkPkvuRiaSwlHQxc8MV2gvcq/xd0/itW
         HV+0+9D3JK4TCoHlySkTdo61Lik23C+9nC3A+Rug6hzUhI/nNfideGzanTXIbpmG3p3o
         05bPvLmCTTGYxJhW/o+7Ph14s1T+umUFjEslC7jzjW6CscQkZ3jYSRhVEO6fhWdYNtC8
         Dc7tIEdEE1oJvKQOjCLmTsjbfJAe05meNK3GmrhuhXKG9ei5kY+wEn8YpT8DQF207JNh
         JeI+rV5KPJGwLNoAAAYrhpYO8+mJHl3ji9LFUFIaV8g2QhzxyTJk75vTa44TPWGg0HzA
         4UYw==
X-Gm-Message-State: AOJu0YwL7HN1jlZuXHad2ttSgSHVyyum/lkZSM5zaMlyUn5Rgo9WSNub
	Z6HFo1y496Sf/0Jy2/E6vzN2qL0mo8y5DHSaca4HyeNVavOcOoJsSrUz6CvSyw==
X-Gm-Gg: AZuq6aKUOOJPt1reF4Ons/yZcxmbTzhvPj3Oz40S6xrCa2Fdttcl7IdwK6Zt5acnikd
	hWT2y+LoaBFpVVNe9/7fCZeMZUVW8TUSLylfR9B9j+Q50PFn3fzKs8in28vMpAw2bZ62USHM2Hx
	94tV2t6oR94WObCuqhg/HWgJ9KUirZLRPlVUfAmvPLs9J79g8O2ZZzGxwidVYlfWCCKmmJU7qyc
	a1mQm5f+ihdoQShrpWSu3sRVGgoGE58xx+Qcmxupr1aHNBLMcBEsMKuekCWtaloGOGGX6I3ZuUF
	kHPfj/drvTylKb0IwsoAfCYoUOHwsM4i+5c1xLJqAamfW2Ii8vM6Vrz4IS7hbyGjLoQGZrhp+5U
	aS+fNWE2RCSyai2FzNipOWBYQwcMqBppLezIHPD27nJWQJNjaV4B0Zuff6eruIZ4QDqqcHXlmFx
	ELa1+s08mA
X-Received: by 2002:a05:600c:190e:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4804c947bf7mr87844555e9.4.1769232738021;
        Fri, 23 Jan 2026 21:32:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm40746155e9.4.2026.01.23.21.32.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 21:32:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 4/5] tracker-miners: update 3.2.1 -> 3.2.2
Date: Sat, 24 Jan 2026 06:32:14 +0100
Message-ID: <20260124053215.4066209-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124053215.4066209-1-skandigraun@gmail.com>
References: <20260124053215.4066209-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 05:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123805

Changelog:
- Backport seccomp rules for rseq and mbind syscalls
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{tracker-miners_3.2.1.bb => tracker-miners_3.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.2.1.bb => tracker-miners_3.2.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.2.bb
index 2847635b6d..87229622cf 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.2.bb
@@ -16,7 +16,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
-SRC_URI[archive.sha256sum] = "44369f53e2edef41437406dbeecd477a97f8a9afdd9134832ea45d1ba2aa2c47"
+SRC_URI[archive.sha256sum] = "fd84c71e621bc2b81cacb5f908932436246d1b8a4fc3a6353e2b8dbaebc0236c"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

