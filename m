Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.555.1621121956012941886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JVVuqQhS;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id t3so2620707edc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h3zxSbt8F0LunB2lJUnSlECHh25yciVAHQBuhHYotiQ=;
        b=JVVuqQhSJj+bwS66Tq+joeqDEXnNg1/qWxvgAP5jWkTgo3OF0UAEQ74Mgc9tfT/+5J
         X9Wjw67ktRAxDv6QkxrooSi/I9uc9tPTYdDvLrLWvIrnAOCwFgbv4mhha5esyfhPxJLq
         cQqd2swO1mIEzz3Lt21MW90GTNHBR5SFdE3ur/CmjWFjRb+thAU7SR4C0ouUw7OorhyE
         qmTyLfp/ocTSapEGzpb+tkg749haWfXom4a91mS+RmsuHbDoq9gy5dM5EYWXM6wjNp2j
         qs0VGdp9E8NgBViioK0jPX5EvaC2xzf0DHii4sckFeTg11uQ6IpMC2wkdE6nQ29xz5bA
         A4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3zxSbt8F0LunB2lJUnSlECHh25yciVAHQBuhHYotiQ=;
        b=dqnyFi3UDQ5DKGPafbgcA1WR391cfALJqFG7MU73cAqVvJ9sNttGsdQrQ4jwCSctlw
         g4kjRnaXdBtpoR/fgH2vg/HqDaNqZHEZRIUnClHkwuUvSOWVBQiO8SiMo1IOrD5jWhDf
         2GHPLexivvW9PhmvTsg7diKBhWjFOd2UEWcryVwi+/yucECLvaxHJqcNULuUim2p3JPD
         ivXx0t7dz0xlwtzIwa7IZLcvhTcyiMHf7HnzAhUtWvJHSvduf8+hHht07ikepObgYeb4
         vtvMFlKkEF9iesH+ihBZQhlSbv2CNHJrMVY66oZzZJY2+JIEbWh4UCGUP3sXpmsJDFpi
         5jOQ==
X-Gm-Message-State: AOAM531P91hGB64FBe8j6ss+ZnI5Ok0h/gZ92PtVAURNOw443j83xMFF
	Yx2kChdTplfRYL+JC4Wo8r4gRsTZj2I=
X-Google-Smtp-Source: ABdhPJx7B09X3D+f0c9O4rrqLOZeZ0RbEAEELitZpKF7RhC2bCDOr3XDFEQQfNNbfaWwnTVpMjYTQw==
X-Received: by 2002:a05:6402:312a:: with SMTP id dd10mr61912427edb.384.1621121954680;
        Sat, 15 May 2021 16:39:14 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:14 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/20] libwnck3: upgrade 3.36.0 -> 40.0
Date: Sun, 16 May 2021 01:38:45 +0200
Message-Id: <20210515233853.583490-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libwnck/{libwnck3_3.36.0.bb => libwnck3_40.0.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.36.0.bb => libwnck3_40.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb
index 8bca93f6d..bfb52e5bb 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.0.bb
@@ -17,8 +17,10 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gobject-introspection gtk-doc gettext features_check
 
-SRC_URI[archive.md5sum] = "00bb40dc6fab76af0da33e88a34b6378"
-SRC_URI[archive.sha256sum] = "bc508150b3ed5d22354b0e6774ad4eee465381ebc0ace45eb0e2d3a4186c925f"
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
+SRC_URI[archive.sha256sum] = "30cb79a839f90cd66f3e202f3f98cb5166fa0cd9b92eb571ad9c470a43021d83"
 
 # libxres means x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.31.1

