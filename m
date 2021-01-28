Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.21297.1611820062416530662
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oHqhcpTu;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id kg20so6334247ejc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 23:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qMMuohewOuS++K2AGhAoyCwYEEp45aq74ejMBbx7yvs=;
        b=oHqhcpTu9d814h92kGRZ5EFbTwNRpQ/TQ1XqMZWC77qM3m6Oxd3lDdce3OYGzVgl9x
         /bSXAkRDGfKSZXgDJLig48ZAc8UHVkIAiG9OJAA8Ex0k8ueLRNEnhs1LciNfjZsQHVSD
         Z0Hlbu7ve2apScXSgwoTqfhs7ZqpLhqYmwupdJ4jmusVL7IFfA6HxuhR7mRV2A6IXYXr
         vZsYKDhpbnjlEELudcqs9UOes94XU6sF6GsEiOnKXekuZGfGS+56BscV3wkZAqf17yNN
         d3N9NIKOqBj4c3w4hUxzKjuH5TztszqdQWOP4mGqEbFxilhfY+BKa2Heg06nALANFs5S
         ePRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMMuohewOuS++K2AGhAoyCwYEEp45aq74ejMBbx7yvs=;
        b=mvnvAJQcwxX0vji2hHKP2p2KJEWRkXd86R+2U/5nrcewBNHTbcQ/3iEfAYQbMolyZx
         yKMsiBqhoAXXXSPY4OD4nOL/av9fcTha3ukG3guy1RwBpTqcjHZIXbqNglEfrBkP9MkA
         Tk2iSOhP5J/W0vati6h1ESX3VcW0bimpH1JRlVP5WdKAtO1KRZkAOvZrl8pFPX2hn2Q7
         qG7qBc2CVFlKjUMUh0CadNWxDKNcSJOZowsTEc8vnyFbLmzmbEni2sw3RCxR7zYTjGu5
         TxnGvqiLjUAsKbIy7u8VGsI5skhTQMrZlcYtMMGKCRfck74e2avd47lwAU4TQ0cIwS4R
         EIjw==
X-Gm-Message-State: AOAM532QXFpEio4o1uimNY216/IlCxNltxfH8EjacQmPBxu66yIT4qhQ
	B6eT5gFOD2O4olnXyMW1rWXBfSlljtJDeA==
X-Google-Smtp-Source: ABdhPJwFql1kMEjR7mpFk0YsH/oX35f0GUYEUsxY8x9fOC53jBnjtlvXm9ipd2eZx1hzXmlv318mWg==
X-Received: by 2002:a17:906:fa9a:: with SMTP id lt26mr10019774ejb.439.1611820061070;
        Wed, 27 Jan 2021 23:47:41 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07f659ecbde7b17c1a812c.dip0.t-ipconnect.de. [2003:f0:7f07:f659:ecbd:e7b1:7c1a:812c])
        by smtp.gmail.com with ESMTPSA id b17sm2570850edv.56.2021.01.27.23.47.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 23:47:40 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] xfce4-panel: upgrade 4.16.0 -> 4.16.1
Date: Thu, 28 Jan 2021 08:47:26 +0100
Message-Id: <20210128074728.1631219-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128074728.1631219-1-schnitzeltony@gmail.com>
References: <20210128074728.1631219-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- pager: Use gobject bindings (Fixes #376)
- pager: Switch to new workspaces icon name
- launcher: avoid double fork
- statustray: Display tooltip title of statusnotifier items as
  plaintext
- statustray: Prevent crash when parsing properties (Fixes #379)
- windowmenu: fix use-after-free in window_menu_plugin_window_item_new
- Fix compilation warnings
- Update `.gitignore`
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.16.0.bb => xfce4-panel_4.16.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.0.bb => xfce4-panel_4.16.1.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb
index 0b210ffcc..b92ebde00 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "5e979aeeb37d306d72858b1bc67448222ea7a68de01409055b846cd31f3cc53d"
+SRC_URI[sha256sum] = "fa099bc6be6592dbb828747a473c2e1b0e7f85afd945a98002b475bb6f975991"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.26.2

