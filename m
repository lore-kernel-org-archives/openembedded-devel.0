Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.1317.1597271989634372145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rVgfoJ7W;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p24so4002553ejf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9ebNC/7Avr76cdYnsmJVKY4OfNAIZ5YyblSSPdxikTE=;
        b=rVgfoJ7W+BCrxVzX6rGhxcCpnI4uxrcuMzSe/VJrUL8+nDWMTFGD8iqG4u4uPLgwu3
         afijSYTe7jbghgu5WWdyzMK+oF7a6NfNdxakbQzvqkkb21hF+fCD7xJd8QxZQDaY4dG4
         Y/gpCWPugbcFVwXSwl4j3c27Zs1aajDsfOVEF4wajILR6ik5nUFfYxrC8H6szUF4+JFw
         2N2s6xfOWAszmZ84n50q0w2bV8xQCjrrBHJJngdJ5gmI9AY4WOvUOiD3GNrZlWkQ/ATQ
         pU3onee091j9zLTLsPMhDaee8WPgi8KRXvbvUtLsroEJIKxeKJ3oW+KCeOLrN6mLjrJl
         9/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ebNC/7Avr76cdYnsmJVKY4OfNAIZ5YyblSSPdxikTE=;
        b=ai7bnX5KbkjHvLqJ+F5zRc8L+M5mH2sks6vJQbtYzPya7CdDDLY7frT7+FYAsvwTAZ
         wf9IlIORroNHXisfof4yqww2RpXGBspSmsKZeTi+0GRIsPFVMEJOd8f8WM/lr4pKHwBd
         8r6o17FObKZhy6T1BZNittzvvMvUxsJgjPJoXwrMIltf1sDX71IJ3tx5hBflJ9PdLLky
         yc1eQW1stJjnrfvE1dtwm8XqsbeaA1z8U/9gYFp+ADKisKBzn+WrNX08aGWmTa8VlvgB
         lroIFuGnXzueMgzF0cp90WAVkqYxWqQ4iDQUYtKMK7eBTDKqY51d7vPTrB7wiah3PTg4
         llOA==
X-Gm-Message-State: AOAM530/fK7MQeruDqmw1Sv38NsZxQamQNpd++0rnmI7e57HN2D+1642
	fI0g7iFujMWQGtlk+M6jdoxAo5Ee
X-Google-Smtp-Source: ABdhPJwNjeNrTv+vZWb0cqR/3nB2xj6Hropte0pJPw3AlOkZzSFPlTa8ZmgTFIC/mww+Gr1ol6Xqrg==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr2171612ejx.156.1597271987827;
        Wed, 12 Aug 2020 15:39:47 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:47 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/8] gdm: upgrade 3.36.2 -> 3.36.3
Date: Thu, 13 Aug 2020 00:39:32 +0200
Message-Id: <20200812223933.1119785-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.3
==============
- User switching fix
- Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_3.36.2.bb => gdm_3.36.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_3.36.2.bb => gdm_3.36.3.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
index fbf25a30c..fb0b77bf4 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
@@ -14,8 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 systemd pam"
 
 inherit gnomebase gsettings gobject-introspection gettext systemd useradd upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "18384eb8345dbee5a8219916debf7e43"
-SRC_URI[archive.sha256sum] = "3f561c10ae2e5942b03026f02c0aa7d8712e382708b17a0970874df8175b83a8"
+SRC_URI[archive.sha256sum] = "3bfbb620cbc0d1cbd70b4c4376cf4b705db4dc36a37124e5be386ccc25fa7e81"
 SRC_URI += "file://0001-Ensure-pam-file-installation.patch"
 
 EXTRA_OECONF = " \
-- 
2.26.2

