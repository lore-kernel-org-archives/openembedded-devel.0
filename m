Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1480BC41535
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:24 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1852.1649188017108746056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dGel0ffu;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t13so273730pgn.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mirnXLH1fN34Ks5in3P2hcMCiBDpN+hK00y7Cw6qUrk=;
        b=dGel0ffuyWZ0i/dxUHa5NfrXimD8X7/ofdXarF2Hs1S1QenCCg2OHdQfCp5n95wIkn
         CVQeBH00lf085zqbL3ZqvDg8oPK9jueFiVv26lHkn+GY3txK1v9LVSx0KN1XRLsnqvff
         QCzTnXlFOZS5Db60bHflxbTMts8HxFuEtBrU2ZsRN96wKe+LN9GDBd6k7E8jq3X7TwOK
         zjg4ympkcoRcJQwJabToEZAEtXCAo71Ubr5ZLOi+QlfKJUUaHt7giiqs7HjSGg+nxAR0
         o0T+Y7Lqzbpx8lWrnH3M1mDpFPcojafgItTAXpGrgG14ixwP79H/KCLiJlaYR04eg7OQ
         ubCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mirnXLH1fN34Ks5in3P2hcMCiBDpN+hK00y7Cw6qUrk=;
        b=ARGDd6UFnhf5zZIPmnPWzaQ4yoSEV9o0f/5O2/qFznbO3LEuPXuU+zDpYmYbsIXYg8
         wDgHkFxBvpVgNZVbVm4tql7KdC78L1Ck2EIKqjB70bo+fA/OrrWvGVe7YtHjHo3odg2U
         YG8QhAccBq3Um7omz9hnMGMNhj33YeYGylvEuQuHO9DA3rISZu7seib37OJt4wyAagtG
         SIoLi9zUfWImJjVBj2N9KML+O2X9Zz5Kru7nkuE+nmcB0dx/H83I4LVtj1zZVRUEURe2
         Y7VWHupqT/IBrPOaOiMTXc7ouYibwC+igspPODQjnfJm8U76/upDPn5033bCAuFHB/oA
         NNlg==
X-Gm-Message-State: AOAM531tecMRVDnZYdbEsrXEmsxjJ2WpBvrJVCVOVR4giDc69XcOLqJL
	qpazyj9cJ7UbU3PtxBmAnH8z8DdT0IUlvg==
X-Google-Smtp-Source: 
 ABdhPJwidxuMY+uHyO/mjWG8IV+iw5cdSDCPvAtDWuan+ULNdmLw6YlJOlGizxDXCaDDvB9z6LOLiA==
X-Received: by 2002:a05:6a00:b51:b0:4fa:ece9:15e4 with SMTP id
 p17-20020a056a000b5100b004faece915e4mr5161007pfo.27.1649188022418;
        Tue, 05 Apr 2022 12:47:02 -0700 (PDT)
Received: from localhost.localdomain ([121.168.114.144])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb44e0cb17sm16821665pfw.116.2022.04.05.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 12:47:01 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [meta-oe][PATCH] multipath-tools: update SRC_URI
Date: Tue,  5 Apr 2022 19:46:42 +0000
Message-Id: <20220405194642.494-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 19:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96432

The git repo for multipath-tools was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index c0c4412c7..5a8db0877 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.17.1


