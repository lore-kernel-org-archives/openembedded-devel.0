Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.14814.1599905060906501455
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 03:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UjItW7nR;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lo4so16684122ejb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z819fDgmb4AFevid1bu14xPbG8pdP7sVsiiFHPMamKE=;
        b=UjItW7nRxE0Ua/IZSaSeOzG8IaTpnKOp+q7QDfjC2p6P5Sbjf+7EeNDQKgkrOwwwj4
         VttC0Q20dv/0HBM8tx9I0olQn0QQbZoesvv0jLg0VKNrMOXrZF6KIUfbLAF/CWHVQ74I
         sHPVFbrA+n7KsjkBx9oKdu4Q2M/JV2IEcAXPEeZOYpYgF1JvYaOpUB+d0COY/+gzL2td
         hYp0zSwmz0ansPg24vWIg6sRnsf2wCHmsH2mLlEJQj1B2MhySaPVlqmsd+/FPINpyFtv
         UxEUe76w7uEzJY2AKGP4PPqoU2IPEuA5mH/AUKv5wAQWLpr/CatSeXo+F2M+0/k/KW7K
         AqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z819fDgmb4AFevid1bu14xPbG8pdP7sVsiiFHPMamKE=;
        b=i3EH/YWsQ9r0RHdt6WfIMM2jB1tv5Tiknhs9q3A/ar8ToR0GU08E3THeDKMmoVFjYt
         KJEdCBC+kianylKkvF+agbf9Pq7j7zlYFB0ZYU6PCAgXymydlLnPvRMijE233LCGH5Pp
         AgjL67kxwavS0ZTO8WJHFy8ZtCGRCQuVSoVy57P7bPQJ+q4nKQlyA0mdXmH9YBgLeGYr
         GRa5VdMZgvLZAftv70aZ4FmR1SSdUC+0mS4OVt8Iwbt7jauB3mxc0qM/+R4vTvGLkOz5
         7lEUlzx5QAXbM48avkaXVR1aOK6E2DYugPqIUoYpxWa/zY9gIDcHS5QZI/TOMqC0BNzH
         cjBw==
X-Gm-Message-State: AOAM533BwATvd3fn48261b+4voAECiTGUxhxrCX8emlF5M+BJyKyUwVs
	t+0DGc8mSs9QQetfpy6uwtg4SoOcN5Y=
X-Google-Smtp-Source: ABdhPJyVKUcxUjzOTjYMkk4GpyDDpGYEkF+tcj8nlyroWDjsdttNNEEP2ekoWzEEukIWGtG+xE780g==
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr5748197ejq.204.1599905059014;
        Sat, 12 Sep 2020 03:04:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n4sm2927060ejj.19.2020.09.12.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:04:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] st: add x11 to REQUIRED_DISTRO_FEATURES to suck less
Date: Sat, 12 Sep 2020 11:44:26 +0200
Message-Id: <20200912094427.3904-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* errors like:
  ERROR: Nothing PROVIDES 'libx11' (but meta-openembedded/meta-oe/recipes-graphics/suckless/st_0.8.4.bb DEPENDS on or otherwise requires it)
  ERROR: Nothing PROVIDES 'libxft' (but meta-openembedded/meta-oe/recipes-graphics/suckless/st_0.8.4.bb DEPENDS on or otherwise requires it)
  ERROR: Nothing RPROVIDES 'st' (but meta-openembedded/meta-oe/recipes-graphics/suckless/st_0.8.4.bb RDEPENDS on or otherwise requires it)
  ERROR: Nothing RPROVIDES 'libx11-locale' (but meta-openembedded/meta-oe/recipes-graphics/suckless/st_0.8.4.bb RDEPENDS on or otherwise requires it)
  ERROR: Nothing RPROVIDES 'st-dev' (but meta-openembedded/meta-oe/recipes-graphics/suckless/st_0.8.4.bb RDEPENDS on or otherwise requires it)
  in bitbake world suck

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
index 1f4961cb20..7d859e1478 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
@@ -5,7 +5,9 @@ SRC_URI = " \
  http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
 "
 
-inherit pkgconfig
+inherit pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[sha256sum] = "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
 
-- 
2.25.1

