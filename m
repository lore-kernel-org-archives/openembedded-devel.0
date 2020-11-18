Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.25326.1605712087886017368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yz27qhmB;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id w14so1591274pfd.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f5Nd1ybdL4mnjemDTDARi3OI6tv3g/YwkW0YZvWh2s0=;
        b=Yz27qhmBUsA+4iFTGcTorV7wm5WyVTfuO3vh9evKcjmLSKpih07UKpdne/0tLvbUTP
         GmF9umzQZNWSztUlt4qId9fKsFV4wsEZlo2pogvez7085EGKpfdfj/+qMvMPd52AiRHC
         dxkeafbEWu6qCJYaxMr+mjTQvkwS7PLgZ0qrAB4keoe8uTePfHByk+otkDrGYEeaaCOo
         SXmOv+QSnKGz4ge+nxJ4Eg7kwsQRYyDcIDDBBMHtTGJ7hKbJbdmRwnNj9GeiIM1c+Vft
         99d23jNuL3HeHHwY6XlnkwQ4stIdpdYlOvhYNmKiT273sHS8vid57+HwNNUJdbkFSC6S
         xUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f5Nd1ybdL4mnjemDTDARi3OI6tv3g/YwkW0YZvWh2s0=;
        b=g++V8ee38LP5AHCgg8dhPYOxWc6vKxkKWqvjvIpKpF5lGyRTHPb6E03bUegJJMt/PU
         Rw5Z7TPH1lqK2zRPhcBU7MrZbrX6wYNmuBhjn0Fapw3zilftNTRue21Dd1IQRjcKwJQh
         lhpRijN5YfevBFp1YY8mhx1gGIXWghhrcVw63+md4KKtfsV0Rwo/mmjcRbgDseFJyKuw
         H4dEqkt0/IE6ABWpHfgmBa/Wv8zHQJ1y1Fyvs1I3E0T3XaohSWaF53yM2bcfsURAdQLu
         ul2nc7zjSvccERFugHlbJUbpPBDCvTvu5IGMzn5Jd9nQLR7CR1aKi+xFeMRgiAiNh8ZA
         hZqw==
X-Gm-Message-State: AOAM533XsGmHSg04zK1LM4YGHVwYNTIm9XXV7X44bEjqok95O4IbCA92
	lVm7aj5eITwMIMRSdVQFHG2IS+r/2gU=
X-Google-Smtp-Source: ABdhPJxDZtv5YYXqBFf0Z1+yWM4rweY5Kdehn42dAQvUwcGu+AhbstANj81UZ7W4QGrymiyDflyEUw==
X-Received: by 2002:a63:343:: with SMTP id 64mr8653569pgd.14.1605712087224;
        Wed, 18 Nov 2020 07:08:07 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:06 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/17] libgphoto2: improve reproducibility
Date: Wed, 18 Nov 2020 07:07:44 -0800
Message-Id: <4accb95ac47d44d1ddedf4016bdea4581ec9ef31.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove WORKDIR information from config to improve reproducibility.
libgphoto2_port recheck config during compile will set the WORKDIR
info again, so remove this steps after configure.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 42c71fae324c9e9fec0677044a5011d63bc60a11)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
index 8daf737a5e0..fe7657f54cc 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
@@ -29,6 +29,12 @@ do_configure_append() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
     autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+
+    # remove WORKDIR information from config to improve reproducibility
+    # libgphoto2_port recheck config will set the WORKDIR info again, so dont do that
+    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
+    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/libgphoto2_port/config.status
+    sed -i '/config\.status/ s/\-\-recheck//' ${B}/libgphoto2_port/Makefile
     cd ${S}
 }
 
-- 
2.17.1

