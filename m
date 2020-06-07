Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.19164.1591572614995134739
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 16:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FOu6Lsl9;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id w7so11927326edt.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2020 16:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vFFxjzDamwLaH6iXJpnC6550wecy4U0IZYi1yIswjlI=;
        b=FOu6Lsl9a0GYDc7cNNA+uW6ZUA94LFzUw0bJacKkSOSP+rEApPc/YTNLLQc6Ha6bV9
         e6icYN8My/Q7QFeczNNvar+/bNo4IGVH6PHD18nzZ23WyNkaZABCrwqeETLOfm76CWgk
         nKkuLg0HUvy103NIVW73DFIN21vq3mmgytdvirG+ZY4H6rYCxZDGliSR3sdhlgQj4a39
         OZQqV3+uLGTcB2+MeZNgl6J2r04/gsg5pnxr9AqdduVU1LXsdKaQ9UV1WKkLu0t5eer9
         04CkwV2U51aejzLn0npwVX/yHYM+I18SjduwegGhmhFKdY++IpOI0mtEth9FqZfFGoIc
         Wxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFFxjzDamwLaH6iXJpnC6550wecy4U0IZYi1yIswjlI=;
        b=YD28h0E5sUhvx9kZgpTuQ+drZDa8g+mzMmgxMEjERLlVC8zb57tYgXaZiHMcw7Ind9
         02gLxXo0lPhiB70f1DVzGGyh4thgkmns5jgoofg+CT10yamZEyh1vW8hPG2phXQqocmK
         lcJvjFf2FSHCugAOmsggh+jm3w3iYt1WF3Gs0O8PEhfpFWB4YuuA0y4hDpuG7lJ4w9bs
         5q2BZ+VU5jDAOQ1MvgM2oGPk6kOJ2tAe7YjdWC8z1Mz4u0MWMg5qmPVbAbBrCu+09P3v
         20LGwppHh8On+uOesa004uf+nuS5C2SJxKRzyq/UWIc9bB59cBJtVUYkqn50kK3J7B8h
         9IcA==
X-Gm-Message-State: AOAM5333qF+QVKNyJqdEnWsc0IV/ViVLf4sf5huZU6mj6QzZnI9a7esn
	vQ3CvuYho71qgSI5F6wLVy3Eslo7MlI=
X-Google-Smtp-Source: ABdhPJwfWkfgpaZ/sybSXOym5XV5vHZ8nHnE+dKbxrWqHXhnszSR/+j51lVxLyrDbqXPwmwgft5A9g==
X-Received: by 2002:a05:6402:1d10:: with SMTP id dg16mr19183543edb.309.1591572613038;
        Sun, 07 Jun 2020 16:30:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f081622be9c7682a114d3b8.dip0.t-ipconnect.de. [2003:f0:7f08:1622:be9c:7682:a114:d3b8])
        by smtp.gmail.com with ESMTPSA id x11sm3759053ejv.81.2020.06.07.16.30.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 16:30:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] vlc: upgrade 3.0.9.2 -> 3.0.10
Date: Mon,  8 Jun 2020 01:30:02 +0200
Message-Id: <20200607233002.2961063-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200607233002.2961063-1-schnitzeltony@gmail.com>
References: <20200607233002.2961063-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/vlc/{vlc_3.0.9.2.bb => vlc_3.0.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.9.2.bb => vlc_3.0.10.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb
index 24898a5a7..6020c2035 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-Fix-build-with-Qt-5.15.patch \
 "
-SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
+SRC_URI[sha256sum] = "a966abfc7f3b2ff3adaa130306ecaf5d6ad3b6dc73385fc9ab0c1204029d4c31"
 
 inherit autotools features_check gettext pkgconfig mime-xdg
 
-- 
2.26.2

