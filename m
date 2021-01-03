Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.19960.1609637174226921249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZosPfTQd;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id y23so14494183wmi.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BQMhyPsF91Sdd2tkQFBYv9xg5O1b8+SKO80Y4MlFqjk=;
        b=ZosPfTQdnCqkO/jH2L79JKnHhlbx7DkFfH5Bj8Og6XpQyppbew9TG3Q0dyroy2CkbN
         KEf3xKdHwr866QT74iYN6C/AAHW9Tdg1X+o0AI4vLXZpd1SoIb330icwTDFWT3zMAemu
         0hGjRXTj+A+KlRM3UznOkp9IbEggLIU1ksu7LJfoOw1cnaEZ7vvaAK301z90GK6LHIrW
         YVyFo5sgXIzt0bziqQnB1Mxu9LaYdn+V/mz21ZrcDM9kEH3bYx/+LnLTL8zAceyONtGW
         lbGSbYbVm33ROujFbAlZufYzpJem5LER4x1A9ESEcE/hoqntzDgl2rAqvmJ26B+d9Bud
         mBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQMhyPsF91Sdd2tkQFBYv9xg5O1b8+SKO80Y4MlFqjk=;
        b=NzOoiiSsZbrsCYkVMxvBwIDTTT+eaYBhhR5YS07Bqz9bNIVZt4WW7NuxSgY2eCg4gO
         gI0Sm3DkhCJHLbBSbent27VRYy7c2hW0N4m/QtmcGJtTwsUEM39OTZ4HgOO/n9u9Q5Zt
         VzdA4pOvrbdC+BOc98uC3+A5ggZ2dWAFxsACdxxv2s6U2JCB2++E9tVOlHQmiQJ0zl5v
         VRb2mlEY/mq6EusEyZK8+v84+Os7UAu3cp/O/9Y8tdLwfmEvvE3TEg444qG8g1aJRQ88
         On84N25Xvrki3MfCN10rFC2Zdz4AEFkp+pyEknSrr/Km5jtbOuS0uK4xHoxFyDfsU3Ul
         R1HQ==
X-Gm-Message-State: AOAM531q6m27+EfTEw4VPoQ1UWPABr3LYymF9Q3cOIoIQkaPax6KTSHM
	Zq0dTouQzcRLomptNRALcMkVEuAJTICAKg==
X-Google-Smtp-Source: ABdhPJxaqFdWW8rq1physwfy2B5ggLQWOMPf/NsyOWJbRERym005/y8FzgjGKyP5UFsej32Oqxw7jg==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr20598470wmc.102.1609637172869;
        Sat, 02 Jan 2021 17:26:12 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:12 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/16] /xfce4-cpugraph-plugin: upgrade 1.1.0 -> 1.2.0
Date: Sun,  3 Jan 2021 02:25:47 +0100
Message-Id: <20210103012556.557336-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
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
 ...pugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
index eeb54b315..a5e9ebf4b 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "48ead9dcc019212795637c170d9e2ca2"
-SRC_URI[sha256sum] = "3ece0a24e55827e0d9b6314129906da60513acdc1748d9dece9f50526e906ba4"
+SRC_URI[md5sum] = "3c6dd0b62acf9aa44f8d54018334c3eb"
+SRC_URI[sha256sum] = "7866dddbbe0557a9bfe603934e9ce82df968fe36e21533d05ee71704e6602da7"
-- 
2.26.2

