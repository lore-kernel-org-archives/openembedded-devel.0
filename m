Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9A7E80A88
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:20:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.11357.1695792001163245124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4181462ebf0so38255391cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695792000; x=1696396800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOa+Or94QRpw03moeOyQumoNIeqzOVeCGi3AV9CLppw=;
        b=R4bPhmFuX81MrpzJtgH4E8MAHw2Q08MF90mLpC+m1rMAu/EYRDBGiCGgbZlOvy3SNm
         WVE+Rgm3dkdq/0suGT0fkaJTKIqefC/NG0b7mNRiZ1be8fIXudZMlPDttSeMMPXHqcfm
         nu/PT0/Sm7lsgrbJQUJ4tikqv5G9PufhCGIJd2gtt9aSkE1Lj7B4UmrrrMdQgQjD4bsG
         F3CM6mcg+pZB88qlf/z2EI5rf56fRW8hB55dDRZbAcp7/tW+N77EcftBUpYayqohe0P5
         K4R19HoGr8nNY6WHZBcATPD/NfxloCfXlFLqqcRovF46ciOOINSMRy0fZJk6vl1PIv1V
         dbQg==
X-Gm-Message-State: AOJu0YxZs27/GW135H60ijctf1FYet5z8s2c+qfGWy2BRGL5cCH39V9P
	U16RqhA0QmvY5YdGegTrbBl031tL35baXg==
X-Google-Smtp-Source: AGHT+IHZci0TWhNR0jzMYxfDOQEpNwzOkzJl8VZkxSOQtrguXN2SIHMTllBXWSomgdopg0Q9qTnurQ==
X-Received: by 2002:ac8:5a12:0:b0:418:1d1c:ee13 with SMTP id n18-20020ac85a12000000b004181d1cee13mr1105325qta.56.1695791999725;
        Tue, 26 Sep 2023 22:19:59 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cf9-20020a05622a400900b004179e79069asm793347qtb.21.2023.09.26.22.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:19:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cachecontrol: Fix upstream check by specifying the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
Date: Wed, 27 Sep 2023 05:19:51 +0000
Message-Id: <20230927051951.1695789-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105164

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-cachecontrol_0.13.1.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
index 535bac0e3..b4c90bcff 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
@@ -7,6 +7,9 @@ SRC_URI[sha256sum] = "f012366b79d2243a6118309ce73151bf52a38d4a5dac8ea57f09bd2908
 
 inherit pypi python_poetry_core
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/CacheControl/"
+UPSTREAM_CHECK_REGEX = "/CacheControl/(?P<pver>(\d+[\.\-_]*)+)"
+
 RDEPENDS:${PN} += "\
     python3-crypt \
     python3-datetime \
-- 
2.34.1


