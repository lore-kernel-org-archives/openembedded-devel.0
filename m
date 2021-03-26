Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.6522.1616721775726789552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kwtYo1h8;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id i22so3528230pgl.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VpzRCn5MesXejR0bwF98w9b30JPnEcCV78B7YUT84mA=;
        b=kwtYo1h8bqFkItcOcq10d82XUvykN8WQiQZeduhUN8wpxmN4hxkQaBdAZOvOhJDjc3
         mcIIsGJkNj+GB6xvhPMt1sFi2hOYqwwfbnQzLjllVDl5oed1l4A6qzrBy16/wJNb2NDn
         Tt5MKe3UzIgXLMq/DqVaXRGcbMGD6HkqFDWUsAOwK+cDMyGKBZnY6F+pTojo7d6dZkDy
         TKPwQThRlJ9N7SDJxtLDc65Fvua0cLa8eAeZac5B1h/4jdBU8SEJuQ/g1qv8FX0VbZH+
         aAklTs5VOseC+5LFkxk8s7IvlhwOzzqGuq63GM69jjc6N/3swjwvZOwf8nobgcjWgJKq
         dsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpzRCn5MesXejR0bwF98w9b30JPnEcCV78B7YUT84mA=;
        b=Mszrg/PeotopKYOWbwuEkcmGQGlr3vnqDjAtRDhYt8hEM4QnO4wOo+2mKaqXn91X5n
         ioizSsyqppY3adYzQcrJmRjUYv22ZCWaOmWksf9/6qut0PcoflOyY1eNwKR77stQK/RQ
         qpClxzrSyQPqP+AkTKY1i3EL6sRp75r9AHQ6RrWOgi/abcSHWA3qF3+RCYd4hBakRkmi
         JMwTr8g3PVLi+2Ovo1GfhD3Obm8z5Na3vIg2QYhXPpX1Zl91Ws+BWR6KIQjmy62IKwYF
         nY6R7WrYQUFfSLQX4tJ3z2DIfw3sLDs3Lv8S5V4m+Ww51ndUjiJSqJlX4Mec0Kym+u0v
         Aw/w==
X-Gm-Message-State: AOAM530vWPU8D3CL5HlqqvE/N2DOv7l+y38mQ+cYh2Al1kE1RvsKW8wi
	JDta3kzckju2RnVwFv2Jx35udXZe8XFkHw==
X-Google-Smtp-Source: ABdhPJxUxt3pcycM0vPbGhrWzvT0dVekUpq8UUEQY/epngEw1L+DwagEp2xgClVkEShM2yT4D/lOVA==
X-Received: by 2002:a62:6045:0:b029:20c:b6a6:6077 with SMTP id u66-20020a6260450000b029020cb6a66077mr10486927pfb.51.1616721774804;
        Thu, 25 Mar 2021 18:22:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id q10sm6472873pgs.44.2021.03.25.18.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:22:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
Date: Thu, 25 Mar 2021 18:22:49 -0700
Message-Id: <20210326012251.1063470-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326012251.1063470-1-raj.khem@gmail.com>
References: <20210326012251.1063470-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aac and ffmpeg could be enabled only if they have been whitelisted by
user

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.22.6.bb          | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.22.6.bb
index e91bb5d978..b1fa96e1be 100644
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
2.31.0

