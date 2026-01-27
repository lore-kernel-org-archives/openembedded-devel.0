Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C234BD2594D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:00:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3949.1769493639446026495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kj5vY0CK;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d21c411so27401795e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493638; x=1770098438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV+53GEs2wxb9UWjyh+IvVjMxX8uL1MUQMqFWSaIAgQ=;
        b=Kj5vY0CKXMIUZVCTkIptRsw0d9gStgZgFjDKdbJX4VTmek2kifmJJUx1OFTqQcKZnY
         9tqQOKY8JlFCgyFtyTBI5enp+bRraXnI6htmOktxSLBr8onXugc4LT4tED5gF1eLp/+M
         Htm6/bmoozGIcUuHnWx12pkvWsyEbZNdqdlNxTyw9OHyjouPY/8XKY5Lr6Zgvg1nRM0B
         M1AbtYHA5aSMIiDKZ6SPsH+ocxHhMzbDEzIodKb9oP8OQmh6Bi8rVVrQlNqFLMIbOE3c
         +vRBWOsJa5NDi3B667ntnnbywfjx/CRNOOS6KhJHenCyE2KGsPQDyTAnsH9rTcDW3g5+
         luJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493638; x=1770098438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FV+53GEs2wxb9UWjyh+IvVjMxX8uL1MUQMqFWSaIAgQ=;
        b=op35OOdWVFKOhnKaqIWZOkKk+AYc2Pn2xXBypVv8FUHodOsHS4T+6qtMekAbu1gZZ2
         A5z1c6Q4sU8qxqnZksJX93uQrgtaim/PDiKM7w1twuVHaFtopnsvKIHr4SMfHjphd6fX
         5We8lN14HFGP+ltvxe4jdr8zHcyzBGCmVsv622+s49x4WPDAEWnZB04u1H0NfwZmhDmb
         kT5b37US3MqwhJNRqvSzawBog6nHu1/Lez2dRXT302Nl+W44cHm9xLuK8bUVde1SeZNL
         yEpwctFAzEP2zRmXARqtDnOep4aXcT8AJALbXGlOnF3LfoPqdjd62YkFy5kWYhy0UfHO
         iJEw==
X-Gm-Message-State: AOJu0YyjyxZqdBJnJqGlsZjTjU6ulLiV5XX2umEfX5Q8twZ6kJYqnU7a
	S6wRpOaCMGnf8aVkQ0ZCGlakcCKqX1Du+kTBgRoschCZfRcRRhYW7iCCCBMQVw==
X-Gm-Gg: AZuq6aIvDf+DqbRttKFxp2xCc6Bp0wVhQFDAlog9XeLvXCCZC99usyiFJNLmTOT2BX8
	lBmGEqj89owXJqu9tROqZTWjnYjGU2hUZPMn76l2uyHAe101mbUPGtDoL7wdurccg3hLH77Rpot
	vNQwrm+CYm/FsS/D2CsZLpzwF/nK4NpMmF9i4fLfBR3S7jpm9GMIeWyCXLQ36rHE7sj8PI/MlPD
	DapvYtKY5bIs7s0p+OAPcfys3nk3LKRBLaEsBboTwUnrLVcAy1SDUwO5gODGEFwN3zKW3oEsTNv
	CohA+qLe7ie3nWwqRnJjhu87dDGjz0PuGxjpog0ErMPGRP/Y7d0WDrwSvjgdmlfB7kf0U7yCGf0
	sU9OE3C5IWPgby4GZTxuRukX/RrdL5e8x9X63GoqX5h5LwH0MKYxYol8Iq/5vqLEoTrP1fisI/y
	y5dwhDnW3P
X-Received: by 2002:a05:600c:3510:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-48069b8de93mr6272145e9.0.1769493637688;
        Mon, 26 Jan 2026 22:00:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm126122825e9.0.2026.01.26.22.00.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/5] gtksourceview5: upgrade 5.4.1 -> 5.4.2
Date: Tue, 27 Jan 2026 07:00:32 +0100
Message-ID: <20260127060034.1301860-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127060034.1301860-1-skandigraun@gmail.com>
References: <20260127060034.1301860-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123902

Changelog:
 * Updated languages: c.lang, perl.lang
 * Updated style-schemes: Adwaita-dark, solarized-light, solarized-dark
 * Updated translations: Friulian
 * Gutter renderers are now provided a prelight quark for lines when the
   pointer is over the gutter.
 * Hover assistants now avoid synthesized motion which is used much more
   often in GTK 4 when dealing with crossing-events.
 * Hover assistants will now dismiss themselves when the cursor moves.
 * GtkSourceMap has reduced how often it needs to do allocation by ignoring
   spurious notify::upper and value-changed signals from GtkTextView's
   vertical GtkAdjustment.
 * The testsuite has gained some correctness improvements thanks to
   issues pointed out by Sébastien Wilmet.
 * The Vim emulation's register implementation is now shared between buffers
   as it would be expected in Vim.
 * Snippets have gained some robustness improvements including the ability
   to simplify results from the snippet parser, more defensive behavior,
   and being lazier when possible.
 * Tabbing through focus-positions in snippets will now immediately jump
   to the new position if scrolling is required instead of animating as
   it results in better placement of tooltip assistants.
 * Assistants including completion, hover, and interactive tooltips now
   reduce how often they request presentation and position calculation from
   GDK and ultimately display servers such as Wayland.
 * Completion windows now take the size of the gutter into account when
   calculating their position relative to the parent GtkWindow so that the
   typed-text column remains aligned with typed text in the source view.
 * Completion has gained robustness improvements to do less work when
   possible and avoid spinning the frame-clock which could happen in
   certain scenarios.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gtksourceview5_5.4.1.bb => gtksourceview5_5.4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.1.bb => gtksourceview5_5.4.2.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
index e270c56d9b..297f79fe20 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb3584099cfa0adc9a0b1ede08def6320bd099e79e74a2d0aefb4057cd93d68e"
+SRC_URI[sha256sum] = "ad140e07eb841910de483c092bd4885abd29baadd6e95fa22d93ed2df0b79de7"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'

