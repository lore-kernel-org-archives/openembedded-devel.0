Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.40053.1595802908566073787
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XFnlHIJ4;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id o18so15132963eje.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iYsvxSbWztEnIw0WestP8DA5RjZ8guiQanfbzLpArLA=;
        b=XFnlHIJ4ywjYqewc780lh2xOkRReqhP3zvj0AvcSMfwA+e+yRdiobsRXr4geQnMt3n
         PX4mFxNgmQxUCCQxv+UdYL3ARfTKa5JE0id4SCrpzIC0bkvBBe1pSYnsvau/kyh6BjjV
         q9TsN09RrxCCCmgTb2cf9ChrKl4o7xo82EiJKhYgwr5Xk8lZykOo0GOvjQ/y6A2hEnvM
         iAbNXS2Sl/0/ufqGeY8N8dTdd8srUqLtUflC3tCPYTEpjiBCMzOiGtDM6hth0oUXacD0
         BKReFJftdBUfo7PrQ0lQTohiikntomWUhAtdJzfHCps8zsdUJJAn76io1RJHQ9U50kKY
         sj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYsvxSbWztEnIw0WestP8DA5RjZ8guiQanfbzLpArLA=;
        b=kmS+smt+BeHupLJj4tJFO4OSUAN/OOc61EwOtSxG8tIUC1/JJC+ItRTOXA9REvwFD0
         hXIgJGh3YYnUlxCoxYHYITFjd/3LZl2nYymnuDUFSzDANI2vkoKv/Q7QEEyqf0l5yE6r
         3E9a0cJCJnteONQ/FD+d4x+822IaVhBzRe2J0V+YD62K4h7prBu6jlliBYN9+LLhnBij
         ObMpm2czPfUJQQ1ou0CoHysA1JG/LjI1GC/bGDChp1FcW/rHAfU+NImf3FqhVek43WUP
         e3vU2qtys6xNh6p3z+K/pb12DegTCCNVJnunOUfPMrCDWv1Au5cXCgdN7f9IRV1fBvqP
         Bitg==
X-Gm-Message-State: AOAM5329v3H/FnjUM9pq7+JfplCtZZiJFn97dEuK2QDhkGAxaShpys7n
	tzjKGg+V7ObTzMHGapsCy0M4fOE/
X-Google-Smtp-Source: ABdhPJyjiW+XU+3vCdwqpY8emIAjJeVjMXzDRWNV9Wzxe9w3v5+iDr4iiYahFW0vsh7O2iYCS2ia/w==
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr10349496ejb.8.1595802906874;
        Sun, 26 Jul 2020 15:35:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:06 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/10] xfwm4: upgrade 4.14.2 -> 4.14.3
Date: Mon, 27 Jul 2020 00:34:47 +0200
Message-Id: <20200726223455.333001-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.3
========================
4.14.3
======

- Add support for XRes X11 extension to get the PID of sandboxed apps
- Fix use-after-free of settings strings (xfce/xfwm4#406)
- More XError traps (xfce/xfwm4#405)
- I18n:
  Update translations: en_CA, et, he, hy_AM, id, it, sq, zh_HK
  New translations: hye

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.2.bb => xfwm4_4.14.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.2.bb => xfwm4_4.14.3.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb
index b6066a526..ab8b34cfb 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.3.bb
@@ -9,8 +9,8 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "6d61d07b6ea88a429c43e1b9c3293eb8"
-SRC_URI[sha256sum] = "b15b40342596a3b6ab5167a58371262adf5484e165cb25a31fef42f0aa8ffd92"
+SRC_URI[md5sum] = "66b25adc9db8a3d829ba171bed478724"
+SRC_URI[sha256sum] = "829bec5a9e35a9f11c54a546c0112f5ad36e0f747be1156856d4abcce37283bf"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.26.2

