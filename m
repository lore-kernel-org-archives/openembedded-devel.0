Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1841C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.26011.1651346333251250450
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CQCAl6V1;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso13166320pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vZdNANg4RWBwhUxgNvFIrWggetKdjmMg3eUv3a2IEyY=;
        b=CQCAl6V1cw1YVXpO+igt+uDX5z6UCOA0eycnCTkKA5rjXkCdKzWhSHKz9CV9E3ua4+
         tGEzfR+qlPlajjYjT8UoDbhTZr4ZCKXtF9ocdRg5Gw74eqAvQ+s+WIli26nmickyknTT
         IENDgmDXUaDvcfxdD6DS27znvnDn3h5VVC34e+Z+tyn+IvKMjB+TGEbs3pTmmXZSSMwr
         niHATUy2IfU3R1xEMi5Rybv3jYQ6QRUD8XO1l6UZLe3sntR9Q5SbPNwQvNPXVVHoQgnD
         uxiZTO0Xtyee2T7WNrjC5QPkWlisSZm1k9pU9eb42ve3ulHaa0WHK+K7Cv1x+z6Kt3uM
         pQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZdNANg4RWBwhUxgNvFIrWggetKdjmMg3eUv3a2IEyY=;
        b=klbIY800fq5HVC4pAJRKXEPnrRtCxovxuyHKU/5srX5TUhTFIrbBRibEP/Xes86ENp
         n98F1iS275Ohm4dDvXL21PNXu/Je/lW/k0LtaI4C/GSWoFFA230AtWIOx+bC+6/Ibi9A
         UwCSjWuQiB7jVQ1L9cYD7UrSxT1oINDGzZ4hWd6anG6PmQI4gsfXGSBdSP2TEqJGoFsc
         h+YGyANmiKdqNALG8oeshDBNf9qGPYM7NIU0ULZxZJwGL6jk5DkqlmFc+SuUCPtWrIjr
         1YnkP9Q9j1usuLhlPzUNnVwg2P1aR7STsc/rOBXF/7i7b9y59+5bXDmt2pLgX2iGxAkO
         X24g==
X-Gm-Message-State: AOAM5323qoRELXeB3iOLCXJsEBH+nP87Oh+AUXNHm4lAbs53SPYyRGAb
	KLlUQnfRJ5quzleN74WFEeigA7dcWhgVaQ==
X-Google-Smtp-Source: 
 ABdhPJwo6pdNZH0K7HDWOdoZ5Th4iQInESC8kU3xvNjozN6K6Q1KY1XU5HiYVZXzesCX3ANH03T19Q==
X-Received: by 2002:a17:90b:4c88:b0:1d9:7158:876b with SMTP id
 my8-20020a17090b4c8800b001d97158876bmr5372570pjb.54.1651346332511;
        Sat, 30 Apr 2022 12:18:52 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 17/39] evince: upgrade 42.1 -> 42.2
Date: Sat, 30 Apr 2022 12:17:57 -0700
Message-Id: 
 <06c6d83a1878072a4e96b18ad6a284a8d806855d.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96884

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
comics:
  * Fix use-after-free (#1776)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4aa174ef75aa363d2ca6a45e433bbb51a5c53ef8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.1.bb b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/evince/evince_42.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_42.2.bb
index 2e22f2e703..af6d74c1a0 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "b24767bb3d5103b4e35b0e15cf033dbe2488f88700cdd882d22a43adeec2e80a"
+SRC_URI[archive.sha256sum] = "ff7f81f308cf8d4956ed97fb724a7e49448c214beeab998812ef9efbb38df8ae"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1


