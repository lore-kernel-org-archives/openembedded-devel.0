Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.405.1616693139509860003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y3oeRy+B;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l4so4201780ejc.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXHN4GLvfD7UbI5qP/gsgnp0fOvzw1opf/4vY/LERuc=;
        b=Y3oeRy+BexQRxeY7GmOjDbeUtngakNGwentNlEs2DtmCLz/8rwBHOMoLkqgowW0GRO
         JikAaFOzYkHEpkOxa8TXYfnSDua6hpFfmWeDp0iaPxN69gknZyiK175AGF+RWbYJDONM
         4TBHHOBFR0i8HLAXVs34JJmKm8l1mK38+5gz6GWohN6Q//BBm1PY696r6fSeg63hBMHP
         8lVybB8moSS8Vzb/Xp2mZyaTcZlsECSBbpYSb1g6OF9FNK3m3VDKuEwPpazwz9fEjC1E
         uvycPOGsz7+BeD86sPTz/bW3ya85/IfsxafW+9PEuDUFd4IoXEFeWKXhk9p5CJ4OuCkS
         RYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXHN4GLvfD7UbI5qP/gsgnp0fOvzw1opf/4vY/LERuc=;
        b=emp/2bVzkeGoy9W5JKOGsB/4lD9zwl/bQ7XqWaiTkfPMntw9Ea/2iRnqs5BYQv/ZZM
         olMjePcHSFHq2I4zIvNABny/9K8OZTrVswPzMX/Xa8SYPYZocX7xGfdSw6I+Wta9rKEj
         HNH557gTW7CQroB5YACeC41ovplrxe4vjibp/PA/V5Al/y0mS4ETHk+qA4tMWSDLoa4L
         iXd43Oo+fEK6ouHI7WZx0QH9wRiBUX7UbZgWry1Fn7SQw/k8dr5QPDw8NmLXn+ViyB9f
         4elb/iUuDDqk3cW4alFxrhcM6qODs7U+LNwwgTi1y09DdQ9l5vrtoUm6tTazC0UdZcRN
         tN+A==
X-Gm-Message-State: AOAM531qCw+vbfSIuRvJ9p8D4qUg4CGvOHS6YdGClg0C/Esy9snpcpAz
	pLPEImsR2O493QaWTDj3n5VAjUVPayI=
X-Google-Smtp-Source: ABdhPJxo1YJOCF8hWeu0wyEgPt7AL7fjMpodyYxvBA52o2JCuTV6flZZl+1Bc+1pGE3iKzgJ1k66vg==
X-Received: by 2002:a17:906:da0e:: with SMTP id fi14mr11017386ejb.188.1616693138029;
        Thu, 25 Mar 2021 10:25:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x4sm2826539edd.58.2021.03.25.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:25:37 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-{oe,multimedia}: move pipewire to the right packagegroup
Date: Thu, 25 Mar 2021 18:25:31 +0100
Message-Id: <20210325172532.1099941-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
References: <20210325172532.1099941-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it's in meta-multimedia not meta-oe layers

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb       | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index c4be1b5ce9..350c14b264 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -53,6 +53,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     bigbuckbunny-720p \
     tearsofsteel-1080p \
     schroedinger \
+    pipewire \
     projucer \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libde265 openh264", "", d)} \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2b79b3d8b5..42087ce4e0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -670,7 +670,6 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     libvpx \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xsp", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "mpv", "", d)} \
-    pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pavucontrol", "", d)} \
     libopusenc \
 "
