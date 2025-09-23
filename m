Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5416CAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:07:01 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14131.1758625613675956426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=env9jt/v;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b29ebf9478bso350691266b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625612; x=1759230412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpeX4yqR7wnTfhJKoBCXcruDA2HRkTSImEw905MJin0=;
        b=env9jt/vL697GOHJ7SjPpd8qxKIpVEvtnAs7Cf/5649EnF1Wlx4y73+hDRyuGPyDpQ
         jayifAAkvD0RUt3cJnawum0dedRXobg9S7KUQO8oWmhH7LlPqW0MrHtW+KnGUTP6vVRY
         XyHoiY9V6/wIESrpNJCA3pDy2L2/oA3FvRzfTrQjXK2QYxOJTiyN1gDISMLe85j8Ya7c
         ht47bYXeRsX2Ri6uYdfZHfiUVpVVbEGQbam1gXpeQnRH1Sr2JQNfz+Ng8hTG5aVq1aZT
         jM6RiA0f+7jRYsn42AH6zOrbZAR14syZ+jheuZ/c+VUcCvhX1jP3qy9RpN2xyPm3u3v8
         WJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625612; x=1759230412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpeX4yqR7wnTfhJKoBCXcruDA2HRkTSImEw905MJin0=;
        b=mjtt4yjLiWDjmFWHrZnj7g79CwXZ6BN0JFCCD+Sf9BLkyVfB7PHtAW+vgH76NnzH7J
         tfa8+yfnTIZFAWPeomJfokUQKcasV94iROUQ2HMPltbRg52p6HrZzy0V5Di/fS8//FeT
         wX8bA9kaOQ5I3xdxDBoc5a3wCjn/fCDevigggJEpneIIP80hQtFEMKHdX/nD0NlIq68A
         kit14lF+CIOgXY5+aPhMQ89TxfWgWDvnFSlWO2yGuXa7QRzYis6u4WLTPrxUjOnC0ySM
         AFDbaeUU1tPFeBmCKCWgMrN8+fsawUF3flCOXatg6t42QkutpUuxY2Ig8AHxpITQWjyf
         728Q==
X-Gm-Message-State: AOJu0YzSy8qeRFTmD4en7MsuNkoVkkPzA7TTr2epcAB64tsZQL5dYMK5
	oeamwkSTE2O4rVMS4/6uEyG11bPxqEQdRwfmIWBIvZdRkq/FnGklzcptaBoq1g==
X-Gm-Gg: ASbGnculA8oLysQ3htcu4woI8gwrrGHjHrTyJeEk4auf17qvG2xVwgArSGI5mq1d64U
	/etkKwvP1DcSd0Ki/VCX7FNU+ScXMxZi7BNpwxdbgdxejpiFj4rCicjhztH8vkjh+yBQ8/jEUxk
	ITQQwYaLY3ekHm0l95yD5B/1kdUcFm/AWR0C+KwWwGfUJzlH1yGJNu+TpfGKIgDTYID/DrVBCIs
	LuvxeWDh9nXEIoxuKaiL7IyH8m3+vHWqeANi/LFPwVkCgwYHkG1VTYLI+AFLYKsuVhPoM3kqDxf
	jZGbrS/rNhPMNRO1Gxum8vSgv2ThOuACpwR84G90v05m0Z0HR4RURGVGuPy//TByCMkoFiXC7aD
	aaAGwYXmu7vKao6rv9I7+
X-Google-Smtp-Source: AGHT+IEreMbISmTFlMCQFBJ5zau8h0k3/oLBUZqiVcMB4VtZOh8dRlfbQYn3C84osUSUb/WN+EyeFg==
X-Received: by 2002:a17:906:9f8d:b0:b09:d915:1416 with SMTP id a640c23a62f3a-b302b0246a1mr212232866b.54.1758625611882;
        Tue, 23 Sep 2025 04:06:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 22/22] evince: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:36 +0200
Message-ID: <20250923110636.3413021-23-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119686

From: Mingli Yu <mingli.yu@windriver.com>

Add opengl to REQUIRED_DISTRO_FEATURES if x11 is enabled in DISTRO_FEATURES
as it needs gnome-desktop when x11 enabled.

Fixes:
  ERROR: Nothing PROVIDES 'gnome-desktop' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/evince/evince_42.3.bb DEPENDS on or otherwise requires it)
  gnome-desktop was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'evince', 'gnome-desktop']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 82fc8c534ee62095df3bb0d382c9db3e6bee5bb1)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
index 0c97f75e90..5f35d5b33b 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -19,7 +19,9 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gtk-doc
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gtk-doc features_check
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)

