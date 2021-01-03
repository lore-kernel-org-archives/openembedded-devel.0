Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.19969.1609637175993696868
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZVV7+Isc;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id 91so27339169wrj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Zmp/kG/sq540zeTaAwnP2LcgHMGZONfJXvJhM+d4z6s=;
        b=ZVV7+Isc5YQri2HBM3ZW9ZotgHi+XkRapiEIPz29lQ7WkzN5ZRCMWzpZrZt2wj9Acx
         Z7d0gdNia/UwSdQ6rEkXYHKFzUdlMehaL/ojo1PFL1ZbWmM1v8qpORnVbtGUf2Rne/PZ
         /9svIBuP4JJOTWBmAwsVlCSAN/A7/qKiQFV4crJhHhUdoj7zWPR4b/JliOt7jrHLJWLf
         wppiXZGP2HGqtgZfqRz1Mf2T6RhaEvJpsfiUS4aN6Baepdqgw4Rk7MsoTfnEW1C5kIgF
         jJa2En4NhU53fb2AODzXsqsUlEhazSkpOM6oXRCwRvv0bFZIF99IGqWwiTkyhvPtrJQQ
         VlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zmp/kG/sq540zeTaAwnP2LcgHMGZONfJXvJhM+d4z6s=;
        b=W6Y346P9waJFWEh3wrQAWKiSKLPOnNzfXLded1VNNavqecCGb5PuG5hFcbwjQ2AQ2I
         QRv5MhmWIjCEYPVoRMJ3n3TJYIAe7leURa8O9oZk6ufADottsT2jDwm6oWTU3XeludwR
         gwoGp4fChZ0NmOCijG5Un6DDMVH0Ih83YaVyV9riXf4TvcsRbUsYjdDqg2oB/6tTAo+t
         O72YNzcheWcelr9sTZLprInlWWWri1AeI3jT0vysCw97pMTRnY6WlUwZW935djOoeTBa
         nDDH5RDDe1CuRieVlg3inwnhN33AxmcXddaJc4QEHrCCRa6qAz72DNVDuW3QMFWHZ/8v
         x/7A==
X-Gm-Message-State: AOAM531ZZYElGTnT+be1uclxGq8ROfkn1ixRpnJbBRYrZUwO1vGn8Yfj
	ov+YUY9jkHHi8UN58/1Kis0orcXNkpLqGQ==
X-Google-Smtp-Source: ABdhPJxKAkK8/RMC6qsmMyesHdltiCQg6Kh0NXTyOU0V0QMYclNJV2lzF7Zc81aQKWS4KYxguZOpOw==
X-Received: by 2002:adf:db44:: with SMTP id f4mr73277091wrj.169.1609637174701;
        Sat, 02 Jan 2021 17:26:14 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:14 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/16] xfce4-diskperf-plugin: upgrade 2.6.2 -> 2.6.3
Date: Sun,  3 Jan 2021 02:25:49 +0100
Message-Id: <20210103012556.557336-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.6.3
=======================
- Fix build with panel 4.15+
- Fix missing-prototypes
- Remove GSourceFunc casts
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16160)
- Update .gitignore
- Make build less verbose
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Belarusian, Chinese (Taiwan),
  Croatian, Eastern Armenian, English (Canada), English (United
  Kingdom), Galician, Greek, Hebrew, Indonesian, Korean, Latvian,
  Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese (Brazil),
  Slovak, Slovenian, Spanish, Swedish, Turkish, Urdu, Urdu (Pakistan),
  Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...iskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
index 6a72c89a6..45bbf2a79 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.6.3.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 inherit xfce-panel-plugin
 
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "538119ea97a217695b297e2d165b305f"
-SRC_URI[sha256sum] = "fd2e9843da5822de96a7829e50ba496c34a50fb8492d5b5f792558c6b7ce9644"
+SRC_URI[md5sum] = "2ad57a6fa5dc6468f66f3cc7c9d6f101"
+SRC_URI[sha256sum] = "73b1ea2deb2403287337e8521d21345fb2f88445f9030732fa28f1bfa5d51c59"
-- 
2.26.2

