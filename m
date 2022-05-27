Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A4AC433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 10:29:48 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.2143.1653647378035981588
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 03:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FQQIDwqS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id v15so2432696edl.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 03:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQdsrdurDdBDpS8Ux+8xjjujFMkSdNspfr5EcEtMVJc=;
        b=FQQIDwqSR6p9UCa4yb2uX59iWHlih/DcDS++me4C9g7xM9cRICNuQ7JAFv36N7RsGM
         ck4XwiWvt3FHJqV9NQgMIYj2hKtQdl7ELoR6yun4XC2fX+x6wNgUano5AenkfPRz8vP8
         f9Bb+J8M6ClXt/JEeIVuVjkAz9ND/nnyaMexRm2P8J4FhUvzLVH5GEYA3LI053agMfpI
         xfsqrLUTAGZiAldLthWeXrfm18yyE3E3c5rl4wIgHNOTYDcIcErafzMInjgUcEC7M1UN
         R/6HkXinDSyWnTEq35hwPux2CVEo0yWkmA6ug7emLiQ4SymL38kzyB1yFAup/k4jvrWe
         ACnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQdsrdurDdBDpS8Ux+8xjjujFMkSdNspfr5EcEtMVJc=;
        b=wnhYbfyWX/3pmFzbtBFEhUmX7jsieuAmFBiBxBvf8zUIf548T6HXSPawl1vHbnRt98
         H2sAKlziK7xSMyLZzn2Wc6nyYHm9EM521P9pZyWQ8qIdVF3DfUJxLjqGyKCZsmbuQhE+
         IE3U4kswxLtIHfm8jdhdCK6KC/+FrpLXXdSfz1FQuFMyEFQlk6hXRXm9MvtQ1qaUDPaC
         PL7HbIxyRn941sVLmBsEXCyMmSYQQGHu5qgVTxQ7gYVYokkDRY8eT9a97NBtLGuMkmhH
         4PN3TBZzjVqTJ/xFDX3X1nVCyTSAWBLnrdzPxeGW2p1jiVtrihzM3mJPWblcrQpLNgnp
         13ag==
X-Gm-Message-State: AOAM533YwfcCnVPFK2WmIBXS5wPuM/pNKRxhiSlvD7pNDe9UPA5E5ZKM
	WWGL3TCULtAtSTnOmyjjpiQLx/mp/Vc=
X-Google-Smtp-Source: 
 ABdhPJzsaLdibrc00S8RXfl7NYTIw6YYkPM2Tj9uw5HQL1tUnu+amkQtnUyydydefnAOh9UN7FuS1Q==
X-Received: by 2002:a05:6402:4408:b0:42b:61c0:14b4 with SMTP id
 y8-20020a056402440800b0042b61c014b4mr26680704eda.17.1653647376367;
        Fri, 27 May 2022 03:29:36 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a170906590600b006feece1e053sm1330150ejq.90.2022.05.27.03.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 03:29:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][master][kirkstone][PATCH] conntrack-tools: fix
 postinst script
Date: Fri, 27 May 2022 12:28:45 +0200
Message-Id: <20220527102845.4075957-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 10:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97307

Fix error caused by postinst script of conntrack-tools:

do_rootfs: Postinstall scriptlets of ['conntrack-tools'] have failed...

Configuring ... rootfs//var/lib/opkg/info/conntrack-tools.postinst:
  line 2: setcap: command not found

conntrack-tools.postinst returned 127, marking as unpacked only...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index 50f7ced88..8f57e823b 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -37,3 +37,4 @@ do_install:append() {
 pkg_postinst:${PN} () {
     setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
 }
+PACKAGE_WRITE_DEPS += "libcap-native"
-- 
2.35.3


