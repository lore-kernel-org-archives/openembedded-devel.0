Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.7183.1596634632115289100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eEqBYhWv;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id r4so37761388wrx.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2020 06:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16sc2VOflEpsssSp5Lx+sYzGxpxrehD8I+Co3y4OMrY=;
        b=eEqBYhWv3rpGGYo9B1LA3aTLvTawdCO1weoMpYQNxDGtBwJiFPvh0oK3ZBJmyfe0XU
         523vC+AI3L8yR4voOQLQZbl+TmHy7ZNN1uwxZhCo1OR8mv5c7ClZzwr5PVajQsj1S+Jt
         TYRUtbS5iKnuTGgmulHz6elcILIF22TmQsWP0C0Cf+G/m363gu8wi6hX510cuGyix2g1
         csK+Hy87g8DwogX959TLX0TFU2hdYDx8C7FzeXH6tNcY4CeqYUIRjSWiV/F9w2n2LoqA
         e1oNsQVlewuC5gtFci4ma0EnsRgF3DCZNpsLreCOfbI6yVGYt4OlsCJjU3mqnNh8736z
         aCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16sc2VOflEpsssSp5Lx+sYzGxpxrehD8I+Co3y4OMrY=;
        b=c1ggiJXdPYNK94WfV6xFP5dwPLvsKrfYy2THBrOTJzHA7O2jQ7iUyCcgn70hMTJT1c
         AvDX1ZQM9Y1DbML0esY5Nxq0biCHB1UdzH0n3R3NiWo9KKIvUeu2hrIvkD88Ip4h4BDF
         3hryf6jnP1YD3uHDcKHYAkGddKXt4bm3ftip/pGOs6+SATBMAof+wuwquSmtk6bSUs3V
         7KxaHeg1cgk3UXzby768e2jeGDwxSX8YDIW9iuvD60MYjoo865Lurs4YAwPd3iWu1HI7
         vuu9JHLSxDYHlTtBcBhHX2Tac0y/38WawrWS6alWJBbSN5oHMdMuQe3rMqpKFXuPXeDm
         C+Kg==
X-Gm-Message-State: AOAM532R4YEIqQEjBe7qUNMML6kWdKro5B88Q38hoLSC3IVPBPTYZJik
	H/3lhWwymWIzUwF1fRHgmXS91GOrQ4k=
X-Google-Smtp-Source: ABdhPJzCZgdHlmKGKN35bSulDYO8HAF3F6eVd1MhLNpuh4zAp1no6WrDWzWXXjBdWNVFrb6s4Bxucw==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr2707780wrr.323.1596634630231;
        Wed, 05 Aug 2020 06:37:10 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z15sm2822205wrn.89.2020.08.05.06.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:37:09 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] lcov: fix lcov-native build
Date: Wed,  5 Aug 2020 15:37:07 +0200
Message-Id: <20200805133707.19234-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* there is no provider for gcov-native nor gcov-symlinks-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 14718184bd..0cc8b31b3f 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -9,8 +9,6 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} += " \
-    gcov \
-    gcov-symlinks \
     libjson-perl \
     libperlio-gzip-perl \
     perl \
@@ -46,6 +44,11 @@ RDEPENDS_${PN} += " \
     perl-module-tie-hash \
 "
 
+RDEPENDS_${PN}_append_class-target = " \
+    gcov \
+    gcov-symlinks \
+"
+
 SRC_URI = " \
            http://downloads.sourceforge.net/ltp/${BP}.tar.gz \
            file://0001-geninfo-Add-intermediate-text-format-support.patch \
-- 
2.25.1

