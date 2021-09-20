Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.807.1632170811504573817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvFEXkGU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id z24so46752974lfu.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZvy3yxEoOnW3iutPSm4IUVJXeURvt6VG3ot2G7ds10=;
        b=YvFEXkGUeZR23dY5hnWEKAWyctdT2TS/5g0RheJZ9nD3DkrOYGPiYuTrxwNWW1ff6z
         i95LHnU3Ib3NS2nCfsb40eRhpMCEZrOIC+p8EFhm6z9MSX8RKVSoS2ZG+ViJTjHdSS5+
         z10/exbB1sfctYeeG8iwkAR8jUu/fiFkSOObYS5ajDYRDEvJ0KkH79q0Ua21vEXOVH2O
         YraK4lZx5k5XE0nVzBHSUbJ8H1rbllzGu6FVjvQA5rnfP6/W0bBU/eoyVXwptQqbRQph
         Goj62qlyNUBC2QYmxr6fCyJAzn7FMJzMbf8ZbM+UCx6imPk0iZ3mkadTLAx4O+JyVLuZ
         8Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZvy3yxEoOnW3iutPSm4IUVJXeURvt6VG3ot2G7ds10=;
        b=pH2kvbggijXDmeMZ9C7KhReWljfbwRxbEbxcEyDdO75VE4aw+ff6ItPeOCDVvvZD3X
         wOrOGV5Aa0Cid5+IWOKpvaaY4VqsRjiR6OFggd2jzovhJNpyzlycPEwt/1+zdpUp291a
         Ae+buhed3dUE3APFKZP7CiLnCkX4WGAzeh1enbcOFR4ZkMk/tUy0xX0g/R3pWaUfb+yy
         z3Vi968fgCw24u0J8sji9tRrgxuRKbtj4hOE2nxQYEGL0q8Q8zwdrUkXuQe2+MW6dYLb
         /yzy9Lx6gVOmIHatZhjMZSF2kGszATu2XaFq34MI+uclse2Vl1JNxB+o3qnnJaD+lS6s
         GTig==
X-Gm-Message-State: AOAM531WKptQdwBX2OurbdSwg7/vqtROigsCBfffkw7hxrhcywX2PElp
	e/9mcBwzOQHVSId9xurdAaVQFGh6M9ndzA==
X-Google-Smtp-Source: ABdhPJxejaRCk8dMFcYyzsnjPKIwa2BY5RXZqjlGcWwEkls38mkEaOAzqnmpeZPgMCooD3AwuynZXg==
X-Received: by 2002:a2e:89d2:: with SMTP id c18mr25094910ljk.242.1632170809932;
        Mon, 20 Sep 2021 13:46:49 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id r15sm1347225lfi.167.2021.09.20.13.46.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:46:49 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCHv2] junit/xom: Fix task dependency typo
Date: Mon, 20 Sep 2021 22:46:19 +0200
Message-Id: <20210920204619.1449908-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/junit/junit_3.8.2.bb      | 4 ++--
 recipes-core/xml-commons/xom_1.2.10.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index feaddc3..57dd459 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -16,14 +16,14 @@ inherit java-library
 do_unpackpost[dirs] = "${B}"
 do_unpackpost() {
 	mkdir -p src
-	# Prevent deletion by do_deletebinraries.
+	# Prevent deletion by do_deletebinaries.
 	if [ -e src.jar ]; then
 		mv src.jar src.zip
 	fi
 	unzip -o src.zip -d src
 }
 
-addtask unpackpost before do_deletebinraries after do_unpack
+addtask unpackpost before do_deletebinaries after do_unpack
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 2520405..42ad957 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -36,7 +36,7 @@ do_move_jaxen() {
 
 }
 
-addtask move_jaxen after do_deletebinraries before do_patch
+addtask move_jaxen after do_deletebinaries before do_patch
 
 do_compile() {
     mkdir -p build
