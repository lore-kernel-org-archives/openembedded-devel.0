Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBA5C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 23:38:36 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.29348.1634513915979743884
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EMXPs308;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id c29so13329409pfp.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=smXZQVtBzgZoQ/Lc/e2l5pHlzapzSBaKr2SRCTyS6Q8=;
        b=EMXPs308gOe+G6cZJGwf/mqA3j9tnELodgUE0PSR4n2XMSmlII/CUp1Aj5DxSuE1dt
         7ePtux1AVokEsIHkLi96LX/PD5g3iwR4RA+wFz7Rsu/e1lPtSHe95Bjz4zu0KaFf525k
         S6IbqJ3B1wWL3wbMQhJPiTU51JNaWalY417qPmboLMrvQjG9P68kD7hx0H+4deVgFs8E
         ZClXva8hgkod8ExaGVBkIHTrTQjgVrFLynnYHCWCZvSE0KRtS/hRhA1gCRXCoba2Tdo4
         sy7OEmaE/9hNLZzC9Wo2CApaUCNQINY8dmXIWm4XHBPFIvynH5o3jWp58KIZAoXSr6Ad
         jqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=smXZQVtBzgZoQ/Lc/e2l5pHlzapzSBaKr2SRCTyS6Q8=;
        b=QIU+xDglj7ykTqFcJszj3ZWIn+ZMID29GoRetArcW2JE7xkUsmra5zslk3m5kltTby
         ZBKebH3dA/5oqEaxqaBsiauNQS91NaMngisK8jsfX8NcpaI9Em9WoaGAO6ytd+7POU6F
         O7ULhNZYxEK6zO0shh55rcHF/u3Wu3mPaPojAttyTG7MP9wpAIZNtOt/bdqW6pZ+f4X/
         pwmR2sm56moMTpW2tkqIh8K4FMi3QpAC83sQj37yShSaNCx+lPlDGyrRqgdV0vYplVo9
         2RF2suLcPL24ALw8tXXWNUckR80Q/H1fTJgxIWxiwS5wEDzDnEw9jYjcFzFsnBkpykeu
         dztQ==
X-Gm-Message-State: AOAM530IeTr6pkhJyJkz2sSvNi1745po0FU3RNonn/noCJhLQHx2RH1Q
	9IAEXiK3MZ1YKdsongAEmYYJgp9xE8O8EA==
X-Google-Smtp-Source: 
 ABdhPJxaroluwO/TsCyDkd6pV/yFuYvsHr6kUdUWYvgJ9wdInyc1mwFf2BhUUmsGNmtVY3HYXcTGtw==
X-Received: by 2002:a63:f241:: with SMTP id d1mr19727479pgk.74.1634513915275;
        Sun, 17 Oct 2021 16:38:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 z12sm14229409pjh.51.2021.10.17.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 16:38:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xrdp: Exclude from builds
Date: Sun, 17 Oct 2021 16:38:32 -0700
Message-Id: <20211017233832.2414409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 23:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93415

Needs work to compile with openssl 3.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb                | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1b293a5aaa..188677f5f5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -908,7 +908,7 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     nano \
     xdg-user-dirs \
     xmlsec1 \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp", "", d)} \
     usb-modeswitch-data \
     usb-modeswitch \
     liburing \
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
index 0a643825ee..e933c6679f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.17.bb
@@ -92,3 +92,4 @@ pkg_postinst:${PN}() {
 		fi
         fi
 }
+PNBLACKLIST[xrdp] ?= "Needs porting to openssl 3.x"
-- 
2.33.1


