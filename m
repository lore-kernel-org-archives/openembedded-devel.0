Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.2578.1614745015560075024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 20:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T5yCBDpD;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id a4so15354479pgc.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 20:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3hjO8AVtG0jdb5UVxvynJvpxpWU8ALTkcZACCdfUNQ=;
        b=T5yCBDpDicdFBjWNnYECT5r/OznUotZ71Q3teZci07yosdacnete/41z8tWz+mait0
         E8X9xkA3dFP5mVovZTCmycQsdIgq4IGbqkDJidl5ondhO9M39XKo7M2Cvd0re4NyNTec
         2b7/83PMtJ8bEG6UWTn/4A9YSCQexWlK+pqmB+0tV7GLgUgvjYQeucTZdTEkMIMHR9rk
         1p0ALCv2eegW3UA4k7Tq03ruwusmroPpkllfcofU+IEFeIre5IznFKvnu8xMcZ2+kLOj
         M1Enk9rm3p81AUgSa4DUSdQ1zYmAyTwBporau+WAXwMGSTixkovDOA+BlWU0hDo+DO1e
         XkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3hjO8AVtG0jdb5UVxvynJvpxpWU8ALTkcZACCdfUNQ=;
        b=J3I5GeS/sqe2j22s7rVNdSOCwQdilUC+uvZkHrItjXkqQH25QNVi1RU6eiOKM0ECKI
         klkIw9Jp/eqcrxgzBOlM2k7EH1SBgsnw/kuRY+MRZIC6/7E6CrzexsvL+NAyPs2BgWBB
         tydY36wKIPARILitboIf9PeiQwc/yUEnBK8UiJa5QsWXAgI8S9Rbc4SOFleubDQkiX8o
         Y8cwbhOt9JDBjrsEq2Y5zw1K1fMyqFAleZQqwwIqLjEw3j60KrixOiBPyJOhWV/qIFfE
         017Q7FuTBi3sLC2zj8G84C/tkat8bRmRT7IsCzm6gePoSnv7lyofKR5a2MkWd+/9EDD3
         igeg==
X-Gm-Message-State: AOAM531SXQNEKKSdpmzLGu6s3iugnJJryU03Hk4x/L5LKjIYAZbDBNmK
	qaibtyF+ppNjh+ZkKoGI835xvUNtSv/e2w==
X-Google-Smtp-Source: ABdhPJyQL3Vjsi7bilBpblcnuJVF4BRc51rsKODPzSO2WHkTagEd2527vmLa5xZULqLgR74otk6kpw==
X-Received: by 2002:aa7:8d92:0:b029:1ee:75d1:c87 with SMTP id i18-20020aa78d920000b02901ee75d10c87mr1270009pfr.9.1614745014838;
        Tue, 02 Mar 2021 20:16:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id m9sm4824631pjl.4.2021.03.02.20.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 20:16:54 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] v4l-utils: Package systemd fragment for systemd-udevd.service.d
Date: Tue,  2 Mar 2021 20:16:49 -0800
Message-Id: <20210303041650.2457462-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303041650.2457462-1-raj.khem@gmail.com>
References: <20210303041650.2457462-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
index 7d96646220..3c90a68de4 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
@@ -10,7 +10,7 @@ DEPENDS_append_libc-musl = " argp-standalone"
 DEPENDS_append_class-target = " udev"
 LDFLAGS_append = " -pthread"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig systemd
 
 PACKAGECONFIG ??= "media-ctl"
 PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
@@ -40,7 +40,7 @@ FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
 FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
 RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
 
-FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc* ${systemd_system_unitdir}/systemd-udevd.service.d/50-rc_keymap.conf"
 
 FILES_${PN} = "${bindir} ${sbindir}"
 
-- 
2.30.1

