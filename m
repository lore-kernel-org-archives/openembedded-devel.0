Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.20009.1609637179611192035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WSNCNarq;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id y17so27349093wrr.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y2F3O+6lhtPzCmRjkZyl+eDX0pndb9upbCOEg2M7keo=;
        b=WSNCNarqrt6d8ZtOKpdZ0dhSg/KwkMZzb7XO+j4aK/BKaSiI7HMXPpyeUQl5R1XGAj
         q665DhisFd9GpY15bfBs7QRP64iJm61+efSPe6+hpXVCLg/rXRKG7uM5fUhjfv0kPz2U
         lWmkck3cqS/p5snfnpjoNuCtcRa0zutpnRZDNVSH9wloUlx54ZS86VsiVpax0p3aVJlX
         qICANy+H+WgxhjO9lAtvmDTfp9poSOx9Dor1b7FLgjXeFJOAxORLNJCp1cJ18TJzvhVh
         Zma8LC9v8ZNGcsgpdVl9Va2xuDG4n8P15j+brD/GVNJLp1dXIbdK7FG/cWvrtiqtv5Kb
         JPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2F3O+6lhtPzCmRjkZyl+eDX0pndb9upbCOEg2M7keo=;
        b=Gz43h9SqDoppNXR8y9LM7ms+mBylCpk6bXXWLNih0SHtkKVsH3gMCMf8GV6KQAtYC9
         SzW6lhFYMhfwppDuDsuwJMKCkOAmZ8vJDF8XPzpITajNvXyRuDiI0G5oJLfrCtzYBfgg
         s0dLi9E208oaQ8AojlkJkTloMY/12CtWokTzpLjMqOr6G1rSv7/qLFGk0ZikpnzS7HTR
         0r1MQS77+cas9muteXEf2PJpWD/+Kv4mWp0Y3hr5pHbbXvkUhhQHAI7vVfAmRTabpf8W
         rusESLm8sL1XnfatUeBQJsHE5g0noqBPfBOx9AdZje7ecE/3XGf/rV3Kw3Ihs1dEaEr1
         xdbA==
X-Gm-Message-State: AOAM5309IuHDV/dhNHNTOQxmVzyGjmOjlKU3HSdjuG5ORlXSt+B+ZDR5
	LoH40VnhDkVjNNeCJm5oUk8heRh9HCcrdA==
X-Google-Smtp-Source: ABdhPJzgW0+9w3fmp4JLsS9PnJA+kt9w89hOq1vxdIjq9Ovhguer3S1yqut2H4rC1NXC8OFWshc2Jw==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr73315565wrn.208.1609637178323;
        Sat, 02 Jan 2021 17:26:18 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:17 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/16] xfce4-verve-plugin: upgrade 2.0.0 -> 2.0.1
Date: Sun,  3 Jan 2021 02:25:53 +0100
Message-Id: <20210103012556.557336-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
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
 ...fce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
rename to meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 36e04a438..fbe0f0272 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.0.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "94429b1be9d66ba9b31e4aafb726a8c7"
-SRC_URI[sha256sum] = "9e6510ba6c48fcfc60d1c6ab14613dd7b6ff095cabbf4746f82bf788d8ab4cd2"
+SRC_URI[md5sum] = "2fbf40a2a52c8e401f2331560a8db616"
+SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
-- 
2.26.2

