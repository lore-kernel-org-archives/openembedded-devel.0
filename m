Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AAEC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 12:05:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.119976.1699531509171251442
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 04:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=OIYcEXMF;
 spf=pass (domain: foundries.io, ip: 209.85.210.170, mailfrom: daiane.angolini@foundries.io)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso740194b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1699531508; x=1700136308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGjwpUfM4J6hB7ZtFHNqFFHi6912vlAvXU/WfRHZkJU=;
        b=OIYcEXMFgnI4G7vctH0730hPF+V8PiIkcPBcDzIq9uwy5uvFZ8lkRXtKEpHv4HysJH
         WJ68wpVwLbm0Fk6kuhjWTRI3IClurKpyGv9Qsud4TSdtJeLQSI7I1Zz68x9geKZvz0BB
         r2Y9dBuCyw/MlOnDyuZTpmsPrLnSU5JEsmQMRO4iXkno7NkymkECTrm53Foxe8z7Zptk
         Q0DI4n2mnYXQXvhoJ6xrpkuhJ1gl72bn9tvaVxKsNF8jGRUYNWbPCeEId+2w4l+nvnWV
         wRiQ2UrWbDQNbH+Ids+YOexOAFYD1bHa565PCphhvZJ+iip7dTqvAtFvee+uIOU9BWMN
         wEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699531508; x=1700136308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGjwpUfM4J6hB7ZtFHNqFFHi6912vlAvXU/WfRHZkJU=;
        b=D+kIGo7TaSC6sOD4Eiudrik1q5A8PTXG4eEcmXcyX0DSb4eY2bjdNZSF+SwT3zI2+n
         cuShE41BAQF6kzSlV3LB9+MJdZTCO/OD4eBA6bblaAhqs7vJ74iZkRGEEbX3VKfxtTzm
         nvHtNkQOxtcx4FgfMSgB34oCZ6jzl1x4ZSBNjoCvw05Qjn5594P7gweyDaY0zhON+gRW
         b7UHl7/dZFHfCewnOLtJGVuMLyZiPAv0vYRXe+Hhg674yrsUBjwp5ECuLnTCvaU9yazu
         LYbOPZYLDk9yjuOusiOW7H6QLcE9SSCjwwmDiSc9sLYturDAkK7E8wsZLl2p7iHXN0OR
         +/OA==
X-Gm-Message-State: AOJu0Yy0ADY+FDyGjYJS52uss1FS1FWBGpi0Rv6egbLoj+ZBZ9Xk9qFu
	ZrtylPdvHTYhHWnnVxg8YYbiiK9nLgZZB6ND+uo=
X-Google-Smtp-Source: AGHT+IHdG1Tcx84FcHunTgiDf4lyLdp0kDZ8cKOzz2qGkfc/QMLfktMXEvDqZg/PTuJP5Pm0Mex8JQ==
X-Received: by 2002:a05:6a20:9d8e:b0:181:2f76:f9f6 with SMTP id mu14-20020a056a209d8e00b001812f76f9f6mr5579306pzb.44.1699531508230;
        Thu, 09 Nov 2023 04:05:08 -0800 (PST)
Received: from nina.lan ([189.55.42.196])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090276c800b001bb97e51ab4sm3385621plt.98.2023.11.09.04.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 04:05:08 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [meta-networking][PATCH v2] wireguard-tools: Use PACKAGECONFIG to select wg-quick and bash-completion
Date: Thu,  9 Nov 2023 09:04:35 -0300
Message-Id: <20231109120435.1961221-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 12:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106516

Condition the creation of some files and their consequences to a
PACKAGECONFIG, which can be overridden outside the meta layer.

It removes the sub package wireguard-tools-wg-quick as PACKAGECONFIG is
supposed to work to configure a package only, and not deal with
sub packages.

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../wireguard/wireguard-tools_1.0.20210914.bb        | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 20435338c..8def54ece 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -11,24 +11,22 @@ do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
         SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
-        WITH_BASHCOMPLETION=yes \
-        WITH_WGQUICK=yes \
+        ${PACKAGECONFIG_CONFARGS} \
         install
 }
 
-PACKAGES += "${PN}-wg-quick"
+PACKAGECONFIG ??= "bash-completion wg-quick"
+
+PACKAGECONFIG[bash-completion] = "WITH_BASHCOMPLETION=yes,WITH_BASHCOMPLETION=no,,bash,,"
+PACKAGECONFIG[wg-quick]        = "WITH_WGQUICK=yes,WITH_WGQUICK=no,,bash,,"
 
 FILES:${PN} = " \
     ${bindir}/wg \
     ${sysconfdir} \
-"
-FILES:${PN}-wg-quick = " \
     ${bindir}/wg-quick \
     ${systemd_system_unitdir} \
 "
 
-RDEPENDS:${PN}-wg-quick = "${PN} bash"
 RRECOMMENDS:${PN} = " \
     kernel-module-wireguard \
-    ${PN}-wg-quick \
     "
-- 
2.34.1


