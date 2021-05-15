Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.596.1621121961459692962
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yzx14g3F;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n2so3766831ejy.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CySRFeBN/DvyPcWVf5iDQu/IHey1gAbfU4d2b7EKFUg=;
        b=Yzx14g3FKlcXOqGTvI83l0di8iWDd5SWT2JyA43azpfopd3ZnZRPZ2fd5WXK4z1Ejl
         rEaJNx2C3V3m3Utk1PMUL25EuBjdZ3HUIiVbH1HRdikl2A/n4aOAZ5NYSOTWUcA6qAhK
         Reo0+A/Wjo5Ai0+2Xmtbcwsz3JbOBP7auxak2GJiJuEDrjYKPHQkA3sZ0sCysx2xz6ry
         qTKbJaRV0Xo7vG1Nb1E4kKl0MH4OSmFdNretbGEQmdd209WHGbjeONe6GBtRNsu4pXNy
         SvNXqDw/RaFRjppPtiXkQXanHxOEGVi/vORnrHmN/FX3v3Pe7JBRbpcN0q5GoZm1QXuH
         qA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CySRFeBN/DvyPcWVf5iDQu/IHey1gAbfU4d2b7EKFUg=;
        b=n4+MOeSHLWJbRLZ85mmbfYE+c0USCHaPmw4BZE1A0wnlZUEvZpaixJoMJWKkF1lNA1
         GfKhhUO1fnBHhdmbzEKR4Od1gOqNqj23CDhBEYlX9+PKNYv7ajcRq57EEHAJvI80jDs+
         iCi2NVmzLH8rHTfR8e3KRfqxN+k7g6dljng5XsXMQVM7XMzcZcJ7zG2PFPaVC4eT7Id8
         F7rxf7lGExRYDtOUvVl8+SwKKfuzbkBpjafPGWmziaIHdd4nuoBh3eJ1MjbEkPmGa2bp
         B8xmjt/Ctlu13o4jWw/DRIwxzHkh0qLXzvlz2AssZ9/lSOibeLHXh6VaI8RiHj/jpfyY
         60Kg==
X-Gm-Message-State: AOAM531lJCdKqPLVw/pYOVZo8vaZbKW4QvYVTDvwBFCcm85XuAUFaHtO
	koSqz+tltqKV/4sIx/aOm7uQn9/aGjk=
X-Google-Smtp-Source: ABdhPJypcxJG7f95Q8o015FKzfxsXUUD6Oxm2R3NC8Df0ib8QQblk3Ytj2iHIJa859ueFEPeicnGdg==
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr20983731ejq.269.1621121960056;
        Sat, 15 May 2021 16:39:20 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:19 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/20] gnome-photos: rrecommend grilo-plugins
Date: Sun, 16 May 2021 01:38:52 +0200
Message-Id: <20210515233853.583490-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes:
| (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.011: Unable to activate Grilo's Flickr plugin: Plugin “grl-flickr” not available

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index d26c61083..628b1eeea 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -37,3 +37,5 @@ FILES_${PN} += " \
     ${datadir}/metainfo \
     ${datadir}/gnome-shell \
 "
+
+RRECOMMENDS_${PN} = "grilo-plugins"
-- 
2.31.1

