Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29BECAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:21:36 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.4905.1758781287594978761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 23:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGU2G4VW;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42575d46250so5484845ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 23:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758781286; x=1759386086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tY7VD/2JQlrmgOiLl/D+sK3zVPwk3nfYeMyZlHpvE8=;
        b=gGU2G4VWpmizAJC6ooKjjkfP7iSY6D1xlplLZRy3AwHjzbUAXgqb2ChiuFeLmI1CJe
         s/jAo9C1jF14MHOjoV22aSpTjqv6dQBDkwfqb+u6+QBbo+jg7//TSgwVJWsKWd2o1vLn
         mKYMCkey0mA/KQk9pFm0FMAf0SVdaBue6RqydSFn24EiYUgq3OwqZI1YyvTOupt9LTxN
         LNeYB1fc7/XhhM0In93kiJrdRBIV4ATQHo2wtijATBcIzlxzT1uvBcFN1x3+bTvP/rcV
         F1yHodBohOxp+k8aj1mEdPf8dxj9OP1Eetv1bfKWPXhjbNMwlt9dLEHEmc0tax6NXrYJ
         xlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781286; x=1759386086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tY7VD/2JQlrmgOiLl/D+sK3zVPwk3nfYeMyZlHpvE8=;
        b=qCMGOFvTTFx719R3gmwnDKScoavkr3xqgfkpvsF70Q1wAexT3w/Jrv/RdvWmKcJhOR
         vmhaKdzIOVwcoFEvr/uXmzFYmp7GZ72XhAKOTVJ1vm0QYFriG1KmMNg0MiqQWfk/GjlD
         r6lT644tyB8zCu/ede8VGvyzn5c25cp8jHWiJ88b9dz9ckDTrrfZrdqdUp0j9N4OeZuA
         vRDuY+wph+JV/8YL/03BuBEul04cISGoowEf/+9kUrBlsFoqM7MSe6NxpUmYco3Gcmzr
         XZJyoyuxGwgAO4OMzn9+/JMXQG5cxkNZgVilH1Ya18oRjUmavGFQM/LA3srTFtz/cVuG
         cRUw==
X-Gm-Message-State: AOJu0Yy34CE4zSINmJwPle0EpyIiZpQcjeGPAzp4uZ38VnV19cGKdP3m
	N0MjyEJQ6H8XjtDjvDmH9nMxPSVzEKOO47shWSF3ZunfRKYk8uY3Z9W1ynv7Kg==
X-Gm-Gg: ASbGncuiRvKoV0VJRA8dHNB3Jk80Vjhmo0JkpEX5CKVcjAF5wP9Z5SLkBspetrgBuTy
	SYr43zMM0+THy11pc7adJmbgJSwq0Ea4rf6EK2oS2MIkfRSMs+qOZh0dZih4zi8wq7KJYehZ1l4
	VEE9m6vcQ1/A1Ja/jhZBNN6VljUeXuHIoZBosZ6PxiNIAFcuZFoeIWzU6h9tJzxAHWeDW1+UEJ5
	rB0bLgf3iQs8OYd1VlOch/ge5963y/Oj0dhQ+GP5dsns0p+iu/tdC51TkgndSgqn/oFU2Ebj+Ws
	RmWVG5yZphBgyEtQFHxUVt/IPXLb1Lr23MjH9YCi0AhR/QLyG8XWsvXOBzr1VtbfErBh6GbWAVc
	fnkCXH2wshlb7wBkpu1+Fcv6+ze+76zPGc+TmDx8oznX3CGcJQ8Ve
X-Google-Smtp-Source: AGHT+IFfpAISr+cl2OlCms6i7F2q6H9qFTuwXK6TPdcp8lKNHvRH67xAt033hfHzTIOYxoN5XO8bog==
X-Received: by 2002:a05:6e02:1a09:b0:425:84b6:a7ff with SMTP id e9e14a558f8ab-425955ed620mr38647075ab.6.1758781286545;
        Wed, 24 Sep 2025 23:21:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c016c6d8sm5560055ab.38.2025.09.24.23.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:21:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH v2 1/3] bolt: upgrade 0.9.6 -> 0.9.10
Date: Thu, 25 Sep 2025 18:21:09 +1200
Message-ID: <20250925062111.240262-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
References: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 06:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119850

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix bolt exits when opening an empty version file
- Fix failure on integration test due to the change of the latest pygobject
- Several CI improvements and fixes.
- Fixed memory leak in boltctl
- The unused codes were removed from daemon
- Fixed a NULL syspath variable causes SIGSEGV
- A new NHI for REMBRANDT.
- CI fixes.
- Don't install an empty DB directory.
- Fixed: Determine the string length before writing file.
- Fixed: Free on error to prevent resource leak.
- Add a 'nopcie' security level since some devices report 'nopcie' when Thunderbolt
  is disabled through BIOS setting.
- Markdown lint styling is used for documents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 98969e3b441183ae8bb0c30258cbe5377c18d979)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
similarity index 92%
rename from meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
rename to meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
index c278a0982a..2e7237bd8b 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
@@ -8,7 +8,7 @@ DEPENDS = "udev polkit dbus"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
-SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
+SRCREV = "c0d4cb2f4399e86417907a37c0d8ef3bb9fb406f"
 
 S = "${WORKDIR}/git"
 

