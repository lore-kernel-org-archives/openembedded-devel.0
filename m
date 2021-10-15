Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD7FC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:26 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4277.1634338585091999764
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=zK/BHjmb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id x27so47360811lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eNSXnCSu+XQa2M2j6ciULdUk3k5vj/uBiNCgzgBIlJU=;
        b=zK/BHjmb+zJzcRwJ+0J1/53IDvQbmJZS2fXEczXRuvhhFVTiq4XpNIde+Y109o4hcG
         UL+V+ESR3Sv0uM9Tsi2YwR2K4ZuzSteaccmwL7VVgtd1gB/FF8lLP4hSCvbWXb6KC6Nn
         1tKkttBxfRrsQgah1EW+3/WZBwC0rmCpIxlUkw2LJRVC/tBRSbbCiCO5kcn0ruPTNhSM
         6Ph4Vsf6nmShhF/YVw3Cf3QMzw0SXqR0oV77E09eygO76JAJwOgrMMvUDvk55jbuaamV
         KBS4EWkDDpCAm3lIk9vBvhjmFg37rzvRkvUkTbRUyfePOUlFRwtWSIyyVbDz/5M6j8te
         kLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eNSXnCSu+XQa2M2j6ciULdUk3k5vj/uBiNCgzgBIlJU=;
        b=gQAX0vkKZQlP3fdwty6uPevMrSm05iDqSkPkB2Nquu6sKGksJkRgv8sbnkTz5KtjQ1
         eIp/j6lH+RAaUYSV6w+6012ckVRTNVQTknTa52AuuIFJyaS7JHkgx534ZjmDakHo2alZ
         pYCpw0cTD/h4snUlO3Vz684C8tr7Mk3kJGSAn6LUG3HsQecFyaRcgahSRGTYmOYG+BEa
         xYjCuzU9K7RjomV+dm1WsaIxvNvHlIlrVZx/Rey6o6lIu0qgizQZe+KpXMesTEqaFJkC
         2wFpwjy8y1v4DRX8q6qe0qK/ugRx0NuovJctfnI1H3mOLVK/VD4NjLR9RfHtF6okh+El
         87Ow==
X-Gm-Message-State: AOAM532B9KOKq3eKzJIKfF16YF8vbug7y7vk9v+VzPQwdmiesaqzsKy3
	+P6jm+R8lbMtMvO9Goi87HjijRvueuNa8A5e
X-Google-Smtp-Source: 
 ABdhPJw5Jyxv6Ghffd6wmE12qliVV46EnjN2eQ/VsIZC+MFyA/4ypMAdahgWGBFkZ/FdDs85bnbVJA==
X-Received: by 2002:a2e:b88f:: with SMTP id
 r15mr15621816ljp.388.1634338583157;
        Fri, 15 Oct 2021 15:56:23 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t81sm651452lff.228.2021.10.15.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyatspi: update to 2.38.1
Date: Sat, 16 Oct 2021 00:56:21 +0200
Message-Id: <20211015225621.4162756-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93356

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
index 1368b923d..bfccd73ac 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
 SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=mainline"
-SRCREV = "cc99d68db66174f4499b9b325bc788393b972edd"
+SRCREV = "6d5f47ee8e8a36140b52bf52fe954a131a0aa5dd"
 S = "${WORKDIR}/git" 
 
 # Same restriction as gtk+
-- 
2.25.1


