Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC90CCA480
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:55 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.2394.1654283979414392827
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kVsQ2oTH;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id c14so7890256pgu.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YITjDE4FRC/K+rIWtzkdxnu3NvdXuXhCzL2fuo+Iuc8=;
        b=kVsQ2oTHKsJWCIcGJ3pkpzbjpT77s69iRn6vgLXb+dqJ24n2IKur8cYRM5dpCPlFaz
         rsgBd8ZWxDSixhvPMP4lBkhP4d5t481Epq+0+bEuk+ze+TqNOz/ih49IZc2E5J3CYngx
         UjwMKGkIYrk66tGR3XUwKsEmPYj8y+vHRM9gkZLAu52QdPhHC1Op91qSH7VAtIgN9Vnl
         cDS4UwXnCu6cAOc9/xObuAyAEJ1DvDkRIrP/O1/XA5d/+JFp0lohX6ffBGdhrlGd5eCW
         /PkMJwFzIXWPLKK34UNEjushEOXiRGWeJfAGnnVCt1wSPONI90mgSfP8exh8VnbcDGFR
         fE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YITjDE4FRC/K+rIWtzkdxnu3NvdXuXhCzL2fuo+Iuc8=;
        b=ZUV2KUYmwlY9hAXpqeXVGT7vSMe+EaXnCPGzvFGtbsyMXwWO4tKLO54Fabbv/MyANn
         ysW1pea8fW2uteX7HIyZT/LzdKNyHO0oHCieAjrQZwsKEwhIKl/oHcwBOvhAKXWVY+/c
         e7u8zz6ThqvyE95z6KNrJxZb84ebMPdewIDL+6m+b3HywhLXr6abFbOE46JtJATeqCU8
         aJVFY+QI1Cdos5tdGF6OC+Yz3FciNtkZWbb1/2//+2a/edt2YQpg4H8+KFqr8KrrrbPW
         vsX12TL3HuW7dTyI4/wUeduubpMkMUX8XfPKZyfdnCfp9We3Vb2yOdo7Skl3WZ28g+hp
         Gugw==
X-Gm-Message-State: AOAM531f7V7vKNKgSiCFXuVyIw501WSy4OmEyVvpLV5Z1al50pV5TfzF
	ZyzDkBUJPqk1+fMQ8lW8D1wzXBwE8Y4=
X-Google-Smtp-Source: 
 ABdhPJy1y4n/R6Hl91VVT06yhf5S92fCeysGv2cYLH05/QlSS+f6UepBNm3hTHBZPCZ5KM3XIaNSnQ==
X-Received: by 2002:a65:6d89:0:b0:3fa:5523:440e with SMTP id
 bc9-20020a656d89000000b003fa5523440emr10290299pgb.318.1654283987388;
        Fri, 03 Jun 2022 12:19:47 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 18/20] python3-speedtest-cli: fix RDEPENDS
Date: Fri,  3 Jun 2022 12:17:17 -0700
Message-Id: 
 <17da928a8de487a8c7f7c41eb8db7f8f00aa1564.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97407

From: Bartosz Golaszewski <brgl@bgdev.pl>

There are packages missing in RDEPENDS needed to run speedtest-cli. Add
them and use += for the assignment as we don't know what inherited
classes may have added.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3413265185dd199da0f54ef6d83abca2c8ec9b50)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
index 06d98cbe1e..472113b059 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -7,4 +7,8 @@ SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d41
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-misc"
+RDEPENDS:${PN} += " \
+    python3-misc \
+    python3-threading \
+    python3-xml \
+"
-- 
2.25.1


