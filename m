Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.20006.1609637176854293809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uosRgEea;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d13so27328842wrc.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CHWqC8pBcEoxnZzz8EiGa0ftd06d19yPLqNQAKKmAkI=;
        b=uosRgEeamM+mlstJoWHdDXGwHO+sDX4Oc3w6eDZZxyU4iDwinM/FDeFvkKaWihiHFD
         Zzrixzp3Z2aWg8KGDlDGgwcxgwYZXIr+dyRBaiiFRkg92aekgxjp5urd6mqXka1WkkJ1
         b6qmrg+Kl7EG9AhZSvMpzGNg3Xb5EE0iktKJg5YMUvG5cKcTKck9idz+8J6gtKRbq9j8
         01mVSI+ZWc/W14HCVi/UiOYJc7wurgVewlWPiDpNsUVDuABNG8x6F9FmgJw7yczlDibJ
         4HEEo4weJNJnMxq6RWx/2UncrFeo2HXFMnsHw/l/XEk2AcTvGrxxW9LcR8Rwy4y2cMO3
         d/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHWqC8pBcEoxnZzz8EiGa0ftd06d19yPLqNQAKKmAkI=;
        b=i5Dp3IGgsuOg8LC1YTqV9bTYNzgXRZKFMdy8QnIRe0SdbKl24zKVWQLKptxWebpxdZ
         8SppkKT9c/IZbsTM6P7q32k8AFxOr0L3Qwo9+UACTc6oJ1HtINTzG7v5XokdgqdgQUxv
         4wc2s1UIsYxRbMRpazPdZHyjST/kWCNsEs31YkCG5fz1jykL/1qJDBzlwJev5mngZ+N/
         uk4d1WAq2mjmt+odmgTHFaWiZoV3DIg0a38NVN8sKUE5jyo1hjcrnjkBVr/5L1NZKXBg
         GE6y1ccL8CyhH46AagxgxCWl5osoV9ctebj/TCgyme0F/dfSfcAd/zzTJGUCc4zJbeB3
         sefA==
X-Gm-Message-State: AOAM5307xlEMAuP3KZOuQSGNKGt9PfVjoJajCfiPiyOBuK5acjq9qYqq
	/jKjmnAdUYSIRC/m+D8+xqonKN35FIg0eQ==
X-Google-Smtp-Source: ABdhPJwzf8uS8f8AOBoNjw34Y/nE87t/Tq9CngdijaBorkAwm5Ifu0NZjEAvWCPA9cW0Ti9/nhQZmA==
X-Received: by 2002:a5d:4ad0:: with SMTP id y16mr73050534wrs.424.1609637175561;
        Sat, 02 Jan 2021 17:26:15 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:14 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/16] xfce4-fsguard-plugin: upgrade 1.1.1 -> 1.1.2
Date: Sun,  3 Jan 2021 02:25:50 +0100
Message-Id: <20210103012556.557336-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.2
=======================
- Improve spacing in settings dialog (Bug #14665)
- Fix "ISO C90 forbids mixed declarations and code"
- Modernize the configure.ac.in file
- Remove GSourceFunc casts
- Replace obsolete xfce_create_panel_button usage
- Adds new README.md updates AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Add gitignore
- Update URLs from goodies.x.o to docs.x.o (Bug #16163)
- Translation Updates:
  Albanian, Belarusian, Bulgarian, Eastern Armenian, English (Canada),
  Estonian, Finnish, Galician, Hebrew, Interlingue, Slovak, Slovenian,
  Spanish, Turkish, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
index 183d521af..986b5883a 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "d1e1fda4e80c36741643b1d9eca5c5c1"
-SRC_URI[sha256sum] = "d6d05d0a90a68453d65cdceec5ca7eeaef864393ab62eef532a7ba58f374d516"
+SRC_URI[md5sum] = "d491b5674013bb5a3c7c3e6ee0141e56"
+SRC_URI[sha256sum] = "67d8e6a219a7117c59693adbc59c39a6eba31e3f18a5499189ef4ef28b554105"
-- 
2.26.2

