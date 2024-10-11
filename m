Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A47D0D7BA
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:10:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.14272.1728659437244365602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cgAtlog6;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4311bb9d4beso10426345e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728659435; x=1729264235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJa18xRLVRZDpWkY9Juth1dwFSbT7N+xf2xIDQkBECk=;
        b=cgAtlog6W8utxjaK8kwqMzhANeTZnjPNM/0XDjavilKgDPAD3rE5yDXy7g2Le3gg9C
         pgLZEKnuPIgo3qo3FMvDp2pWkqJgWnC/bM+/RCYl23MvULbr6CqiFNH1F62dj9j81NsG
         SCnTkXAWORynEJyXgNNPwJ75emqTqh9VA3rsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659435; x=1729264235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJa18xRLVRZDpWkY9Juth1dwFSbT7N+xf2xIDQkBECk=;
        b=H5R4M6UVu0pDIonOCwCk7rjGWlPg8MO/kiYgh3JeMkGzyhiBN/JDR/hbVEZBsN/tIX
         fsMZXx7Q+Sw3RaZO/QmYeVxP4tkSVQKcWRbOiy3pL7a67kY0/BIPzjM5/+CHrYHyhHeP
         nuOxeAiYF3pg3+jDm8yOY4OoWTVWvvrg0VFzp1fbQOre6psDrPqNRhlwAmy4I853HVK5
         0wJQJ+jehuaT7JGL2OrV7JwPM2k1v5TUcKHdun2GTmY8Brm/yVPUiGe7NtpqI6Psfi97
         1nM6QxEzZlyxrPHHRMOMsfLW8E50CqUBgABWpNlUjTokxDxDzlcSy5Gav2Ku9aXOXsoo
         K9vw==
X-Gm-Message-State: AOJu0YzxpJ5c+U9kTdWr/lAgLqronEg+L6yjHEWFZ6H/5Zmk7OKbAlDh
	rSAwSsD/BQBjGW8PmYx711EY0mz9Cs8tycPwd2p9Q8GB7tdkQxhlTa+ZSeRnAGCQsQaW+QgJ8l2
	J
X-Google-Smtp-Source: AGHT+IGGSOTi5au/+gFQxqt6mseKxlmELKsIzWwZdqm72ljRQghtuH5tF72ws1V39ZnxCzT44OB1fg==
X-Received: by 2002:a05:600c:3b19:b0:42c:b34d:720c with SMTP id 5b1f17b1804b1-4311deb62c4mr18849955e9.4.1728659434557;
        Fri, 11 Oct 2024 08:10:34 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183567c8sm44539985e9.38.2024.10.11.08.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:10:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] gimp: fix buildpaths QA error by removing gimptool
Date: Fri, 11 Oct 2024 17:10:23 +0200
Message-Id: <20241011151023.1516957-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112807

From: Yoann Congal <yoann.congal@smile.fr>

gimptool can be used in GIMP plugin compilation. It would make more
sense as a native tool. It also contains the sysroot path which break
build with buildpaths QA error. Remove it from target packages.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index a17e03b103..8755af94a9 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -70,6 +70,13 @@ do_compile:prepend() {
     export GEGL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'`
 }
 
+do_install:append:class-target() {
+    # gimptool can be used in GIMP plugin compilation. It would make more sense
+    # as a native tool. It also contains the sysroot path which break build
+    # with buildpaths QA error. Remove it from target packages.
+    rm ${D}/${bindir}/gimptool-2.0
+}
+
 FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"

