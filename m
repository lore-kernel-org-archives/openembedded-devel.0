Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9A9C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:09:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.184.1635862165594160613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oTWpYzCV;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id y1so16354321plk.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aBQ3Ak8ZaB6vj0bI3QQGfZERSYbINJWNgMX0qFpJoYo=;
        b=oTWpYzCVNtEOc0M0v/C/mPZrYot9FaiDuFut2vhm1Hjg4XqTdUMAz2cTlVXR0rUIVH
         pfSIPEB8sJltVqKsV+qSDQt/VvO6w5FW7lBzf3tgvr0IvhX2alwCCylWls65TdDJ3Sma
         5XCl30gmX5KL60dYFNCIMHNaaCHCTZxUZTD6yHrcXJVNuasuTVg/e68Bi0j1SpRlg2A7
         TersnpvUTAs3Eh8QwtRtMnjQuAqV8SuECYWMPVRY1Tm4jAx3qaZXv9atdAqdwTnzqqLt
         0vQEtzOzBOqDscdC+uKENtjspc9QIII79nnn4WLiA0+K2ehB/2yxqriW6xQ0awp92m6H
         265g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aBQ3Ak8ZaB6vj0bI3QQGfZERSYbINJWNgMX0qFpJoYo=;
        b=KKhiihYnWy68/pH8x6E+Ca432Gm7uLYPxqvtpBqbSQLVwuPZzzxj7HuQ4VuMYctoXV
         S7hfq6c07ycM+SE/BUiWdH/TeXfgACuozQ1rngtMvUDarqlNMYHotKkF2zij2kwFsdad
         BydwKWC17ftmdFBzzdmIPZHcHH2YrWAWPv7YXiSPCD6wqtDwsJgXOX44lsa3RCqkvuMh
         c+b2LXhYz5GcSb3DKULXGuO0jmkuWJVmHRrPSnVCLNNx5XN0oubAO4LiWQddVXIMyegU
         kCuM8xiGo0vNql/T0iBxhfV5uSmg1RtfYcjAGck+FHhAPZeIpFZP7IGt05QThYv4LKS2
         SylQ==
X-Gm-Message-State: AOAM533mOkfZB4zw+m4ZIA8LBilU/+wii9q7INFn17wdSUoTYsIYt8ms
	jPswgag1cKVDCxodn9nXODwcy02dK2Q=
X-Google-Smtp-Source: 
 ABdhPJyYBskMvbE3lDROqHHHJSf/+s0YWSdIIIxRS3hAYhrm8KQxhwDxJ/YmALwSIEyY5J13MXj0Gw==
X-Received: by 2002:a17:90b:4a43:: with SMTP id
 lb3mr6959829pjb.222.1635862164987;
        Tue, 02 Nov 2021 07:09:24 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 g37sm16340029pgg.89.2021.11.02.07.09.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harknott 3/6] gattlib: Place pkgconfig file in correct package
Date: Tue,  2 Nov 2021 07:09:13 -0700
Message-Id: 
 <47799c15b603209e4400359cb4cc557a8507db3d.1635862049.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635862049.git.akuster808@gmail.com>
References: <cover.1635862049.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 14:09:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93773

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes in OE-Core added some pkgconfig dependencies back and this flagged
that the .pc file was in ${PN}, not ${PN}-dev. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit ea4afdb6a846aecd1be5f81f989aee3dfc08cc60)
[fixup for hardknott context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index d79dbed87a..f2da88aa26 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 inherit pkgconfig cmake
 
 FILES_${PN} = "${libdir}/*"
-FILES_${PN}-dev = "${includedir}/*"
+FILES_${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
-- 
2.25.1


