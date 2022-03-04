Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54252C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 20:03:10 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1139.1646424189199421189
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g41jrPep;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id bd1so8666688plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7Xw/EVLcfBTw/x7vQYBhQft3f8uOlSnpcY414WGpBw=;
        b=g41jrPepEppahVPc1z0XyOQ+rvE5KrD43oBZIKYIDnZO+u2QJdIbaCIqi8pONeYsPG
         cG3+hVvSAzuxf5K/JuoouY+CagPo8y6YJ9i1oe5EFREhz6l00ZvwY8THjmbgVumfS9fB
         /qFMzuPXo5c2a43+Ez8aJn+QpF8RBlCKToYdzhEapA9YF8WPugtB5TnRfuvcZZFeHzB0
         wkSzJtg9F0eVaQZm/YFug83+CPycDZQklk7ChGrKusPrg98Ino7L1kiuZ/Z76rz+kH77
         ZfQKpANWwOQHn34i3/LT4VQEVBFeg8YgTyJF1A4yY8JzvGmkIwyJPAMnBahbKnCTc5LS
         6Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7Xw/EVLcfBTw/x7vQYBhQft3f8uOlSnpcY414WGpBw=;
        b=w9Fz/q0ViSSYXsY7IX7j4vvQDE1zdEcfOaN0fzTsQMiPVSSFHxNsDeuyDSVyS5yReM
         HT50yyISbJB4hYbnKBB3oNmEME/I6/2p+Yh3jEIGMQ7HxQgaKr0+OBhrbek63LyvBk9Q
         +kMJEhprEcTJzIzDVtXMlijYUFe1AIOyvFqgz4+fw7u+SHtTOaDBp0kMJ7RFhe4TF5l8
         BPFb3dYlAKJJAv5wI1Lx/074TB4ZjAwuGbiInKvh2yO54XjowbJ2kpN9tlpiYwIVEC4z
         vrVvEwAqyQznngzXM43fHdgMwQ6L1XKu9YQ0xZGKtsFrn9r7Swxa+skIt0up6oZ9Q6ic
         8Zag==
X-Gm-Message-State: AOAM532mIwvnFRgZYWqTTCk45qN24B6CjrPXaNO87ZfNqKnQc6WOFj7a
	Ugj5i4CBMeIMaYbz6wzKR1ZTAHCs5SVasQ==
X-Google-Smtp-Source: 
 ABdhPJzoww7AMZ25ilEd8PQNkHCQvDFVgsRzDAOeZok6ZdT3CvveWnrGgLQzio9g/AiEF9mdrN0cRQ==
X-Received: by 2002:a17:902:8492:b0:14d:5ddc:9df6 with SMTP id
 c18-20020a170902849200b0014d5ddc9df6mr245489plo.15.1646424188511;
        Fri, 04 Mar 2022 12:03:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 s21-20020a056a00195500b004f65b15b3a0sm6624051pfk.8.2022.03.04.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:03:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] menulibre: Inherit setuptools3_legacy
Date: Fri,  4 Mar 2022 12:03:05 -0800
Message-Id: <20220304200305.2678538-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304200305.2678538-1-raj.khem@gmail.com>
References: <20220304200305.2678538-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 20:03:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95794

It does not yet build with new PEP-527 packaging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
index 898f6ed43a..65aa7a53e2 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
@@ -9,7 +9,7 @@ DEPENDS = " \
     intltool-native \
 "
 
-inherit distutils3 gtk-icon-cache features_check
+inherit setuptools3_legacy gtk-icon-cache features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/bluesabre/menulibre.git;protocol=https;branch=master"
-- 
2.35.1


