Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.247.1617899783840541981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lMwkfAaj;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id w70so2850231oie.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f+RahKdrU5YXuAsnkLEfhnm9aAzm3rP5AEMPFEK4QLw=;
        b=lMwkfAaj4m/V2ehQ9L8lypeg3QILKvZFF5OThIsDt+aDfSwtrgZ10GBzvhTqNFJPp+
         6Q29IqsziyPfOgOL6MLlSkZujncWSKr8Dt7+n8OInotWumWMbXEpRp1lqWDQLEQQ2r6t
         XjAxuKZZ0r2PXVFZYPOW1CHFaDHk6VQ91MTN8UkJkod0MKnqfei+pCCOfVoehNNiGqcF
         g0TG00G5Ks71qfzJFdhTr8VSDwQhMCAS9CEKmZPdvuyrwMm1hBQ4e1sWKDlH7Hi0H8yC
         S5D8WftUAc2ZflSwtZWRp/sNDMZlBMo45kVv/9KbpCFRNkzXJiv/HoCCUhT4dHseziCf
         uhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f+RahKdrU5YXuAsnkLEfhnm9aAzm3rP5AEMPFEK4QLw=;
        b=nfw1w6wiCMa/TmolKB1fMx7uXReofVpcdsIfOBSXtYBpohuVYnMWE5lgQ7AztYyngT
         IKVcrF8GWMMD2NkIakNdSAK0DglVvVLbeUtk6jmBUNElVr3LrL3j1YmvNjEyNNUrkQ6v
         AfyNwM0mc6vOS44pCM30QkRKAhyP2iEbnXfOarJ9rfTiZNpb774zYTPwKa/ZiYsaN0oZ
         iXfUCMAtfs5OZ++dKtC65QxDYkVJ8YFK6qdsyug3vNtu1HO94oMO1ce/2eDDG0OctYKh
         sA8U1buYzjfCHBK9eSqxOOs7OqOm1SnH820OSOZrM2hnmBdqJcMYhPMQKqvlcDeUOkm9
         u1pg==
X-Gm-Message-State: AOAM53189PJprLVdNJiyO6b3u6q1eI3VUnpqvytAIgRi9mD3CGK57y+6
	zbXBy8m/b5oS9HwA4syzlekZ5Dm8e9g=
X-Google-Smtp-Source: ABdhPJxRI4OB2Pa+8jEOuKnppyPjPjjzTF4aln/D41ewFwO85L1qFQQx0K5ijv4Df01PB1rJ4sT7xw==
X-Received: by 2002:a05:6808:8c8:: with SMTP id k8mr6695488oij.140.1617899783086;
        Thu, 08 Apr 2021 09:36:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/64] mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
Date: Thu,  8 Apr 2021 09:35:16 -0700
Message-Id: <c10ab3169fde7570d5aa7c3cac7acc213e722f14.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

aac and ffmpeg could be enabled only if they have been whitelisted by
user

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 20ac7000cca4b1af84782e9e79dcc5207fdcf71a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.22.6.bb          | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
index e91bb5d9789..b1fa96e1bee 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
@@ -2,8 +2,6 @@ SUMMARY = "Music Player Daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-LICENSE_FLAGS = "${@bb.utils.contains_any('PACKAGECONFIG', ['ffmpeg', 'aac'], 'commercial', '', d)}"
-
 HOMEPAGE ="http://www.musicpd.org"
 
 inherit meson useradd systemd pkgconfig
@@ -28,7 +26,14 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
 
-PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+PACKAGECONFIG ??= "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "aac", "", d)} \
+                   alsa ao bzip2 daemon \
+                   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg aac", "", d)} \
+                   fifo flac fluidsynth iso9660 \
+                   jack libsamplerate httpd \
+                   mms mpg123 modplug sndfile \
+                   upnp openal opus oss recorder \
+                   vorbis wavpack zlib"
 
 PACKAGECONFIG[aac] = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
-- 
2.17.1

