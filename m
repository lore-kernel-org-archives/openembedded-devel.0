Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB45EC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:46:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.648.1647456369195540028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eEKtIazf;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id o23so849293pgk.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8K1qXepaNnHrdAu9lw27BbTtlXa/Cum2p6T0gu1bZU=;
        b=eEKtIazf33A8ZYg1HXBCDtyoSgtojlXf3wjSAbhLvQBjMZ7khg98Tph2BvYoitUbnm
         jA7JY0DwxRCOdmQoDtvWpdv4zP6XDXKLh9t+WzMT6NjdEnQiGUqE4P2gwAVa+VYFKSBO
         h6s9YOPU1f1j8t05kgPdCgROy8H5J+JHicOyjymRaGEYjNbUgig7BXPaD8PbCMDQH2mD
         3Lw46a41r8C1mN2+5EHWHPSY+RFOvBbrzRKANotqfKwiFlNehJ4joHNfmdwR9tgXsJD8
         ZxAHsCbGtDguiVXcNqpEIJ66xM+JTfrnhJsMBqPPmiHSl/1cqF62OrtW9vSa6vtI1nu/
         MKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8K1qXepaNnHrdAu9lw27BbTtlXa/Cum2p6T0gu1bZU=;
        b=N2HHFyDV4BQxZxGD2mQuabO78PgN6SPBrrmrPfcoceNSl9V2aZBTlih/qvvtSQuBQb
         27Y1O8z7bKqVoVo6zZncs0jH1vABKvkYlYtqfnS4v2b7OwDOPO6+nwI90uLKXYB3M3la
         eOxpwX0EgnPtEweK6vTF01eZhe5dY2vjH3YYOYGbugAmQDnkXD7TNbR8byPpVYBS0Jgk
         9lw2mpvacgqvqocpBQQkgq4ID4n1VCL1m17EpjeW+fMv55cdaa1E0n0gTAYPB6/I9vRW
         ZyyLyqaeycu0SJCG0s6FsNwes0EVodceHSeI5yszPCQp9EqbWEJU668bdo90yNl3yEd/
         1A8A==
X-Gm-Message-State: AOAM532FjxeV5ULRzQkmyT4gQab7pwX89VDrE99O00MDjyGb+spvYuJN
	/AH7g5Vw09WfEhzdCnYBu20Dzl2IbbCBuw==
X-Google-Smtp-Source: 
 ABdhPJw/dYWdjkMTz7VyUaGDMDFMPW79rVmEMliukKamxml/rSOJzRMX54tu3YTHCkwBPuSkKzVEIw==
X-Received: by 2002:a63:874a:0:b0:37c:7fab:50fe with SMTP id
 i71-20020a63874a000000b0037c7fab50femr724276pge.93.1647456368296;
        Wed, 16 Mar 2022 11:46:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f7ba8b445asm4078949pfv.65.2022.03.16.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 11:46:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-kiwisolver: Upgrade to 1.4.0
Date: Wed, 16 Mar 2022 11:46:05 -0700
Message-Id: <20220316184605.3280922-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 18:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96025

License-Update: There is separate License file now so use that for
checksums

use setuptools_build_meta since normal setuptools3 bbclass ends up
in errors

| distutils.errors.DistutilsError: Command '['/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux-musl/python3-kiwisolver/1.4.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m
', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpmeo45wf4', '--quiet', 'cppy>=1.2.0']' returned non-zero exit status 1.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.

Release is here [1]

[1] https://github.com/nucleic/kiwi/releases/tag/1.4.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hon3-kiwisolver_1.3.2.bb => python3-kiwisolver_1.4.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.3.2.bb => python3-kiwisolver_1.4.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
index dac6cd48b9..0f343b2fdd 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A fast implementation of the Cassowary constraint solver"
 HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
 
-SRC_URI[sha256sum] = "fc4453705b81d03568d5b808ad8f09c77c47534f6ac2e72e733f9ca4714aa75c"
+SRC_URI[sha256sum] = "7508b01e211178a85d21f1f87029846b77b2404a4c68cbd14748d4d4142fa3b8"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 DEPENDS += "\
     python3-cppy-native \
-- 
2.35.1


