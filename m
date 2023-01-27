Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D8C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.96375.1674798886930880157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5wyOhVI;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h5-20020a17090a9c0500b0022bb85eb35dso3908235pjp.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYDmqExTYmpuTw28j2yaYj1pQt9rIzYMj22P0NwP0u0=;
        b=h5wyOhVIQtyvxTYQcjDFSPwiWGnGrzTqreGgYGHzTnn677KNphYpLSuTp6MHKyj43H
         LLXaeI2sWtQz0n1Wi+JjrklQjgQxnhLeBRlgQ0X0IuLC9bM2fBssp+MDVOpk64zHyvjF
         72LBikjdIifKPC8mgCfHz/DVfxKdww1APLxMXrJUh0kJu4kH+DOo2GhUV4JivTu6Ppz6
         y9DloIvRroMAV9BH6n/vm0jGThjuIbgmbKZdvC+PpL76qwPxJNhhkbxCnvmYW/wk168x
         AzAofDYxa7F6DQBmcAHk0VBVbIWtDt0tdurQ+D7+z0fcOF9t4MLxIfYIL+8okqJgLmWU
         b/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYDmqExTYmpuTw28j2yaYj1pQt9rIzYMj22P0NwP0u0=;
        b=qCLzv0rHSLgrbUtrfsDomQkkwFzbdIsmF6rZ0wS+F9+DiXr83y5likq/GuUvEXRZJ2
         Rauwit6f+uBy3PyiLC6sqD27xhNBrZTFElr8spja3V7aAukt2a7zikKe6I88RyS3Z8+i
         WvWLxe4tZNdW1cesDeztKX+nuheknrr6N90Fdt7FvtLF3S4K/IlFunGBUBdbwmql+nRn
         PSG2Ow/bh7S8/hOBnkeChAReVyGqqXagDzbIIhlTmtD+TgH43zc//oBvpCggd5c4mAc+
         J1qSIYqG9WOPMXED4KFRrQkR70O7QfAdozmZQiOlrS8TwdiB6Pdb5PZSDsuKnagWa7nQ
         G6RA==
X-Gm-Message-State: AO0yUKWo121GvSdOhI/I9RwMeX/EIWHqcBI00mcVgGlVNV9KhJcHLjw4
	tAcawNDk++PmuhS2AZxgpzx3k11LIErknw==
X-Google-Smtp-Source: AK7set+W0ZwJyQcp2WbzWpwhk4+675VMYlrkfSogCVE6FQw35ACpNY/sMYfblwuFsc/YgtK0hwUgLQ==
X-Received: by 2002:a17:902:d2c6:b0:196:1cc3:74d5 with SMTP id n6-20020a170902d2c600b001961cc374d5mr14086788plc.52.1674798886083;
        Thu, 26 Jan 2023 21:54:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/10] mpd: Upgrade to 0.23.12 release
Date: Thu, 26 Jan 2023 21:54:35 -0800
Message-Id: <20230127055440.2108933-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100809

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index e63c1b5e19..13938444c8 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "12147f6d5822899cc4316799b494c093b4b47f91"
+SRCREV = "d91da9679801224847c30147f5914785b6f8f240"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.39.1


