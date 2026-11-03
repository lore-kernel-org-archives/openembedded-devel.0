Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1415.1793731012418595720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rZExAYN+;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so5802700c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731012; x=1794335812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCicYzGJKOpYa8MqMTaHx7gAEAzi3uC9b6Rjm7mMrK0=;
        b=rZExAYN+XXndwFPp7bj1C0LmqnS1sHnBSzmSYgqJbHds7SZSmcBo6/yIgJ4HfYlsC+
         xVa9Ca7oR5+K4QlsTXu/r+1sdPPZ80SW2UEOjNUpOPHArQMx4+I32KVV0e50eNb5XMGP
         Z1FQum3EibNQ+XdwafK95ijzqzE1hqFAfeK+5RLDR88dEiSrb2rh9NlGv7tWaUQO1eCJ
         fwu/la62D842oylTQynyNsVsgFwG66qF+DQT024p9avsRki04cNM1QbqTBDfdAagRcLM
         mw+wu4s08L3Q7NLVsV6XztmaAOS7OFa8hkp30ACli9FLXt1yBgo3YxrgCMKuqhTQsf46
         0dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731012; x=1794335812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCicYzGJKOpYa8MqMTaHx7gAEAzi3uC9b6Rjm7mMrK0=;
        b=Auy+hHZ+qo3w9JHH9+IQfVrr8HeVQ2G35Q0Ke/Gu2aRa4NC0NTz/2zpWDMGVyznBXg
         8s3HhvXYz10tlUFyHnyNJ0OEgF2qAplDQhL5A+rhxAPGJc+G02PocNhy+F66Gg0fku/p
         2wlxyiTMuHilSdCAj56+5UElpZ3TWSbvok4kTvqIdt9XQ8oVuZTDXXlW66bUAmUa92i3
         x1uBilSdWz2tUk+tcFdw4b9uww+dEvsfnI8On5m9f9IlWe/7zsbLcLQE03taQbpQOiKk
         ZYGtcwhiFk1TGRqsCJE5CymU1jLaYTNQI/JDMos1ruIrvqd/nIF7yK7FXR3RKlWxHDgD
         41yw==
X-Gm-Message-State: APuU4Z9oD1vGLdzaZBQmLZC6ilyudFqAcuik+tZi5z3bbFg6OI/cVSLO
	w8VOYim4YXP5WyELJqGOdDmrA66Mub/B17j89ZPJiqpSOaBTFT5giOAt7w4Gaw==
X-Gm-Gg: AYBFou1xtPGy1MhZFFW4mhZbtoeaK2i38ijI2CvG+QFBLbN5IOQvNG1fJzjN1izuP+/
	1ZYp5UEif9D3pkfvjwOsnXLt0LvJyXSll11N5lF/5HrdZrpm0wTz09g9Hro7JeZypzxB/z446rw
	glKaZqrxn2LQ/x9JqFch0M8VhhG/OEsYSNMn8ALa4fxZVKhJylh6kRg4IFVkb1dcwts9xNmn9lO
	T2WhsyGoTtGSrhOOxZjMYWYOpzsrHRm+2E0Lesfcb621ADjST6DPwTfTiaVIWiaxe5jkAgyJu6N
	lG2NycKc1mMhd/D0lQI/HrlVsPcg/2gK3n0h8zaDNdXKxttmTegYOolws2VVd0ZqxyLIyTw8YdK
	Wabd6lIfqaHhcdMd7ryBLQXEUpeQXkvwXX7ZUdss4Ra7E2kN35ghvnc91sMOWQQTw2e4V81UXgx
	Wa2fGqegBAsdQw9PkaS0X8wiZb0DycZb72SsITjhoIFzAHLhxk+aa1H+VTybt6FNNvl3EXC7N/E
	HvG2axbcGZSgOUbH1ScCqvD5DPn9RWOFVGI2uVgEQXJDNvuJguDiB+a8BMbtHY2NGj3l7LvxcYL
	2udnNyo1m/PPRaRk/+Il1dDllcLaRRkqCozyb45yPsDa07HE9nRTyCiR5NVCMg==
X-Received: by 2002:a05:7022:b0c4:b0:144:fb87:5b91 with SMTP id a92af1059eb24-1ac5e32099dmr19630783c88.44.1793731011519;
        Tue, 03 Nov 2026 10:36:51 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/20] mpd: upgrade 0.24.17 -> 0.24.18
Date: Wed,  4 Nov 2026 07:36:23 +1300
Message-ID: <20261103183640.919438-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131801
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.18/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{mpd_0.24.17.bb => mpd_0.24.18.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.17.bb => mpd_0.24.18.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb
index 80858516cd..354a73430d 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "83202ab4fb35196023163b007e537c0e60da8200"
+SRCREV = "8a337d15d452d5bff3be9533dd8c180f695aa953"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
