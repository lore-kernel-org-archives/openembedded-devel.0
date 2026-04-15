Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31CCF42131
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:21:50 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1941.1776277305721844925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H7y/1DlJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: mail2szahir@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so7168380a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 11:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277305; x=1776882105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4lfHkZFVyX24Mf5KkC7VHQVvgMGQch85xKmmF0fio0=;
        b=H7y/1DlJLdB5jhToRLXoE5KDuYavOpGGMwAU4l1/sNIfxCq9HMLPl0PxUNI0uhOXoT
         D5eEB8QLeVf3fdfy+aUrRY9eDHJTeuTFo5gbgGDs5RRiYB0JCNGfwKz1BhzU35lAq6PH
         zuiX+ARk2WE1pgJi/rDBTa74ZwLmwdU9GkATN+shp/MUyPeEHUWRBVdFjy+zBSj8loio
         c1vmki3NbboGHQ5qnjraaxpBL/YaptKG+vcBQfvNQyEhsSqCnlwBvctMvsLCZO2WweCq
         4IRUM8ggHQqjcQUS2EfHGEC2Kngv0MEbWU7sa/e4+O0ta3R3H/5ianKttYB+8m49Mkax
         ndow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277305; x=1776882105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4lfHkZFVyX24Mf5KkC7VHQVvgMGQch85xKmmF0fio0=;
        b=dqQ2Xhume6waL2nCux+NucgbGHtYdEum24gCoLd+nlCiRiQrjpwNQFoq11s4hSyItl
         FST1F5zyo7gOzK94OC/UxsloLzujbogivVfJPp2zWYHKM4HwyzTA65K0t1aKbEkUSEdV
         ZDwf1rXkg7Losy38MXyIK4v2OyXInWTycD3T4NtsFhYiZfOT8Cz1pwO9mNNMTiZB120C
         okPrDGbdOCYBCArXX/sEVBt4mxpsQKtP1hlLnnGd53LkXfw2xfWowj7J2Ep/RtZtq89a
         tlsWgWmIlLcjC45HFCqOTrMJU2qgRuvXHX/PdEaE3W/z7+yyAhLwtukJKYd/F3loZYU5
         fWtQ==
X-Gm-Message-State: AOJu0YzE8cVBvryJTJNYRRUL8Ue/ZDyqSlxw4RkMPJqDf7b6xALXGOjD
	2A07uPH5ycMNBYjFsHsQ5mkkllUeo9OOK/WG7p2gMzXShn9RAh1EG6OeMfXXrA==
X-Gm-Gg: AeBDievFokTrfeGnjPA7y2tojBWlvxaUkPwOQ9/JxAvjm21560UJh8RNzpMjUsgxWVO
	hJtHOgH8OPyLOfpFaT4IOItZfipRjlca/ef3FxZZ4IRI8qCu8kzVED2GuP4uZZerf0UC/YjYXyq
	xdQO4BKdpQUxCGAQt6SyFwwBPfnIO44kO78sAYK6rh0ZivE3eckPujlLAkSyqHMPMSDMoCbloNC
	OhC0US8vMcJeaARhiN+FPc/ucaRnxkcMrGjVHVAW6iujQkbU6L8tug4qVH8iKSmetL+oEdGHQWs
	Sk/ZaB5rDaoBO/7/JGTRB4RtxNOSnP0tfRDbY3ILi3OFBfmyhcaYFHrsL9ksoYiy9u+VL4p9qVk
	8yf8mezixTUQmLFrCnNGbw9JF54roFr0TPIKhXdLLUhz+9lplt23dTRZh52yW18BCwhrO3/75WT
	4i9oxZZC/InvfbtVIOjR03mm5uQxaPFZKbOxUIleosa3ncn8HQCZZC3Nk5
X-Received: by 2002:a17:90b:2d8d:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-35fbb33da40mr12480227a91.11.1776277304812;
        Wed, 15 Apr 2026 11:21:44 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd2101cf1sm4113599a91.15.2026.04.15.11.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:21:44 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [meta-oe][kirkstone][PATCH] rocksdb: remove rocksdb_static from default PACKAGECONFIG
Date: Wed, 15 Apr 2026 23:50:40 +0530
Message-Id: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126370

From: Zahir Hussain <zahir.basha@kpit.com>

In our previous commit
https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=33822593e5aed47f619a385579a47c366859408a

While adding the packageconfig knob for static library generation,
rocksdb_static was mistakenly included in the default PACKAGECONFIG list.

Remove it from the defaults so that the static library is not built
unless explicitly enabled by the user.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 7bfe157c1f..7e39928bec 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -31,7 +31,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake ptest
 
-PACKAGECONFIG ??= "bzip2 zlib lz4 gflagsi rocksdb_static"
+PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
 PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
-- 
2.34.1


