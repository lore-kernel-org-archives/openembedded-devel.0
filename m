Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859B8C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:18:06 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.37810.1634570285416405842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p111xx5u;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id om14so12439480pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TEka3NOX9iNJSpuE3GI3mZ9j+aiKjLoMobT1PYSN8WE=;
        b=p111xx5uH9TGE+tEOYXSoKkHyHw8b/LYo06mQkUyeGGP9u3u92Cz4pk9u1f2E4mSaf
         duZFJJxlMneOFCuQa9oZq6uyjjBqItSUY6XkFJX8yjfCHlIn5RYI5c2ugwkLck4yZJf5
         GqCrv6IJAJE1+Op27iDGZhry2loRlcQM+Q97NFYBS4JN/rbkJJq6NvHXSaV/T1haBYn3
         n/hFRSe4yCfrYLpP7iGy/KxdujEZTlwhl1J1fXjKZXzvIVfNIq/Lp2a2PjsulAv5O8Pc
         YjZXS/VvEvYeZGbsybtK88+jcs+FyMXvvSXmhyhXMjJgH/2xaqp0uEBAI6DO4pvSwwbZ
         g4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TEka3NOX9iNJSpuE3GI3mZ9j+aiKjLoMobT1PYSN8WE=;
        b=sHaZu4LVBg5Jq7VGaEnnoLlSrQsL1+i3ZNql6p2iDYAotxQsjzO9F6PaQjveigpGve
         0a9RicnKpUSHoKS3jYpjcgpEuLeKgM/UwdVEyc2yNyIr9A1g/w7jQkPHk5GHNgfYOv8c
         zUiavtzCpYhNPkIfZolnhnEr8C0pbGSACFcb/tGEvrmn+DT4U4XBAIrbwlX3+bwCC47y
         99ejW/cOlJwezqB1ddxjWn0mXcyVDRQY+YX9JvJsfLVfucxunz7idK0a2mJr7cpL23Fw
         2Z//CcYXohc+0R+L+Kbph5nCav/h4QKjCtcC8CigfYshnhs1ByxPg3dicOLS9hhU1C94
         79tw==
X-Gm-Message-State: AOAM530bhx/RivNegzPzj17zB3+0l4xZK6UrkFyV5+fAMPAplKs5Ovbs
	8i8G5Q7CwcwH/v508srEWB2hnOli1kM=
X-Google-Smtp-Source: 
 ABdhPJx3GvHSCjaAwyyZsPxf9FjJkc8Vnlf/dAzVMbcVEU6IzjSFXD4MIMZViwhASZJnxdCKBKrKlg==
X-Received: by 2002:a17:90b:4c4c:: with SMTP id
 np12mr33909619pjb.205.1634570284566;
        Mon, 18 Oct 2021 08:18:04 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1830:ffc7:e2cb:a2b6:d240])
        by smtp.gmail.com with ESMTPSA id
 z1sm6211257pfh.150.2021.10.18.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:18:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-gnome][PATCH] libgweather: upgrade 3.36.2 -> 40.0
Date: Mon, 18 Oct 2021 08:18:01 -0700
Message-Id: <20211018151801.2314154-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 15:18:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93427

Upstream changed version schemes.

Sort DEPENDS, add python3-pygobject-native

For changes, see:
https://gitlab.gnome.org/GNOME/libgweather/-/blob/main/NEWS

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../{libgweather_3.36.2.bb => libgweather_40.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather_3.36.2.bb => libgweather_40.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
index 69fe9552f0..1d9daac1f0 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
@@ -7,8 +7,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "ff399cf89e97a3e574ae05db5617b96b"
-SRC_URI[archive.sha256sum] = "ee1201a8fc25c14e940d3b26db49a34947c8aebf67dee01ee67fbcb06ecb37a0"
+SRC_URI[archive.sha256sum] = "ca4e8f2a4baaa9fc6d75d8856adb57056ef1cd6e55c775ba878ae141b6276ee6"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
@@ -17,8 +16,9 @@ UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 DEPENDS = " \
+    geocode-glib \
     gtk+3 \
     json-glib \
     libsoup-2.4 \
-    geocode-glib \
+    python3-pygobject-native \
 "
-- 
2.30.2


