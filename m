Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0D5C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 04:01:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.2966.1645848116232201540
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k/q1vie4;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 12so6414099pgd.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEUdV8bWwtvSkZCAX4hGq3sHkXPh3B8Hmi6MMB4/Lj0=;
        b=k/q1vie4yxjv9ABZTawXiDAoFQa2Pby/u/LrPIqx8ml3LWB2CjgHGYW6FjZneu2cJp
         fvatnJq1SrBYFV2qKV4Aw6PRJPcBdOUeVRuUGLtVytU9B3chHSfKj/SIc7/Q4B5mN5fq
         yi/o6sn0INwJAjUMxailMmFi/A/MKOTxjkkPocBpJKUaCxIcwwobOhi2IFSLOICTpvMb
         jk1cDc6OgikmXkcM/PHTm2dNc7GOMEw1xBMhYC14MTC/nvo83pmhmvN4T50tabS57qza
         fxzU78/uu2EVp+/ss0mmtt+pe3LKAPewc8YZCyKiL75K8V9bxD46k+s3oIiVaUP6OUV3
         agIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEUdV8bWwtvSkZCAX4hGq3sHkXPh3B8Hmi6MMB4/Lj0=;
        b=ahUEX4jg+iBhVIwXlPxyc51E7BW8pHzERcaH7irrCm4h6bHBcbX1KcMmxBWJaECfWe
         OWRyiBYNkRIVUMDmkZG4DyIP3jtNC5H5O48p60s2aqhgo7s0um4iwCqoo65LKlD055pG
         vM3kpPunfgRy0ONtbc1due8gAMzvCuF6h0p57UYLmPHf8eujOfb0Lg4FTpJlK6G9N1H1
         FGB4i7moCxFQUwDNsQGq9IYKYYd+frvkqW9vh2oNTKRPEMbCmunCLT1wI0FUWz0EB0qj
         MVzQ27iM4g44T46Azy0D55GPKYpaXVacJPD0O5L33buUTlJ1GTx/WYuov9+AjgqMDbrg
         yIXg==
X-Gm-Message-State: AOAM531f1ZUp7ZJFZEiDldnySRlgteETi+R+AxXXKHkz3F7wssFcvRvE
	+NI1ZqyegDCLG2oyvQNvEIdzD7hYcvc=
X-Google-Smtp-Source: 
 ABdhPJxOBZ5+joQ6Z79i7E3w2Rx9wxLNeRKdeax+gTl9FPlB9teHNjvTgGHihmnf/jSxKhg79TBJcg==
X-Received: by 2002:a63:c22:0:b0:373:3d5b:ee98 with SMTP id
 b34-20020a630c22000000b003733d5bee98mr8537235pgl.252.1645848115301;
        Fri, 25 Feb 2022 20:01:55 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a056a0021cc00b004e105f259e8sm4866978pfj.152.2022.02.25.20.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:01:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pykickstart: fix wheel build
Date: Fri, 25 Feb 2022 20:01:50 -0800
Message-Id: <20220226040150.1393503-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 04:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95536

Recipe does not inherit pypi, nor is PN a reasonable guess for the wheel
name so set PIP_INSTALL_PACKAGE appropriately.

The wheel is built in ${S}/dist rather than ${B}/dist so set
PIP_INSTALL_DIST_PATH appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python-pykickstart/python3-pykickstart_3.34.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
index 65fc88e77b..7aa0758400 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
@@ -23,3 +23,5 @@ SRCREV = "bfd836cfdd8439d984595aca015811ed5c6be733"
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "pykickstart"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
-- 
2.30.2


