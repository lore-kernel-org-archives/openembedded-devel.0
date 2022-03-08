Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F16C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:02:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.9826.1646755333567329570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFyy1DiH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso2612730pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WL1DTvb38nOxCsHAXkIUk2dlIO//k/CPVX/p+Osyde8=;
        b=VFyy1DiH2ZOOjJEX3+LNE0+OCJnNA8TkyJ4h6UMn64cVJccnnw8yYvUvduGY3EY/Q0
         PMud3bhAQyi8bUVJsu46mDQb0JDMpUHzRbEkVl805jLN1eRlyJ2F2jptB9IpuelaMGZM
         VyoY7eEDAGDAcdlsZxs7WWXeGDIuGPgC5+zEWKVErhhmE8mN5aDTIpDeG2Fm5WPwXR3o
         ncmboV8pZ29s7kYOBIxvz+o/og8y2boINwyMbHlE4WRy6o687ht6u6ZzO3Q0Zm9fz3ns
         WnhBdOW0Mrz52KlMnNYc3vjnbOUUf58+Rtm59cl9Y3HogDnLyy+ybsp1fGzJgjBKnZsd
         ur1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WL1DTvb38nOxCsHAXkIUk2dlIO//k/CPVX/p+Osyde8=;
        b=HgrFpGEmfyP3rAl1DW+ODucmeeZqTIouFZmIjaMkfukDFO5wE2dGUDn3aloSXODRyV
         09Pvh33Qn4d/FcO6fuYwyQ/VUxychVmsJ4KOXFczm7s4SuWBrUxbi7DpwL5H9GeSJ8ce
         ZS60gOO5PxlgZ8x4WFDIriKD7bbxv91U1P6Lg1rWUDcgBH8ydJT6AGu3vlQtk+HRRTKN
         qyKNNyyrQ2EFMoPekYE1bTGVRa4Jok9FnKwg+U71AEdWOJP9fVdSh+F5cO0hmvff5QoL
         9zfmyp/nK/vILwijTE8INkTJMH+bJ8qyRoha3NE9IQx2FxUTCn3S6x48HASGKgkGqghE
         5wRw==
X-Gm-Message-State: AOAM533tek9rBsENcUrIbLPeK0WJK8IgNFXrVlf1L+80LJEvT8zJJUCa
	M/znY/cxr0wAlxvjSwdGJ/LOS1ToqwRJkQ==
X-Google-Smtp-Source: 
 ABdhPJzserHK6RFuz+h/KsstXQvK+sLqmQUR6xNnEwglFk5pmPVNN26+8lhD/XZrh97bA4xV6gqgBg==
X-Received: by 2002:a17:902:b185:b0:14f:2d94:184 with SMTP id
 s5-20020a170902b18500b0014f2d940184mr18059105plr.56.1646755332740;
        Tue, 08 Mar 2022 08:02:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm3533737pjf.13.2022.03.08.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:02:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] boinc-client: Depend on virtual/egl instead of
 virtual/libgl
Date: Tue,  8 Mar 2022 08:02:08 -0800
Message-Id: <20220308160209.2585680-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308160209.2585680-1-raj.khem@gmail.com>
References: <20220308160209.2585680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 16:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95884

virtual/libgl points to GL implementation but some implementations of
graphics drivers may only provide GLES and this makes the package build
on such architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 63c32dbf0e..5e991d3099 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -24,7 +24,7 @@ DEPENDS = "curl \
            jpeg \
            openssl \
            sqlite3 \
-           virtual/libgl \
+           virtual/egl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'libnotify', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
-- 
2.35.1


