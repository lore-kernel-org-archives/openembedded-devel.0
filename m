Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72DAC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 14:12:41 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.27006.1750601551473238036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 07:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LN4qGsF5;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553644b8f56so3457349e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750601549; x=1751206349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jT88C2QlCKkcFxp/E80ScjZ1D5kQV0Ipd3wJFqdygow=;
        b=LN4qGsF5MtIEpjdc+skWpYUjPf+tC6ESx1XLo1k6aGO4FF6tj7gOYgpJwa9/KXzrs2
         5JvNX2mVRFva2X8DOJZ+CGHfY/GWC1MhPN+rBTxZeegG3XVKBEP2fNTgH5oa+oOb4lAb
         chPH2dyjL1FXZjMNV6yZ9Js/8xa9y6j/jeh6Vd6HKnOAnVbkyegvSLPHfPxky3aFInoK
         x+TvY3sAQJVlM8as8PuEA8uibRoVjbtpEZeMVaKVhbm8ybGIezIi+mL3ACkg8k7e4z6f
         vx4XVEH02jVabGYF18Rqfn54F5ICP/iKz1iUYJzPQq24HxVNnPrZxdUrtXkmhncE/hvz
         +Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750601549; x=1751206349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jT88C2QlCKkcFxp/E80ScjZ1D5kQV0Ipd3wJFqdygow=;
        b=eyglJ54xSKWijaIQVjz/mkcTIa0vp6/s/BmxoeBRh4YoZ8Cokq0OuY3DzREt2LHnLJ
         ZFt7YUBy5uy1nGEKdhDrjkpeFYcpR/0AFbXbfEliPcWOej3G68P6zgRamvqAd8Zk1m9q
         RtHBoY7jz+JMxjK5SRdn8HCX6MQWfe//vQyv6nsjl5/5rjWExLPxjFc4j/A44cUGSDw9
         SyKjosV1ht+Ae8TIdWX6iosxhkjA7GT5rcO0T7W7FkOh/5VQfyRPYGOQh4eaSuplPpMb
         SXSC8h0uO3mAu8kovI8Z1FRRubqzJh1xQKiELItA6wJja6YGoPwRhGYSZewil6p0i3yG
         iEfw==
X-Gm-Message-State: AOJu0Yzk35cTCzlhqJJjarCuMD07RKsTq4qLmkgX6Po4EBGhZ8zp7IgO
	eiHaZRxbuV94X7dDbvJIYWQm3yZjHuQiC8p1JMtOTOVZo9ATmriyc0xsUnL9LJLZ
X-Gm-Gg: ASbGnctB59292POkgOwEdaLCmWNh/jzsTXudCKOogk9a3BEqMMobjECXecAXPNcd000
	qaJofo5lgCgmeufSji/sechwzpVK2SBoWjENlLbt01dwEiCPMGmn68zgetPTI/0NUihNMDzhxtQ
	zo4kjMwXIqRfcqYNGhl3uKYNVSMdAHZlKuuu6UAL4qZjoKArXcMwiD2lm/JT7/MjsVqKmvXeTSQ
	IPf12xMgzrZjRfm4TjvrnJeriepcMmxaJ+nfOmx6keSB01KXltFopVw0SQO0/9vC7ll+wj1SciK
	/4+RMmp1lI8XQ+lJN/t8rqXkpDCs4o0L9k2AzKUfUPM73NWnJ2JbdbVQT4uPwcqqVR7wzkMmLPc
	nA7c=
X-Google-Smtp-Source: AGHT+IF3G/nZGfVV6H7CW2OqgiXNS9dkfCH0ssI+gdeteLWBmuZjHvmzxEeFzXfkA8ambwUyEb5BAA==
X-Received: by 2002:a05:6512:3e04:b0:54f:bdfe:ece5 with SMTP id 2adb3069b0e04-553e3ba7f06mr3162768e87.14.1750601548832;
        Sun, 22 Jun 2025 07:12:28 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc10dsm1016511e87.199.2025.06.22.07.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 07:12:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCHv2] autossh: Replace WORKDIR with UNPACKDIR to prevent compile error
Date: Sun, 22 Jun 2025 17:12:12 +0300
Message-ID: <20250622141212.449928-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 14:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118021

Issue was related to latest UNPACKDIR changes -> https://git.openembedded.org/openembedded-core/commit/?id=46480a5e66747a673041fe4452a0ab14a1736d5e

ERROR: autossh-1.4g-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/autossh/1.4g/temp/run.do_compile.2252' failed with exit code 1

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-connectivity/autossh/autossh_1.4g.bb   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index 4613ac61f1..cddb5e89bd 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -11,19 +11,19 @@ SRC_URI[sha256sum] = "5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31a
 
 RDEPENDS:${PN} = "ssh"
 
-CFLAGS:prepend = "-I${WORKDIR}/build "
+CFLAGS:prepend = "-I${B} "
 
 inherit autotools
 
 EXTRA_OECONF = "--with-ssh=/usr/bin/ssh"
 
 do_compile:append() {
-        cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.host ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDIR}/build
-        cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WORKDIR}/build
+        cp ${S}/CHANGES ${B}/
+        cp ${S}/README ${B}/
+        cp ${S}/autossh.host ${B}/
+        cp ${S}/rscreen ${B}/
+        cp ${S}/autossh.1 ${B}/
+        cp ${S}/autossh.spec ${B}/
 }
 
 do_install:append() {
-- 
2.43.0


