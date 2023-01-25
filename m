Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742F0C61DB3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.44849.1674653490555146804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4Y5hB8y;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id h12-20020a4a940c000000b004fa81915b1cso3146006ooi.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PitTdAaxqTGnxaNy2iGR4LAoCPp8N2zCij1qChCVWsE=;
        b=R4Y5hB8ytSdV9NWpxN+AXmJeFJrZDiqiLFYD5WyuIOkkuhzSsEfJPcuYbZEnKijWDp
         WffvB0u/xk/W7PpSQ/DYfOFbRe240WCJs670OTgHoo28mFDyAvfdjBbpLzyOL9WMv0O6
         yQts+tmIjrk96ovvJiyBje9BJoK47tulldXXDh6vnK+JBjv1ypXFdG3ZingZ+NqkB0mg
         kmSVO08i/Y6TgQWVY3kbe9gweoj1yW9a8fVla8WChkt1WN5GBv/JUd6UV4GC/rJ5qjaP
         e7knJQqESWPMuosPSkS7Jt3ktg24/x3qWmvGNjiseTjL1onXZkZy2c2LWUxEYFSQ3pBu
         UZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PitTdAaxqTGnxaNy2iGR4LAoCPp8N2zCij1qChCVWsE=;
        b=iuAkcwWpGTMTSe2YsVCPgZw1nRiTErV9XSaSWFd1X2XQ7FbXL8IWPu9+9/qNYZ4FBq
         VI7/YyBRLdEqrkaBbkdZr3gELdCSD6k1duwrcLqC1iwfCJ4GuFNbKXR3el9keFEd0Jys
         rxlk11FHFLHUQo6Lapg6ii65mY9N02fPrYxZsY+2GP4hw9JfyoEBKqCfNJEIZ+NwCeCs
         1idHc+q3toUcb0ql8quIz0UXv3Plb8bdK2aC3F3iXitr1vxuTbtMrfhVZfoiQ4tdIC+2
         p7wVVW6ErQ+yTjzpb6HuwrqjeoZ7y5wh6NnIBL9RukUdj8sujDy3fXfil1nDo4KDbqpV
         vZpQ==
X-Gm-Message-State: AFqh2kow2VusTECaQpnQzbcNW3TbxwiH10Nw4pifNazJk8WNLyeNFGOY
	/ZvZ59y0ibib9nbQRR8kQBX9uHkw1u8=
X-Google-Smtp-Source: AMrXdXs9v5eYj34SqEnKUZtnjKZGXZbe2KLKtyhUMwgMO7hU1rJQCprohtx/4qsHni2WHmk2+qFJwQ==
X-Received: by 2002:a4a:6503:0:b0:4f2:27c1:af66 with SMTP id y3-20020a4a6503000000b004f227c1af66mr15023662ooc.2.1674653489687;
        Wed, 25 Jan 2023 05:31:29 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 03/41] xfce4-verve-plugin: fix do_configure faiure about missing libpcre
Date: Wed, 25 Jan 2023 08:30:45 -0500
Message-Id: <cfb543bdc1df619e16f07ed3ed8f7eec2802f853.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100738

From: Chen Qi <Qi.Chen@windriver.com>

libpcre is needed. Previously, it's available because glib-2.0 depends
on it. Now glib-2.0 has been upgraded and it now depends on libpcre2.
So add this explicit dependency to fix the do_configure failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03708a875fc3bdaa30310dd2d62030e9b1f1b002)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 21bbda331a..eefe3322b3 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -6,3 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit xfce-panel-plugin
 
 SRC_URI[sha256sum] = "ebda5e5eb62d6e42afdc6f121d2f1cbd4d9d3c2b16a5e3ed8192b1b224b8f825"
+DEPENDS += "libpcre"
-- 
2.25.1


