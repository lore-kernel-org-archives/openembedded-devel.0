Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.25403.1621872531538786025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 09:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzCrECD9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y7so15090965eda.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VsC6cUvtUcRwPY/CmV4KaXRrXwJcGLdIxH5xWGJiuuw=;
        b=PzCrECD9w57JfokqJjD9e9sJ1w8pGh3PGRgITtyyYPUgPW1VotgdutgDPIpV7Pg9Pb
         lYofgAyQr/PKFOXy/o17gDq6gtM8E4J4YuZdrbBHoMqhfegovQvAXYLU2REx7g9b8/T0
         q7UPTU6XgwwrH/Ich4lW8I/9+28B1iS3k34zJ+0JFGEsuE+iu9PEXj1j5XtuyFV9gcuO
         NVeO1j+ZBalCsEE6uqosWcI9uIHhNNiD+/ZPb6ujalHKpAof5fG7rPTRK479dUKoHuiT
         dTIyySfDPL9sgRudlm/LcE8u31aRKql448YKzSgZsd2we9NhUsVmheQfGz4ir3M7rdFR
         WY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VsC6cUvtUcRwPY/CmV4KaXRrXwJcGLdIxH5xWGJiuuw=;
        b=e9Iirl/MzK2YTzhSsHjRkXey0pUCf7YklmTM6wVMswlF4NFLhIUYB6gxmG4lwCGv2k
         4tHnT7c0/sCyxFCYjoJQBF2O4qN6O7ZD8YD26aLS2lXeT5Pf3ftqigKAf887pnjxSBz/
         aaH8uVSq98ZN7MPYpI73TbaP4q6R+sbNDLLt4XtQ+VXvC4SVaIPVbLzrxwPb3q1Iwsq5
         uas4yF3iEWilKWtD7ui0oM7b0KA1zoWG44HIL+2qCjiB2gijbqHzH6PpDW+jMEvVcats
         2nzstiUDPpU5K6x8+29S+sL2ZOBlkhmzAv35/99xpz8eDnEuEbUx+aBjP3u55sLRG3x9
         DW/A==
X-Gm-Message-State: AOAM530se/dNEIw0FkQ2Iy06zdI/vTDsz9ZZWrhk0PsVtT8Q5h08oC0Q
	N0K78drsAMMgoBxy/iFLWO4g7TquDIg=
X-Google-Smtp-Source: ABdhPJzuh+9gyM/zo0pYeUbAJg6Gs6Ml0wq5D/4nWpZgACMFynmwUAxqaP8mv2HF3CLtj6eI0iIkFw==
X-Received: by 2002:a05:6402:1052:: with SMTP id e18mr27396114edu.366.1621872530182;
        Mon, 24 May 2021 09:08:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b189e31b9623dc41a84.dip0.t-ipconnect.de. [2003:f0:7f1a:3b18:9e31:b962:3dc4:1a84])
        by smtp.gmail.com with ESMTPSA id k22sm7953470eja.33.2021.05.24.09.08.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:08:49 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] xfce4-screenshooter: upgrade 1.9.8 -> 1.9.9
Date: Mon, 24 May 2021 18:08:40 +0200
Message-Id: <20210524160840.194431-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524160840.194431-1-schnitzeltony@gmail.com>
References: <20210524160840.194431-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Add link to Imgur ToS (#54)
- Add notice about imgur (#53)
- Add launchable tag to appdata.xml
- Update help message for --save option
- Add combobox with file extensions (#6)
- Add option to capture window border or not (#4)
- Preserve last used extension
- Save screenshots according to the extension (#6)
- Avoid save dialog loop if action was specified from CLI (#41)
- Respect windows scaling (!18)
- Fix compilation warnings
- Add version check for pango
- Correctly calculate dimensions of size window (#37)
- Add option to disable Imgur upload (#20)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...fce4-screenshooter_1.9.8.bb => xfce4-screenshooter_1.9.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.8.bb => xfce4-screenshooter_1.9.9.bb} (86%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
similarity index 86%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
index dbd7a0b40..722dd2910 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
@@ -7,7 +7,7 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup
 
 inherit xfce-app
 
-SRC_URI[sha256sum] = "6f029d614ad3b63fbcf742984dc6c976f3008e7d88fa487d49ed544f56f62c50"
+SRC_URI[sha256sum] = "33c8aeb53fbdb82dbd7d40bca77a8affbb4116ba0993cd59474b554558e5daa4"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.31.1

