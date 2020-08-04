Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.9942.1596502447047057366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 17:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I2tvYhWr;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id z188so11422498pfc.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 17:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4l/CQS0SYEnIbDLwAjzvqN65gKB77sipVaoMniYtYXA=;
        b=I2tvYhWr5oxxU1crHRjD1h3Fgi6q3THQUif3ACq3ajWB74h/P4k4rBzF5IJjybHRhz
         EORcAUIS6d+3JyNbLxzn1N8Mwky5bMGtFdX0+E7c8uFsvZdBmXomm7gXMR9qP6JdiGei
         qItE5IrHcnKeFJuf4I/sjlBQaE8ah5c39ISGbsh4N9O9hKW3YixxACKrXoyxQaXuCaah
         urg0Z/UR5XPTjMxTw0sRWutGUdFu8S4NArmC4IiENcgu0K6apWYEe8KpAShXU+4A3OnJ
         heO0XpjOFRkMGel1ePPbK3n/KLgtdiXcTgH5RhL0T/4/O+gmRgaSF0LB6LWOMyh/cjkO
         Jy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4l/CQS0SYEnIbDLwAjzvqN65gKB77sipVaoMniYtYXA=;
        b=eThkIpzy27BNk7A7lOTmEtZIc2uWNHqvMHRlpowlgHhoFNhfA1QSepwWGroWmwxK8q
         oa5CDFf6vmxjp2JrlCQi+gAHJJjXeWC3QGBU2L8z3+iiGWqXj1jPR5wuu03iFSZYYFMP
         Oib0tGGCw3d9SG8xEMgfRX8BQdvr/o78Kl7vel6DtGN7huuLM4G8z9ZBpmhca/m3mdp4
         gHRgExeNIcZvdDkdBfuS6454kWMJKssA5rIICpxEaMdY0GR7k+avS1mcIMJBJFbpc3wE
         z9e/fmkUQNzqYXkbTmsuTWP5V1cWVZd3TCVTGCEPTlylT5eQD+jzyKeY95qYxByLgRMq
         qOtQ==
X-Gm-Message-State: AOAM531CC9cPmfo+uhxcuXABiXQ6t6SqYOsWRg8vK9QS7S83T/4yyMUS
	hwcLvGU43eTOdJE2ROnmB2KN/G+luBc=
X-Google-Smtp-Source: ABdhPJyZBVcUgXjIyr4tHwwRVYp0aFijjhbeLkS7gC9DGgst9YlkumwYQ7u3KvQTlTpthErVxeTBlw==
X-Received: by 2002:a63:125f:: with SMTP id 31mr17893257pgs.239.1596502446257;
        Mon, 03 Aug 2020 17:54:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id r134sm11835596pfc.1.2020.08.03.17.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 17:54:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/3] gnome-settings-daemon: Drop using autotools specific option
Date: Mon,  3 Aug 2020 17:54:00 -0700
Message-Id: <20200804005401.2416569-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804005401.2416569-1-raj.khem@gmail.com>
References: <20200804005401.2416569-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gnome-settings-daemon has now switched to using meson therefore drop
this setting which was used when autotools were used.

Fixes
WARNING: Unknown options: "introspection"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index a9f5274092..730ea9ed05 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -26,7 +26,6 @@ DEPENDS = " \
 
 # all these are mandatory
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 SRC_URI[archive.md5sum] = "102dc488a6a726e4050cf5ab7e967e8d"
 SRC_URI[archive.sha256sum] = "3e33dbd319b562a5ab602dcab6de3ca81b85f8346672e90ec632b36bbf15ee4b"
-- 
2.28.0

