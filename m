Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1C6C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:28:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.10244.1634387307910343598
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bS9DwXlN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id i24so52775639lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nhG5AXHRnGTOSmXUnr+NKKlOw5TCfcHgMhgR9W6Inrc=;
        b=bS9DwXlNUl/n+3c4pnA6xvDF3LbyK7jYk21wzKVTb1hE4+rYA9/klXAlXXGJspwqb2
         0eJVFgMIq55bIoC2tjbNV7stUzWI39puefHbs9mPj0BGDid0ikh7vQFmkc2C152nKNHw
         NKlArUORGdJG0JTuFDtAXO3NvgNcRgncubu5c9ZyojLJXEAsIregaXs2A22TuVAj6zI8
         XViUET7hDyY1Qq5zQdE9ZtExOsd+i8qlDgQreLwe872LNnTVIEqDzoVofeb0mSR/Ctph
         SZnEm2op/eRzpF7hEAPnPr9S37Qd561CeBpGHN9ZjvRzYB6fdnBlVhQ3QsR7mxewoTfh
         WJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nhG5AXHRnGTOSmXUnr+NKKlOw5TCfcHgMhgR9W6Inrc=;
        b=Vxi5mTd25+Gtta+S4uX/sZuqudE0F1zFZEGHAq/tzhr0xf5l54YmDjsswKa2EnpEoi
         k6sU0p0KeD0XytNkaIA33becTWBrPQ4XAsPZEPnd9RobFE7GVVoe1CzLDHpBs+p+O/7i
         uv4ukaLwG8sSGLI8UHkKxlivDfP34CO4anYQDlr8uehRVI2+51zakyYBFIFQaiOYgylT
         pk3XrIqXY/ShwMTcE3WylHLm+N6s5GcDkgiQATm2DbeZ6bVWPgBSIuSt5K3Z7dhFLLls
         j1PZEF0mN0tt1Z4sZbRWFZVxk+BBYba9TcMTA46wnbfCGynI1rqCRBeRsC8hhvoBmmcY
         LOxg==
X-Gm-Message-State: AOAM531+IzA28OW44y9REP7l0zVKN8/fnhtjoSP/ayFeFhM16mea7NJI
	vrNn4ubsqnMr9/7z7a4RzzRZtEpvTD7LPXmY
X-Google-Smtp-Source: 
 ABdhPJzHQ0KiUqGOV/QzJFNX+x8tMizFIhtKiNwdcbjN/HVeCAhEHUzK0ZY1m63JfhhwBzmG4px6fA==
X-Received: by 2002:a2e:a7c5:: with SMTP id x5mr19484325ljp.49.1634387305511;
        Sat, 16 Oct 2021 05:28:25 -0700 (PDT)
Received: from localhost.localdomain ([78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b15sm974285ljp.54.2021.10.16.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 05:28:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] opensaf: update to 5.21.09
Date: Sat, 16 Oct 2021 14:28:08 +0200
Message-Id: <20211016122808.3564498-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93392

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../opensaf/{opensaf_5.21.06.bb => opensaf_5.21.09.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.21.06.bb => opensaf_5.21.09.bb} (96%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
similarity index 96%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
index caa85e040..6c8a48179 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.06.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
@@ -29,8 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
-SRC_URI[md5sum] = "a60775787ba520a0b1031fcd42e0d65b"
-SRC_URI[sha256sum] = "d29d124506e4b084285d27c8742c7bca66de80be6a0ba9de8e37835ccaa8ee57"
+SRC_URI[sha256sum] = "227ae1dafb6d51ce6561c9fcaec60087a0183839a8a4da11517e09f2a662b53d"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1


