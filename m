Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.1036.1630777512065761624
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 10:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lPZBl/ye;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id fs6so1671915pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j4YUnN+exoyo0COvi1tPD2K92oZxIN0TzzmzO9Jwvsw=;
        b=lPZBl/yeX5q1Uli7s0qZwhENxebs/ioWdO2wXzgIEEU/Y11cB5OuYpItWbOSzYJI1c
         PyElqkTJ4hWOXfiTbcGu690tNSZjLVj30ZaY09Bp0MC+OAurm9xEPoimi7fzZEW8mfQd
         qNa2VOzxxPc91ZSuNPjuWvpKINHqtBLdPiOlm4BnUqFYbq8z+dOEQStQ/njZ/TCcSMEI
         ccw2Drqhn40M0Zf8jchgWEeo/qk+3ucBaIIcL3tqIPhv72DnfyrhT2Mb9SY6V0sAikgr
         0ZmwIZWRvSZpMKaD5hCOqvqspt8AV8s9WP/imAZ/0lW3DanEa1OkkHDkWcUXIM5DMlLd
         TKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j4YUnN+exoyo0COvi1tPD2K92oZxIN0TzzmzO9Jwvsw=;
        b=bAjZwn7diDQMOppVWXh47UYy1i1QbVY9DyyUt5HLE6HcOp+EZCcSjJEGggRmEwItDy
         MBE5w4vAncz+5hC+JNVfAECZbXqgHH2t3T6RBa8mB+DAkO2U4IzjhufC9XglEoDocuKV
         KRoyRKe/6Xs78061vQ7RzuEKHU9dzFadPn2M0Ni7CNfo1LymvXz+sZJxpW751Y2vj+kC
         TBa8MQcFgivJDnh2/6FqMFQzKunusXYBS5FJbBlZsVsS1wvQMGATaMc22fMyEOEb4RJR
         XryEbMTyBzHxR9MwJkDfE/F78CtaJ+E4kTJ/Zrr8nWPT74WfqNzFJlAsFWFfPhs9mr1L
         D9Og==
X-Gm-Message-State: AOAM5331LdeT9Un1yrO0HA6HyHYI2aE4yl71oJ6m16/SgAvaR6L5X4Ag
	fASAX+4QDkjpFYe6BwWdXD5IybCMdMy6BA==
X-Google-Smtp-Source: ABdhPJz7Jj2n3Dc9+0RrTwMj0QDvNUJXRpBR6SYqimj5z0aXq5BmtWfybLaUNqJvx3tbNFFr6Drjcg==
X-Received: by 2002:a17:902:7ed0:b0:138:d64c:7c4 with SMTP id p16-20020a1709027ed000b00138d64c07c4mr4022145plb.1.1630777511430;
        Sat, 04 Sep 2021 10:45:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id w4sm3052250pjj.15.2021.09.04.10.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 10:45:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] packagegroup-meta-python: Add python3-kivy
Date: Sat,  4 Sep 2021 10:45:06 -0700
Message-Id: <20210904174506.2263139-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904174506.2263139-1-raj.khem@gmail.com>
References: <20210904174506.2263139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b5a2f5d7d9..2d51b4e1a3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -210,6 +210,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-kconfiglib \
     python3-keras-applications \
     python3-keras-preprocessing \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "python3-kivy", "", d)} \
     python3-kiwisolver \
     python3-langtable \
     python3-lazy-object-proxy \
--
2.33.0
