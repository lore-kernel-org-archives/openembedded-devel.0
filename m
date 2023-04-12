Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770BBC77B73
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 05:45:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.36113.1681278298215908347
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 22:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l33Q0+he;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id j17so16270857ejs.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 22:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681278296; x=1683870296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=l33Q0+hezkBuEAcmU62oOB+abFT/ca4mJIlLSNWzWHx61NQasyId4YNjFG2tQaoGSy
         DkoVSDSPYeAu+2shxVztJi1iZDZisq1uuhtO5u1/TTCIlihtPd2OWG664fwhY+qFHX3w
         mL5kZST9b4G7H2IPqhxuCY9JJh394JEYTuwKb7am6Ify+I/k0QBRm/S7ASv0ygp5N5vB
         iFo6CwZZiZNivmk6PzUYk43yAmHVpd0j8/a5RoMLa6M/sFHxgtFJuokaAS0LyUvoh0M8
         BkhAp25CFLG2CELIEfH8S0PfxrDoWq1FsgGW6WjPdtMcai479f5hL0helI07jNo5JaPo
         YFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681278296; x=1683870296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=Qi/aR0D+KfE7iylL1xOePy629zREDldog/d2tRmj/wfGksJVFrhVqV0I2sD9Ckd6OQ
         Vq4mi8IxmzIE6bIdwZ/S5SEWtfEZrio1/ZOHfUCJzxMjq3CdiYSo7GZCl5Zyka2VGcRS
         QIGyCdAEmfv0HDKaL6WbKdDbaKI9aED8vql0iyCD8E3MR2nth9sW8h1OaOwaNU+XjvsS
         G6m9HXRfKV58zlLb0f+ezo5h7wkyH7ItXj7svI9ycreIL+TrItfBS5nuFD80d5NE4G9D
         YCcVQtRsJ7BG1TgiwKQGfnNZkoypY+/ZRxPHqLKJq6faes8KwBWt7UHKCgzrIEuEUxqK
         q4og==
X-Gm-Message-State: AAQBX9fRP1fzkscqwS+8HzA4L6Sn9QYdCXLEsFEtLQkWZFP0JSCvR4Oy
	McJyBR9LtPCkMrp9h0bId6y93pnOIpk=
X-Google-Smtp-Source: AKy350bY6HYpJQui9xJbBqaTpnuGDYRafm9Gs98AbQ8r8IHYnUubt+gdNCZJ6sZnosBQhmQCCFOxCw==
X-Received: by 2002:a17:906:454a:b0:94a:5602:5d6a with SMTP id s10-20020a170906454a00b0094a56025d6amr4903332ejq.9.1681278296451;
        Tue, 11 Apr 2023 22:44:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gq10-20020a170906e24a00b0094a962da55dsm2564928ejb.195.2023.04.11.22.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:44:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 2/2] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Wed, 12 Apr 2023 07:44:47 +0200
Message-Id: <20230412054447.24461-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412054447.24461-1-Martin.Jansa@gmail.com>
References: <20230412054447.24461-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 05:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102062

* the libdir is arch specific, but the subdirectory is always BPN
* fixes:
  lib32-dleyna-server-0.6.0+gitAUTOINC+eb895ae827: non -dev/-dbg/nativesdk- package lib32-dleyna-server contains symlink .so '/usr/lib/dleyna-server/libdleyna-server-1.0.so' [dev-so]
  lib32-dleyna-renderer-0.6.0: non -dev/-dbg/nativesdk- package lib32-dleyna-renderer contains symlink .so '/usr/lib/dleyna-renderer/libdleyna-renderer-1.0.so' [dev-so]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index 3e43c0d2a7..e7f918333a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -22,4 +22,4 @@ inherit autotools pkgconfig
 CFLAGS += " -I${S}"
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index b25e446c41..071379758c 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-- 
2.40.0


