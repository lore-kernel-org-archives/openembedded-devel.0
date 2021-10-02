Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A65EC433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 10:21:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9217.1633170066122149532
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 03:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fMaQ+ScI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m22so14084138wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cOgInH2gpYzHbCxtNfxOTteV/n4HEHs0U568rGp7nWs=;
        b=fMaQ+ScI6uaSfG2R1nava6PNJN48uTCTqy/E8Nc7gZcjhjHLKOmoAIZeuX9VpjbDw+
         xQMo9N9x/n3F0e+zi/A721gsa+93W/7xlgDqEAv1UQiwArzL0KF7BRorp9TiyWM5qFlN
         C96ZmyLlp5TaFGHmgjsXM6djydYmkb9HFyDLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cOgInH2gpYzHbCxtNfxOTteV/n4HEHs0U568rGp7nWs=;
        b=B5N74a2FcG436vI7Mly5u6iG0c2Ki8b4u+txbxQhMqAqbMixesQQnTeYRv4WpSE7Cc
         5DeH2Jq/WT6UYzPr/29/eQ2SdHjUapVYWzSwY9dmVkDIuSUgw3Z5vKsfovM+ykXhKDXi
         RfbZHEZTS2P2ClVFdqbl7gy6leeNwJtoKdOonDGFhHfkKLQNG8eKJjxltEnnRgspy5R8
         M1uc7tPs29dktpu3jw8l2XOUZTeX5WW2vqLMOnHQ172NdFXJACcZK+w5kff3qp01uMih
         Wge38iKRUViq8TNJAS6dUDenvtrQel3WHqhdzT6R+WVueXe6z/PSA/A0zEHcWS5u/9Zo
         HP7g==
X-Gm-Message-State: AOAM533NVQDo7sgtICk2GqWR/EINHyReEXTtOxkbh+B+9E1JtvhhOC/m
	uffvUFXuV1SX2ps9c1YOsK8DhsQu+BReC1r1
X-Google-Smtp-Source: 
 ABdhPJztvasqR1D3tfXmb/isZcBkwA7vDv8Cy9+M33z+tSaQIBMyDXbKRLc6Yqvav9xIAdxAxla9VQ==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr2747781wrm.341.1633170064369;
        Sat, 02 Oct 2021 03:21:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bdad:e899:5209:16be])
        by smtp.gmail.com with ESMTPSA id
 l26sm10177937wmi.25.2021.10.02.03.21.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 03:21:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-XXX] [PATCH] gattlib: Place pkgconfig file in correct package
Date: Sat,  2 Oct 2021 11:21:03 +0100
Message-Id: <20211002102103.2268157-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Oct 2021 10:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93189

Fixes in OE-Core added some pkgconfig dependencies back and this flagged
that the .pc file was in ${PN}, not ${PN}-dev. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 234f840f9..8485013ba 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 inherit pkgconfig cmake
 
 FILES:${PN} = "${libdir}/*"
-FILES:${PN}-dev = "${includedir}/*"
+FILES:${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
-- 
2.32.0


