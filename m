Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.20718.1595724286480061049
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=BykrjDwF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id q7so13619410ljm.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8/WZBONg9TJfQ3yjaZ89sLZFsiR9g2qgMRefh/4uRHk=;
        b=BykrjDwF5cy5V6r/ajDzYB6TLyEIw5cFrYlmXo0Salsjp5iZU20YSK2fpkTbNDZGH0
         BVAPjlHKWwI3vnXoMfGyq4XiYBwjXr1ffkYCMTApZY0MBf18839waDH/f5Pz1fG5X2K0
         KgW0dq9ECQsdmZ1+PC4EpQNoBWx3EbEFMSALgOj0Ct71umt/e/YPOIBACyGCS7cUZr9x
         z3KtXeiulvaPqhXs7MrSC78LsE7pgOrbUVUif9IFmWi8IUf0MSIaulhGCnPv3h6hLuum
         CiRXnhCcR8lEdk/uVOfHLkV4wnHnEOeqmwIWltZTgtcf4Yg5HFJ1NIjqFcLRemHVkB6l
         Qi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8/WZBONg9TJfQ3yjaZ89sLZFsiR9g2qgMRefh/4uRHk=;
        b=FH36QHoLTf3Edg7XoiRACINzynrdwqgLlCzuiLR/Eprmm77u6drZAmHNcdqPosuoIU
         dJTSG84wf+BludpoJmvKFFxrpOsTDC9uNd5RlPg/iwsqBjTOBN0IPPQVXut8bnIlPmbB
         c6ir2EP3W8WGQ199RE1+ZnOP44ZGHOYYj2Byo0SjcQjVNW10+iQJ/ThoRo/s1RKLrblL
         aXCy3+3q8JPtSBaD6w7PSqzaS0yGMJ/UGvN/C+OIkMCs1Trr2BTAE+yWzadVzkU5H4Q5
         Jaj4nO9IwTQriFeOd50dbymLbN92NdymElW7ohvzDo1F2fpsWVAF3P4O8Xd7OUU/A7zs
         Se5g==
X-Gm-Message-State: AOAM531C46Y+lqOxll4DjuQ9F6VZ0fP3g33uf/AN/UqoEFxlEfL0VDKV
	UnW2kb7KqLGM51md3NcQfJ5BKTFUOeI=
X-Google-Smtp-Source: ABdhPJzaLhnuIVmHGuaUSUFdTlwaM5NMV6ZnAxEWaFnYkgkjSj7Voyzjqby5jcdh7GCM50EM68A9vg==
X-Received: by 2002:a2e:9208:: with SMTP id k8mr6598696ljg.461.1595724284250;
        Sat, 25 Jul 2020 17:44:44 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k25sm1430370ljk.87.2020.07.25.17.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:44:43 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libjcat: update to 0.1.3
Date: Sun, 26 Jul 2020 02:44:40 +0200
Message-Id: <20200726004440.3218218-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libjcat/{libjcat_0.1.2.bb => libjcat_0.1.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.2.bb => libjcat_0.1.3.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.3.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.3.bb
index 10f5a800bd..7ef2e5305f 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git \
     file://run-ptest \
 "
-SRCREV = "1a509ac60b7446254c3bd1f45ea53e6cffba30ac"
+SRCREV = "3c120a9132a36b100366cfe3d658ae31e6f4b7e9"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala
-- 
2.25.1

