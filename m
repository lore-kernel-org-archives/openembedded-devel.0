Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.25278.1609683192898711710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WnB6C3Zb;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id w1so33399012ejf.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5h2rOqlVzEcgO4SDLB3OwwFkQg9cR3ytHyKfJa2hU1Y=;
        b=WnB6C3ZbOBxzZw//GdHy+TTIfPLwGAFMCZRNkx91SmC8t/6Tv9WGnkPo+vapRbJ0zt
         oT/f84qo4SPFUQSkT07yeQ2/995s0S223rmw24tSN7+7OL9iMqT6WSZ8FHNNH7pTxwZM
         M1w+TfHHsSINvBQlNdhGzdocT+CcJBPVM/NZ1ROQLkKWE/z3ukRcX9qPaPsrAakTpFxa
         FAFfoPF7thl0dxYmCYDSfs7QDv9fUXl//YVPZuDYZXpv1iEMDxL+mzrPbSoG7O5N0LK7
         wgpq/GepTcvidkBgJbbGjbAEBEkCHDf4AzlG5xcxX5W5vxK/NW4IIFDJoQbn7BxAwc60
         Kh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5h2rOqlVzEcgO4SDLB3OwwFkQg9cR3ytHyKfJa2hU1Y=;
        b=bAeRy6Ud5o3GcuMTwCwQZDtMU2/s1arJ1rms0r1Wq5HIGebnwxGDiWtlbQkFLFHqg+
         eXhqIzg7tqUR+/l2PqF0rIq9NIufH1G6PpRIYOUeu6nd0YtJmrAZChIM0GtA71VWB3uU
         EB5E2+kYbtg05zfd+ev/UBH4csMmy5hIKNXIKWB78dEo1QlnI6WmuJHWqc4g+bLi5+ZW
         TsEgIE2xImxQkYGdUylP2fjebmORPFFlg96Z1Kub1e6EqdhRC3CpAW584XBkoP9Pr3t0
         Lfi7gVsE+TAFKwDSh5n4RNuXG14jykCsbLxo39HjqBgC/mE4wiLLXgFvQuKm918FWjYm
         +6uA==
X-Gm-Message-State: AOAM530+eUl9YAU1OQmNowKLDWPPyIBM77+Ukj3AZvfD6VLVoQiOUWhm
	e/ZbIPHC30flI52My+5R+30KWINuz/Q=
X-Google-Smtp-Source: ABdhPJy5BUsKLMrLoGms/YNoujyzxEdwxjoPG+UrquIMPiUs2zqrlD/+/GsV1WEBq3sQvWHgJpOROQ==
X-Received: by 2002:a17:907:447d:: with SMTP id oo21mr63841511ejb.367.1609683191563;
        Sun, 03 Jan 2021 06:13:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 13/16] xfce4-verve-plugin: upgrade 2.0.0 -> 2.0.1
Date: Sun,  3 Jan 2021 15:12:44 +0100
Message-Id: <20210103141247.1637618-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.0.1
=======================
- Fix build with panel 4.15
- Modernize configure.ac.in
- Fix xfce_rc_read_entry usage
- Fix gdk_rgba_to_string usage
- Fix GtkAdjustment usage
- Fix GtkColorChooser usage
- Fix GtkColorChooser usage
- Fix GtkLabel usage
- Fix GIOStream usage
- Fix gtk_label_set_text call
- Fix gtk_style_context_add_provider call
- Fix discarded-qualifiers
- Fix missing-prototypes
- Remove GSourceFunc casts
- Create README.md. Update configure.ac.in
- Use GtkColorButton to pick foreground and background colors
- Translation Updates:
  Albanian, Armenian (Armenia), Asturian, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (Canada),
  Esperanto, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Lithuanian, Malay, Norwegian Bokmål, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...xfce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
rename to meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 36e04a438..5902ad0bd 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "94429b1be9d66ba9b31e4aafb726a8c7"
-SRC_URI[sha256sum] = "9e6510ba6c48fcfc60d1c6ab14613dd7b6ff095cabbf4746f82bf788d8ab4cd2"
+SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
-- 
2.26.2

