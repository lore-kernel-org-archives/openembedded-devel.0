Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD7C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 19:49:28 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.15976.1698436164228117254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 12:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NngbdZR4;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so36693981fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698436162; x=1699040962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCLwIDSMs7eIgCspC8/x9q5NMk+dbMvNA8ZU7VBu6nc=;
        b=NngbdZR4KNNNp/jq2qwCWLDLjF1M2L64TTPHepomBo4G/brmFDZ5J1VANohtgD6hbC
         AH2QVvoedXLOGgsZoKPTGLdaDyJOKkakyAC1Z5N0i+z7LBCzuy4Hf+NaHXJ27QIzM+qt
         VIsCIw1At6lje7a9KF0XCczU3SKJsqtRIIsZYR33I5vLxw02s8iVtTbMnnM5hYhH/vlh
         hU98pQppL7O7LQaBPQ2TC+BgiBY57TzY7PGiVBrGWRgB6ajzN4TgdtSsAw9Jplhaw32z
         BZ1r+uaXMCb0q2dk4CE5V06Q9wLumBVbWbgJcPsIxjy+u6ytIxaL+Btxj4dSVu9p5iz0
         Gjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698436162; x=1699040962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCLwIDSMs7eIgCspC8/x9q5NMk+dbMvNA8ZU7VBu6nc=;
        b=CRT/PH9O1xGsQ+QlXbmfLImnJuriF8d9us3/S0JTgeLAE9S/GuoZu4iflnzw7pJ6QQ
         wZfG/O5Ilc7dU7+5+M+QH2POlr/GHCydZdtayG4CSEWqTHybu1Shi5rwGSSxZRmvFB40
         0mNPXHge/3tJFDbdKd3F31xw20EHjzAqBw7w0lnZPmxmYJAZThhMCDlGxFRUHVk5S8Bu
         jSb0AEz5wK7ThZAVQTyE9bvL4jKTHMAzbAuAaABayoiuYx2kBAjrE3PWdvLxxY2gghDC
         GiOiLc7/FzxIRMVr1NKvFfOVshLaKVZWwfrJngmo5czHVs1iQV1IFZf1qwO6shTsC7/e
         a8kg==
X-Gm-Message-State: AOJu0Yzi+TbjUb5arBhSjIBMjf0/HcLVDQcGXX9dwjgYXoRwjAZSzOXX
	yHir567jgL4jT1e/OG6BbLpapSOrWns=
X-Google-Smtp-Source: AGHT+IEexfHML3zCrdzf6hWSBvjx77jYPs+6Dx7G0zCN6C34gLv51aTiuM0VWes7bVzh351u9TPefg==
X-Received: by 2002:a2e:3e0e:0:b0:2c5:14eb:1080 with SMTP id l14-20020a2e3e0e000000b002c514eb1080mr2853608lja.21.1698436161419;
        Fri, 27 Oct 2023 12:49:21 -0700 (PDT)
Received: from clements-mbp.home (2a01cb000c0d3d00450fe1482180185a.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:450f:e148:2180:185a])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d640c000000b0032da35baf7bsm2375749wru.113.2023.10.27.12.49.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Oct 2023 12:49:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2] connectivity: add pcapplusplus recipe
Date: Fri, 27 Oct 2023 21:49:14 +0200
Message-Id: <20231027194914.78513-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 19:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105782

Add PcapPlusPlus 23.09 recipe.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../pcapplusplus/pcapplusplus_23.09.bb        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
new file mode 100644
index 000000000..39c6942c8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A multiplatform C++ library for capturing, parsing and crafting of network packets"
+HOMEPAGE = "https://pcapplusplus.github.io/"
+BUGTRACKER = "https://github.com/seladb/PcapPlusPlus/issues"
+SECTION = "libs/network"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
+
+DEPENDS = "libpcap"
+
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
+SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[examples] = "-DPCAPPP_BUILD_EXAMPLES=ON,-DPCAPPP_BUILD_EXAMPLES=OFF"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF"
+PACKAGECONFIG[tests] = "-DPCAPPP_BUILD_TESTS=ON,-DPCAPPP_BUILD_TESTS=OFF"
+PACKAGECONFIG[zstd] = "-DLIGHT_PCAPNG_ZSTD=ON,-DLIGHT_PCAPNG_ZSTD=OFF,zstd"
-- 
2.39.3 (Apple Git-145)


