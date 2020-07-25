Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7452.1595673302605794177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=X9qVKMyW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id b11so6507853lfe.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2u/HkPIv4kbQ8vZxT+XJHqzhY88JrzX3BevfYI0kNA=;
        b=X9qVKMyWr+I/TGbA/+avrdn4/RSULcnqtbre7qLvSc/mDL8uxJGQr3QHaAlfTmVIg6
         MHDVlI+OXaNwjnjrPZOfWL3B0UbYhIBWxU66gHVY8tZ0ovt1x7EU+2NW9HB3w445Ne2U
         +8RT0qhTz1ZKqd7y+B1Q0VTKXClZl/WIy8zTXPpEnR+ZzEK4AKQC7uGvW6OUKt3syag/
         N6xQ0/ZRMtpgW5H7sEBA3Oi1vfTQT1tp3Feid3SfOU1LfOHuQOVQ5yIlE1QB+qtCSk7/
         4HhlBYATSucZdmpcgFJ8jLovJNADWAfdrUZLu7XjoMpp8sMcUqHv7Hphqjg1Y954t4CR
         hANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2u/HkPIv4kbQ8vZxT+XJHqzhY88JrzX3BevfYI0kNA=;
        b=lmeX65TvAemdpBOKobRu6sqroiElkbbE2vkBUJKa3xCiTT8Y1jCBXZRyb94Pe88XiN
         vF/RtBilveXAhe06dSJzcudjStMHF3rXUVXwHwZl7QoQ/ReqCiUp+C/uIkpzgS8kdeML
         K+68GTzdoQgd4F2CrpIMC5T4j5YGfpbfJCP6YOcw5eHuI58HUWEmQZT2hK1042sAC1E2
         TOivdm8COnulAOPmUoVDWSOXMCcMdpfclt/Oi1rM5/v/MlOmgswxnCDUkhwhgmafrLra
         GdjtmwgUhWN052xfQjGluaaqtVYlaTszr7bJG0IuNvd2OBKYVm8gv4ri3ABgr0597qHJ
         DGmA==
X-Gm-Message-State: AOAM533fjPuoalTjaDFY5AQ2nx6wMqvmk7gLaRtPnvAhMNQzVnWbEhBn
	GN33guq/XMgrOiZ2v7oEWY88zh8rYH8=
X-Google-Smtp-Source: ABdhPJymvBeUiILTkLwAZzwqappVldgfsR2ZSRjjNlpEtg28W9ErwLXrROru/z87k68mNd8mB6BzCA==
X-Received: by 2002:ac2:4d31:: with SMTP id h17mr6970468lfk.144.1595673300404;
        Sat, 25 Jul 2020 03:35:00 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b18sm1325859lfp.36.2020.07.25.03.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:34:59 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 4/4] usbmuxd: update to 1.1.1
Date: Sat, 25 Jul 2020 12:34:47 +0200
Message-Id: <20200725103447.2109015-4-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
References: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../usbmuxd/{usbmuxd_git.bb => usbmuxd_1.1.1.bb}               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/usbmuxd/{usbmuxd_git.bb => usbmuxd_1.1.1.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
rename to meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
index 7284234326..3860fd8b99 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+HOMEPAGE = "https://github.com/libimobiledevice/usbmuxd"
 LICENSE = "GPLv3 & GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504"
@@ -9,7 +10,7 @@ inherit autotools pkgconfig gitpkgv systemd
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "ee85938c21043ef5f7cd4dfbc7677f385814d4d8"
+SRCREV = "79c8b38d1488a6b07e1e68f39d8caec3f1a45622"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

