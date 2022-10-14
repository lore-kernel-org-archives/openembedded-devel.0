Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE72C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 18:30:50 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.10787.1665772241458471071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 11:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ql9pJfY+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id k2so12302376ejr.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iyp7Nc06WGIERY0OhwNKpuawY9lLtuFSY7au3WghknA=;
        b=Ql9pJfY+NXIPueu1xNwdcoebIPqoeUa5ZO/jNkGh/pvp2E7xCzCGHlGjXCN3iqt6oo
         2LrXZMDaFFaTzjIbfyWYx+cd2kQ+S7iPsa+cpcSUEy1zD1mt3OH/NT9B0kw1Pk8TAixC
         J9wuQMSY8BkCQxMxeHhfun7i2qpUna8OYT4xBgyDkHfuMCcLvfbv6N0eBqkwlR2FBFtF
         GWZKgsKxYXEnRX91phZSahJSJE1TGLTaEsye1LcrqC6SgNjaHwAcw2MG6T+ULjUoYILU
         EX66fnpAIIB9tEWWw98/ta+Unb9Dm0TDegVP5JX8YTtci6bNvpYKbsdJKL+snbX5SohO
         Mqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iyp7Nc06WGIERY0OhwNKpuawY9lLtuFSY7au3WghknA=;
        b=2s7PQtLzbSJQh2RHy/+xXNOWLhd2AC0JCEAibTEK+RPHwJB4icCtGtsbbm5jSlA8mX
         ml1vr0W3LvB4s49RCtvmJpBRqaSXhKiKTSigrHxEdN3Yfzgy/or9sjsaYtp3hTTKfulD
         xyP07drnPy+e6zB50MSvRw9KiWbQSacfRIbxbFLrX+8ztytbrhtI3UC6USw3Ei1IIxl/
         v0ROm9HybHVEthlMuD4F1qNbT7JZ8OAEkGSrHpE2CvXjsfpZc134jOVc2Xxrk9gIVLfV
         u0JrskmsNAQE9Z3MpIy13O4mf/uK38gwgDqzPoCGGEzgufY7dnANX1b7gtxAjRVVnPt4
         Eyxg==
X-Gm-Message-State: ACrzQf0mY3oKl3+FMtn4gvme6ll7aVY/jWeByYKIhRb8aALO6vCMkj6x
	x1H22rqmcnk3x/dgnQZ8NwHHAylnOAU=
X-Google-Smtp-Source: AMsMyM6Z/SLc6dg4JTj3BPUXnMM++W4w5JC1/irLzEBIsKE1ijW/suMqEN+gWYgzmgRcZUpg+otGxQ==
X-Received: by 2002:a17:907:628a:b0:781:bbff:1d42 with SMTP id nd10-20020a170907628a00b00781bbff1d42mr4375620ejc.375.1665772239762;
        Fri, 14 Oct 2022 11:30:39 -0700 (PDT)
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0b637124c0543b861272b6.dip0.t-ipconnect.de. [2003:f0:7f0b:6371:24c0:543b:8612:72b6])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906774700b0077086d2db8esm1928015ejn.140.2022.10.14.11.30.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:30:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Revert "onboard: Inherit setuptools3-base instead of setuptools3"
Date: Fri, 14 Oct 2022 20:30:13 +0200
Message-Id: <20221014183013.30601-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 18:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99170

Nothing is build/installed

This reverts commit 9c0cbd1d8f2f4d7370dfd2be747efd5014f539fa.
---
 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index 9325ef9c2..0388fc69b 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
 SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
-inherit features_check setuptools3-base pkgconfig gtk-icon-cache gsettings mime-xdg
+inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.35.3


