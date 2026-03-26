Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A4E10A1E74
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:04:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44810.1774523033429377731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fpFo4yLK;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a7539851fso405889b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523033; x=1775127833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ye2mJ6PRgvmjh9RlSvSObIZyBCvh8/2J/ItQMFpP0oY=;
        b=fpFo4yLKPtleYPbMDFmUcMQkCQC2aPG2Fli9RWmlHdbjoL/z5pns8NmwS5BhiLPcbs
         xK6/mAc2me/mdABBjwpDFKmNtejRkeKMh79zz4wy1wIeSUjnn7hZcvDVrDTnze0pBYis
         MUV/I+WjdSXk19EThLeb31rzEj3SpvuOcmgd3/S17/4DqkosMqt36K2x5648ARRSHJ4U
         +d5/EyPl9Q1IXMI8EfzvGh38x59qtGJs1B1DLjhnpc3PbQnJQ6d95gcmDSbr6kEkO5bU
         U7VI+BF/3fGrHIYdWwhdclyTiH8e6LiVSBca5wo0Q7K1zGAJOuR5hQAtHIhtTk4cE/w1
         QxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523033; x=1775127833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ye2mJ6PRgvmjh9RlSvSObIZyBCvh8/2J/ItQMFpP0oY=;
        b=a3CHMwMdqRCGwtfgVS2AA8CsghnD+2M+sV9nRGVqRTFdNaBQ76M4mp0gye9tm52o+W
         OFTMmBJFgpJbrl7yQ3jP2pcx3I6p5VAAVcP2nRhfw6hPtfDdTcz3GzeHYY6bxcezMKtm
         hmNSWOXwWoOsf0PM6k708fa+51xfCmJWGssjkYhAKIag1o8CPOIrtc+NqBC17Sc6UsZL
         w+ofn0zeS4LEcP0PjjD0skpgSGyCgkCNnaymNfShaZv0JKxpSaPRJTc/z7AZmlI6upR/
         EvOXRt6r3yauWP5yKl9oL1YI1Z7u0rEjo9P9tfBzgc0gaoGc67qfM/LAC0eDNW5LFZTn
         bPHA==
X-Gm-Message-State: AOJu0Yxt7WHKr5TfFjvlc1YQMzBefnb1hWHfpLqLvUDOqugSeGSYMUTW
	JIEWjRS171LhxMsx3SVy4YWBb9eq80H3XSeS8eiwIbxKBal7P/JP9t3o2V2kLPmf
X-Gm-Gg: ATEYQzxTVrwaP6VYaQ0FkFKKBMdUnHGP0el3ODV1hvnKQjJ7L4BfWkpBlrBMz+q9HFI
	9eWS0cX9B2YXTL+xamhYA+ow4Ku/WWFODSXa7bd0a9XTSyWIXD9cXKyfkm22cGx9ugEalh2PUGJ
	WKe8Zp0kncyipYv2u8/lXG9aZ2wFfMIJ1NpCCZtfIlTk7+aGC6yCQCk5a2oNbF0s7UtH5K3rVXN
	7Z9ZTeteSo16izHKdoTgty0wbgXHwfjVXQREVPfVhEzbqt/yBJEBhGLaclfOKwU08SiQwajoplC
	8/Lur9ZIzWhOAapW4FoDc6fmiJhgJG1vm29Ebbwwjj8flhF3bizlwaKjo5iiT5DpTboDD7qd5yJ
	GMmUEgpf3R5wK5mj+k9hZCKEKpqgW5yfiRN+xc2HJQzVQmhHoMuR04zthzktE0iepzmaKjy8B01
	QBT4XlZdu7Niow4lPlD6uYVH7aKGNV0ODGdnU=
X-Received: by 2002:a05:6a00:1988:b0:81e:b2ba:5b3a with SMTP id d2e1a72fcca58-82c6de7ada6mr6536349b3a.8.1774523032578;
        Thu, 26 Mar 2026 04:03:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 12/13] libgedit-gtksourceview: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:09 +1300
Message-ID: <20260326110310.1809866-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125653

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
index 119a75b2bb..4939f673bb 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 gtk+3 libxml2"
 
 inherit gobject-introspection features_check gtk-doc gnomebase
 
-SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.git;protocol=https;branch=main"
+SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.git;protocol=https;branch=main;tag=${PV}"
 SRCREV = "a7bdc39f9fbc10c49ea7468ac1e5bf77385da0c0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"

