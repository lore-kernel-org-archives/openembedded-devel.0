Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1769.1792434902623325389
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y1GwGzYN;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd623dfe420so1804951a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434902; x=1793039702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VfVySfNeBqorzi1ldP0UCxzEgdfl2RQm/k2/E9UBCo=;
        b=Y1GwGzYNdtdn1O55YM1X+Xbcy3pw+W9oSYVbH+pZMu7Gz6+jDZfm9JbUWqE35NhdVq
         mJUSWVGRsO88Po2HbD4TV3OfRLe68MTbWYEsVLkkP8vkAWqRWSohCcRs8EIAW4wPLTWK
         6CdMcUsafSC7VMLmmxZSkwcA11AW4fC8ccmvAXR3fUYH1FZniTnzW0bQKW51YX9Djcsn
         bPvFC1kf13MPRGyeJczv5DUuDk1UyaKnVPQaE5QSUzJwdNIW3s6jlARs2TROFFII+Lp5
         bajXGN3cuo5vGVRD5XAr9iZ4X8FEa1wO1PqSIjsj+RbpH2G3HKZOWhoA/WXrd8pdEVn/
         0Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434902; x=1793039702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VfVySfNeBqorzi1ldP0UCxzEgdfl2RQm/k2/E9UBCo=;
        b=p0EBiGtdLGbj2yjduI8ONyGbXEpVN0CHx8A1CEkF7y0Lv+jadh7Xcwuv6ogw5pMa7m
         HW+M8JAgMdvvbaxWVZHtQtrSyqTBNspHHvb+D3HnkOIytJACvQZ9zY8LldQQ9i05A3bH
         licMdQ7s27lgAHN7V/xkIXXxvUbflo29RniMcO/F5E+2vuTKWMYfNhRS4ay2Ex/XKfLk
         OdMdBoElkVSLhce9vC4FlAQTHZehX6o6519bZ4Xm6txo6QLuC1gQA6+W2J81kk/ZNLpH
         5834uYUsCF8dIQWxeiR/lcCXL6t98DMWdu2m287bR/qT5v8R6cZoak6nrOYuh3wkOJLp
         19gQ==
X-Gm-Message-State: AFq9FYKzaV0tTM8VKaIyow1sURVi803aCEYpizVEbeicYg4YnsBl3d9S
	QGrGtqZBRkL+s4Sxc+2dlmJuKUS4GM80XZ5DzCWVqYF6+PPI7UOZeq6U9GRgkQ==
X-Gm-Gg: AYBFou2n5Z0PtqoxSeWqyBZ8fVgTbZYzqxA2wGMLHpUl/1zqAMj0CDCQEOlzFWHT3Jv
	WushCwNvoyAlqfV+8zo0UVp5DGWDDTJO+CQKgJMVoWlR4135dtNGm7Ldorwtd8OOzp5vPa+BFWZ
	tyRf7/N8BYrjIUC8WB8as4ZODKwvBPaY2YkKpMS+KTbm0bh/ZirZ1zMqodGwU3vGO9K95f9N2G1
	Bns7QgJy9VjSDcihXn1k3F047T1eO2WUKy6B1Pp4mM7jeJbHQ0xvbYV9yW/8QyoNVx3/sPXZQUE
	K+Lu97c54+EBPmCRHUKwLSXZ96JEBB8j+JKfjX9UAsuwGUGeHEELg0oT65kF5GtjkQfHT/uqS0P
	TK+BqT+0m0AOxyZhZASaQKVtqmIE2GH40MBVaTTznFR5xRDhRtMseeLDh2z9BedzHlWlUmw4BQq
	7BGZEK9DINw8seofhjlNZWqwhDh7oX/1W+SWL50ioZgLACZXUlQOq2fgP7JU15HBDVAuckXUEc6
	S1rTqQgYbFMFIQWwFj5KiMxJWggKZPFdpAshTY=
X-Received: by 2002:a05:6a21:730c:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3e226254f11mr6782437637.21.1792434901960;
        Mon, 19 Oct 2026 11:35:01 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:35:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 20/20] mpd: upgrade 0.24.15 -> 0.24.16
Date: Tue, 20 Oct 2026 07:34:06 +1300
Message-ID: <20261019183407.1037972-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131146
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.16/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{mpd_0.24.15.bb => mpd_0.24.16.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.15.bb => mpd_0.24.16.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb
index 2b1ae309c8..f5e1424a73 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "b1c87eb85e9b211369e42433526b55469bf1b6c9"
+SRCREV = "a07478faa8c94cef77b22e62d755ab19e30b9085"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
