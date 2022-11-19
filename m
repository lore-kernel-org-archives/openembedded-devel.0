Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBB3C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.23273.1668873494372322638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cW05gOxO;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id e15so4957233qts.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0krvhMkswRAAo/h2dnbIZ2RNZppt3JlKgP8FjgCcCP8=;
        b=cW05gOxOUKGUAOsqZ/4SelOtypgBxoNwswvg7v4/r4K3rEIgdN5C6WP1CAyrmip0p/
         245ywWMldkJuxPjiur+y0z+xeEZ1gVP2jo9XU0zp0YQq+MWnNBs8U3t9SWI+AGKtOVL4
         2D6iqgIsfDgUtIdW40XAje1gKpvGt6VFsoUosngD9rFwttbeU8v6x2ffZpjvKhbt9WI8
         +MYGAaPxO7ZkWlRrDNobSbollLq/UlzhHI2RWXV7pJPD7V96ZObRrQkjU9pHHu+wgJqm
         iKR3lgzys5WBTCBx5WexGWEH6DOL0cjUYUg830gR7TyiZ/Hu5uYt6owdvQYNSiZmaUrI
         eTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0krvhMkswRAAo/h2dnbIZ2RNZppt3JlKgP8FjgCcCP8=;
        b=2CUyAXZvZaqMp05GH+TCHGhGheDV3bWzyu18WMvJHbsSrZN8KXHzdM4D3rOCJK83eV
         P0t4t+Yg3YRdsLtkYhg4our8QiWYJFvVOGTy2L9askre1ydJlFhidZVB7vmUvjR5e+9G
         PqexAPzK7yJVWaj8sSUReeSGF1HoxIKLoSum4o1uccz2GcBm7Po0KSJiR4yrtFZsxMYI
         EMSXs8HONUv7ae2cJlwWpd4ImDd6qx/rZhz7zBK+F5yzcobod+UEAA1LjvlRhzev/R+o
         ib4h06VUmtDfCpbxZbAY8W2EmxyDqf9npungk05g7DcENk219FS8GBfgYIQfYIVA1l96
         4FFg==
X-Gm-Message-State: ANoB5pkh4r7ZMaIvNlmyrWKWHcq7oLBzoM8KYwn/YpweteXd+IURNL6a
	MLjOEa8mDeHWF7PCS9w2THPChW0gO+3b8A==
X-Google-Smtp-Source: AA0mqf4VcOS3lWFB2BCqksiFHCiW0uvR4ZRMtRhs6LKNADiZ5YN0OjwTNHw/dbt4ONlpTmQ3oeBbEg==
X-Received: by 2002:ac8:5ecd:0:b0:3a5:9724:695c with SMTP id s13-20020ac85ecd000000b003a59724695cmr10882130qtx.510.1668873493089;
        Sat, 19 Nov 2022 07:58:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 08/35] makedumpfile: upgrade 1.7.1 -> 1.7.2
Date: Sat, 19 Nov 2022 10:57:32 -0500
Message-Id: <ec2fa6cd4758e0909398b1e0cc38e230cde7d172.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- LoongArch64 architecture support
- Support kernels up to v6.0 (x86_64)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9712b6ea416fb359fb72d8f74f165bec1177da16)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{makedumpfile_1.7.1.bb => makedumpfile_1.7.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.1.bb => makedumpfile_1.7.2.bb} (96%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
similarity index 96%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
index eb004c2ed5..1c3538a3da 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "74bbdd14ec861552ace1ca63953eb2ef73e1f965"
+SRCREV = "9fefc6848d0b3765760e709cfe92fb9d76d5d452"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.25.1


