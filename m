Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F1C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:22:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3181.1657182168771300279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pG1od+NS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id m16so6685816edb.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87O1DYMw9y/w6Qm7rrcce4wzePIZQjRdCZY2lNa+o/w=;
        b=pG1od+NSd/VcWyDlwPWXGuMftsn5rmi230dKkhv7lB2ZjoGA/7Re74Tn8xVwbT67jw
         dyPUWrm4s1AQ8Jk5wZdhVWkHtaQvU9BugXE3fK4aewRUf5fo36rs2Fag/tZZq3rB2b05
         0EqLCnEyn8OhQwphMXgeK4hK6In8vS13m5Dlz2y5ZF02IxuXM6o1jHHdgEdgUcvFJ3cE
         LS3GidSyeGC/T/lnNI41eCCmtVYXr8ziW2qDMub8b5MPd8L1iwsDSXdYcHeSAeLpwZ0k
         jpnHhlzxAgiPNYRaUAG1klXN2YdogCM7QbQbGrnkCeAFEZ4OgpdnR5bnfWYdCZoAYfbO
         7phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87O1DYMw9y/w6Qm7rrcce4wzePIZQjRdCZY2lNa+o/w=;
        b=Elx2QG+H9hnwq4tqPfca5OhhEk0iSITCG3ZQmzFzCGnkUeb8wtQPXMkfsCq0gDPCoE
         SIsBxcw8iLL/64eWbSgVpeajTnBstkOuDJbz+P4Wbz56cupqvjFnmnYp6BBgiQE/4wzK
         TjB4JUF82geIhxjIbVutWDA6O1QWv/hDcsFEc3+BA7h8iP5ca5amIBnqB7TiZ54SuWQk
         ujSCmoP6yCGkvGDRBocbG7FtJziyWh0vSf+UygyNXb8ViyRrRaMKB51SsSIVCzm4kTvp
         nBA34v+Lh4jPFa6wSz3IoBIQSzFYZTa1fK3KaHa/8f6/Y+XNPlnRV9yStbQWTgh1ecmK
         UCdg==
X-Gm-Message-State: AJIora//NkK5s5qMyS+HTFraSw4E5QiS8uDjL+PAk+bNa4B1GAzF8fZj
	EEIvlTqe/m14yxzR2FjNpOxppQR8kz7NYC02
X-Google-Smtp-Source: 
 AGRyM1snycPCowe6/c50upH5rpYljfLk41BJugl5JezHyqGfpkLyyS8smCGLrjg4qlWgLtfNwvQc5g==
X-Received: by 2002:aa7:cdcd:0:b0:43a:31e:114 with SMTP id
 h13-20020aa7cdcd000000b0043a031e0114mr36010250edw.231.1657182167070;
        Thu, 07 Jul 2022 01:22:47 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a056402038f00b0043a67dbbb4csm8545025edv.83.2022.07.07.01.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:22:46 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][master][PATCH 0/2] modemmanager update
Date: Thu,  7 Jul 2022 10:21:58 +0200
Message-Id: <20220707082200.2497308-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:22:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97759

Update modemmanager and libqmi to latest stable.

Adrian Freihofer (2):
  libqmi: upgrade 1.30.4 -> 1.30.8
  modemmanager: upgrade 1.18.8 -> 1.18.10

 .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
 .../{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.8.bb => modemmanager_1.18.10.bb} (97%)

-- 
2.35.3


