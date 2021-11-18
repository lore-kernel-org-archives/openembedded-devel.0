Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6A5C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 21:34:26 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.618.1637271265129506573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 13:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RaX7drGy;
 spf=pass (domain: gmail.com, ip: 209.85.210.50,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so13310329otk.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 13:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOzb+yo8y2oF89eTlMv60p5uCa2et+wb3njAVhLhz1Y=;
        b=RaX7drGySJxTs81dGWUugeh67pxQxG4nRLqm4F91IAvGSbCQu6DsZKPAN+JCNTuCya
         jtBteSdgBfVRCsUFiRQmn9YqYaAtefY/YfKEX4vJYFBb07IuMXaZHno7tzsTijF/t7+O
         mhD6CxJt+5rk3rF70zFhgnPp62BTyYSzqTt8gSO6pn0MvFGYGwR2D2JITIeMDT9XrCE1
         qb0mZvh7mvJaQIt79PevV8/5Lvb0yL+uNXIRkgQfTZrJW9BwoLfrgRpl5OlfXqFVgteh
         QrNGGED5Hy7CcuYKYuCyzXmwaTJi/v6d7nt0TuM9PE3tCwsdWQ0E9RA8vfL3dVICbbsl
         u7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eOzb+yo8y2oF89eTlMv60p5uCa2et+wb3njAVhLhz1Y=;
        b=5CBZYEERmX5NeYy7TtatquxYkb9LKblG06jAHNrfxMvNm1A1iq3insq7fI9cAIYnox
         Lg1AgY2JfuHm/1llzgJklrW0xGuqZgz3y0gWBa9WgfYuDp6Z9O2p56AwwiN7aVj3WrUW
         5vxgJJWGs9pxFskfDTy+VtmNE8gUTonOe297IgNQC6ViUaLllz5JKpn+yfg/9XE2xSkC
         d2Gkg/V3Mkb9Ztj2vmZddrcoEnps+B1ZPm0T5RP1+vz0WpW0GGaWgIgJR+bNEF+oI413
         Dz6BZUdf7X5r/7HnuMXUTjPyTjiT84ahdTpnKDaZNqiiDz9YkgoL19JzOuy2LQ3g9zw3
         mu4Q==
X-Gm-Message-State: AOAM530IlazJEEnO8f2bLR7nAvHQ8lZ9R+BRaCnDf2K3vaELfFyUyQSJ
	HhpsSqvLea7zK+4djKf/G9ymC+7RV08=
X-Google-Smtp-Source: 
 ABdhPJy5j+IkWHxX3KGgOJwwaQEtItDzwJHEh4Ig5AqnnAb06bU29gLHoxIFMrjby0IPNPMp6wvUwQ==
X-Received: by 2002:a9d:5604:: with SMTP id e4mr311680oti.249.1637271264288;
        Thu, 18 Nov 2021 13:34:24 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 w29sm227096ooe.25.2021.11.18.13.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 13:34:23 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] gnome-control-center: Fixup polkit directory
 permissions
Date: Thu, 18 Nov 2021 15:34:21 -0600
Message-Id: <20211118213421.896534-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 21:34:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94055

Fixes up the permissions of the polkit directory to match other recipes,
otherwise they conflict at package install time

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../gnome-control-center/gnome-control-center_41.1.bb     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.1.bb
index 80d49d95b..79fa20e41 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.1.bb
@@ -44,6 +44,14 @@ EXTRA_OEMESON = " \
     -Dcheese=false \
 "
 
+do_install:append() {
+	# If polkit is setup fixup permissions and ownership
+    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+    fi
+}
+
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gnome-shell \
-- 
2.33.0


