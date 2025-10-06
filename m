Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD20CCD184
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:10 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.37395.1759765925063695907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlVrQW9w;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d601859f5so56107177b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765924; x=1760370724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcnAMxJZDS/gYQTlgi9t31sM15zB2N1pYW+MK7MqKaI=;
        b=YlVrQW9wMM9fHRq7xF7Cw+WOqj01inNgp5ZmxVWZr02lAM/IQducal/wVtVQkfWs9U
         U1Z1kFfum5yI8iTvUxVPG5exMk5E1SJ9w7eZJutim9kERQ+sxdGqGML/v2IALqlcWZiv
         rPT8JJNLgMWWAmgYGV29roVidiskBVlHSsQcNikYzC85yEqRH78otHG8Lh1Ag76UIXAX
         MqJv+gOzwFXPqK4uQixaqUOOyEgYVvFA3MyIN//rJew09w32clnYuk/uqmzk/X8QdnmB
         gfkavgqPeb12B/H4Ywkd5tH98+G8qgf0r98ZmqeDDcsCN5e8WNzMymtfmh4aYarnNb1t
         qZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765924; x=1760370724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcnAMxJZDS/gYQTlgi9t31sM15zB2N1pYW+MK7MqKaI=;
        b=Svi06+8kBPCdKGbmnYf8TXIknLUktiMi3MgKeyjUaW35dyNCKBR8vYLfH7m/uM6zdk
         pS/mXFPn+tlV8GxJQhCyHxThXbxbdYK8QassTxjxyqoSZGMf1uQ5V3S2lmitp4thJXDX
         6rf/nbvIm/YK5Kdscm6PfgRPH3G6I4Veznn7QLmFyNrKk215VUIvlj3pNzFb9aNnsKAw
         c6Ii02r/PKnM1UMGFweaZw4Y6IgQE71r8gp5/F/9dirPuBS4X1WjEfEnasYXdq4dh9SM
         p8zK8yvwg/rsLEbmBck6hVG/gqC2HjDE8GnOaeb0NpnWaT9W4rIy0E8TwWfheaLfP3Un
         YodQ==
X-Gm-Message-State: AOJu0YyudEQmc82drUlrnCqStL1+nIn4/H9y4SWqnVKBTu2bDjVw9k8t
	4jasgaMNt/ixCiKaMYJESf6IOcQA8m0+y9AKMzbaQFxHEJIKxfbYjTrK3WAXmv5C
X-Gm-Gg: ASbGncspo1rF1MyAMDhz4OqkF6+jDfFA5Vi8Nm5RgaZpJAGaGgCzxgv8i3AMeSanWCm
	Ts/NOno6tMz+gMIdfuYMvCIzX1Op4OOTFYz95SjnuOcPQbXTL4O2zhKOzs735oTdMgCH2cTZNpf
	xgvCfcB5IobZz6TTc9wcL6e2OGU3q7tOq1iWavT56075WviTm9+wHMoJH3aHhTjA/DkT35dB+i8
	UnllqQaj/KvXJQsd8BGd5sEbTWefWTRahF96fqzJnHivErNqwuHn9z6tk1HgeCRsHHRp/CvAJG5
	EkwRt8QQYPAVgDaKYIZYmZSXnK5w6qzv1MNbt1Io+6Z6JAfTw3fw4dPFfQGZUlbdBSz4QlN9GbQ
	9eCECBiYwnz1uXMlKGrmQ5yl6e9I44TcGbRs9ip9/ULsJ56e7xmI0
X-Google-Smtp-Source: AGHT+IFUHZf/LMw4gEwTX+oF9S3Gvn1ZevRtv2VhZYAFGkkA0JA0IGoQKqVaTPmRXO0BwSFyguLt8A==
X-Received: by 2002:a05:690c:8690:10b0:77f:a47f:6df7 with SMTP id 00721157ae682-77fa47ff461mr105994587b3.0.1759765923647;
        Mon, 06 Oct 2025 08:52:03 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:03 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 03/10] xfce4-pulseaudio-plugin: upgrade 0.4.9 -> 0.5.1
Date: Mon,  6 Oct 2025 11:51:39 -0400
Message-ID: <20251006155146.416335-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120294

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/tags/xfce4-pulseaudio-plugin-0.5.1
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/-/tags/xfce4-pulseaudio-plugin-0.5.0

Add EXTRA_OECONF to resolve configure failure:

| checking for glib-compile-resources... configure: error: could not find glib-compile-resources. You can run:
| ./configure GLIB_COMPILE_RESOURCES=/path/to/glib-compile-resources
| to provide a custom location for it.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...io-plugin_0.4.9.bb => xfce4-pulseaudio-plugin_0.5.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.9.bb => xfce4-pulseaudio-plugin_0.5.1.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
index 1729ebfb29..8773cbcbb9 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.9.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
@@ -3,15 +3,20 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-pulseaudio-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5eac6bb0d6ec0dc655e417781d4015f"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin features_check
 
 REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-SRC_URI[sha256sum] = "a0807615fb2848d0361b7e4568a44f26d189fda48011c7ba074986c8bfddc99a"
+SRC_URI[sha256sum] = "8e1f3a505f37aa3bc2816a58bec5f9555366f1c476f10eab59fd0e6581d08c47"
 
 PACKAGECONFIG ??= "libnotify"
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
 
+EXTRA_OECONF = "GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources \
+                "
+
 RRECOMMENDS:${PN} = "pavucontrol"
-- 
2.43.0


