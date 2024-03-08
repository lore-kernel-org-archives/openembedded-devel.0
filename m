Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0268AC54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:24:44 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.10720.1709861076945025878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9V+gsog;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-22187576d54so595799fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861076; x=1710465876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcovI9/xkTmmQ5ZwyeZUuWmnkuEcLKonf0dQPp8jcSE=;
        b=R9V+gsogtLLImhyjct8HbjXmlt/xy9qF1dhCAQKQsxIEg5dPU2mOKuiqGVkhbOWdlC
         S/I+qMGMybo1LNJa2tfrInxoHMmTOHAjZ22lEQcROMtGr90qmB/zqMVNFVd7U4Nq0iU2
         JHTQyNPiGebfXjz2yfZGmI8n+as6WWODHNPsuzV6bP/BnFjAOUCb9wFq/oij0FHqkGXi
         y4JHvrzYLXd1rKtJXvglgySQsSAtUKX+SzHkXY1zYSb3XBO6pw5HCZGcJ9krgcscwgk4
         VFCoj2tT5V4oVYEF+0/cMBY4DwZ5fdwMlD/w4DD97jSyiHASmhSbMufkS14uqfulFkER
         B5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861076; x=1710465876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcovI9/xkTmmQ5ZwyeZUuWmnkuEcLKonf0dQPp8jcSE=;
        b=d84IOGBd08Xlub6g1D4zTaHVaqUi7xs4t/BaFc+tuKFneSn8EO3BpBlL8kwoVizMsB
         azdNa6qji9KtdJ3gMNZlf3qdjcFQKMdop+xqSmGyv7D8D86gMK5RXEFGsXA0PfngBDUu
         cxyDoShmACJ7zs66b87SGrlGgQdLLZzwMJRgTwqVqeXT4BJ5Z1TWDcvb+qToPaXRXc2H
         SZrJNtB5LBMsjjMOPsbhrtTmMRvr9+cWo2C7lecLWChRvEISS313eXfzGZQGfgxjNR6V
         +DzbGuMpxzSS2r6vfY6uXTnutXEloMszv4nmlhytqHKvlPn9qa2uBZsERYpy8rpIWyIz
         mLxg==
X-Gm-Message-State: AOJu0YyayPSaz0QObStAYqYwXhHW+AvuDD0deJQXQQbZo0rEUpwOzNv6
	iHVP2gy05sNLYTx7hb0+R1bip/b9671CWv1aNJZb4QSjYmlqxfOSlMM7tpb/
X-Google-Smtp-Source: AGHT+IFJ9zHZBth8wAiNIq5U0aXhyOggdXvT6y26y5ZavEjvaFTIu6EhZOP6S2IyLy/63USLKZnYQA==
X-Received: by 2002:a05:6870:9712:b0:221:8915:1cc4 with SMTP id n18-20020a056870971200b0022189151cc4mr1821492oaq.12.1709861075925;
        Thu, 07 Mar 2024 17:24:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa79984000000b006e559bc3250sm10649731pfh.68.2024.03.07.17.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:24:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/5] gnome-commander: Fix build with taglib 2.0
Date: Thu,  7 Mar 2024 17:24:27 -0800
Message-ID: <20240308012429.577792-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308012429.577792-1-raj.khem@gmail.com>
References: <20240308012429.577792-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109216

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Build-fix-needed-with-taglib-2.0.patch | 37 +++++++++++++++++++
 .../gnome-commander/gnome-commander_1.16.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
new file mode 100644
index 0000000000..8f6920c2cc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-Build-fix-needed-with-taglib-2.0.patch
@@ -0,0 +1,37 @@
+From dc3aa0ff5a41114b17816f1f36f6bb5631c6ab5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Mar 2024 17:17:29 -0800
+Subject: [PATCH] Build fix needed with taglib 2.0
+
+Fixes
+| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:153:29: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
+|   153 |         if (flacProperties->sampleWidth())
+|       |             ~~~~~~~~~~~~~~  ^
+| ../gnome-commander-1.16.1/src/tags/gnome-cmd-tags-taglib.cc:154:67: error: no member named 'sampleWidth' in 'TagLib::FLAC::Properties'
+|   154 |             cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
+|       |                                                   ~~~~~~~~~~~~~~  ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tags/gnome-cmd-tags-taglib.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tags/gnome-cmd-tags-taglib.cc b/src/tags/gnome-cmd-tags-taglib.cc
+index 9e65836..573f5eb 100644
+--- a/src/tags/gnome-cmd-tags-taglib.cc
++++ b/src/tags/gnome-cmd-tags-taglib.cc
+@@ -150,8 +150,8 @@ bool getAudioProperties(GnomeCmdFileMetadata &metadata, const TagLib::AudioPrope
+     if (flacProperties)
+     {
+         metadata.add(TAG_AUDIO_CODEC,"FLAC");
+-        if (flacProperties->sampleWidth())
+-            cout << "Audio.FLAC.SampleWidth  " << flacProperties->sampleWidth()<< endl;
++        if (flacProperties->bitsPerSample())
++            cout << "Audio.FLAC.BitsPerSample  " << flacProperties->bitsPerSample()<< endl;
+ 
+         return true;
+     }
+-- 
+2.44.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
index 474512daa8..bb36d59e56 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
@@ -16,6 +16,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
+SRC_URI += "file://0001-Build-fix-needed-with-taglib-2.0.patch"
 SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
-- 
2.44.0


