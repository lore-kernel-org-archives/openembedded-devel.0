Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F30EE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 19:07:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.2824.1733944017438694554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 11:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mxE2PC+r;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46741855f9bso38833211cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733944016; x=1734548816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fvgxa9sHFlZec8zDXwVf6jnn6IUY3CA5lS9vlZEL+M=;
        b=mxE2PC+rpOC9bLJghc3oz817vvKTyojHo+/rneDGsjKZxYeKnpsCF0BDj6u2QBdA0H
         ME93/DNxpCberheGkRxzHqGYbpRv/iMaNoQxjUnk7h5E0/lYCTI7SpRYWoUcROZ5+6qt
         ZG/ojF00emSKRyiikkMwXfc+u5jro7rxazYbuNeb5BVYi9tNJJlr5rtaDQ4mpEmE4Chx
         hFOn9Y3GTYAB5xe5+4Lpje6udCjdfA930MpuqRcwCQaHKCq2VGzxFztB42dpAR7CuqxK
         dDiAuMfN2aXlb27dlNOUX1bnixA1rKP3o8ZgZJ/fIJvP2mjMssUDmcj9YDUkN/AOEkye
         NVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733944016; x=1734548816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fvgxa9sHFlZec8zDXwVf6jnn6IUY3CA5lS9vlZEL+M=;
        b=N8J9VpxvulTkLoLYuuYq6rLJo3XD0iyuQI3oxTxlO//0GUoRcQtEBNA+NonTBQOKrI
         wBnlGJpYzTg6f1fRDhgOD6pm3jn+ZOgVRSkrn0JYYhNvv+yMfjvXCZMg/avftARkdbKT
         DhNsjz5/2sazzE2odnbikF1JZAQNdYLPx/6VDezFIbWoUq4X09Kq/s5HaeMAQt6cs8cI
         fjALqjgB60aOw15yEOFsIPOLjPURLdmQpBuRsK2aBGPxuEi9ByyHelIuQ1UGnTpejoqW
         3spMNpVpj2/2LUAU2MfkPcldwbmCwDH5H4bVDgxoYD1/Rf6Pj/+jm8vMTzK8hSp/+h8O
         wLgg==
X-Gm-Message-State: AOJu0Yx2bZzr/YUWUF7wAhR59fmypCuVf++G40B/jHMUWi0C6ssc4ARw
	SZNoH1YskTWJo2yYE1O2yMSTjdXjc6NuXxiWOAov5ND3LORaiDs9cDQugwOv
X-Gm-Gg: ASbGncubC80wtVT5tURkJLED5oCFH2MH4GiUnqFnhuM45v1jQoTTnk+o2O/L7vSLinS
	oc5714Aj0eSEbec8B3WuM/saGrMzY/ENMf3kPdmrK4YmH9xAu/5GgBrrypgJbw6mqYWEyR/ISOU
	IS3xjpwbRul0X0QjsnJ8527wGe3MekdDaW+7ETPiNDE7E3HBS1kD+OZL5U6ndgi70LJN8cf1Z7g
	6uNJ/Dyxq9RY6pgUx1nAxIB+k6/fkhOQr1MRokqWPMjJjFMvBvXrESnC2ZNDGllJlPFUrOFVBZw
	+Rc+ghMXXWL0p85lhfLramWn2yCVjC3YrRoUV7kWX35kE6mgFyrd8nk=
X-Google-Smtp-Source: AGHT+IGwWzZeTvmPd3Dk7mPdCeV5Osp61BMvnZVf4FaJ5mgOxEC0AzquixqLpZ4/9laegj3CSziRzA==
X-Received: by 2002:a05:622a:17c3:b0:467:7441:270e with SMTP id d75a77b69052e-467961591d0mr9713331cf.6.1733944015963;
        Wed, 11 Dec 2024 11:06:55 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4677f718b90sm18227131cf.31.2024.12.11.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:06:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH][meta-oe] vboxguestdrivers: update to 7.0.22
Date: Wed, 11 Dec 2024 14:06:53 -0500
Message-Id: <20241211190653.977121-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 19:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114285

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This update fixes the build against kernel 6.12+

Also, to fix the following warning:

   WARNING: vboxguestdrivers-7.0.22-r0 do_unpack: vboxguestdrivers: the directory ${WORKDIR}/${BP}
   (build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/7.0.22/vboxguestdrivers-7.0.22) pointed
   to by the S variable doesn't exist - please set S within the recip

We can set S for the unpack task, much the same way we do for
patch. Alternate solutions should work (do_unpack[dirs], etc), but
they didn't work in my testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../{vboxguestdrivers_7.0.20.bb => vboxguestdrivers_7.0.22.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.20.bb => vboxguestdrivers_7.0.22.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb
index 444b86a1b..74b15aec3 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb
@@ -15,9 +15,10 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02"
+SRC_URI[sha256sum] = "cf3ddf633ca410f1b087b0722413e83247cda4f14d33323dc122a4a42ff61981"
 
 S ?= "${WORKDIR}/vbox_module"
+S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 
 export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
-- 
2.39.2


