Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF82FC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:36:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.30217.1719416201342413249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdn4VAq4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367339bd00aso242702f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719416199; x=1720020999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NDZqDHabH6AihSBnxkIKsqik2/6KJkA7UglfqXVcfU=;
        b=hdn4VAq4f8/ifNOvvqYRMYO/nowLzuGs/hag50ieBtzIxbbYQF/takoWUz48zomigQ
         EAY2zCI2Aibk/gwpyzdoylIBkvc8WHFlSpqELc0F6gKeLax4evG963TJsKfO6Y5rw+M8
         uk0znM9+5Vwku1D/o9APYk69kJQKGit4v+dOq9WF2gRqsZM1cd18pjkESdoLWuTzCM6P
         IdDd4GVp5jZJgVBZUWFXy/2F1xsaqtCBXSHuy33H7QkEW69DSg8FSWmS7CqAYPHfYo9i
         mkJ7TqT/QIFOo+TGa/PN2lyOCu1fCzMcMgrsnQkGTg//YyiUKFv8MW0ZMm7fYxDJPZ93
         nM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416199; x=1720020999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NDZqDHabH6AihSBnxkIKsqik2/6KJkA7UglfqXVcfU=;
        b=LKn6Pn3LKTJqfENIcCjijnTY7AjV614NqDhOd6K18o8TnL1p+papsilm67GIyKNdGY
         SF41ug9ldnczFhstNP83Dl3GrJ/A5iV3tadhgK2vvxr96PZQc/D4CU3DNZ36bEJ5SvLQ
         MfviTGAh54JRe4R9pj+YSkMQrcRZ2Jku6RFLFcZ2/ujQVEzdjX86P8KuDjnRo1rBRBEj
         7nMrjER1uUc951ia/0JMWMwH26ypQcIy+b7dOYfL2oqqiDR+xrfrj0z/HWIOV8CxZrsE
         B9NK3V2H8z3cPASYeWxvGUGSi0wwB96fHbA7FqNoFpGpSGJGhsHciW8a873uOo0mBhth
         928g==
X-Gm-Message-State: AOJu0Yxlu+uamXWDL2OKOu3jrOCawurAI38UVpgqrmHzrBaH6yBzmCqi
	TyUonfEehxzHNRa6za3bOkpxK++ulUFScTwcdmY7PtGW7Yo1xShz0ObxmDuH
X-Google-Smtp-Source: AGHT+IHXloATmx8qPilVqNOiAXgirNe2XttTbUGwv0dhBVgF7HNZ7874BT5CQEvsqSbMeOxjs2jsNA==
X-Received: by 2002:a05:6000:144e:b0:367:35fd:d3af with SMTP id ffacd0b85a97d-36735fdd7a0mr366854f8f.44.1719416199230;
        Wed, 26 Jun 2024 08:36:39 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b85a2sm16107003f8f.42.2024.06.26.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:36:38 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] hplip: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 26 Jun 2024 18:36:26 +0300
Message-Id: <20240626153626.2902794-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 15:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111109

Make sure that the OE provided CFLAGS are passed to the compiler.

WARNING: hplip-3.22.10-r0 do_package_qa: QA Issue: File /usr/lib/python3.12/site-packages/cupsext.so in package hplip contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index be420b483..991c69556 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -49,7 +49,7 @@ EXTRA_OECONF += "\
         --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
 
-EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
+EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' rulessystemdir=${systemd_unitdir}/system/"
 
 do_install:append() {
     rm -rf ${D}${datadir}/hplip/upgrade.py
-- 
2.25.1


