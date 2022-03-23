Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CB9C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:28:14 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.4479.1648078094189032206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eiHyCXGo;
 spf=pass (domain: konsulko.com, ip: 209.85.160.176,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f176.google.com with SMTP id t7so2556212qta.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nMVeea2+ygchnghZNcjpwYhsjMWnc+UFSP2Ju+bBI7g=;
        b=eiHyCXGo6SnX8hB86nwKls+EZ9xjsxzWQIeS8HrAM+uBN68/idAhqXXdwNuqrYb8/Z
         7rgyyvkAp0Lczzrv+uFvVnw027eJtXiiSBUSzs5CYGPF22SI1iNYPl+T6/BDNJuJLf8L
         8ZpKoE/SD+CRO2homS/C5pmiBvPU1CUGz3PBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nMVeea2+ygchnghZNcjpwYhsjMWnc+UFSP2Ju+bBI7g=;
        b=oZ8ofdE6iYKklJC488mB5szqE4vHArdUWHieQjdobn5eVFo8Won0RotCPsd2Kr1GUK
         9APMfqmcRQiO/oo0ZJdff7i4IwHS9TXzklatryJGr4uIQBWwgZEnm2WWAk8tLO2gsRcF
         HMbmMjf5ZLdzKF5SShaGMlWve1UbxyKPk/sm2k4XkfdLSq1tKjY4aW3tGfRQ4yVXQhrW
         Izs5ruEMXo65+C7ONQynWTd9QlNqggsKQR/d5is6dJaDcjIDVlCcQfnq73LXQIUdjXem
         C8WjbTJTseM+HOWTRtyjpSO1p5tlylHvhGQZ3ifrP7G8Lc2xBbZlfg+3D3+gYqmFedM+
         ZkSA==
X-Gm-Message-State: AOAM532bFudAXSAwBiIPtuKQ2cFzq/ZJahaMDrj4/ampOBaFr4MeJtNR
	RYCLI6YArjC0n9evgSRvXBW72sQKf5hyOA==
X-Google-Smtp-Source: 
 ABdhPJwx/QkS4IGz1WL7NxD9Dzv4+ONAbnJfDDH7vkZ9/YTi0H3xCqTTyQmO64N0Jm9kr6FcI6Q2Wg==
X-Received: by 2002:ac8:7d91:0:b0:2e1:be79:7fa5 with SMTP id
 c17-20020ac87d91000000b002e1be797fa5mr2018264qtd.581.1648078092553;
        Wed, 23 Mar 2022 16:28:12 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c10-20020ac87dca000000b002e1db1b7b10sm1102411qte.25.2022.03.23.16.28.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 16:28:11 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] mpd: upgrade to 0.23.6
Date: Wed, 23 Mar 2022 19:28:01 -0400
Message-Id: 
 <bbba1edd71e7dca7686382e1fca4246874a9d2aa.1648078003.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96169

Changelog (from NEWS file):

ver 0.23.6 (2022/03/14)
* protocol
  - support filename "cover.webp" for "albumart" command
  - support "readcomments" and "readpicture" on CUE tracks
* decoder
  - ffmpeg: fix end-of-file check (update stuck at empty files)
  - opus: fix "readpicture" on Opus files
* output
  - pipewire: fix crash bug if setting volume before playback starts
  - wasapi: fix resume after pause

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.23.5.bb => mpd_0.23.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.5.bb => mpd_0.23.6.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb
index f6baca523..c74f1074c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.5.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "df4b6b92f2c4bba1b55fe0a5559b19808abb28ff"
+SRCREV = "f591193ddaa7f9bcb6c85ff5899517fc7b53e35a"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.35.1


