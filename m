Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3761CD5BA2
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 09:30:26 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.5265.1725528619420918503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 02:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xk/2O0kA;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so287136f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725528617; x=1726133417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+5sOFIJv3th9gZqejxhXp5/rvXeUMs+CF2zbC2SOQ0=;
        b=Xk/2O0kAEsae02hoRWQttHs8oHv7FQZa6vVaAtMRGEjGJI0glv2yHA5YLdvO3CwBqt
         cEfebsY1S96yC/YpE58cjCsTJ+snyaswzEON2WD7qrS8/tBvVMv4PBf7Ay3QPtu7BG+S
         +CfxD44rA3KhJDkxCc7Hy7cIz/4sPpsQB8xt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725528617; x=1726133417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+5sOFIJv3th9gZqejxhXp5/rvXeUMs+CF2zbC2SOQ0=;
        b=czAZD7IdzgpEtp5oh2XUoJ0R7R6Ras+KItE3CMBxzDX8XmAFKygwDh1h25I1BuZxHM
         EF7DjNXACDGiPu83CfSodH1Ujgym+eW61TpB4N7Gl37lyhHSiMETloAMIVb3Hyj4lH/3
         1GZ9Pb+TtDzYb1FoRTkEyfAJYVCKdpgve8rSYPba+4fbm22zzre03OM6Wv8/mcW7ZdyL
         xT1+//3/TEhB6Txp3APsSZKRUQUhwF0vgIcR26ZsjArwc99cG9Cb/3ov/KsFO+zNpilj
         kdUivGYuIBaPDjFncH7ZP1qSUxgUYKELZ+jEUF1q9tpMRMa3J4pcCAvEvWsk+ZhTsxOA
         WGcQ==
X-Gm-Message-State: AOJu0YxGUvq7aCke9zDGSXywv2CIaElzf1uQKh+wQ50gKy3BikUnBL9K
	bsnszzRDFt4ZnU2fCH7r0CU2w85tBjz2T58JBUx12SP0OpjOHfgCOpmcY8IBhLoj18qhET0RRR4
	XgE2Zrw==
X-Google-Smtp-Source: AGHT+IHKcP+ADvChr57r0ZfuVvt18JVzKUUxUVYkC9kN7Ksc8ASOi+DNHw8wtDB9b30Y1JdV9qd6nA==
X-Received: by 2002:a5d:4b0e:0:b0:374:bd93:9bd4 with SMTP id ffacd0b85a97d-374fa04b44dmr6897329f8f.56.1725528616650;
        Thu, 05 Sep 2024 02:30:16 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374caf10f37sm10220154f8f.28.2024.09.05.02.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:30:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 1/2] polkit: Switch PAM files to common-*
Date: Thu,  5 Sep 2024 11:30:04 +0200
Message-Id: <20240905093005.2731956-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112099

From: Yoann Congal <yoann.congal@smile.fr>

Polkit meson.build tries to autodetect host OS to change PAM include
file to match distro. Force the distro to Suse which happens to match
OE-Core libpam configuration.

NB: This also may fix a non-reproducibility bug.

Fixes: https://github.com/openembedded/meta-openembedded/issues/860

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: removed patch and switch to the preexisting "Suse" OS config.
---
 meta-oe/recipes-extended/polkit/polkit_125.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index fe1ee467c3..54a2b3636f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -16,6 +16,10 @@ inherit meson pkgconfig useradd systemd gettext gobject-introspection features_c
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
+# meson.build try to autodetect host OS to change PAM include file to match distro.
+# Force the distro to Suse which happens to match OE-Core libpam configuration.
+EXTRA_OEMESON = "-Dos_type=suse"
+
 PACKAGECONFIG = " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \

