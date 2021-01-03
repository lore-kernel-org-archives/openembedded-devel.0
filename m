Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.25315.1609683187407458006
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QKLpHUKA;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ga15so1314833ejb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XUUDe4rVSkY8fEMu2KGPC86ZbQ+SLoE/MMnHJjW+DQc=;
        b=QKLpHUKAX2+PtO2TI6PU6e9oKVbn4ulLLDvB3PYTMAr7SvbY3EyuR6IxyZK/hw8Oy/
         QAMnPrRy8CRfvsWHt1N8DPo1ZgY9nX6E7Rim3XwSuL9IRZIrzIkUO88mYr7X+gmGQq+N
         /TtY6BQ89q65AdIepNn9taK/lJKEqoMdTnqcNIPZkpm4n1T1U9RAdSTrieAWqjeOQ0Yp
         LrmOH1vkz1jnSEK511+RxO4Nhj/88+hZDJxEbd2ubE/RkpLX0MaicB7mRFgaX/lukFsO
         0eC+/Z9AfwFkwwAY2i0waTXGJ2mipPtFw6X+FOFpmd6ERsgRVJyQrV5qZzK77UrYrjfG
         y/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUUDe4rVSkY8fEMu2KGPC86ZbQ+SLoE/MMnHJjW+DQc=;
        b=btDh03RIo2N8NwYtJGGRYeM9ZNKkUycqX8T+eSMSP/6waJ6L7OGentwwyFP1lN7Cl+
         LlerW8UjcXf3UFQqwLq3lKyCWo5GimOks3PfqxU6bpw2e25vxfaynIhwAKRr2pvK4O28
         49oGzPr/M3QVDSjMsR1Ip0bZxwE0dCkAq1pfUEn/DAWLb14GKqKKPMJ3izOIX3VRgU5P
         I4rnAYzxyldtrvOx01DaW3kFyFAxOFGRgLNFSN5hmwnTA0OOmFk982jWC8YYPzIeE9MG
         3tcY97LZwctfbirEJ5XZ2BcFXN+SiKchgkLRmuskC8QL3uvb/voI+jcNZhg9IZDWs4hg
         7g5g==
X-Gm-Message-State: AOAM530NRpNBjYUB0tCR05vCZ116xaVzClXGRdWEJqsWofj+M3TXCoCD
	y/BjLVTCQLlisJCKClbpAuNDqkuNJf8=
X-Google-Smtp-Source: ABdhPJzsMSyVkr//3zqWfBrfqxL9WBB29I4TjR/8B06Bd0LPGJTrePHj7GBqbXTwbX+v/oPEIvvJXA==
X-Received: by 2002:a17:906:edb2:: with SMTP id sa18mr60999546ejb.264.1609683186015;
        Sun, 03 Jan 2021 06:13:06 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:05 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 07/16] xfce4-cpugraph-plugin: upgrade 1.1.0 -> 1.2.0
Date: Sun,  3 Jan 2021 15:12:38 +0100
Message-Id: <20210103141247.1637618-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.0
=======================
- Highlighting of suboptimal thread placement on SMT CPUs
- Separate the associated command from the rest of config options
- Better resilience to inconsistent OS CPU utilization data
- Display 'Show bars' in the same tab as 'Bars color'
- Clamp CPU usage values to zero if they are below a threshold
- Cleanup NEWS file
- Use larger unscaled icon in about dialog
- Add small explanation about default commands
- Dynamic default command lookup
- Fix RGBA string memory leak
- Fix an invalid memory reference
- Link sensitivity of labels to sensitivity of color buttons
- Allow setting colors with alpha
- Revalidate the event box after showing widgets
- Use floating-point instead of fixed-point CPU load values
- Paint CPU usage if it is 1 pixel tall
- Lower CPU usage when rendering bars
- Update URLs
- Improve performance of CPU data parsing
- Read CPU data correctly if some CPUs are offline (!7)
- Paint CPU bars in left-to-right order
- Separate the bars from the history frame
- Fix old-style function warnings
- Fix clang and gcc warnings
- Also offer a 3 second update interval (#9)
- Update URLs from goodies.x.o to docs.x.o (Bug #16157)
- Allow compilation with panel 4.15
- Fix typo breaking build on NetBSD (Bug #15794)
- Disable frame and make background transparent by default
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål,
  Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese,
  Portuguese (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu, Urdu (Pakistan),
  Uyghur, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...cpugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
index eeb54b315..55941d74b 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "48ead9dcc019212795637c170d9e2ca2"
-SRC_URI[sha256sum] = "3ece0a24e55827e0d9b6314129906da60513acdc1748d9dece9f50526e906ba4"
+SRC_URI[sha256sum] = "7866dddbbe0557a9bfe603934e9ce82df968fe36e21533d05ee71704e6602da7"
-- 
2.26.2

