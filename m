Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C370C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:34:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.17446.1675445653929014366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WL34vBoJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6528772wmb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zz6dm5K64925F3pxfI57vURZaFHsDPC/NfOddnudM5k=;
        b=WL34vBoJeTHBQ22YymmgN4lq8RZ+OIEqjb/Dy/5Rqg43Spn7+RSDEea9ohaKxpx6nX
         dAx4nQk62nkoD246XD0hNt5NCHrXYQwVjUHSdOEH8kZBgv6icDXMn2hxvJuY00hVlOH8
         7HP9Yv4LvmHG9SOM0d0sK3GcmDKms6QQzSWfbIzWvoxUw5drT3acAE5SlWl2v2+dM2/L
         VAYj7oY7kfvbcKQMyaG0u2ClRUop4oSto5cDStJyY1Vqm7y5gnqDS7aYS90guBHKWlqc
         anjeVdfxRIOecIN/Qcmai6J3OrljPeqJaPlX0TI68DrGX0wZ1sWKi2iZUIwuyc+UR3D/
         WPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zz6dm5K64925F3pxfI57vURZaFHsDPC/NfOddnudM5k=;
        b=Q2tUoJLW3a3gXeI21VPJu9bfhFTA7ekC3jarHyBRx7bES/W4bd4IxQp80gAa30VhmP
         1YvzVBM0Qw9eVVqu2ciKVrjHV/+4sE0NMJiatO50Ghr7iO41fwGBSTDg4zSfAlaBBCr+
         cnzH96jd/PxvXysUdtjfjknSaO1JZQBNv8ME21fK9CReQk6FbxWes2g6X0744p3C9AcF
         tp5uQ8ExR/Tk4BijuHKEZLuRt+4ye/o7jiLsX385+fiNGwAk55bLCIN/JPtkO3L7snbU
         vGiYLRcPP3yC2Yv+ua4KIm0MaZ8fhTl8wYi9mzB5lqSb+PrbvefG0G1paKJT0bNamomn
         b1KQ==
X-Gm-Message-State: AO0yUKVDkCSoq3+LJGg8zse2bbH3Seuq5VHDGwzolHZY6RWU5l7aruB9
	1Tw7No3p2FhpoXEhdr6X4ELQJ8Go4xM=
X-Google-Smtp-Source: AK7set/hz0jfQ0XBtFWmepJqfjHbVQLGXpp09Pzg1QGv7wG76rqeiNxTA7vklHjBk0q86N1zRpaTaw==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd57 with SMTP id i22-20020a05600c355600b003db331bbd57mr10782164wmq.23.1675445652136;
        Fri, 03 Feb 2023 09:34:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b003daf672a616sm3566384wmq.22.2023.02.03.09.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:34:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] mctp: fix overrides syntax in SYSTEMD_AUTO_ENABLE:${PN}
Date: Fri,  3 Feb 2023 18:34:04 +0100
Message-Id: <20230203173404.436834-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 17:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100925

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/mctp/mctp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
index 9e97a6a60a..edc614d345 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -23,7 +23,7 @@ PACKAGECONFIG ??= " \
 # we'll want to declare the dep and install the service.
 PACKAGECONFIG[systemd] = ",,systemd,libsystemd"
 SYSTEMD_SERVICE:${PN} = "mctpd.service mctp.target mctp-local.target"
-SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
 do_install:append () {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-- 
2.39.1


