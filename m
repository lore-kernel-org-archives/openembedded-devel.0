Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.28473.1615156502699854283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jBQ+hQ22;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id w9so11956238edc.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sZsVr85kDHXZ6pbSx1SvhkbwO2D8epmT0pFmsHMCQ5E=;
        b=jBQ+hQ22ztPfzU9v96Ks/z8m//YRv5iqt/haQ2Os4jPc/WoHwpGi7owNXYkrYph6eg
         FT4kFzBaVj4l8CmH1Njk3BWoe1M6ZVAVvjq5dvxkf4QKuJ8XX/AtJPDuUorDpPeY3zcb
         W4O3CejE81BBYFZG6Yis6wwgPuuMIdUnM2L0zmsEYRaGH50VxuFhi5Ed4RTPdZS4I+yI
         ZN/YxncmfbKDGx4R7z2KxQReWCgVqtfVQrpKv0wrdgHKL2OIXhxjAIExWQKANkOEUzP/
         G5tXlyOky2Cuv90KCyK7MwQWU+sIV2Gx2qCmieagskSY2k8m4gGAsrYbI5hOMdSQjaG9
         +Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sZsVr85kDHXZ6pbSx1SvhkbwO2D8epmT0pFmsHMCQ5E=;
        b=fD0wgdSqjBNan2nNqmWWwEOqU9tsUfhM/2Wcgs2zKknv2tKdfC0+Ij3Zhzpb8qRefn
         5OtfH8GkrkPu01GSdH0lp1ZCA2S4XQ8WQM+JDA/yGI/EHWYWCPpPHAeGtsnj96Ij+NfG
         dNyb2xYWtTeEpDTUrVs+SIoKjD+3UrFulO7K4ExY0syAhwCj/SKExQ9ad61zhvBOsD3w
         NvERtXNWntPCDcjDq6I377MBH3w9njdz/WXR+TCmruvhh4mfmooo0U5BY3EQYEvr6lBr
         iRa5x+LGz7rsfpXvolwVA7yOejtdZNpMSZDunxRKrsSPeRHHmh1JS+PNV1kmcXHMvcP+
         vqcQ==
X-Gm-Message-State: AOAM533xysCuycVuXLupqb3iHuoswx5oXRrkCpGr+G3ycO0PFZYJoLcd
	zwTAVPpxnsMH2FUis7x+/3DjH9Drb1Q=
X-Google-Smtp-Source: ABdhPJzY9xdOfm/GKP6B1bU8NNWBtRE32O/zThfNCQh5ox8tIEiJ0e+lQcUrVuvwiKbT+Imx1aPb9w==
X-Received: by 2002:aa7:da97:: with SMTP id q23mr19092587eds.180.1615156501154;
        Sun, 07 Mar 2021 14:35:01 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:00 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/9] xfce4-panel: upgrade 4.16.1 -> 4.16.2
Date: Sun,  7 Mar 2021 23:34:42 +0100
Message-Id: <20210307223448.1063315-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.2
========================
- Add icons to help and about items in panel menu
- Modernize documentation (developer.xfce.org)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.16.1.bb => xfce4-panel_4.16.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.1.bb => xfce4-panel_4.16.2.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb
index b92ebde00..7e54022ff 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.2.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "fa099bc6be6592dbb828747a473c2e1b0e7f85afd945a98002b475bb6f975991"
+SRC_URI[sha256sum] = "8634166e6f14318daec363f7e2371d49b98986f9bce313a7dd1554f30b48b5cf"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.26.2

