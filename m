Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.2641.1624825355126526790
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LtojSwO1;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id e22so13479092pgv.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZSRSVY/MWzvmQcOlo0gcBiHKvhqXrlda/nZH5/3NORU=;
        b=LtojSwO1ov2dDSk+GB6Yl8QnF/7/7cM0sZ1JQ/Nx4yrnftglGjB3EQ0hzefYE+KMuO
         jllu+ilUhjVoM7YidsGfGscFjg8tyzdHAkollIBrDi9KeaoXOizhIBH/VpCTeh2WACyA
         82BH7CojyrEW+Gr+UUsv3y4vmc+mXxv4sxgRTTnFa0diqytyXV5TrQGxKRTI7tNxhnTY
         0/ZGcAz+10crzxE/FGG/j3mqW40YhN+f+p2WNSiGger80JihzmlwqBypfOxLo2y6hfkg
         XBvhrnUhMtg+FyjUXeG8WKvMsfJ8UGE0FvIrjP+lL6hCI+nut/Fqg5i/XKwAi5cTCSpT
         a3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZSRSVY/MWzvmQcOlo0gcBiHKvhqXrlda/nZH5/3NORU=;
        b=bRYFBMw3/v3F5lenPa7vgYlrCJ8uLIS5fwBUBnB/Z6wrbdOcwLMuoy2HKXRnwNYB/+
         NLDngBDSwBo1Yn9/x/JdEEVstC/snbH1kCLmNvWyDOha4BOLSwLOSrKpL2wHoIGD1isF
         RDFbXteASky2GESn+RQ+2Yfk9dMTO8/V61Ys7caAXPeatwjz/usGptV5+0rFytSSASpt
         ETUt++BE7EIDkQyVmZAePP2aK1uw7AUv+fJ21lqxNNcbw+1TncAJYniQi5BBVNdpQ5sY
         3OfFAEyoQQPPY66W5J3Vb9k0Yozfxi0FYQ2rKCsI83c8B2/SbYHJiGcq3puO2u9335D8
         oSVg==
X-Gm-Message-State: AOAM533ZtwwBQBeGAfqqM+Jqc0z8G2K20tJQ5lccBmR6QgUdgCLGuGjE
	V0xUoBrnnhz7RADcYJlo00IAi3Ahf0zmlQ==
X-Google-Smtp-Source: ABdhPJyvbzTmhR0U8SSLy6aviEb/eJJfOemyUKpQxPL+h2YoP2QYov2WNPdUouYLVKpubSMX34odHA==
X-Received: by 2002:a65:6487:: with SMTP id e7mr19879026pgv.27.1624825354508;
        Sun, 27 Jun 2021 13:22:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 18/20] python3-django: upgrade 3.2.2 -> 3.2.3
Date: Sun, 27 Jun 2021 13:22:13 -0700
Message-Id: <adf023f1921833d9aa23b262f8a6a8675768f599.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

3.2.3 is a bugfix release:

- Prepared for mysqlclient > 2.0.3 support (#32732).
- Fixed a regression in Django 3.2 that caused the incorrect
  filtering of querysets combined with the | operator (#32717).
- Fixed a regression in Django 3.2.1 where saving FileField
  would raise a SuspiciousFileOperation even when a custom
  upload_to returns a valid file path (#32718).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit bdf1be7c5511f3d19e4786b9f2bcad88dfb2a9e4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_3.2.2.bb => python3-django_3.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.2.bb => python3-django_3.2.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.2.bb b/meta-python/recipes-devtools/python/python3-django_3.2.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.3.bb
index 7deac2ca9b..7a9611ca12 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806f25f6b9752ce3d"
+SRC_URI[sha256sum] = "13ac78dbfd189532cad8f383a27e58e18b3d33f80009ceb476d7fcbfc5dcebd8"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1

