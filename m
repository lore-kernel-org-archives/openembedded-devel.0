Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.2306.1585607192662829861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 15:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MED41Dkn;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id t128so527955wma.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 15:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/8CWXRI69ubf4htbJ6rJhefi8SHQqyFhK8u7OnY+24o=;
        b=MED41DknRiaGf1YFcVPZd0GtWx1wwD144g7b25b11RKhxnAZCgl3NvK588zRyMX8uF
         K0vfSKJCOcOj9nMhpwD/YLAlIwCUEp3OI21xBTfuUf0cRZl7J2IC5iwSAj1ObsECieO+
         uOvO91Tm/E1oX47ZZxq8+qPwzyJ07tHYdIocJeh0tA7UyVRpSITt8YMF7P7h81KEd+CA
         08SVygdP4CNpducZ1kBpuVxruVhvpq7Xje19Sx4HavbupAi7oWCs8x22A2bHfDCMy2H/
         jXXPSfl4Ia6tii0JUB9s5JxlBII0TWHO3p3kwUBeTA6579eNZzbraza2UuRT322YxNgd
         OmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8CWXRI69ubf4htbJ6rJhefi8SHQqyFhK8u7OnY+24o=;
        b=oeqEo8Zcj29ihSya8eUMi+96FGmeqI8DdS+id+/gfJkfSS5XEYxeA5HaZ4rYV/+nON
         pqosTDltvzbPAU3TB6W6OWixoYMdchDN+Ut5pnLTbBNKdDtetimOhcXZ66yC2YoDJWjl
         LuSaKAVZNkLHu++Zwt8xWwGNop6ZUZ2ZljVD8yr7Vws2bBeFHA+yBoKT1lzhbe5Q3lND
         uxqhjDTpkNAFANGH3/0sXy5y9li9J6qJxbGZRVAYZs9gY1hDpoy16PYaBOVmAybkFVbB
         pBccTiKqWtwKr9H1WYq4qU2YlRGn85pmCbpAHIv0CBlLNEdVn3JLEhJCXXuf6wGfJMUH
         zOJQ==
X-Gm-Message-State: ANhLgQ0s6BeoLAvpqR7JEgrlZL0Yyji16kI4txeBEMAo+jPzfjQxHpqp
	xbOROrrgNvrrlH1tXSmEN/I8grdkjB8=
X-Google-Smtp-Source: ADFU+vu5SAP4S4qH/G1RaNJuYW6LFMFqEXX8zuGr5LQOpQG19x6e2MB8MPYC2uvIwSgqz341HPqQQQ==
X-Received: by 2002:a05:600c:2251:: with SMTP id a17mr287123wmm.106.1585607190956;
        Mon, 30 Mar 2020 15:26:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030968BA11C5DB455F3E0C.dip0.t-ipconnect.de. [2003:f0:7f03:968:ba11:c5db:455f:3e0c])
        by smtp.gmail.com with ESMTPSA id z1sm12002404wrp.90.2020.03.30.15.26.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:26:30 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/6] xfce4-pulseaudio-plugin: upgrade 0.4.2 -> 0.4.3
Date: Tue, 31 Mar 2020 00:26:14 +0200
Message-Id: <20200330222616.2354-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.4.3
=======================
This is a new stable release.

General:
- Build now requires exo-2 0.11 or newer
- Fixed various memory leaks and warnings
- Removed unused dbus-glib include (Xfce #15343)
- Replaced g_type_class_add_private deprecations
- Updated copyright years
- Updated URLs from goodies.x.o to docs.x.o (Xfce #16173)
- MPRIS: Added support for filename icons (Xfce #14329)
- MPRIS: Added support for single-string variants on xesam:artist
- MPRIS: Added support for the DesktopEntry property (Xfce #14412)
- MPRIS: Added support for the plasma-browser-integration plugin (Xfce
- MPRIS: Added title/artist conditioning from the track title
- Preferences: Fixed icon rendering known players

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...audio-plugin_0.4.2.bb => xfce4-pulseaudio-plugin_0.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.2.bb => xfce4-pulseaudio-plugin_0.4.3.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
index fc380c153..f3e4df298 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-SRC_URI[md5sum] = "9a34eadf06ed217ec0732a096f178987"
-SRC_URI[sha256sum] = "4ae8aebc2458675d4f885bf16f73829be359e16370a684301bbef6a23758a120"
+SRC_URI[md5sum] = "3d86032acb9364d47e0a144350c63e1a"
+SRC_URI[sha256sum] = "5a518237e2137341d8ca6584938950525e20c28a0177e30ecaea3ba8e7a2615b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.21.1

