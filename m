Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.157.1593141287967249194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OyUlaWIM;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id j1so4043438pfe.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CTNJxXb0SJTJQvrHsubdgRLUoZWIylENm+L+lnrkajY=;
        b=OyUlaWIMlM1gTqB7sCKdZghwoFNwxHMq5RpjIpez8du4MMi9G7H787GUpg0elMmZch
         wjJaK0lPxBxCZaW+xQkaQ31OTP3xUi3EPtnGf4gDa3hZB9hQGQhCqzREHWjlA1rzu6fI
         +yNxEICYSWS6FgqecLGLJoNUixFYCdk6nsB+DBvyA8ZcxWa/iw32+6GwNJXhAKfszgc6
         8ORi7darIHry8nZ+sCutltF3G/jLyGEZWYw9joE5AKdrhodxSpyOy4Zt/DMzZv5EoTwk
         JvyKGSyLhKK6unlyChhhE2nI/rpmslfV2rHraxcQ9WAKoFILd9dsLfW5yHK83wgIgwT0
         lvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CTNJxXb0SJTJQvrHsubdgRLUoZWIylENm+L+lnrkajY=;
        b=NLuzPDYS1p+CpvIXYdONwuJhZDMAj+cPjt6lN7XszJ+rNz6qS7Z5KMyPeUMItfdoWb
         Ag7Q3VG3/Enyhw0w0v1EkF+mg1/1rLl49UZqU+YxL6YE6uzodDev/cMIlv9bTrNJlI14
         H1gQMdNjiWHK8XzSHU+fNetqpk0yun57GCFHtjevQBC2JLLLV9YB0Z+RykWlONqZm/DS
         j86Q8kZ+xHTTIXFjAcR9cPYzHgPlGrDKRIGT6yX2FdCOm0W5KTf94B5FVd5tJ8miPFnm
         YPpxmW9ZWbnkKZ2GmvxBGJDUGEhEs0a5ygKOZwjOdIp2OR//DysY5fE2KOB5wbyw7x1F
         pdpw==
X-Gm-Message-State: AOAM532h37bc6D/NppBCqg80/3Imu1hra+h+KIFhyFCitTyufVGUDkx2
	HzPlzNWrN/FMZmCdqzxZF/xvrDGi
X-Google-Smtp-Source: ABdhPJzUoxXslzgK0LNfquocnbU2V3fgZLBJxrcjQG1ToSGXMjUFiMyT2R5OPfU5Kh0fk/gfazSGHg==
X-Received: by 2002:a05:6a00:15c8:: with SMTP id o8mr813947pfu.286.1593141287248;
        Thu, 25 Jun 2020 20:14:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 6/6] tremor: update SRC_URI as project moved to gitlab
Date: Thu, 25 Jun 2020 20:14:38 -0700
Message-Id: <2b5dd1eb81cd08bc065bc76125f2856e9383e98b.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593141198.git.akuster808@gmail.com>
References: <cover.1593141198.git.akuster808@gmail.com>

It appears Xiph.Org is now on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
Signed-off-by: Rahul Kumar <rahulk@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index beeb23ae2b..d2ad961cc1 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.17.1

