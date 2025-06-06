Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78916C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:06:56 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.26326.1749182808498246702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PF9xu6PV;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso1605058276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182807; x=1749787607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGZfncbs/0zYWw6FQoOnfW4DDXC8VeQbkipYfP1WoQc=;
        b=PF9xu6PV7oxXlCQTIJXVzCBSpP7xkbSEhGvF2wPacjNiN/jZZmHVAiWgmQGY5qYolM
         /8tBhA6NKYOYzXifE47R5QMucnCDJM6oEUkEnQftbNjZfVodYj+pKZb13z0rsg71hEkN
         W7OCjtaBFB5p1yB5hQRDnukLwf5kOMAUtagbrw6DjZH5CK2qyW2uH4dmVxzveFkmUwEb
         VnQbsLn6woLBy5NYiQACaM7tQcKlcsz3hTCMNcqs4BKSuNKoal9l5Na0nEo+gdm8ArFU
         ss9OEDcyKgotF5qPh0YYbGUWPy5t8BIyPdx1q6IoxiPQQbmzn2c9I6z1jpuOfPbkf5EZ
         A74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182807; x=1749787607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGZfncbs/0zYWw6FQoOnfW4DDXC8VeQbkipYfP1WoQc=;
        b=vSyFAAKf4fiVbJfWOJACEe/CiZOtt1WYspjvHHYTUQa4rklzeJhdO84OMN+4os7FXM
         ReUtdhuE5pRkbnsrbT08rXvtDtr6TDcJNXD8faKGL1IuGaJD4UaMXrGaUjbVe+hyCo2U
         k5d9mr1nOklhhuDIfrJhV05k7xkTjuzTGletyzu5rvGVedeIWXkKi4t3jEdIGzq9xOdY
         QeyrReoYLgFl6kPkkbTuv/HzEVB/30iJl4SNwvnv/AgHuW2+W7sUUURto0GNU+LSknqy
         ieh0VlI4NX+OLwUml1riVvMleuiaKayTsWI43pp98u7+n/Z+tLhxE7yO6ww1viNfXQw1
         /0Qg==
X-Gm-Message-State: AOJu0YzG9g0/kB+lkbEM2y61+CmH2vbHck8vd0h2f37xLntpB7vZTRb7
	6jAGv21RThKXT6//Pj9awGo0wDTqgarl4Vz0Q4vMbl/WRxg/OFGY9SWzW65Qeo77
X-Gm-Gg: ASbGncvBRagqidGHAX5bWh4NE+cmfhin/DsERam026b0CZLw7cnJxX5+Tp19xLZS/cb
	yQ6MuTQ2/q+qZH0aRQsxnqnJWnhXBBdF5VPh+8ZCOCX6tA7CR7Ze6e+81H4x+SCj/Umogt50M0A
	xUhUWxOJyY/Xs8gro87qczCmPAK/gvaYCUShW702xMXCuCt74gcKAtYyHW1tYGVgBvis4fCtE20
	ovU50rfQ0hNfFdZ3xYPvZ0bD0AXacgosHJQ1yflQ+b/JAFcWo42OP455nIx7DrRQoQWnHxzbGyt
	81ZATMt3UrVmhkR6mYSIf6Aevmyzrf/C8b790AGyqQsUHDCBZ+r8GIlKJd+4m5Cix6hY71m75bz
	8QFPiyr67ug==
X-Google-Smtp-Source: AGHT+IGDBs4XogTy5YCR/QgPzKxvY5sEhbvmJ+DlB4ONROt1D0VHUO41GzO8lN8Hl0me63YS2UJP0g==
X-Received: by 2002:a05:6902:6c11:b0:e81:abdb:600c with SMTP id 3f1490d57ef6-e81abdb6343mr619541276.19.1749182807102;
        Thu, 05 Jun 2025 21:06:47 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:06:46 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/6] xfce4-clipman-plugin: upgrade 1.6.2 -> 1.6.3
Date: Fri,  6 Jun 2025 00:06:00 -0400
Message-ID: <20250606040603.2410505-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606040603.2410505-1-schonm@gmail.com>
References: <20250606040603.2410505-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117756

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags/xfce4-clipman-plugin-1.6.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-clipman-plugin_1.6.2.bb => xfce4-clipman-plugin_1.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.6.2.bb => xfce4-clipman-plugin_1.6.3.bb} (83%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb
similarity index 83%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb
index 59fb8578c1..e1eed88098 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb
@@ -8,7 +8,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[sha256sum] = "ab8a5fe6f68fb1789190e498243a1d1385de3f64e984f470cbd3d1eb779399b8"
+SRC_URI[sha256sum] = "e11c1f976217fc959cee98ecfb934058ae485cb363d2c25c7ddede44394c9a10"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.43.0


