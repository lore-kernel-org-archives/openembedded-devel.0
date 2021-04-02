Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.10662.1617328731085330526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kVTDwyWq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id e14so1899894plj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3V1qVQvO+ByEY7StaX0CHHsB/2aDhv6Ot1ETmnvWFTs=;
        b=kVTDwyWqz4e3Sn3ybfR43LOtC9/YMXGAdFsLGCFwm//FSb6x+6p8/YcLpAZNVVI0dw
         cePMaRI8wXAcBsr5zSh3Vy4UC31vAtB15oB666op5EaKd7BEFGi3gYDrMxGiUxDVfdyg
         9WSUfUcRD0aCWfFyJ0eprNxW3zOTn5IbgJWXjxQkgdQN8r+yWbbt1r8DAj18d5jLhmhs
         hLRYJpikssG9suLggmParDWRqvL+r/xpG5cv0auAWf+eQ1c8ut0hQQeAG8lQB7d1wgUt
         B83k/8mmeE0ASCUCQJnM3WJYp3MlKBFFzCZEuJHAv2L0zjCEPSsXFNe+pfidFpkRHBJY
         sFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3V1qVQvO+ByEY7StaX0CHHsB/2aDhv6Ot1ETmnvWFTs=;
        b=S1cHkpfN+tHSNrj9jUFJoG20hZhZOqmw/Wb+vVqv4y4msCCBfy1WsG+6qgBrSgVNv8
         k3MMquq0x8Gfxl7/E6d7qcr3XKx3E3sGESlL9MuymD1Pphy6t9aBR7BP/8CpjyG9d0to
         LMwo3n/p1xbE/J4cZ/vYude4RGZcrPGIQZ+92o8IrtiqnS2ZGP50JCnTZWB5dApeZDhK
         h/ENtA6S5nFuG5/Fmv04VbZS5zhPLTzfHxjJUuSiNIYDQb0tQy7EMwxJ6VBz5LE1AZLj
         bfqChLQWwIQhzG/awiQsjpi4z/6BpOZnaseu88djlLXwWjFB+8GNujndmPLx2Wbm1Xbl
         ecWw==
X-Gm-Message-State: AOAM533CLKOy++ap4s8e7W5vPSYHWI+FtWBRG7lUb+MShwhmMUVYJqVS
	bh2Kr24PY5SaDZji3GYMVteQ/1v2x+U=
X-Google-Smtp-Source: ABdhPJztitfSvq2qp/B96O70sCDTqCXDUNYN6mDZ6KuzyONPO2baBt5LhHLtAAHKGGmgkkF5q67KHA==
X-Received: by 2002:a17:90a:fa0f:: with SMTP id cm15mr173197pjb.52.1617328730488;
        Thu, 01 Apr 2021 18:58:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 04/14] geoip: Switch to use the main branch
Date: Thu,  1 Apr 2021 18:58:32 -0700
Message-Id: <182ee4b68c6c8de44c6b82f004446fb5889fcd4e.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: geoip-1.6.12-r0 do_fetch: Failed to fetch URL git://github.com/maxmind/geoip-api-c.git, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df3ef158347072a409b4e276a9dab8c2e89350ec)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 4271c2e1558..143100e48e1 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -10,7 +10,7 @@ SECTION = "libdevel"
 
 GEOIP_DATABASE_VERSION = "20181205"
 
-SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
+SRC_URI = "git://github.com/maxmind/geoip-api-c.git;branch=main \
            http://sources.openembedded.org/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
            http://sources.openembedded.org/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
            http://sources.openembedded.org/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
-- 
2.17.1

