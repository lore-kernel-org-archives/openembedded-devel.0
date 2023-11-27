Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106E3C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 16:48:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.99611.1701103696935330823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 08:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ATYDxEnj;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54af0eca12dso4490602a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701103695; x=1701708495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nooVGyfSkJxcL90J9qOvY75I1QyLVjBgsVFWNjVJRLc=;
        b=ATYDxEnjlBLVU3SdWyShZRYgC2cmG7Tmg52uD95S2gr1f6oNDGh0pYf5rUYOGPlYRn
         bhyh655+RRFQbaNox8w2JkKMWbOkEMf54lSclbOjlXgXMAKyK06PQKoDwPu+jS28fNsF
         VnLONWNo1+OH/SXrH3DEGEFSJNBNL5l27IcUs5lWkUlirdxmhW46kBkl/dLFoASaTzkZ
         sR93YzTC90nn2qyenPCgJUfMXoocWFMz6TrGmLWYuqVa9JPXV6B//3a0uFMwI0PFvT+E
         57nHc8MOh5HVxgxX5hOPf0bDcRlO4zR5vR/uWtA0TDLcKqeYWeXLgONYma8h/NqrSyxb
         5qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103695; x=1701708495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nooVGyfSkJxcL90J9qOvY75I1QyLVjBgsVFWNjVJRLc=;
        b=wScalaTQ3ds+cmaYce5FZqxgA7tf6HjguUofy+nYlVSTFArkWWSAnRnUW6r94T+4oU
         LERc3CqOjokj626kuvihcA/RckHwosJYzioU63H3aP/oWV41VgQsYMPWp8X2r0o2e6o4
         bYCG+dEa8sGQfS2jPlR+8iv010Ab5NvWPH8F44EhZt/5B0sr5qrrKxeE2zamA4yknQ6r
         3E28Tz12QX3E12cO/RrlMtm0N9/kAA7HpLM3oOxrwkhCrhX/1Pryl/9yEfkP+44nJecX
         7UZNalzQX1FAB4VD/bdvUfn2LcGtmwkHN5iwyy/ZAQtDQKgRg0rgFEMhCS8NiWkqMGr4
         Ooqg==
X-Gm-Message-State: AOJu0YwD7BjWYEv4QQw4HMpuWoDdy3QXPnwhBlqi0ihADMK7W49hussU
	aH8de2kTsLnrn1829oUKZ7Utxbl5C3lGSg==
X-Google-Smtp-Source: AGHT+IF/RllOby5naZaEwQFdN/G4HJmBWJqVAlfuOtvcwMIdv8MtpOJ6fK7TaFssIZNnob1jTHHPQA==
X-Received: by 2002:a17:906:194f:b0:a01:3df:a93a with SMTP id b15-20020a170906194f00b00a0103dfa93amr10093179eje.23.1701103694448;
        Mon, 27 Nov 2023 08:48:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id bj25-20020a170906b05900b009fea232316bsm5860910ejb.193.2023.11.27.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:48:14 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] squashfs-tools-ng: upgrade 1.1.4 -> 1.2.0
Date: Mon, 27 Nov 2023 19:47:59 +0300
Message-Id: <20231127164759.2203317-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 16:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107060

License-Update:

    Remove builtin copy of zlib

    On GNU/Linux, *BSD or MacOS we can simply use the system default
    library. The copy was primarily only there for the Windows build.

    The build script for Windows has now been adapted to download and
    compile a shared library from a tarball.

    This removes a huge chunk of code from the git tree as well as
    the release tarballs. Additionally it gets rid of iffy things like
    removing the Zlib copyright/version strings, so the libsquashfs DLL
    doesn't export it.

Changelog:

Added

    * Make it possible for gensquashfs to add xattrs from a description file
    * Make it possible for gensquashfs to specify file sorting order
    * Support . and .. directory browsing support in sqfs_dir_reader_t
    * Add sqfs_tree_node_get_path to libsquashfs

Fixed

    * Only use actually available CPUs in gensquashfs and tar2sqfs
    * Overzealous bounds check in the libsquashfs block processor (#110)
    * In sqfs_compressor_create, clear the output pointer on error (#110)
    * Typo in gensquashfs and tar2sqfs block count statistics (#108)
    * Hard link resolution: report error if path cannonicalization fails
    * Documentation: signedness of the directory header inode number
    * Seek position in libsquashfs meta data reader erroneously out-of-bounds
    * Memory leak in libfstree error path
    * Double-free in libfstree error path

Changed

    * Allow NULL pointer for sqfs_destroy, sqfs_dir_tree_destroy
    * Use 32 bit hard link counter in libfstree instead of just 16 bit
    * Internal cleanup and restructuring
    * Upgrade autotools version
    * Check in autogen.sh if the required tools are available
    * Trigger a build failure if no compressor library is available

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...uashfs-tools-ng_1.1.4.bb => squashfs-tools-ng_1.2.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/squashfs-tools-ng/{squashfs-tools-ng_1.1.4.bb => squashfs-tools-ng_1.2.0.bb} (86%)

diff --git a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb
similarity index 86%
rename from meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb
rename to meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb
index c57324d89..880af82bb 100644
--- a/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.1.4.bb
+++ b/meta-oe/recipes-devtools/squashfs-tools-ng/squashfs-tools-ng_1.2.0.bb
@@ -1,18 +1,17 @@
 SUMMARY = "New set of tools for working with SquashFS images"
 SECTION = "base"
-LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & MIT & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=5789fb0572753ed69014cd90a445cd74 \
+LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later & MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=a709b68f1ce8a9f10aeea6401446c1f4 \
                     file://licenses/GPLv3.txt;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://licenses/hash_table.txt;md5=874823605326caeaabaa95bfbd0f9fb0 \
                     file://licenses/LGPLv3.txt;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://licenses/LZ4.txt;md5=ebc2ea4814a64de7708f1571904b32cc \
                     file://licenses/xxhash.txt;md5=f042a9be092bd6d7fe6f217d8d00f4ca \
                     file://licenses/xz.txt;md5=1c389b9610ccfdb25f7abaea6a0bb5a4 \
-                    file://licenses/zlib.txt;md5=ae27c72096606131f760e5f59cf98b06 \
                     file://licenses/zstd.txt;md5=8df8137b630239cbdd4c0674124cb0c8 \
                     "
 
-SRCREV = "7667b84cc34707c28ca0db8d24f046ec34e8c25d"
+SRCREV = "f2a3ad56e40c9711b23371238f9fa07dd24245f1"
 SRC_URI = "git://github.com/AgentD/squashfs-tools-ng.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


