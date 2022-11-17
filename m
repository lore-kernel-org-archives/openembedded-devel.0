Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B245C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 00:51:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3137.1668646286521891097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 16:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FgXry4tt;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y4so155008plb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 16:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHXXZi14TiicNeNKmcqgQmYtm+3SrOz39mDt0/lQwHs=;
        b=FgXry4ttGQz9DjTFVa1IMllJ/YXSKi91JMqEaQTmr/YhuyAvHWHeKv6ipfcOvyRCfK
         mnEuQ/+EkFpubCfWzcSlp6795AYF8ISyqw3NhV02+O3Ex6hs3v6joxfsaqV+WOJviB+5
         dUtkv5dbKWkkA5pKexlj7QsHujygEpjBlh1CijYjuJI+O6KyAgrjy3tPGWifaM4Ylwzm
         AV9VTLsx7eYWhhSg/QuDbrmGuqDaOGy46aFJTvDHBKq0QXDF27WS489992INjMfFgKQY
         o0ruPq5IgrVECEwAx+tuzCX04mNW2uQThm8Z6GXCVW0SkQ1d86se9Ll03kfk5L89HxWi
         SjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHXXZi14TiicNeNKmcqgQmYtm+3SrOz39mDt0/lQwHs=;
        b=AQGqwQacYm72fufIM50sv7aSqj6KZrJkFDsPYWl3yebkp4I+jllwmwWyATJfZjg75E
         oJAbwfHRsrN8zJ8gR2paww2+tnWvxCC57FddlGk0LhoyP6NJEg1cAx9CkeIMXig++6qM
         i1p7Ih0pngqFxxJWftGQzgzMJH/UMXvr9CyovvtrV2ArBYbyvorPBJ7RyMJ1MvfPneXU
         LHkJMc/Dv+O0bEYShpHaq+LI/O3/vFUNZcqV3SN/zSvOi6lZAeYFvkHnG32GWFGk3b99
         p/Ir3zDbz8SZpdeQ9tA67e/rGVMHwntiILaRHF70kOiQOwe/RwIcLyaiYS3BxUDVQGY5
         PR6Q==
X-Gm-Message-State: ANoB5plIjNhroaFA2ilU4IPDQIVNPEzkWESFDgm2ugcw8l6U/ZoKWT2M
	Q4qdGiyHHWQLlgAAIqV7IDLoXw0q/GM=
X-Google-Smtp-Source: AA0mqf6wSnFsfyPyyDUyEoXOJZGJrrsadmFm8Jeu34lGvBX6lbsWMZ+32stBJbXe/1kNEmnwuRZm2A==
X-Received: by 2002:a17:902:a5cb:b0:186:8791:e9a7 with SMTP id t11-20020a170902a5cb00b001868791e9a7mr382106plq.91.1668646285539;
        Wed, 16 Nov 2022 16:51:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::8bfc])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090a3cc300b00200461cfa99sm2212587pjd.11.2022.11.16.16.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ettercap: Add missing dependency on libpcre
Date: Wed, 16 Nov 2022 16:51:22 -0800
Message-Id: <20221117005122.4114639-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 00:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99599

It depends on it, but it was being pulled in via glib-2.0
which now uses libpcre2

Fixes
TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/recipe-sysroot-native/usr/lib/libpcre.so: file not recognized: file format not recognized

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 7d37f41096..b0958e6975 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -10,6 +10,7 @@ DEPENDS += "ethtool \
             librepo \
             libnet \
             libpcap \
+            libpcre \
             ncurses \
             openssl \
             zlib \
-- 
2.38.1


