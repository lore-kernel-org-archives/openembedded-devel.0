Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229A7EC0467
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14348.1772529599230581849
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jyGCYOFq;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8274936d2c0so5350532b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529598; x=1773134398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFsjIYtUjSLKQuOqFwuL0pOJAEBk11zCY70OgOs/BVo=;
        b=jyGCYOFqxLRIe+Bdtosqz9AhqRI5g1uXpFhsIMfK2Qn9Sf1E+ubvgwwe6278lcEIXr
         Qiit180orjSeervSFDYpuqYHp3B36XLmn5/DY8CC/Y+rH6Ovmwiwq8T6WRPM761Zopb9
         /YIYSEtEcBKd4VuYVPQ3DTdaoVJmmHDSzrLh/QnBpI2XP+jNoQoX9u3vsDjt8du4ZK0j
         FJte6B0r11oe7o1YaRz/e5oANxY/tTwuFJ5JzPn8bD62gJJ6/YqgJvJzV1pacj0m+NVI
         PkDaMPE90z9GVO6I1DotnFgkoJdKokoAHAxnioaUuHRH3Rq6a4NohvvhY5GDg1EnsK9p
         Qnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529598; x=1773134398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFsjIYtUjSLKQuOqFwuL0pOJAEBk11zCY70OgOs/BVo=;
        b=ahOybMtJeHhRIe140KN6gtKbMZUmigAzxAanmKB1vqCqi5iO5KFacaMikTZQrGcIGV
         WGTdYMyudnc6QyUeTyJpfaxQShuPbL9BhaSw8D6AcSDCInzDuaD+04mdxbuF2myyjegl
         XOnMWKB2FZgkX+R4zu7Mnkq+QTqlw7qtZ/3C0GTOTkU4ZX3F2/2HDU0tjNHlydw5SReb
         un8cpx991jlbJ1VTMyDYx5UNC9ZXHqqhZ6DiD4i5ebA38Ksnl+pTobXnTli3Niu7qvaY
         J7+U9YXFku4PZTLCLHWHCpH4SuxQMGf3F3TT1zwv2EemSnFx4o/Si92MJLttavD4WaQD
         El0g==
X-Gm-Message-State: AOJu0Yz5pn0J3iEQypbm/I7QQ8W+GQxtL3njp14DbY81s9Lnwp0DY+IR
	3qI+fyIh7lP96wcQUPplVT/QloivhvH/W0oupp4VIPQpFuZeG5qikX7a5YhYkQ==
X-Gm-Gg: ATEYQzzpzWteViMDYEkF9edgjCc3u8aUnf2c3iFuqmjZm1MKtPAydMI/2XLW2O9LuDw
	2HkCSpCapdG4mMm2It0jX3g/wNlROT5ELkO9jMY9uVgqOHs/mo40VFQ/nn94E8YDuD4nd6H3UO8
	Mwh/ergI3all/aNvKMeENMc17WqHOG1E2VAL17Uy6qLDfxBNAZzW6OwfM/Gz2s+wbr2gtgheu4D
	CLHtoTq5io/JFdWamxfcQi8vgYgmgwUzem8p5n88vXA7caEaybXwlw5XPuqR5TTl3ixlE7jkcDF
	osG/VsWBmnFsoriR+PADfPedI4YcNN9uXLmqEufJ0NtQ9xpBJ69h8iffUFKBnxj1DoFoRpKZ5dj
	UHhkb9gr7GykLU3dQbT2vDAYZn1S16N3fz957vHo/O1Gwyg48dzP7PHUbfgD351LkuhyvgaGzdw
	Lt+Bz8XAFmxJ+peTrE7NZ7kOmgdtg05oTduA==
X-Received: by 2002:a05:6a00:32c4:b0:81f:3e3e:c1fd with SMTP id d2e1a72fcca58-8274d9082f2mr15097619b3a.5.1772529598308;
        Tue, 03 Mar 2026 01:19:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05e831sm15677859b3a.58.2026.03.03.01.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:19:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 1/3] python3-sqlparse: upgrade 0.5.4 -> 0.5.5
Date: Tue,  3 Mar 2026 22:19:39 +1300
Message-ID: <20260303091948.3532301-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 09:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124827

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix DoS protection to raise SQLParseError instead of silently returning None
  when grouping limits are exceeded
* Fix splitting of BEGIN TRANSACTION statements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 48617f70328d1a2abc2787594df028a3031e5268)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index d8c3bc0ed7..1e7f3c1ae0 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
+SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e"
 
 export BUILD_SYS
 export HOST_SYS

