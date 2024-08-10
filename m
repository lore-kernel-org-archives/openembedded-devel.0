Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52B4C531DD
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.7798.1723303691743830547
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qk35JwOg;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-65f9708c50dso30727537b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303691; x=1723908491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZAmEC3FgyxlFaxpydESXa/YmePE6sHYeBvamekdwE=;
        b=Qk35JwOgME50p7Y+F83lj6s9A+iDjR3EJecxNKvVkrAnA1TuH0I5kdkPTitpEaANsy
         T8syFCeUD0EhXEJfQ2QSVjug5dNhWjgipUtKi7M/Iaxgr1l17m39eTJw65rPEc1eNyf7
         KLyMFlRFVfv3a5sn3ZOX26UjuAMIA6W1SUscbXmwW66M0bwdtNisHFF1Be1R+Ixs2c2z
         o6T3btgcx9OPm1brFG+d37jiEWNtEC95SwJIcLolPfmvq8rcbfbI5KkejufzEuHPEcgA
         prIWrqGHwzhhMPE84zjN/jRxWVYPfIpJUJWP1zgkrxIkgdgfKdGgGr5vLLUsW1NgFM/z
         Jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303691; x=1723908491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nZAmEC3FgyxlFaxpydESXa/YmePE6sHYeBvamekdwE=;
        b=KSIjHEZN6H6y94exHxgrkcR82fJcoPmiOoHqA0bWUt+ciAy8zV4e1l2VwdUaObyXuO
         9Zf6mY6SvdJjxEPY+HMoCGGD+7G7BWhJbYKVIXR/hG6jghFvKcrHz78pf+Z9CdRFILQh
         V4OS8V2lqciyBJT7Vgu9FOrZ2M6SWnCCGKyZFVkGDZdA1Rqe5JSLF2P76QhV5B7FeSaY
         oPM6onzeF9Or1ymP+wySJOBgzICobRxNqQs8cz1Aok7BNovDEYuzl4y/rO6SPi1UuDev
         XiUyVpK6CZpLDYlPkfq7IrcDteRL+k9eUwd6wQtpNIYfdjFllnrHWL5g9w/1rtpc6XRa
         AbsQ==
X-Gm-Message-State: AOJu0Yzy3Yk6BCqvF5cBUSJs43euO89/xxgcPAVKOlwCCUv2ejRmvCms
	9r9v4uptNAUQ+q5uF6rCOBAp8/J7GW4ttTPkd44DyPN+WsigZ3bCSOz9Mw==
X-Google-Smtp-Source: AGHT+IHqn9Rr4HiYxlOoKquNSypI0s30/myVzaLz+42mWCBUMkZtJNDLEeUuoqVOdBXejwJPT5tvWQ==
X-Received: by 2002:a05:690c:110:b0:62a:2a7d:b512 with SMTP id 00721157ae682-69ec5699876mr65071567b3.10.1723303690730;
        Sat, 10 Aug 2024 08:28:10 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 6/7] tayga: Fix contains reference to TMPDIR [buildpaths] warning
Date: Sat, 10 Aug 2024 11:28:06 -0400
Message-Id: <20240810152807.899873-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111743

From: alperak <alperyasinak1@gmail.com>

WARNING: tayga-0.9.2-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/tayga in package tayga-dbg contains reference to TMPDIR [buildpaths]

Make sure that the OE provided CFLAGS are passed to the compiler.

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d1bf2db7cc2bcb8b6ac45bb382c3f2b6bb762053)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
index 36d35e6dee..40dbccb840 100644
--- a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] = "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588b277431a44
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "tayga.service"
 
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
+
 do_install:append() {
   install -m 0644 ${WORKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
   install -d ${D}${systemd_unitdir}/system/
@@ -19,3 +21,4 @@ do_install:append() {
 }
 
 inherit autotools systemd
+
-- 
2.34.1


