Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D852CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 06:38:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.2270.1752129523955601053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 23:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpjWt7vw;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b595891d2so4604001fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752129521; x=1752734321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt2s4SXZPqU3Uu0jt5yeu8ShLwoNZz1zw4h5Q9NNtbM=;
        b=RpjWt7vwzWZne9Hlk8MyGn37+8PStVpguBNEjNjFYYkp9ebLqeGc7LR/UoP2yQXZ93
         dtc14dyJuJ6KptT8iOY24nIyMEv6vvDcz6aLsgzeZXPMs3Na3TLx3zE4RtUTHdI2YkAA
         NpwIlOJwP6F+SBo1zUC1OUWyty18fhsFRis8BkvlB8HPfftKwo+Dhz56UvNU22WzO23A
         wWlHkZHwdVfzXTVPH5cMb64o8mG+cDtKkHtxz+kVY+c8LMRDsd3vlSSVJ+vf/stTzdKZ
         Gs2Jph6xjfp8Nub+qpzj43oOOaT/GuJGZFeRibSwcL8g8F0WXqppuNXlmmx78ot5My3D
         DotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129521; x=1752734321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nt2s4SXZPqU3Uu0jt5yeu8ShLwoNZz1zw4h5Q9NNtbM=;
        b=PPthga0KaujRLdcaapyKmQwvd5gnLMQ+4/6FhxzudKMW3qZh8ELA2hbkusoq6stK/4
         20zdbhiipAgI3xQgptFwbC3aIz5HYcrGJVX4Su2FUk/UUanKG70ejRJwsWc9jdCoIxTS
         HW7Xl3eJJvmmSi+kNXq5cXr3eU59vRopPwSXu/cSqC5VFQaJB0wzrR1wUOD87175tjhf
         NADJQg0sviTAMNCX8Ox7hjLNs1MKZ1rSygDo1MKM4BskX6izHTBLp3moIkChJObO63N7
         nmwAtawQ1LfJeDmkjkWrmqcXM4+bhMqEyC2rq/ejZFoMIMcWTexvHXH/NSjJAY4RGs9Y
         X3+A==
X-Gm-Message-State: AOJu0YzU4f6HlewuO8zsxRPnl2wbW4iVpjwNq2chxyvw4fvzHWsJAMWn
	afhOW1c26EEhgQoorO+F3ua0JXplo1oiuhI3GypDcw7yf7nmqMkiSXmPsq9gug==
X-Gm-Gg: ASbGncuoiVH9I+X3e/aLJIS6KprjugQ7VSE5/BgG0FDYRceretSqdOsFmX3HyWUC07X
	fS8vVYFIbkTjWQZRRworcVsM0+kzTo7CxE1XmO+MieZj+sSJUlTMXn+VNHYxhTiXrbxUljH/+AI
	hHGMGUIoISPSRdNuy3Pt5b03NSLObjTF/MxOsaSp87ziRmvJvvqU84ECHEx20VwBLfOICIaGSAg
	clcHabeJ0svpBwr7XGWP4/0BvViUzemNa29ZASKMBynEPgddAm2knhkzuJXTjA5f7VzaF88iIjL
	z/muKUm/sqgYr09wf82MvhNTf/lZGUs9gb19BO5N22hZMCmpy615RYP4aY8WiN0SXBRXgbTsugR
	Wjx0=
X-Google-Smtp-Source: AGHT+IEXjSrr+zuR3vmC6kkhYCMJongLDYifdxg5QH/ZpzmtH1z6RBiIeZmyVjiYsBfwiMrigeaZew==
X-Received: by 2002:a05:651c:3246:10b0:32b:755e:6ccd with SMTP id 38308e7fff4ca-32f502a23f1mr4051611fa.39.1752129521104;
        Wed, 09 Jul 2025 23:38:41 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8bf59fsm1675151fa.69.2025.07.09.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:38:40 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] properties-cpp: Remove ancient/unmaintained recipe
Date: Thu, 10 Jul 2025 09:38:02 +0300
Message-ID: <20250710063802.12567-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 06:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118395

Remove the properties-cpp recipe, as the upstream has been inactive for over 10 years.
No new releases, bug fixes or security updates are expected.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../properties-cpp/properties-cpp_git.bb      | 24 -------------------
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1d6c45c518..54171a7b15 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -974,7 +974,7 @@ RDEPENDS:packagegroup-meta-oe-fortran-packages = "\
 # opencl-headers sdbus-c++-libsystemd nlohmann-fifo sqlite-orm
 # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
 # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
-# spdlog span-lite uthash websocketpp catch2 properties-cpp cpp-netlib
+# spdlog span-lite uthash websocketpp catch2 cpp-netlib
 
 # rsyslog conflicts with syslog-ng so its not included here
 
diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
deleted file mode 100644
index 20b7f0a5bd..0000000000
--- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-# Copyright (c) 2019 Christophe Chapuis <chris.chapuis@gmail.com>
-# Copyright (c) 2019 Herman van Hazendonk <github.com@herrie.org>
-
-SUMMARY = "A very simple convenience library for handling properties and signals in C++11."
-SECTION = "libs"
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-PV = "0.0.1+git"
-
-SRCREV = "45863e849b39c4921d6553e6d27e267a96ac7d77"
-SRC_URI = "git://github.com/lib-cpp/${BPN}.git;branch=master;protocol=https"
-
-# Upstream repo does not tag
-UPSTREAM_CHECK_COMMITS = "1"
-
-
-do_configure:prepend() {
-    echo " " > ${S}/tests/CMakeLists.txt
-}
-
-inherit cmake pkgconfig
-
-RDEPENDS:${PN}-dev = ""
-- 
2.43.0


