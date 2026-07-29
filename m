Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6079C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:05:02 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5301.1785305101080332250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=URvXY/ze;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso304317a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 23:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305100; x=1785909900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dny6UnD7bXb2RM7+nzPHHnYNb8oF9/OIdAuOfCw7ur4=;
        b=URvXY/zeqyG0Jx8SjWEzck4nJGAEUDxftIZjfIKiDLD4nWo9bjOeqZGHmfXUbBPrxe
         vEOEDh1+Pmz4u0NenjmW+vEVEx+Y/5kylQojs7jAt2YBOepCWDTdWNze2nCzBAELaoGq
         BzKd4sqyD4+O3bVOB5sfL5nLeNchd0ujJK5133oMXrrRHT/67XPz3GRst5+qQGB9Lf5W
         vTOx7FtIyno6uNoZClXHb/RrGC4AAjNyskGoM8G9ZSwmbmWlNL+oA3aqTnsONhj0onjS
         5gU1FfSOJNQ/6byDIh4dryVPF+/3lSu87nJKNyUowA22E8xSxg/lagYMecxff9616gLn
         47ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305100; x=1785909900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dny6UnD7bXb2RM7+nzPHHnYNb8oF9/OIdAuOfCw7ur4=;
        b=K8+HyeG4T7FY6QXUnTvmc91TtiGwSp0NoccDLml9Xt22sjI5Kv/pVMJyMK5UsjuKhB
         HVxEVCysDtru89Hr87CcfNalglzy3W+fspJMecVAwM8XuwHKYlih+YOiYd2rrp4i2nnT
         8lf1KMUOS9eeEWXastJUPO9KE+XQqHbKeCWobvYBNMMC4ZWIYgV0CFmaq9BCa+glB2GW
         p/8lpBsC4rD/Yiv8cpou9MBtS9v1yU4ouoR0/Ox5fzRHlyY+wGLd3prtu865g8/zgKTf
         /aItrVhdbmraTAyKEQpjcox66B/XJHclsUXV01pm+R1iv4XPsYJmBTuRBwmOI2vk52pa
         A6yg==
X-Gm-Message-State: AOJu0YyQNF/kePbqH+DXvJOmJ7q43KWv2dbPojwSMULIxLVXdAVTGSjt
	0VGhIOvOBBbY7irRNZDyduemJ6fFLgcPc50jVGXzMlz43PCP9OR9ffF1CulouVLN
X-Gm-Gg: AR+sD132ja7OjFkYLmXpY32EpnQbrR535ArOndG2nKZrUEP/KBCj8VqgwTaZIwUSrLk
	LLPaMtOy7O7cxepjVNpK1TJlR7GEDCVv5VsUmOh2gi30Z4uQ+MUA1VAIKwle/iR2p7bqBt6LebB
	Pc5m8BwYV/5D5tANv5pXF3gctUOVJuqqFyCA8rntk92dp733lmlH4F9CF8VzsBlGO0RK9HEAaRh
	ZIHQcRpjAld6Is5u4KKyAmBFryhXj0hhpVcu2EWrhPxiXyq2FULJfCi8AqBz5An7M4iknq1dfhx
	BNl0GmWYfjs01YjwECS1dbjJnMAoHlZ6rxWnD7j1Gp2CuI8CtvJK5kvzXigEGWCH/44Y4JCn981
	Uw9Cna1MKvGWL/BNR5GVP127f6aFHM6j41NzjWsoLKqdhmCm1e2xtTzyjEQO3J5+kHNZZu0zp6F
	tJAmIZinDy4vbEai1tmJ+VIkcw7Q/3nptPWscDqNR9KhOw09mbKBEqWdnP0lslrg/OE6LneA7+i
	0eisn3125IypFCx+N34CSqsuxPOKL/Dblh5efeEv+846iQrlDBhSdjzE93Xh3SRPTxPjL156pPk
	csB4jlAWUZ/z9YltQfBdcjqmWrmPi8eRaGqtLpX6KZuwTX/tKWuC921zsB5I8rPyyfVbdaox2Gd
	Pig==
X-Received: by 2002:a17:90b:5104:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38f6a44b7c9mr5435749a91.36.1785305100220;
        Tue, 28 Jul 2026 23:05:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm2278342a91.5.2026.07.28.23.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:04:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 2/5] yaffs2-utils: update to latest git (20221209 -> 20260629)
Date: Tue, 28 Jul 2026 23:04:52 -0700
Message-ID: <20260729060455.3993973-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
References: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128545

Advance the SRCREV by 14 commits to the current master tip
(474b3acb, committed 2026-06-29) and bump PV to that commit date per
the recipe's date-based versioning convention.

Notable changes in this range (Aleph One / Charles Manning):
 * yaffs_guts.c: fix the size of the allocated buffer for unmanaged
   buffers (real bugfix).
 * Fully deinitialise the cache when unmounting (real bugfix).
 * yaffs_guts.c: use AND instead of remainder for hash calculation.
 * Move Linux attribute handling out of the core into
   yaffs_linux_attribs.c (affects only the out-of-tree kernel module,
   which this recipe does not build).
 * Remove K&R function declarations, silence gcc warnings on the dtest
   filename array, several benign typo/whitespace cleanups, and
   power-fail stress-test reporting improvements.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index d30309a95a..38165387f4 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=11;endline=13;md5=5f5
                     "
 
 # The commit date of SRCREV
-PV = "20221209"
+PV = "20260629"
 
 DEPENDS = "mtd-utils"
 
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
            file://0004-utils-Makefile-fix-symbolic-links.patch \
            "
 
-SRCREV = "68030683543cccb4d942e3fedbcad1dc267e261c"
+SRCREV = "474b3acb927d27b2305618aaf24456b9d33fe91b"
 
 UPSTREAM_CHECK_COMMITS = "1"
 

