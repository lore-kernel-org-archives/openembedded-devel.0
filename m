Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.26022.1600976574580341500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xa+gVJ2w;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d9so427167pfd.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fVu3+NU4DQckN4sca8C2N0kb+KB9Ya89Iw96dtUbJw=;
        b=Xa+gVJ2wSGQV36xsy6HBnPMOMxpwEZeWNI+iUVgjfHq1GzOubHiYfH4B6S8Mn9NuCK
         WldVPQ2oTWuXqg4IWJ8SSkbeBJBN2ac9zvRH2I08WDbDE+HBoceYs2PrZcU+MM4WE94Q
         UsnHQaiSsdVXSxK1k6yAE/9hI9vnjP0lymYyvHeQ2kFgP6hTrMQNgspfnuPIcybm3/71
         d4zORRFhQafHlnGA4wK3WSR1onUVglmfwGe/+cF8JGE8/JPznijbPf497Ez54/Xc0V54
         j13vnEXNg16/eiTVGi9sqChgdEfKm8mQz8eq15wg6zN4UkIjPWEdT79ylYpKrPlxLZXp
         6WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fVu3+NU4DQckN4sca8C2N0kb+KB9Ya89Iw96dtUbJw=;
        b=jUQ5Bbii/fMR4+ujrUqx+zuEcEl1Qr6Dtc+ioUYKNS1yMkHUVjgjGM4+bCCV5rUb5p
         hqBMD8lChal2yiRkn4e8aWKC2TVHT5TyGZd2CFiT4CxIi0SJkoghyyGSllnxDN/0RCl9
         wmMTmm0TA/YLqGL/9r4ZrYlIv8pSxYfFp5shsEWtc32nMFUaU13R8BtHSZs4iYPNigCz
         Ok5/FnmbBJZKjI61TnE0Y/ZpcMlI6zU9KACmjM5DUkFdGkYKHFPEntYcX74kDRseM5th
         0LFhkeZr2RewH14BvLdKOoQjigYzzP5MINavxANX4Ba680XM5EMZPLJoxp6C+KChilCS
         XvvQ==
X-Gm-Message-State: AOAM533o6hAmhLkZ7xC+TZvIuYDrgtgqXiOTBE1wqjh7mlO+qRPAivVN
	INVuszZ1vMseHFVjs73cHhEUMXuafk0MQg==
X-Google-Smtp-Source: ABdhPJxyk18tJrS4rYOUDJtQuTmYAw8ChAd9npf5DnEKLqXYLSd1yOwfJP/I+Vs52E/NXomzhkw3Ow==
X-Received: by 2002:a62:cfc5:0:b029:13e:d13d:a083 with SMTP id b188-20020a62cfc50000b029013ed13da083mr734858pfg.26.1600976573686;
        Thu, 24 Sep 2020 12:42:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5470])
        by smtp.gmail.com with ESMTPSA id i16sm292209pjv.0.2020.09.24.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 12:42:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Todd Cunningham <todd.cunningham@opengear.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] firewalld: upgrade 0.8.3 -> 0.9.0
Date: Thu, 24 Sep 2020 12:42:50 -0700
Message-Id: <20200924194250.2953291-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Todd Cunningham <todd.cunningham@opengear.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../firewalld/{firewalld_0.8.3.bb => firewalld_0.9.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.8.3.bb => firewalld_0.9.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
index ddf5ff88ee..7e03b7fde0 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[sha256sum] = "4ecb16d82c2825ccfb8f109e543c0492cf6ea8c43e2d0f59901bddcead037dc6"
+SRC_URI[sha256sum] = "7cfbf8a33f726151e60c07486af0921fa05cbbab097adf90ec1caef37b49d9a0"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native"
-- 
2.28.0

