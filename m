Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54C3C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:56:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.942.1709056567422991443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kdp5pidc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so3736318b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709056566; x=1709661366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGr6nR+gXJHbvroCwaEYTcJPBKCGJ84vChJxEjuBU90=;
        b=Kdp5pidc9Wj+yLdvR4t3t/Igv8HWl+SCycw4fQzsm99SH2t99LbSpRbI18Kzg9KyfB
         FrlyYMSBOmGOq+/uXsQL82mYzCEwVMJ6fhRLmODhCF3MAeiWK51y08PHhJZnn5wZTXrz
         8cdyhXh4IRWlpMdX/bedp4fmnBhaQHxjmntXGWzDh2JuWLWwmN5qYAOfvNqTct3rToom
         HZ+fWeIjxkqbwPRgf27Y1G/pema5x4h24ssAKCrOqgK39MYLb6SRM1w/SAQ+TSOQ7brQ
         waEmNe8LK0neHBbmpbaj/ytiLD3EPCyhfzEKQhnu40CmQndhDtnLXePCBGjpSZGoOJEG
         0I1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056566; x=1709661366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGr6nR+gXJHbvroCwaEYTcJPBKCGJ84vChJxEjuBU90=;
        b=ndMERuy1Utqd+zCqn2A0+jQcMpLBUovAm8Rtiuiwi/h9JwqjMbDw8FiyBFOtSvITeF
         2b2K+eBZ1h94pNUmgNQo0wbIoKSiRDRUIx9LwIujo+h7DqjEDADTqJufJMpliGUQfTY7
         UENx1pxGD08blrDXiIB4qrY0DRRvJX4pRkmeBvVEyE7oOrV/PhmneCEoJjNczmnIz5yG
         YKHHfOHhWjp1be1iagWCH8LWWp+hO6RZ5JxSxlnLUs418r4NXqxFT97HxfLBT2R1zmnv
         wchNRTG9zP3KdRSIREwNVKx1sMKDMabyBwp4p1S0DY9zubwoheM8403ExuQoXloQYBw2
         /Obg==
X-Gm-Message-State: AOJu0YwUymTFsBwin3XRTOfCmqI2b3cFxne9z95p0lUdWt36hyO9e6Tt
	ygvicDV3eZ/NuAgqJS84AvnqWJVr1iLpsnyeHo+FmtrFQUSZssVLRioHJku9HTg=
X-Google-Smtp-Source: AGHT+IFWsnI+iqllLBJyvlwmUfSf6hw5Wo5MsyZB/PzZqSXFV/qZicfAzN3aoSRmocoTTHjsKDEeOQ==
X-Received: by 2002:a05:6a20:b323:b0:19e:b9ab:189e with SMTP id ef35-20020a056a20b32300b0019eb9ab189emr2339962pzb.60.1709056566370;
        Tue, 27 Feb 2024 09:56:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::95e0])
        by smtp.gmail.com with ESMTPSA id k9-20020a63ba09000000b005cf5bf78b74sm5161861pgf.17.2024.02.27.09.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:56:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ostree: Remove strace from ptest rdeps
Date: Tue, 27 Feb 2024 09:56:04 -0800
Message-ID: <20240227175604.2844370-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 17:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109045

it checks for strace and then try fault injection if it exists. So,
while it will be good to have strace port for rv32 it can be disabled
for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2024.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.3.bb b/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
index 07dedc8b81..158ec9bc23 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
@@ -28,8 +28,6 @@ S = "${WORKDIR}/libostree-${PV}"
 
 inherit autotools bash-completion gobject-introspection github-releases gtk-doc manpages pkgconfig ptest-gnome systemd
 
-COMPATIBLE_HOST:riscv32 = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'null', 'riscv32', d)}"
-
 UNKNOWN_CONFIGURE_OPT_IGNORE = "--disable-introspection --enable-introspection"
 
 # Workaround compile failure:
@@ -203,6 +201,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-pyyaml \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
+RDEPENDS:${PN}-ptest:remove:riscv32 = "strace"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-localedata-en-us"
 
 RRECOMMENDS:${PN}:append:class-target = " kernel-module-overlay"
-- 
2.44.0


