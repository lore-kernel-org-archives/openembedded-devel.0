Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253C4C433FE
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.402.1636825575378927249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D83NUXtT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m24so1029148pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/qu9WMRazLRAgV8jF9IdKNE9gW73fOs9aHBZJ4q91BQ=;
        b=D83NUXtTlNli2vTRF8PCss7nn0oHGoJUP5nlokXbGm/L5651VsxlI228Ru/Kj1gGyd
         /XKnAYCHDz4ZvafxJUKY16Qig5sUR5sIL5fkXFPjmBepaKmbzc014coUu4Uzfp2AU6ui
         FGU5/t26BOxWXCsYSw31wiRekE6m0xD4JuskKj4GSgws+AZP9RgTDAm4T8TONBzRVSbP
         vTE3BDgXd7EovY3Ckvq7aJfy53ixeWNUZO7/WzreBfltoiKWkbyaASG9LcXXHb8RY/A5
         lH6N0rtOSUwJEz8u5M2mTsILCufDYC8TeMLmlle6WaMe/fjmiL7Cb0g/TvsFBu69OZ6T
         GxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/qu9WMRazLRAgV8jF9IdKNE9gW73fOs9aHBZJ4q91BQ=;
        b=4qn3Z+JjCSUKv9am2g5T7BML5INpd2VbyOsxBRQhs00QGZ+Odt0hwNk0EE08jwFLZ5
         qeYZ1+ruVDI3lUaZhA5Q/0TQqImIx5Jh2GxVWn/rF7y0ImgLP/jk0Gt1sCFBao5O2Dw7
         lkx0Yg+rTMxQ0IwJQDnUa2VErgrfhTIyufxHc0ALpnNTf2q35c3deetzMT9hubdh3WJj
         XGM8OpnbFvznUB293mr3IrtRD1MkrcZq8Gj7aJA7P/sM6lwm0k9oDk9H17qzWw0ACp9p
         wM9lwkTuyuCz0uFXVSpZMW6fR4VhZ/AGODtKnnBKrKamTeBtPMCpCeN7joYaJjSyBN0U
         59XA==
X-Gm-Message-State: AOAM532sWqwA/aGtAztGVQ4iUTkMeHUSjod2LsD2e+ykgcYKDROKtSAc
	/iOHCm11SSW+1m74kEFvzdgOAXyfBVo=
X-Google-Smtp-Source: 
 ABdhPJzKGiq74aM9w1NRhjRiYsmaheWlHGUJ+AvznkAfPwtYrj+qnVDIBY3Q8EE3yK/HBSCXBgz42Q==
X-Received: by 2002:a17:90a:974a:: with SMTP id
 i10mr29441560pjw.117.1636825574720;
        Sat, 13 Nov 2021 09:46:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 9/9] tracker,tracker-miners: Upgrade to 3.2.1
Date: Sat, 13 Nov 2021 09:46:06 -0800
Message-Id: <20211113174606.2044137-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93938

This is latest release for tracker components

Release Notes [1] [2]

[1] https://gitlab.gnome.org/GNOME/tracker/-/commit/bcf1347a9eea300d11c95a78f8f74f38131bb560
[2] https://gitlab.gnome.org/GNOME/tracker-miners/-/commit/1e1a9e701faae73148fc05613b7e237715ad0cc9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{tracker-miners_3.1.1.bb => tracker-miners_3.2.1.bb}     | 2 +-
 .../tracker/{tracker_3.1.1.bb => tracker_3.2.1.bb}           | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.1.1.bb => tracker-miners_3.2.1.bb} (96%)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.1.1.bb => tracker_3.2.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
index 78d4b6203d..a9c96a53d7 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
@@ -15,8 +15,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "e4d361351b156f2862a524415fbebf0539c781cd87c6629662f0265b4803b8b8"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
+SRC_URI[archive.sha256sum] = "44369f53e2edef41437406dbeecd477a97f8a9afdd9134832ea45d1ba2aa2c47"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
index 28193d8d27..1c18efbcef 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = " \
     dbus-native \
+    python3-pygobject-native \
     glib-2.0 \
     sqlite3 \
     libarchive \
@@ -19,9 +20,9 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
+inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "4376e2e98454066f44f7a242e45b99b3bfe4c03b67fab19abb0ed586ca748ae7"
+SRC_URI[archive.sha256sum] = "1847e08b39e6e61d848735aa1f97f7d96c038201653fa0d7cb9e81b37eb9c03a"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.33.1


