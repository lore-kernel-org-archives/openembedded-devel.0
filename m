Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB54C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 20:38:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.30804.1640637494192730911
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PsDGtVOD;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id v11so14488954pfu.2;
        Mon, 27 Dec 2021 12:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SEQz1qMJeH+YwN3k1ii5OfnyaAPcecmdAgShAz5qVEk=;
        b=PsDGtVODyJIs7Irg1N6FGOXTcydiXIP7M/dXTfUrXCRUApHztTVI1UzfHl2gNV5VmE
         fahVfqsdPewjbMPiaJUArkB+ReqCnvHKIB4zBOsASznfDgxfo/ccW7el/69sgHHR+xfP
         BRxmy1uuOXENflGXzROZpx86zZDOUT05EVic3wxPP032Zf0FZ80+BQbm5YX53mkfBO3J
         qiq6MVEfgr5WsyJtYLZm8mKtFENTUAthpnCbyvTI+oJSGWzqkAfELD4QzhwL+ItmQy0I
         SNpzpS1QpxqXHKHOmFCfhrRCIQ1HGpjdmnkFIbp32zBYl67LKjrTEMOryXHv8u53la9d
         DvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SEQz1qMJeH+YwN3k1ii5OfnyaAPcecmdAgShAz5qVEk=;
        b=NnUGNMe6RCJNbMON68dRymQ3xn2PNe7yOWFySxtaB3ldN4sjgyBOrpiWHTab4fDaTn
         lebGGSI1oFerYEM2jGgYCkj/sc2dNOoqufmiHu5s4d6dw5vWM9Ez1htvih/eOXRM6xcX
         asyHqDvm0LCNONW/H/ydU7gev/3L9yNuM7dwSIOS06AOiAlwh5j0CBNV4yOIQ3R1BNLs
         Yv0cNsq5W0B/eTV5dFBliG3ZgZJnrDJttKYyNnSb1IfCI9+Rc9oSy6qRXyDiHAjTkJR+
         iyPMRiW2rLxHW66hcx275DRDmTW7yyyH9PpvnKYHXQlKjbfBVzSF4w9VkqhQAd9BMiev
         Pyug==
X-Gm-Message-State: AOAM533PgwNlXY7BCKBSaRnVTkLjhnxR2Q/nYOmZmIllQvNN8R/yMSHQ
	gPy9CNXjTiF+iJLbpqB/mnLtUEyFxhU=
X-Google-Smtp-Source: 
 ABdhPJwBGbcrQmgOSABH2FR60TTjAWEzm1gT+UvVfu3GBWVvu+MOa0Tecs/tKDa14CSwvtuXwmsmbA==
X-Received: by 2002:a63:c009:: with SMTP id h9mr16816818pgg.36.1640637493495;
        Mon, 27 Dec 2021 12:38:13 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 br24sm19962896pjb.40.2021.12.27.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 12:38:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Armin Kuster via lists.openembedded.org"
 <akuster808=gmail.com@lists.openembedded.org>
Subject: [meta-networking][v2][PATCH 2/4] strongswan: add tpm PACKAGECONFIG
Date: Mon, 27 Dec 2021 12:38:09 -0800
Message-Id: <20211227203811.481782-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227203811.481782-1-akuster808@gmail.com>
References: <20211227203811.481782-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 20:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94518

From: "Armin Kuster via lists.openembedded.org" <akuster808=gmail.com@lists.openembedded.org>

migrate meta-tpm strongswan tweaks to meta-networking

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/strongswan/strongswan_5.9.4.bb           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 124b5a799..2b63d9566 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -6,6 +6,7 @@ SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
+DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
@@ -25,6 +26,7 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 
 PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl curve25519\
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'tpm2', '', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
@@ -46,6 +48,9 @@ PACKAGECONFIG[curve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-pl
 # requires swanctl
 PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 
+# tpm needs meta-tpm layer
+PACKAGECONFIG[tpm2] = "--enable-tpm,--disable-tpm,,${PN}-plugin-tpm"
+
 inherit autotools systemd pkgconfig
 
 RRECOMMENDS:${PN} = "kernel-module-ah4 \
-- 
2.25.1


