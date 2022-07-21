Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBF7C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 17:21:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9119.1658424114344555252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GbaKSEue;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id z13so3186149wro.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSACCi+LNAxwRxx9ycSMPpT/QqxEtTOSKltvG+fHlVU=;
        b=GbaKSEuekSO5FRvREjNew4c207XeRP/CHXpkSGsXavOSldqJyBOUgxV6JK6m/eeQn5
         lxue4V8PZAyAI35J8oASW6n9VQp66h652ldXQ/RzWGiz+RN+jgg6CMQDPtgKYjE9o16Y
         zarcS1d5hB1nc73LIweJxRzFvVwyA+oXSLvK0VPBOKjzoiJhzYtjmVoVrA+8XKLEeC53
         OFy7y2GcIl0zjtHCEEqeViQtxeQpkTre8X/UVEUmjOVYsTEoqBCXVsVviIOyrjjPC/s9
         MQAAvypDyNBTxtbl/nZgb03CrjCh/gJCn/bE2tk9guT3eYDV1aSbqBfMa5S3a1dtVMlH
         CdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSACCi+LNAxwRxx9ycSMPpT/QqxEtTOSKltvG+fHlVU=;
        b=GKJOO+S/EupTAKOHh2r8wthLzu4EjUqnhLv93e6cZ2dys9mQAtMKHQ538wpKsUPjYN
         dT+0verKZaE2q0UFBOs1s4vzjfAnHAL4qXJXBhNqyGhG3OXVX7TzPF3U88PmrkFOwNod
         uES+3xEx6AKoKDuRKq/JSDe3pSdWZyB6cUL1hr5j+UucxBk/K95PRBkZ5YgFbiWJ+N9l
         T+dgJj6AuMjegiMnVKvf9o//j6QpIQdyBIQtExeTuf/dbfxDaZOyftCGpEAanE31MtX2
         12EqwboUw1qWNpZjM41D4lbRWz1hTHhSvcJCJGUID5yuOzYB69E9r6oUe6GFLTMrP4R5
         yRNA==
X-Gm-Message-State: AJIora86t8QLZH9zSZakMmGTSfVcrFU6TNKxJgWreUVegCk4H/43Kq6N
	zlhkxcp5jFN0vZx8YK7B9PbjW9fZOE8=
X-Google-Smtp-Source: 
 AGRyM1ut1Bylc/xi+7CLDX6od2ODlz1dM1oM8TrdUhNBjYL0hbK8i2vwls9rYIo6iAU9a9A6TfxDrw==
X-Received: by 2002:a5d:6d8b:0:b0:21d:a6ac:b34b with SMTP id
 l11-20020a5d6d8b000000b0021da6acb34bmr36135263wrs.35.1658424112435;
        Thu, 21 Jul 2022 10:21:52 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-109-113-162-128.net.vodafone.it.
 [109.113.162.128])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b003a32251c3f0sm2703047wmi.33.2022.07.21.10.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:21:51 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.34 -> 6.1.36
Date: Thu, 21 Jul 2022 19:21:49 +0200
Message-Id: <20220721172149.873383-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 17:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97921

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_6.1.34.bb => vboxguestdrivers_6.1.36.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.34.bb => vboxguestdrivers_6.1.36.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
index 5e0accb23..70ddb436a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[sha256sum] = "9c3ce1829432e5b8374f950698587038f45fb0492147dc200e59edb9bb75eb49"
+SRC_URI[sha256sum] = "e47942e42892c13c621869865e2b7b320340154f0fa74ecbdaf18fdaf70ef047"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


