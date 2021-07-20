Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.389.1626798677261968522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y9X1oJIc;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so1880696wms.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ycn8wWZxfdNwwqw7bJVjP1Rzt0PjRU/SI5m5C9lwwVw=;
        b=y9X1oJIcgVuwZ8q06nHdouprJCt8y/fz+AxJVFV4PoFqS31ty55sDS//dZqT/hrR8w
         uCqZxg4rKqNqG5fH6Z691WIz0wNethgOm6VyeQyHvOUZkitm430VYXnDzjpVP8wVgp1E
         9MIcV7S908hvN+AW3TVewM5WvuoaYd0mhCY1cz8TlL1r5dD8mE+ciEf2MX1HjzIKtq0x
         S5ft4Fiv/G35boluCf82/+SSYehbtmVpcnpywVasqq/dxLtjO0NStMiqGRJrQBAHZ6ER
         czByYluICZdbimwc3itf34Di8c7oYvYHA2p9X++CJDVi+LP1r5PJ8UPB95SI5DGjyal1
         ys2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ycn8wWZxfdNwwqw7bJVjP1Rzt0PjRU/SI5m5C9lwwVw=;
        b=XvEhsRrtrQ8ZvN7nouMoJn+AKDi+01i2q8aYhTO/GwtGZS3zZZJBVdIK8veHvW2/38
         +F8rkeUVdaSATDh/XzafnhM7/Tgv+62fnHL7ku+Hqtw+fXT/8Vm8gcFNZjpj2iYg2SAb
         FfnC2nBQpTVhs8B/n6FrnB+J65S4zPv5rQkddmEP/AVgpSEJ+LaGRQhn0KQC7uD/jwqZ
         RO+y3XetSKjctinJZP63D1j83xq8zEkK+jnKe5X92n9YzY2VxsG3wfiQoIfZl8ClBpvr
         MFw0/SDyuTaRML/7HRRch1e9f4RRMNeXgNIZ65h7yo/r2LFa4g8WRBIJf2qqSswXi9YR
         u2Ug==
X-Gm-Message-State: AOAM5315ICr0PNJw5vr/K1cFp8iq/DMz1ww9KopRnD/jg1RuI9CVUhBO
	W9ZuUNo+rpLqb1cJdk4YxQ9ELg==
X-Google-Smtp-Source: ABdhPJzdAPGrbfdHLgtFKIP7SJ/biQd+z2gkM81APeSzN36iJfaar+1Mn4OAcl86bJuOpdH4IHcTjg==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr33116738wmb.65.1626798675471;
        Tue, 20 Jul 2021 09:31:15 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:14 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/5] libdevmapper,lvm2: Do not inherit license
Date: Tue, 20 Jul 2021 18:30:48 +0200
Message-Id: <20210720163052.11295-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

inheriting license class which brings in
AVAILABLE_LICENSES into do_configure task checksums class since it wants to
enable thin-provisioning-tools if distro allows GPL-3 automatically, but this
brings issues when other layers which have additional licenses are
provided which ends up in signature mismatches so leave that setting to end-user and keep it disabled by
default with a comment in recipes stating that if needed then the user should enable it via
config metadata or bbappends.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f592e81f11d455546447ddff35b2f89e18c0cc0c)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 01c9df45c..2fe97d571 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,12 +19,11 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
 SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig systemd license
+inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -37,6 +36,7 @@ PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+# NOTE: Add thin-provisioning-tools only if your distro policy allows GPL-3.0 license
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
@@ -53,4 +53,3 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
-
-- 
2.29.2

