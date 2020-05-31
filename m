Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.18028.1590941814069782315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sr/xgK5/;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id a4so2301865pfo.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=b4kQpUgxrErKuqC/NC3dGNm96Dz+LAi+GuHO6CC8y2o=;
        b=Sr/xgK5//GoVCt0u0EkaFuKvnaMSS3fvIWLoVW/kuqoTmzWzYwCf+9IzdvYep6GOsY
         GqoSywmz0LbE0CxL8uuehaq17Lc70Gbw+SHQ86vdEPDuv6auBqP8G/cm/WWNyIGVo9Cg
         OHY+pKN/A9zDW7u75i7DI4pbmYJ3VWVReoMMwocAba7/5M1mJNInPzqVOgrr7ref4UFc
         KixuoY8FY2yNj0iIUF0cScyVAH2bHGqMJeEKFCLrg97lrPiOQyekW5AN31KS54SyrkL9
         VfsHMpqi52+KJCd/KO4lag2TNnvIjPxkAr8FS4w4D/8CLpDV2VXML3+/Pwe+cO0x03VZ
         UR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=b4kQpUgxrErKuqC/NC3dGNm96Dz+LAi+GuHO6CC8y2o=;
        b=kaiOFl6hT18lD88Uo0vp/K0tKalt1VRri3YcRgpdsolAwW+iIFi6T26+cvlfW7/7Pe
         yTqnopQZ6s4PWEw4ZsquAK0Fy7K+DkognDanpG7laQsG7tP7KNqcFK+JxEC2VyNz+OaS
         tl+OB46XqPfXzVKgEkG6K5sRNXulNDDdEU45F+M37FlhaTYWUOrfnHlNLYR9BardrKNF
         y2YY7Mvzh44n8IwoZg2WzA4E+VVHf71VbYyR4OKsTWOz/cZ7WdQ/y4xmRdVbnV3G+Ddz
         p7ipVm7J95gesifnBW5nBrMwJDARoiwhrczhqV7sJgXn05FlpUMpmdMrivR/MQ7K6lHa
         qpiw==
X-Gm-Message-State: AOAM532f+Pmg4DK0YJXf29xI+2sicVy3zmKurke3c/VeGwW/Tz/kgyaA
	8ciX91CSrlRQfmCLeiDRQLfZPkHT
X-Google-Smtp-Source: ABdhPJzASIG3BxdL8/Kcf8OEKwXo+pVBI2GEZTSHSHU6QIw3xTALPMcitRuN2RMSqjf4wSCZE4YKOQ==
X-Received: by 2002:a62:1d48:: with SMTP id d69mr17334658pfd.27.1590941813470;
        Sun, 31 May 2020 09:16:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 24/35] libqmi: upgrade 1.24.8 -> 1.24.12
Date: Sun, 31 May 2020 09:16:11 -0700
Message-Id: <1403b138925e8fd2bf46d68fb7e9e1f5b27b84ee.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Add md5 check.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d59503a02e510b60d3fe5f8dfb870d7578036c24)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
index 124b0f1b00..6f8638544e 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
@@ -14,7 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "c793db2c91d7928160341b357b26315d9c879ecb36699cb7a6b36054cba60893"
+SRC_URI[md5sum] = "7e6e49fddb9ae2b6fcde14619d6cfe49"
+SRC_URI[sha256sum] = "2d3b91a2b8a882b17b16403c9ef7bdce522db4f0ceaa3e4dff76033885428b69"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1

