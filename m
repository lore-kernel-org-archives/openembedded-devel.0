Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30060C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:45:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.2864.1642571137399987068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 21:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mdulK4ay;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c66so402925pfc.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 21:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fds6lIXEKg6kEQmUuCv6sUKajz3ikYDbo+twL1HfRSE=;
        b=mdulK4ayVqFh7HTeaG39or/3Ym+VYhjvMrU5U4eOd5KakpmusP2PB6G9xhFLUu2iw+
         XJlU2WpsmeQTbqL/W2UiOWAkw3y6bW9HSl+Eu5lASsL6nbe/Pw5Swq10022KWPPOuX9x
         reuoyWX6ONMwpk2KDu20KLxQcmJmkh0nwDfFFZ9F/66QThq+qss0Jd6MzPlBX1ks+0HF
         XBdsGnqJh9n43t19ndHDOcoqcGVkpDxvdob/ANSj+B3tt0qm1XGf8fUjse/adRVk4TWh
         CuIwXlCyXZ1Pv8oSgwVb4EOsvsREnKOksgDZoXLqQ+djflOL0+zFd1jphXUBIOHvIJwn
         Tx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fds6lIXEKg6kEQmUuCv6sUKajz3ikYDbo+twL1HfRSE=;
        b=OdVgc6idBiGrQkoLMYbkhNNvToHa9j9Gi4YsZoGgt1VQrVirvguqEqnmZCGaRkFULI
         NMYjIix5DRzBK0ZRNCmh5XcEjJVP14eRMeGgd6EToINqxJgpl6r2ORVreJnoFybg+S8V
         6oJV4C7eXESlF1aF7fHIpNeUP4agG97C/P7q055Rkm7BL9jn2r+yjNf3PNaKvHVR9xt+
         /Ad5ohhZuhEXrsJYwKPeGhSHIGxfIToB84YujhkNmGkV8N1ZWbRNQmSnCmu8i8Ef3tYI
         mQi4/grmXL1LeWF5XSXkm1JYOPK/AlOUCX5nZAYyjEMojNAzMUJlCj/CYjNR8NvVvMrK
         TAAw==
X-Gm-Message-State: AOAM531hfraFzsrKEBKADZWR9aEZu7MrLgUa+g6PC8QLuj6p40DTV8AK
	HhueTpoiZOwVdJheckzBRbuzmW7J5eD6qw==
X-Google-Smtp-Source: 
 ABdhPJzul+7cK7wTULo1ef6mE20ztIu749AFLN6BZHblLgJFc1B6jNjG85WlK3mRtsB72vvtiCRSxQ==
X-Received: by 2002:a63:905:: with SMTP id 5mr26395848pgj.485.1642571136441;
        Tue, 18 Jan 2022 21:45:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 i125sm11850460pfg.216.2022.01.18.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 21:45:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] meta-xfce: Convert catfish and menulibre to use
 setuptools3
Date: Tue, 18 Jan 2022 21:45:33 -0800
Message-Id: <20220119054533.1603120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 05:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94935

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb    | 2 +-
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index cadbdf14ca..bf3d7ed979 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -3,7 +3,7 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-inherit xfce-app distutils3 gtk-icon-cache mime-xdg
+inherit xfce-app setuptools3 gtk-icon-cache mime-xdg
 
 DEPENDS += "python3-distutils-extra-native"
 
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
index 4aa50d50b2..3d0e55d360 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
@@ -9,7 +9,7 @@ DEPENDS = " \
     intltool-native \
 "
 
-inherit distutils3 gtk-icon-cache features_check
+inherit setuptools3 gtk-icon-cache features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.34.1


