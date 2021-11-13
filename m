Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E3C4332F
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.398.1636825574012308864
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LXfZxAVM;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u17so10971798plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oiReUdeZNlazUFI4oBVhdLpbV7O/zm1YJWCgpcdbGsY=;
        b=LXfZxAVMZI0fgZyP/cMW+6PgJkndu+BfgXI3GbgYjraqyGv1vCrL+x4yfKxD5vpHRY
         6WdAu9L0mNHXhsjcohfhueqz1cnwqY8FzwXMSR5f/GovfzlKpN3mvRq3vsON53Febh50
         1iolkaHvoc99MaffAYhm55C8Mo8slqFrLMx5yApI0GCdhp6CJ9545y8lX9qybqd9o1+8
         QcP66lnQD1EmjTdrZSfSdQk0EZ9Lp8oBNSFOX577U3INfIS+9wmmvaTb9i/xktbUHt6w
         IfyzY6hLx5JlonFlO4m09YyCn/GJzdUGXGzkJaKQAueAFPq1O/JLvhAAxRZu+lR2XTKn
         syXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oiReUdeZNlazUFI4oBVhdLpbV7O/zm1YJWCgpcdbGsY=;
        b=B0ZZN4vfqx4V06rc3KBVa0hzvhAbqebTGxiji5JcYniIrp1t5I5ynsm7LrJPyXH7wN
         OMuLcAYBlhKamrr7othpNuqbp8xDZgzz8KBt9UVf+HK3OyLcY9CO9nX9PKuI5h0OCKSu
         iZlFapHRCn3wt8isMw0a3lFtU4Tw2bQnlOSKSyxFq62hoV49RS/g+surqGOv8cAtUCoW
         xBTvQlfWXQCIEoiHRm6Ud9ZGHb1EZNvgWA04fDDLhm+QbsM0X9JpyfyeG5OxP6HSDwa3
         CY/fPmrduveagH2XWenZdk3csCKDw9xfDlW4kpxdn0ZD/DQwOpdDAfsQ/9+DyelpL7tI
         eE7g==
X-Gm-Message-State: AOAM533XSk0vEwtPQkX4b3iKsel8gONIvcXQoJ1bXOcWhXLWl4IDEhbS
	TKJaq2Cmt4thSObPI+QjtEBP/mWgd+s=
X-Google-Smtp-Source: 
 ABdhPJyvg7A1vqvlmEWQF8clUOKQy2UDdc3W6ph1gfkOQ7H7VFAOvywZ0O9PhsKZLNd4mqPpswFGWQ==
X-Received: by 2002:a17:90a:7ac8:: with SMTP id
 b8mr47557274pjl.206.1636825573408;
        Sat, 13 Nov 2021 09:46:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 7/9] tracker-miners: introspection is not valid
 meson option
Date: Sat, 13 Nov 2021 09:46:04 -0800
Message-Id: <20211113174606.2044137-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93936

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
index c2de723ac9..78d4b6203d 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.pat
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg", "", d)} \
-- 
2.33.1


