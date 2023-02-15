Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F7C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 07:46:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.10223.1676447197547011811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 23:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ogJG8/Qx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id r17so12014604pff.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 23:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAWI2n7LQn7NUKZAY11PbHy/a6+aNNqI3gNc23XyjKE=;
        b=ogJG8/Qxy/oMhG/oZPLQx4v1C1cbEga+dV1z9HZ4pT9GEneYWAicMKQf6uztwdJJBA
         1LMrB7dm9jDs4PeIy8Rvhi3iBY92mX8HPTVKmR8rzFjGhaKOGClC1MYLQBcJv92nToaL
         n1+f5+LKvL9ALQqCOoIb+oiO3QAjVxNqAbJMBNldEtZbL5b2/uqgA9FODBfT8IualsRg
         wwnfbCvlTxVHmTojm4hdUvh9r/2gj9j0MZP1YRl9H/syMaQ1TBQxohKw3iq0aMSwNegC
         KGYu3LmBpyik+fEz1Snyln57MuKMv4w8QYdcYnonmoHxffsiFr6VL4mz6+NHZIsGYdhi
         NLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAWI2n7LQn7NUKZAY11PbHy/a6+aNNqI3gNc23XyjKE=;
        b=wBuqLA3yinXBikeyPTrohUKdSs/7bV8XRUgsBkuUQweUjjz+iXsig2KZTbs3fN+qit
         L9VmtoGo+vz9Aslg7MnumDDPtBRayAomM9lL87rzlXwshOIbJ9qHSUvZtf6g4tYGku8S
         5URHMDbe1V11Bt2Tc5CHA3cvKyJB5b65yT/h7P1sdha6Hy8nkzkBLEiroIyabTW6bZhU
         Q2K9c3nStFsfrJtYJG+nhlHlav25PwpzPH4jn0d53aovi9+onSDBiAtpLB9Hy+H+iKEQ
         WYOn2rDg2yuell/fRmD4faIcSCelJ3RYf93Rv7vUoBXnxDrnAmHHVaOzGK26FrKuS4XI
         lhgQ==
X-Gm-Message-State: AO0yUKWWrDB3tZFiLBiF4PR84OoOWtqqschppOFz4cKnV3MHS65Duenr
	TxDSTpFhgfRfN2Il19QWgPo3PfEZNk0=
X-Google-Smtp-Source: AK7set/qq36oAnLkR/JWSanRgQMuTMb3xQGelT4+ksBIE3dLPrDikWQGG5G4wyRORo5a9WRyVT1NHw==
X-Received: by 2002:a05:6a00:9b:b0:5a8:bc8a:e066 with SMTP id c27-20020a056a00009b00b005a8bc8ae066mr1125049pfj.26.1676447196698;
        Tue, 14 Feb 2023 23:46:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78e56000000b005a8a61ca0bfsm6453093pfr.61.2023.02.14.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 23:46:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] graphene: Delete recipe
Date: Tue, 14 Feb 2023 23:46:34 -0800
Message-Id: <20230215074634.3527059-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 07:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101081

This has migrated to core layer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../graphene/graphene_1.10.8.bb               | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d37383919a..73465def0d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -488,7 +488,6 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     gphoto2 \
     imlib2 \
     libgphoto2 \
-    graphene \
     graphviz \
     gtkwave \
     jasper \
diff --git a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb b/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
deleted file mode 100644
index 1bbe7ecca1..0000000000
--- a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A thin layer of graphic data types"
-HOMEPAGE = "http://ebassi.github.io/graphene/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7d871d9e23c450c421a85bb2819f648"
-
-GNOMEBASEBUILDCLASS = "meson"
-
-inherit gnomebase gobject-introspection gtk-doc
-
-SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
-
-# gtk4 & mutter 41.0 requires graphene build with introspection
-PACKAGECONFIG ?= "introspection"
-PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-EXTRA_OEMESON = "-Dinstalled_tests=false"
-
-# Disable ARM NEON support
-EXTRA_OEMESON:append:arm = " -Darm_neon=false"
-
-FILES:${PN} += "${libdir}/graphene-1.0"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


