Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CA5CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 17:30:02 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web10.159.1759512597576884580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 10:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBzzQ5z4;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-633bca5451cso2689599d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759512596; x=1760117396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI/EFsjXhJ08H6lcPA/VrPhRD2ZsGZIa9I8MsQHu4dA=;
        b=XBzzQ5z4QoTl5XhHaWLavaBsAojB07WZDORQYh9wNWHOGTj9ju3z28c9PY9M1QFiJy
         BkLGza1m1EPxf6C5xJbofl7bvaCX04YQ4mUcNBf72chBEFuVwIZQuSEfwkGwaiMTOL4H
         VvKiAS/ddgGY7O1Bw2c9rH76RUCwJh7gJx3qluwZ0oy3r1ahKmV3R+pwZXbst19eotdu
         LiUiUvOnsvBRsFSPvMCj9tI9W2rvymsG1sFgeZUXGYshkFDlcVIfQuN5uZkw+QiHEfTf
         yual2MTP4TU2OA6vbbKbQepxwu77MOmwjK1UXU+RFD1jULzjB8hFUpw8TpxNOWVvMoGp
         riqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512596; x=1760117396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI/EFsjXhJ08H6lcPA/VrPhRD2ZsGZIa9I8MsQHu4dA=;
        b=Cv8ZRMgTb4VWrU+zhZRVo4jop3/sPyhmZqvaN13whf3mrCTU6wDJwTJp4MUscCPslX
         mkv8FTY2PWlx8PKYqvc5/T2yFkDePvuYJ0kwua+eu9M8onuqv04EBWlxMlGODnANb0Db
         65tDD7sRJw9ZMZHR/wzVhPjSr+ulQpK2ym1vxsrDIm1r8ZBsaTIq2Z0FvOFOntDMVxwn
         y4ls/IbU5kDJ4YYyGqW2yNbkvuHlyhZflPhy1QzX2k+wwSus/d/txNmLNd9b406iM7UU
         qhq35CxXM7vTHmkHMmWj9KEpcuc7p7p71iVN2aHm1IhTSsoLr4K8TbLc9jzn3fl79rzm
         4Knw==
X-Gm-Message-State: AOJu0Yyu3Z1ICM46WbiQGbcSqkhr52hScHcEu77B0ug9vqK9lu+yXdsm
	/4PYlgzanZF+5L9Ie9IS95pbOAaffBCc835QbPp5mBjGl9NBrO+sOnG7wbJo4fFV
X-Gm-Gg: ASbGncuA5xXAABjBuyztDrPXgucnRzjdO2poHZ4WMT1oPrw/bKb/CeIDS0avLSwxL5n
	PLmozWtl+blOLtjuzq4sCk46pP43RS1GvIek05IlCsgfiNDfUDx4Fpwkc0bPXyehfQ122IQPpG1
	+BYeNwaLkMadzkWh8AsknZNflGBiJCK0daV8XoVTEYOevXWYDvR3Qq2Q9S7QWiptAquSdN4q9SU
	72IMriQnzT2dWXafO2dxoNnNQoooa9NFgqieuQ59DZUsKQOklHl514Hs1d7OW1nT+gxEfwNgFqg
	/fqmzfWG4KB4WGDVYqF/tFU86bGWzl1GBgH+jG8Gg453QQokAX+r+dTbtGiHJfTs7Gw6UW3JZsQ
	Xh8fe2tT0wLOU8kBbteZ/0hPMqu6QCuSKG1FXDaBJNxKa9tkFzOBOPokie6HlR6c=
X-Google-Smtp-Source: AGHT+IGT/s21zYavtDLPwJorLEfzyuLMcHTpbPrvcEMogDZ1WV/9pxz2ZXcR+4kVdrpVICxrE0LCSg==
X-Received: by 2002:a53:8613:0:b0:636:19c8:278e with SMTP id 956f58d0204a3-63b9a0776e5mr2825845d50.14.1759512596080;
        Fri, 03 Oct 2025 10:29:56 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846a7ab0sm1874678d50.25.2025.10.03.10.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:29:55 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] usbids: upgrade 2025.04.01 -> 2025.09.15
Date: Fri,  3 Oct 2025 13:29:38 -0400
Message-ID: <20251003172938.19123-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 17:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120222

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../usbids/{usbids_2025.04.01.bb => usbids_2025.09.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usbids/{usbids_2025.04.01.bb => usbids_2025.09.15.bb} (83%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
similarity index 83%
rename from meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
index aa884419f8..925a8ddda9 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-# April 1, 2025
-SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
+# September 15, 2025
+SRCREV = "18b3055a9819a341ac2ff957f0b92f564d0d5d6e"
 
 
 do_install() {
-- 
2.43.0


