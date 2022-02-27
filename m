Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA727C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.7219.1645948735436294477
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OE9OgcHe;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso12095945pju.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMFduAuen37JJ7nIuDRKERCUhwSxjXATMXnzFEJKbss=;
        b=OE9OgcHeb8lUtVGrx56VPzKU0AwCeoHfdKbMKwyujClfpuQAnTu2eVVvtJQCb659+Z
         n8MmyhB0ySPlH9E4VGOxsY/hJ7P2pHv5ypDsL8wzMTy84jFtNqnderGi129XA4qfzoPn
         zDN6eT2Tm8z0kVMdVsehzgv+mAjMxAUpZtCjt5TSKoYgW3tiaEJZoqpuaX1uQSyH3Xec
         RQW4+F6xONW6P9M5GyltOFuQLtjlw3ndQoy20rK+CD40T5kKBzDhvtLzL6xy2KbsT4Qp
         FhX/4XFIp4WV03yrYFXAAb1xmoskPTWqLL16hqF09Clq9Ks6AvZitcvewfFGZxpktRFF
         aWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMFduAuen37JJ7nIuDRKERCUhwSxjXATMXnzFEJKbss=;
        b=ZlX83/EqQkLRAUyVocJnJVdUYn6CyGCsjKIAMHU2OWZP9isY03P+Z9vKpv17PVWDF0
         V1i7m80vy8Z31GyY26zai2MbdIztIH+ueI/w+uxqO0++PPGBN2CFLps7wXwQpz7PfSeF
         jipKvhYvxJZBSPMWPZFvbRb43TcBND4JZypDYe13rX8I7sJX+n8um5tJbcs3NRaP+94k
         sSIqZR5ahDP8LY8ea5mG+VtsihLW65leZ3CwIu8i+TOIvlojjaJ6UBAZaFVMiYFvDhWy
         caC3VZmc0ZHvGFkAiE6VxK+EOJ8DxWTJJwGsP8lbQTcOHxM36JbmI3z0J2FMfbdrgokQ
         iEnw==
X-Gm-Message-State: AOAM532BpUJNJzzufdtSAek3OAAC4v4/koMESZTJEbVCU+MMySyrFo1+
	onTibM6StOmGLJ7gOUjeITJGkh/tclCxXg==
X-Google-Smtp-Source: 
 ABdhPJyIpbR8vP0NxMI6HoXUro3cxvMt8I78DFCd/OnSsCfm7WWOAAXEQNgCdIS/hUaCYnsb6QWKlA==
X-Received: by 2002:a17:90b:17cd:b0:1bd:223d:cd77 with SMTP id
 me13-20020a17090b17cd00b001bd223dcd77mr4611708pjb.195.1645948734831;
        Sat, 26 Feb 2022 23:58:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] unattended-upgrades: Migrate to use wheels
Date: Sat, 26 Feb 2022 23:58:48 -0800
Message-Id: <20220227075848.610467-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227075848.610467-1-raj.khem@gmail.com>
References: <20220227075848.610467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95559

It still fails with
| pip._internal.exceptions.InstallationError: For req: unattended-upgrades==0.1. Unknown scheme key used in /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/unattended-upgrades/2.6-r0/git/dist/unattended_upgrades-0.1-py3-none-any.whl: etc (for file 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgrades'). .data directory contents should be in subdirectories named with a valid scheme key (data, headers, platlib, purelib, scripts)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unattended-upgrades/unattended-upgrades_2.6.bb         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 629d2b43d1..85e5f59c7a 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -13,13 +13,14 @@ SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+inherit setuptools_build_meta
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
 
 DEPENDS += "apt intltool-native python3-distutils-extra-native"
 RDEPENDS:${PN} += "apt lsb-release python3-apt python3-core python3-datetime python3-email python3-fcntl python3-io python3-logging python3-stringold python3-syslog"
 
-do_install:prepend () {
-	cp -v ${S}/data/50unattended-upgrades.Debian ${S}/data/50unattended-upgrades
+do_configure:prepend () {
+	install -Dm 0644 ${S}/data/50unattended-upgrades.Debian ${S}/data/50unattended-upgrades
 }
 
 do_install:append () {
-- 
2.35.1


