Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37421C25B70
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 09:14:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3013.1698398051443350355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3iI/Pgx;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40859c466efso14247225e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698398050; x=1699002850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcEm9S5SdlGHPhUP3ODL71/l2WzTai6+nz67vs6Ghs=;
        b=E3iI/PgxFdFhPbcMdW5TYDLJ+qi2YG5mxVYNhOvUNeghIMwQQuHJELXGgTobFley7e
         v+Ja8G6SqGTLtGhTSq6qH/+3shSIfHz+JpTD/4V7V7vOWwe6pcbxRce12Hchj4XGf9pj
         rD0Ej2HWJvR8aJioBvF7RsJMKugtDsT+alY2JJ/HuLNp+tQyteYt6YB9mE8y6ue3BDTq
         jccj2TPcTjN6W1DML5hrbJmQZoXg7sMCAKzoOz+I9kTK1I/KAbgU23YnFyDADD4P5oC2
         Z4F8OGD1St2tM9LHG8WVjl3/Q0fyTY1pyQ6Hd/BWKtLr3kcMDK9dw1yln0UAHRgNLxFT
         w+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698398050; x=1699002850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJcEm9S5SdlGHPhUP3ODL71/l2WzTai6+nz67vs6Ghs=;
        b=LhT8U9mPkwYqKvr7+YcsYVqN3sxNtqLS9dj1MPp9qg4+qoYoJa4Mov34I00iqtLIR0
         MlEm7Csy++CUeB/9LQRYVpRN37dICT0WpuIqVa1mQ9jmoyLm0ZYYXw6TRzGje23upaiq
         hg54LHYNrjnGHxgt8N2JNjlTipQog16MZQEBrDVAyz/+85y11VdEA8l1A7luamnHGQEA
         EplM2iRrwuzPWKXeyXKFll4MSD5Dx/l5Ti8oCacOiQIkrwCbJFiLG+tKAF1ksGU4Ecbp
         X7MgINrSmnhN67d1/GtIc/01a2SDIMrF7GRRsCVfgHJKfRURVnL0PNKoRzWICfInbyQf
         qbbw==
X-Gm-Message-State: AOJu0Ywu9BeAel+jxyl/jcYyXWEnhJnHS7YhK72ZX0Kfofjxo055HpDq
	G5H4Wjq0VUiPAHw6h+J8XRU1bx0l7laR2A==
X-Google-Smtp-Source: AGHT+IHYuX8HgahQg6RDUBBAqybjYR+H2KmSRIItnShMDVD62hUQbLXJooG78uuqWmRQ9zwo584x3w==
X-Received: by 2002:a05:600c:46cf:b0:406:52f1:7e6f with SMTP id q15-20020a05600c46cf00b0040652f17e6fmr1922851wmo.12.1698398049347;
        Fri, 27 Oct 2023 02:14:09 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d6185000000b0032da40fd7bdsm1332855wru.24.2023.10.27.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:14:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 2/4] ostree: drop trivial-httpd-cmdline
Date: Fri, 27 Oct 2023 10:13:51 +0100
Message-ID: <20231027091353.1700511-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027091353.1700511-1-jose.quaresma@foundries.io>
References: <20231027091353.1700511-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105772

Upstream reference:
https://github.com/ostreedev/ostree/commit/0c36e8143d3c95d454b65c38f923cf71d08d5eb7

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-extended/ostree/ostree_2023.6.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
index f567e6afe..264440d23 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
@@ -90,7 +90,6 @@ PACKAGECONFIG[soup2] = "--with-soup, --without-soup, libsoup-2.4, , , soup3"
 PACKAGECONFIG[soup3] = "--with-soup3, --without-soup3, libsoup, , , soup2"
 PACKAGECONFIG[static] = ""
 PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-libsystemd, systemd"
-PACKAGECONFIG[trivial-httpd-cmdline] = "--enable-trivial-httpd-cmdline, --disable-trivial-httpd-cmdline"
 
 EXTRA_OECONF = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'static', '--with-static-compiler=\'${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}\'', '', d)} \
@@ -138,7 +137,6 @@ PACKAGE_BEFORE_PN = " \
     ${PN}-grub \
     ${PN}-mkinitcpio \
     ${PN}-switchroot \
-    ${PN}-trivial-httpd \
 "
 
 FILES:${PN} += " \
@@ -163,13 +161,7 @@ FILES:${PN}-switchroot = " \
     ${nonarch_libdir}/${BPN}/ostree-prepare-root \
     ${systemd_system_unitdir}/ostree-prepare-root.service \
 "
-FILES:${PN}-trivial-httpd = " \
-    ${libexecdir}/libostree/ostree-trivial-httpd \
-"
 
-RDEPENDS:${PN} = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'trivial-httpd-cmdline', '${PN}-trivial-httpd', '', d)} \
-"
 RDEPENDS:${PN}-dracut = "bash"
 RDEPENDS:${PN}-mkinitcpio = "bash"
 RDEPENDS:${PN}:class-target = " \
@@ -182,7 +174,6 @@ RDEPENDS:${PN}:class-target = " \
 #
 #   xattr in DISTRO_FEATURES (default)
 #   static ostree-prepare-root
-#   ostree-trivial-httpd (requires soup - note soup and curl can coexist)
 #   overlayfs in your kernel
 #   busybox built statically
 #   C.UTF-8 locale available (default)
@@ -208,7 +199,6 @@ RDEPENDS:${PN}-ptest += " \
     tar \
     util-linux \
     xz \
-    ${PN}-trivial-httpd \
     python3-pyyaml \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
-- 
2.42.0


