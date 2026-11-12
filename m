Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7993.1794465770442841347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eXu3kE5O;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b18717a193so687105a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465770; x=1795070570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBc9KKOa/ZU02crKwJ0fNA5ztByU8DzEPqfhuslivow=;
        b=eXu3kE5OxnuzudUTXmAufAwx3KIhq7cgTU2GDZGnS28XaRgDAAEWTJmtGbPK+YbvNY
         WqbLzf2eN0zvq3Dx9f+EX2EuONMYxl8ivkGZAnOgQsK/64jNGcmSbdoQSw7OqV4s9h0h
         XASeYdeo8d+fH9QUPv0m3C0ysOw1/sTIqc1W/vcGBQpy/7W7TLGT3bhDHn/yHdEDPUi2
         rZdFxVEF4wtgPI35C7s74CTGxmNqGsxHY/HdlV7lyUtElGo/PU3QnPCDxPAfe6ayFYbP
         5nd+tupJ9Lz+Y98vtaUQB+IMZ2v/WsR6n3k1mn4IbW8XS1nIrZ2x3E62BovNkNt7P3s0
         KReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465770; x=1795070570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBc9KKOa/ZU02crKwJ0fNA5ztByU8DzEPqfhuslivow=;
        b=Q471FgcUfHyOSyDbgChOmB7bv7aCL4vQh0dizIBQZtukgw7xjbgkMNzo5ZmbHeHdY9
         iShYJKjt1CJDeSJf1GO6Jwy+dZt5CB3Mo3AGJmYCXAQ6YoVon4D5dvl5cfwmLICRbKQn
         kC+I0VsPIf6XRTv47T+kD3TGuqzcJ8MliDWJfUCT9r19+VQFd+WKJi8lRSano0McrPId
         3/VJeGnXYdjJnw5IKJoHj/3AZgJqPR84sQy7rk5nBCs/4NaftAX7wWBzD9I/qOSVlj8i
         Hr8nEtwBsUvRGcZHItSZto9ldnvdB8yBRIX3axZPBtvxgW1iBycmr83mp2Pp7ynE3xls
         HGvQ==
X-Gm-Message-State: APuU4Z8PqkK/QejjNBEQXQv+t4dVyhIyvfzrIXBaNDgZAD4U1Vl/oatN
	L1mZuPIT7q6hKILwIZSZUzYQHSsGJv1S6a+eHqFmHicTiIAR23PoV1dTfgMmPZXPTI0=
X-Gm-Gg: AYBFou2ajJWuhwV6kRw6xfVcCzI7jlxm717AfcMcOoOJoXYAU4Xv58qQco3X5vmQLIc
	SYMd4W4BTMv+eeKFdsqepqfPN6diS2WB9YwQxvj0T6JfV8IygmH71t05HfpxmusXyv0UAkDbPYs
	77KugrJ0BxiHeT+yRfKYO0JuJgYkkSISc+//Jqet9yUFlMVenLfk7SWj4vW4Hm+RT8AAZvUQudD
	hzrmxhk8Ctttbs8AfxUJAc0TI3cE6HRKXhlnCJ6U0BflrSZWOpbMinxz00mLouUbpRhUoUTE0QS
	aDBZ3hlabZdhvQdN9bDQjrHM8y3UhbO/efIoGqOAy3WZBgUMSraMo7rzVebHU483B/MvlUtd+BS
	0KX5TWjWm7fXBYCTSE+XEra75e38TFujfnwseqRRHW7Z/4m0IhFf1wR7kCGdgFsHvOKfwZeD6/C
	EQNqc4IfgL6CgpmPP0HSyRfDpL+hwv3pT52x1bTr9SMcbPqVYt724BnkLIaJ/LmrYpBHj1OyFE9
	g3xYHuXUPhXrmWceWnE+PJtp6ggJt2wZm46x2SXysaVoCF5w4FMzIGbzqlrkZ/+9Zb8KyWEZj5+
	HIQg7ByFtrUoFZHUGoMmYvB0p2KNilXxXBfLn2/MXt3QT0LrtgGe0eQf2xdDHZSSI6E2vxrM7xb
	qmHiH6IzNZXhPeXeI6PUeWeJMUdfdnHBUM5BLM2boJXxgVLK4fv5Rv8wALMAIdOC/WRyq85kOf7
	jHRmh0vSg2TlUPDhAnhwOQTggLnNFFQeePR8myUfeWyIL0LQEITkfoVNVAQpTjh7BjCO/s/7Iv9
	1LN6lKmN6r8rwe+ic3tKivz1PpD9/5Ae3aCAJ0vWUvy6umMWZz7YJJ7qNmjoLmJ4OyY/ij4G8Xq
	vYMVi/8es7viYNznS9cfC5aZQQ==
X-Received: by 2002:a17:90b:1c01:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b182df2fd9mr4743738a91.4.1794465769665;
        Wed, 11 Nov 2026 22:42:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 17/24] open-vm-tools: upgrade 13.0.10 -> 13.1.0
Date: Wed, 11 Nov 2026 22:42:17 -0800
Message-ID: <20261112064225.2410019-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132186
Content-Type: text/plain; charset="utf-8"

gtk2 support was removed and gtk4 added, and --with-gtkmm was split
into gtkmm3/gtkmm4; adjust the configure options and use gtk+3 for x11.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{open-vm-tools_13.0.10.bb => open-vm-tools_13.1.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_13.0.10.bb => open-vm-tools_13.1.0.bb} (95%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
similarity index 95%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
index 088494c91b..5739c05d72 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
@@ -52,7 +52,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "f8fbcd0bf3b5869e2822542c398a51ddf7bd5f7a"
+SRCREV = "50cede15e10a21ab919f5ad2961ae0a1840a1911"
 
 S = "${UNPACKDIR}/${BP}/open-vm-tools"
 
@@ -66,13 +66,13 @@ inherit autotools pkgconfig systemd update-rc.d
 SYSTEMD_SERVICE:${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
-         --disable-tests --without-gtkmm --without-pam \
+         --disable-tests --without-gtkmm3 --without-gtkmm4 --without-pam \
          --disable-vgauth --disable-deploypkg --disable-containerinfo \
          --without-root-privileges --without-kernel-modules --with-tirpc \
          --with-udev-rules-dir=${nonarch_base_libdir}/udev/rules.d"
 
-NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
-X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
+NO_X11_FLAGS = "--without-x --without-gtk3 --without-gtk4"
+X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+3 gdk-pixbuf"
 PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 
 # fuse gets implicitly detected; there is no --without-fuse option.
