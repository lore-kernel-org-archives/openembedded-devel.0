Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE04C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 05:23:12 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31855.1790486590389914912
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 22:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BUi7Vbiz;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c0d931083so715132eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 22:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486590; x=1791091390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdtVBZb95+RovFvrJA196wdeWE0eNSjJzFzGKIyBq+o=;
        b=BUi7VbizFG54ZALr/7r7awcRquoPiBkaG73Y5mDVBiDPeKyTLACjDhtedBmBPqR/ak
         tKfgxkmGf6gw6h6HRH5IBUw252obPw9+azLxpJ5XRk5mGQaOFWgPlxbYdS1a01WyaPVV
         cwgS8G7lGkqeuWeXbA02ot5LubTwZ09Auk7V2sHV+nKduJkZ8Zde6ctACZZSL92t+aob
         K3DlxmP3IxAIRRj3ZdNa291MtwIVdR+0UBRex/8Wm/nJBIPy3r5K37/dzABSyQKdT4Zg
         AiI9PQEGuxeRktwd2jlYliKU5h0xY4UkqI0MidRhA04JVDmY8Ct9j7YCmuS7MXnRrXIO
         +zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486590; x=1791091390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LdtVBZb95+RovFvrJA196wdeWE0eNSjJzFzGKIyBq+o=;
        b=eI/Hj4tmt1G4Vai3DdEUU9oJYGoR4yj+CltYLhukRRoYjveqGe7bp1nugo4T/5q/2J
         7rlTfc5WYAduM6vtXJvljaAW4YI9lS+cTa9mKbHDcYvMUNkKlWHdFQMRnCfQDunkwnAG
         OFsXrEWlZm3lGJHBttPbL5kzB2U/COoiRAGszdj5Z1/Wig81BeOpreYOhkCuW61q/oOC
         AcR3XQoeXa+EfLqvGItx8zqb2YHNCbgw9aKODyvca+D2M9hA7heYXd2Sw8cW5FbVY9Vt
         alNLffZ0F8IhUzCLlA6MI/vS2pqIDoZSQGMHl6GkXDUaD7IUAlemk3NTG0HtnfSVECaa
         rayw==
X-Gm-Message-State: AFuF++kCMzsED1tX29SG7y36IUZm5lVIGI09CjGXEkELMlXlBIDa9ZT5
	Mdz/yR7Fjo2rD9TFeGwlMyu/lXeehExIqM5DqqJmqO8TI44LwkPc2JJPs2D5Nwym
X-Gm-Gg: AYBFou1j8A7n6clJL3axPfzNkqbTlefEU9CQmlOigKrxuk5gbu/sPGbQ/PsKkSt5i5E
	a8ZqpSHp7Xu4lTemxNN/M5mjC+ijVdV37Vor2hrZ0EwD+BDrmoDv6WLG7+celBm70KK22syWlhZ
	FsESk96+2k4HPRSdH0unh4O+2oj9gGhD7Av72G4vfgvC26bGSiHFlmXCMvoVBXEq/Yq/GKueGu0
	so91qo/V3dqfqzajC/MYt9vE5Gkw6nLHbJzwm4lCgk3y6dCGW5KWWfB39WNE17CWqLdbpu4ZPsk
	Wj6wTeFJ0n8pP7JTFF+vWmhJ8K78kyg5k1f+TwlfW+cGUfR1Dvwm91CwCj/EjtWLv8Akgpx5sEx
	ihaJ4FnrmvFyKhxdCwgPDFbFyj06sLvYks1mbBsdKJeaosSJduQX/DFispnB6sPb8trb5zEsqrz
	Puu2l4+hXE1sA5KE1zPui/mx55ABlMwO/AGWErtgWm2m7aFwS3+rmw5g5QSdgMEPfW7Cp0gfT+G
	4STgmTwLVhbL7X21MqO7TwZgWceFyCrppNgr7rKX5sWlXmphLqTidkswBhj7Kv5v8xIQOym9AoX
	lh5f4beI731S4BCJKmS7ft6wgKYlThlBGkZxVqxXJCBrkbO5bUWD2wsiPQtQ7HJMNciDRxzvPWf
	uebZryAbT5zhyhJBgZzFHB1Le1/kCg1/idbBtJ2p8QzfcSEUoteyxC+HdmZbIG7flSihZbr1iGj
	Zr9VZCM4K35Aru0lCszTPURWIjslZ7K6fPw/WJh+b1/u5zQVVaqw==
X-Received: by 2002:a05:701b:454e:20b0:146:7648:619 with SMTP id a92af1059eb24-146ce67ee01mr4639728c88.6.1790486589500;
        Sat, 26 Sep 2026 22:23:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm15681596c88.0.2026.09.26.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:23:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] pocketpy: disable CMake Unity build to fix buildpaths QA warnings
Date: Sat, 26 Sep 2026 22:23:05 -0700
Message-ID: <20260927052306.2867689-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 05:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130333

pocketpy's upstream CMakeLists.txt defaults PK_BUILD_WITH_UNITY to ON
for CMake >= 3.16, which makes CMake generate a synthetic translation
unit (Unity/unity_pocketpy_c.c) that #includes every source file by
its absolute build-tree path. That generated file gets copied
verbatim into the pocketpy-src package's /usr/src/debug tree, so its
embedded paths trip the buildpaths QA check for both TMPDIR and the
build host's HOME directory.

Setting OEQA_BUILDPATHS_SKIP as suggested in the warning text would
only silence the HOME-directory half of the check; TMPDIR has no skip
mechanism in insane.bbclass and would keep firing. Instead, disable
the Unity build via -DPK_BUILD_WITH_UNITY=OFF so CMake emits normal
per-file translation units with no absolute paths in their contents.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
index 910deba386..7f3775941a 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
@@ -21,6 +21,7 @@ inherit cmake

 EXTRA_OECMAKE = "\
     -DPK_ENABLE_OS=ON \
+    -DPK_BUILD_WITH_UNITY=OFF \
 "

 CFLAGS += "-fPIC"

