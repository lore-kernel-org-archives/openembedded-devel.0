Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB74C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:22 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.46802.1673191277111478233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CAV5BVCE;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id r130so5182733oih.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcmnyskcS0IHwABudZQfQCmYgijx5SQw/jojumk6zZ0=;
        b=CAV5BVCEwqc5Q8CFPTsgYJRii8rwGMqlOl3Z/Xl1O0Ks5rqkrr8T1Ut97vddJ861xl
         RQCz4PJ6kAyYxE2QLHQVn3kfm4vbBjSY88IRr9AXV9JJ0qPOiKAYKLnF+5cilSAYc+3Q
         O4DlkzXctu6dPS7PpGZbfXZ5taynLcy2dTPCL9s+iuBdOofXJPZt1Pm9osv5QpNvRcLY
         LAVxq+mrxSCxhcU9WL0DhYqXOV8s9uKlgkGXoDGOKo6kuNqQUUG3Gz3w/qs3v8lQCy4R
         wAujHgeQs1lXZq9Drnp/kUyuK1m6BQ51yhYUCZxYrZF1DA4MlZ7iZ22Y44MsSYzP0+EQ
         8QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcmnyskcS0IHwABudZQfQCmYgijx5SQw/jojumk6zZ0=;
        b=OLK82H/hJwE/BmpN/uxbQWs0AoIhh/JdRtpFx7erlPjeaZw2hfIzfnHVIeRpqff4O+
         kaAtIk/toLaC+ntHFp9FRRU5hZzeYpm9pWH1qFLLZ9DgYozAgebG1faA/xbaiCKQ0Z3Y
         7nhfSEM0JJC3l0PH3jJ+R1XqEx6b8pv+F2Ai9ETNF3QLQNSt4Ojqk/aqhLiLCl1+SI+X
         OHQDHz+6xPPwImunE0kXOzuvwCYEc1f/hxy5Us5CtgFxxm3MO6QBCRI5ma7hTupQK/7S
         31FVv/wtyHFO8CqbMud6AImtwuEqQfjTh9nG1Vt5qp5Nv6eXKH/MzruYUcc0iSifY0Fw
         Fl+Q==
X-Gm-Message-State: AFqh2kpLu3NXNApaSkvSK1twLvslh8oIEHML7sYYAOMl0o6gG/lUuwwz
	x9cL4+F0aEJsAHl3/Sri8tlOmN9FILs=
X-Google-Smtp-Source: AMrXdXsb1ZJpG/h+VvHY1se80TGgN0JGkHv8EXHpIzUT/OImaJCmbT+/sSt937fAjBWpGrDcNHI7vg==
X-Received: by 2002:a05:6808:290d:b0:360:ebe7:c17f with SMTP id ev13-20020a056808290d00b00360ebe7c17fmr25708514oib.37.1673191276265;
        Sun, 08 Jan 2023 07:21:16 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 05/26] ettercap: Add missing dependency on libpcre
Date: Sun,  8 Jan 2023 10:20:40 -0500
Message-Id: <91a4036f8d6a76632e35c42ccbc2ddf1926efb39.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100450

From: Khem Raj <raj.khem@gmail.com>

It depends on it, but it was being pulled in via glib-2.0
which now uses libpcre2

Fixes
TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/recipe-sysroot-native/usr/lib/libpcre.so: file not recognized: file format not recognized

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8bc689ee73fa0f497294cc742660766c7ecd8c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


