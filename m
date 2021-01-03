Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.25409.1609683191978296059
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UzeJnqF2;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id x16so33462067ejj.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZpKgNklGkIIgTHlanNroUx9UKHyxc4N4++khU0oL9bQ=;
        b=UzeJnqF2np9s1vpk/ueYNvDWFkbWDG/7sXk8UYyDaRzB4rBM3IIXajP0dffOW0YRR7
         2waadYnEvEDIklt83LkDcJ+orp+rip61ksGwsEIHezYZkdvZIpdoJ0bJnBWgxG0A5RHw
         wGCbWorWUOg1lOSu05kslKuWRTm5zrMQcDaE8E27yiWhSm8DInHnOE9WZVlOYnY+D/zN
         5BT3g/WhkUJaWPPQiNHEiNKTc6TZB3NZVKRiWFPzCYVzXMhKjhDJ8tp2/F0JeNlhHxi/
         t5TMk2DeacqrFbW3yF32G7mM3cDoftYczLTyiNHuHIrJJ9qpnWSMp5vFoYnq3Gpks7Fb
         uXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpKgNklGkIIgTHlanNroUx9UKHyxc4N4++khU0oL9bQ=;
        b=LOMV0cmYb/jMf33IiBI1lsOFlbSNoN7md0ZdJmiP9Xo9ArepIE1VOmVEcfLQ7yS2iD
         BnBpaqMhEVn7vpANbUVFC0RKjTMD7LFUwKQlfHImX2fNTBUTrzM89euh/SFeR9RMVCy8
         DlBgXdl9M29nEP+rcvg+7rJlAmGGl6VJrY5wcs93li495eFE3GpDOMnn22l3izw1dez0
         pNGhAsG8MGuQXlS59boggm2Y8RySOabcXh8DjLjwnMEw47TqkoxsxKDuBQlF7g01HKfR
         nPRFGdfZ5EkcoD2BX8pVJynqQ20NOGUvHvMM/Y1boZW4HKO7QQ4VTmmIAYONNK1l3mIF
         EuOw==
X-Gm-Message-State: AOAM533tVKt0ED16yosFjjH07rButmM+2pktFiVRO9dDmos/x+5S2KBv
	nJ4EQnaPzDXT+VVmgNX/Qot7654LCuE=
X-Google-Smtp-Source: ABdhPJw9Us1A27yuXHIU8NehDKUv5+fmKqLmrhcei7rIiP5H3RicIePbmj00BiJgfht314qmeqhoZQ==
X-Received: by 2002:a17:907:2116:: with SMTP id qn22mr63089818ejb.483.1609683190631;
        Sun, 03 Jan 2021 06:13:10 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 12/16] xfce4-systemload-plugin: upgrade 1.2.3 -> 1.2.4
Date: Sun,  3 Jan 2021 15:12:43 +0100
Message-Id: <20210103141247.1637618-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.4
=======================
- Allow compilation with panel 4.15+
- Fix missing-prototypes
- Remove GSourceFunc casts
- Fix the properties dialog and a hidden memory corruption
- Avoid repainting bars if there are no visual changes
- Update copyright year
- Update URLs
- Create README.md and update configure.ac.in
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16178)
- Translation Updates:
  Albanian, Arabic, Basque, Belarusian, Bulgarian, Catalan, Chinese
  (China), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
  Armenian, English (Australia), English (Canada), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål, Occitan (post
  1500), Polish, Portuguese, Portuguese (Brazil), Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu,
  Urdu (Pakistan), Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...emload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
index 88d40c495..b966711bd 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
@@ -7,5 +7,4 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "5d75865be699d0b3d36a5fc17ed02d44"
-SRC_URI[sha256sum] = "052407c575203da4de2db6f4a5e997220d95ec655d393dc3875a0d5a20520775"
+SRC_URI[sha256sum] = "0531b8df923cba3be8d064cb8b638b954df74915e5a447228999517847789835"
-- 
2.26.2

