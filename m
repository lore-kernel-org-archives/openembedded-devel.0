Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860FCC4167E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.23537.1668873488393661306
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EVEd72F1;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id g10so5417710qkl.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqAg6sMvYdeHFe82acZQKW0Y4BUH7r1bNdJ0JDiPXnY=;
        b=EVEd72F1BiLrEsw6bomVm0GzcQDaN6L6SlfHx+whNbvoqHzyn6I7VUGo4b/vgFHiQu
         RX2bZJdfpVQZe+0vwd4iDEWePsQPWyMbQ6eGy3r8iL3igsmfWsmtP9HzPbt7IX/jRRQs
         Q98kd6KqFm7F6eRBEVfkBn0o28rDSeFi5FHwUqDTLXNqTpY7Rghkf41kC0ew2+tBxkJm
         yipqaddOeHbkoUiFl+z2IZcyRJrNMsliySPCg84DsK5RVCfxb1vHedQBPS075jgzxaZI
         6LyUp15nu2+KAwfYZZ9zk/WC73FmaLr3KfVoq+TeheesBwtWtYRhxLca7dNt7t+CuOam
         FrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqAg6sMvYdeHFe82acZQKW0Y4BUH7r1bNdJ0JDiPXnY=;
        b=yxht9KE2ttQr77ZGb4hEFXmOHztxSNWeutXgJXVWPEPhGNzCT72LX7jmXZT5bniAXT
         sisrRav9mNJB/Ar0GkGXqsk7MVwSiZ/ttzQXRcN8Xa2kEDlSUdTUR36NHsuTYV7av0Cx
         VWZcGJmLicHORJ/e99F/E74jREKvCqrC/haVt9Y2OMYhFokU6TL7vfV56xK22HkzIdK3
         6yh92SefTeybcHdnlHvC3cRpO9/j0pX97iKyjjL842Pz9E8lGJjKG2uO/Mruy+onfQ8x
         sJg+gCZQykFRyien/FaK8igGCcDifaESo0VCrz+TdqHxd7fHG2gGBkkyFRrnAj8UEgD3
         yYIQ==
X-Gm-Message-State: ANoB5pmkQDT9lF74gVaU+VQhYZIRnbLsO8MEK+Hg5RelLCuCIs0odRdT
	gL2bzRcJNTSQMMC/hbrh+8Lk/4p+pD9k0Q==
X-Google-Smtp-Source: AA0mqf75JPXnD1thkmVNLaMimXXXhyDwV+MEGygVuczO05218VZhMcB10lqF7BA7oUe5uBMd3NUaaQ==
X-Received: by 2002:a05:620a:c9a:b0:6fa:46cc:8d9a with SMTP id q26-20020a05620a0c9a00b006fa46cc8d9amr10105390qki.98.1668873487062;
        Sat, 19 Nov 2022 07:58:07 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 03/35] fwupd: Fix plugin_gpio PACKAGECONFIG
Date: Sat, 19 Nov 2022 10:57:27 -0500
Message-Id: <1a84202c907d4c650b12a8e9a5a5ba66f2526673.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99642

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Trying to disable the gpio plugin results in an error

	ERROR: Option 'plugin_gpio' must have a value separated by equals sign.

Correct the PACKAGECONFIG for this option so it can be disabled.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2ab46bac63c32a1f37576b4b8be61c95585ffcf2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 72f37aea85..99077923dc 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
 PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=true,-Dplugin_ep963x=false"
 PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
 PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
-PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=true,-Dplugin_gpio"
+PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=true,-Dplugin_gpio=false"
 PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=true,-Dplugin_intel_spi=false -Dlzma=false,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi modemmanager"
-- 
2.25.1


