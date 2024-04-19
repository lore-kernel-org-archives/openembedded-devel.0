Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FF5C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:48:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.21642.1713534476510128354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Em+2Dbg1;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so4988646a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713534475; x=1714139275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCasQVcuNTOxAHN8l4f5sxF/1iCs1KDiQU/70SDKuWM=;
        b=Em+2Dbg1J2i/rFGMzFoSZdq/kNafpT1WaZplWe+oLxnUpPnh/Uv0X9kUmr1J3H4k84
         Z2t1iBoDeMOOlEMDltq9nStLrdQEqlNC2obTdWibKJzrpY6SPhiKjEofUO3Kp28sbr88
         eyV0Mi5zZSr4TqV8rk9mXsdhR5ulAdwJ/3tUDHq/ammKg8sTOH3GOqIhWJqXRekHjF2n
         FykdyK4myBF4A+gwzkBUHHc1knqrjphqVPLs0r13PX5ittExN0+L8eu9VFiqlFOG4GQH
         7YWcTlPAzARuJ4maePlxld/jqw7IEQEzqwC8UpYE4p9vcjw9p9QMg0ybgW2gk1FgBsjN
         jrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534475; x=1714139275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCasQVcuNTOxAHN8l4f5sxF/1iCs1KDiQU/70SDKuWM=;
        b=mZtKUrz4Uy0IxhdTnyhV8G5bgsbTyOXMpsQBu3WmRndPPZJnzfTJuxtI5O+v8hN+z4
         MIJN9pz2zfxU1FCm9hLOkGkDp8sqmzgTw5OJzyAzvyffG2k2mdOnKuEsT4MgIkZ67On1
         tDN1dvgBFKhbROZt2ViCukH+wWrSL3t0hpbUKwyFS4zslivJVTIQebk6VExUV3Kqq4fM
         Iwyfz2vnuWe6Z8HKJVTqpP8IrindO1qqPi03crA31x3h5l5nnaqnTfDVzPUWmBJ8lCDD
         6+e0FCXMuaTjPp2fevDcdTF/kS1GdfFFw4FVgtCitOGu+YKRVZcoYkqtKaCHzCdx+KBE
         3Rww==
X-Gm-Message-State: AOJu0YxUNOWqbh3p5TVoTGr8HRrUlmOzdaN6cMUG/NAIPhY4Kg6RH/Wx
	4Fwb+WKwBZAbObY8ZRu8JTtR7qODM9EZ/AerJi0nM3Yz0dE09QA428N/hg==
X-Google-Smtp-Source: AGHT+IHPlKeRyzzkODsklSphU8DzvnaaRB6wXp5138su2N9r6/EPkoup5w2MWM2PRXSp96xYCZVT0A==
X-Received: by 2002:a17:907:11d9:b0:a4e:24e6:9880 with SMTP id va25-20020a17090711d900b00a4e24e69880mr5013681ejb.33.1713534474532;
        Fri, 19 Apr 2024 06:47:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709067b8600b00a524531a580sm2244145ejo.152.2024.04.19.06.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:47:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] freediameter: fix dependency from libidn to libidn2
Date: Fri, 19 Apr 2024 15:47:45 +0200
Message-ID: <20240419134745.1066258-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 13:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110060

* it's used since:
  https://github.com/freeDiameter/freeDiameter/commit/da679d27c546e11f6e41ad8882699f726e58a9f7
  included with the upgrade to 1.5.0 in:
  https://git.openembedded.org/meta-openembedded/commit/?id=47ccb88d94852e327f3bdd45425f33e56983b50c

* libidn2 is usually pulled into the RSS by the dependency from gnutls
  but when gnutls doesn't depend on it, the build fails with:
-- Checking for module 'libidn2'
--   No package 'libidn2' found
CMake Error at include/freeDiameter/CMakeLists.txt:144 (MESSAGE):
  Unable to find libidn2, please install libidn2-dev or equivalent, or set
  DIAMID_IDNA_IGNORE or DIAMID_IDNA_REJECT

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.5.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index 36854c75bc..b3282d273b 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -7,7 +7,7 @@ Accounting needs."
 
 HOMEPAGE = "http://www.freediameter.net"
 
-DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools virtual/kernel bison-native"
+DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn2 lksctp-tools virtual/kernel bison-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.44.0


