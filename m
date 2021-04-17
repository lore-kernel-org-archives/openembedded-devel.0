Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.3588.1618693590275360965
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UbzNnJkp;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id m12so828897pgr.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6oPiVO2tXKdH8WzG5Sw+UWlAwtdoH6hETNoZE3wC/3g=;
        b=UbzNnJkpVefR/hNB4wQwwhO/XFWSGKbyjUht6LUBxrixbPjeiP3HSliicQeNGdUcY7
         eUxCEPwwgv5B10swhjPG0a1Oy7WDq7S1SxIxVs3fAnB8ZWnQhzcYogwDOXlucxJXYlr5
         2iEX5YAx+eZwEqjKLNyR8ip1CEAlmS6SkHDyPn/Z4Bo5D8sYgGjP2UwYz1J2pMfXckvO
         W1G9/eSQAOYSboYU8VwxLk3sRHhwlCHYHCCWXQhsLH/hgOsXPfVbm3SvTkanKPRxUFfJ
         eq37dMLgW1yG6Gb7B5FZN2I0ECQ6Eya0XHbb/iYv8y2jHsxPPGMUZuUtn8mSfMOYX2uE
         kK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6oPiVO2tXKdH8WzG5Sw+UWlAwtdoH6hETNoZE3wC/3g=;
        b=B60IGy4T1vTLOLPG5eRVpXmO4TplRobiJIe8o2HIDjU4sQQWxzgor/c8KO1Cw64VYk
         UCttdvEJfpn6Mqj2FzrXux8EAtmhuXF3zvyJhBtn6b+aNqnK/RYOXcEf8yRfaz9WEcrP
         9CFxWAKDHgMbNtt5YcG8EpS13nDFz455Ak0o50+MdhgglkGlX9VoTKT2CM8o+Ud1wS3s
         SlZlLaYnp03a2UNcFPWtdyVeQGbluNULqWRRz402hAqHovxvlsBzlagvbamqH6rL8YeS
         Z7YDFveF088I3PTCVHLgR50UkXvZ+hnKrDH/UoI5X8NYUK6/U4YFf+Ja8bIhh7vd+7WG
         M3Qw==
X-Gm-Message-State: AOAM533oGeIdVX3JilOBGhOwPmt2K9InZe4hogWGGOb6CHHmba6Sj1YX
	VbNrtQCWatuU5JsTsS55LDXIOl0oc/U5oA==
X-Google-Smtp-Source: ABdhPJwd0rk5XoSuag6GQpgZj3KqZA94376IEmj0Inah9b7sTBka1P9Is4YsTYKqLxbuNzRWiCo9eg==
X-Received: by 2002:aa7:838d:0:b029:221:cd7d:90d8 with SMTP id u13-20020aa7838d0000b0290221cd7d90d8mr13090756pfm.61.1618693589742;
        Sat, 17 Apr 2021 14:06:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:29 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 28/50] python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
Date: Sat, 17 Apr 2021 14:05:37 -0700
Message-Id: <c46741c17ad959261d2f131de3586a6451da7bac.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.5.18:

- netlink: support zero length lladdr

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 2df3e3aa478ffae71c8e2c99e4d8577460292e51)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pyroute2_0.5.17.bb => python3-pyroute2_0.5.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.17.bb => python3-pyroute2_0.5.18.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
index 1d3d5a253a6..439d383f867 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "12d51066ea5628a6fa76fc244f301a8eea5d25d71a9d664016976edfa3889733"
+SRC_URI[sha256sum] = "08ac40cad52c0bb2e0f20087520599aa91fcce0b221dd26e9042330428810bc5"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

