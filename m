Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.573.1621121962283409492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wpn/cHvP;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id b25so3778217eju.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C6bxFVsjjZvl3Tr1EcMS3AHDhTz83L7We8EmZPwqAuw=;
        b=Wpn/cHvPIC6iCwd5v4HuPD+PfLikYlJcsnzvD6MEjMo32kpn/tvskY9nykAr2WDd3N
         OyhvYxhbL0Z83PXZpqU8gdKgy7JbNi6wEIjpkKPuf9Hk0y/doZVokILSJEkrogvNc/W0
         7nUo0Fro4RODABVJ85wU6ioLx1WoMEZeBB5DlrMpcGhrw6yRLsQI44p1dj97fTgPcqyP
         XG6RmDy6fBFdqaF74TqPBtqMqzeZQD/llZ9UO63DyTIZiIlj+IsJWt/Mjg94Ky6Tv/lU
         lua7IJvGseJhDIRXXGbVBb7jvTeRrWr8Yjnm1PV+PCFaPfr5jFtw4DZdvx4MBVhW3+Jw
         R7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6bxFVsjjZvl3Tr1EcMS3AHDhTz83L7We8EmZPwqAuw=;
        b=Bs2msdW9xCch9TAP/T6iD43Jpdapg8W5DhH7I9J50lqCLQzIvUENLc/jnFMz1aV7Qq
         5NONnPnUNCan+X6RS84PgEBOn9AJUYQRXGhz6CLxCBsNXUDQ8wDOBb9rwpTHxdSvVYpc
         PlRbTvtIFhM+aRCynFyN7m2wzPVyxResjGzQ1fqyEPFbjddGlDpsjza3jPoFb1eaNEWC
         6YWZHEUcmQADqVPZyzjQ86AKC/wR5WZRBGdKKdPdjOlWhyxGc4XHzo27lb2h1Y/Wpucu
         7h6NUXTGmNjt0pHSv410yXz/l9sgK7paTvNXHYd2XwF4D19P1cpqZYSK2BOkLrUJTENZ
         EODA==
X-Gm-Message-State: AOAM5307j5TiKQziwB0iSCb4t1oXW/b9WK6EGEeAXPRv5d2g5ZsLV5ba
	p1rggKzykOYGKR/w7KS76ipedvRUno8=
X-Google-Smtp-Source: ABdhPJxiG9Xu4Dl0SxX0qVUVV7EyL3/m7ecQrI/x0aONuJeiMSGzYnopkdi9JmAOoXrdo9/Cr2uRmw==
X-Received: by 2002:a17:906:3e89:: with SMTP id a9mr53438267ejj.405.1621121960900;
        Sat, 15 May 2021 16:39:20 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:20 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/20] gnome-photos: Let all desktops add gnome-photos to their start menu
Date: Sun, 16 May 2021 01:38:53 +0200
Message-Id: <20210515233853.583490-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As a XFCE user I was wondering why gnome-photos was missing

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index 628b1eeea..8a8306952 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -32,6 +32,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.sha256sum] = "e02d73e138af8b2868b5cad7faa1bdd278aeade3b6c3c92836511a4e6f3af1af"
 
+do_install_append() {
+    # make gnome-photos available on all desktops
+    sed -i 's:OnlyShowIn=:#OnlyShowIn=:g' ${D}${datadir}/applications/org.gnome.Photos.desktop
+}
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
-- 
2.31.1

