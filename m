Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DA1CA0FF3
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:02:42 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.20567.1693918960798270380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=exKoRKLE;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so3368597a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693918959; x=1694523759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yE2SUmxrTI9ppQ26BtKAG0F6k2koMh5wjx7C/wim3cA=;
        b=exKoRKLEwv2jD9HwveUGChyN+PYTPSWDhkfRVWhUcGA0gmcDs5agPJcQFDWS5+SQ9g
         N7NlLLPGvUhvJbxvIYC0wa+xCXTdkmaDnANbPhHyLGy7jXaVcEtuKj1ocpaTIvAfafZC
         /7kAdA/1wURxVH72nGEtGIy+twmjCpeQBlFtafEXQ7Ri25zTO9Yr2VOF2+vB7lw9v7zp
         t7pXkxBL+NCJ+yhK3OTCK0bYg7qdXFPZByhvQgkWJD66bDo38To3WUIXDLp+ae1ZgHOp
         ZlMEhbVdLJ068JB08CKJmEqqD/QrJmMWj6YiEgHNqsfwlgvfFYEyhR+N+OBnXcVuLGsG
         OVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693918959; x=1694523759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE2SUmxrTI9ppQ26BtKAG0F6k2koMh5wjx7C/wim3cA=;
        b=iQ+ZQxj/2/t17u25LaXHVgaZFstmivOgs077TtlX0hkZ6mZAifnB5ISasZffXyPQqk
         DqgUP0tl5N9sCUQM5lmtd2WNJtDA/s93lx4JMF3fdQVzmsgA0HeGycmCv4qLH1tn3s1k
         oGhs5gjyT1fv2bB/sUGV45dkQuTF9dmI11yop0OIqtBOOjoCRp92vWkFF3XBXB7z48rm
         EtEs49ROsD1QZKAVOdApLe/rtSya/qN7T1Kg3V15CjsWO/8Asux6Jxvn5mcYXDM+mcnc
         dPvwhkMLTiibE9ef1+y26j/zW7TKpapCBNDL3vyuP01MBuE2iAoqXQUQ5aPpKryYYt7m
         SoYw==
X-Gm-Message-State: AOJu0YzDOUA06ztwop2aDfM1SgoSTT3YmsbNZCbabM9BNdxNxprfry8V
	tkqow5CtkLUzUYDQQieZ0MqERqUq+1c=
X-Google-Smtp-Source: AGHT+IHtOKWJv2hTri3Rfc/wKihjsVKMvOA9vxicEv4O3XkKQyLgefKlJCJucpIOADB1Sc3soTXBUA==
X-Received: by 2002:a05:6402:6d3:b0:522:20a0:7eb8 with SMTP id n19-20020a05640206d300b0052220a07eb8mr9571601edy.33.1693918958974;
        Tue, 05 Sep 2023 06:02:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b0052333d7e320sm7007282eds.27.2023.09.05.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 06:02:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 1/4] mongodb: enable hardware crc32 only with crc in TUNE_FEATURES
Date: Tue,  5 Sep 2023 15:02:19 +0200
Message-ID: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 13:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104722

From: Martin Jansa <martin.jansa@gmail.com>

* see https://jira.mongodb.org/browse/SERVER-30893

* fixes:
  aarch64-oe-linux-gcc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type -=
-sysroot=3DTOPDIR/BUILD/work/mach-oe-linux/mongodb/4.4.13-r0/recipe-sysroot=
 -o build/opt/third_party/wiredtiger/src/checksum/arm64/crc32-arm64.o -c -s=
td=3Dc11 -fno-omit-frame-pointer -fno-strict-aliasing -fasynchronous-unwind=
-tables -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid-=
pch -O2 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-dec=
larations -Wno-unused-const-variable -Wno-unused-but-set-variable -Wno-miss=
ing-braces -Wno-exceptions -fstack-protector-strong -fPIE -DNDEBUG -D_XOPEN=
_SOURCE=3D700 -D_GNU_SOURCE -D_FORTIFY_SOURCE=3D2 -DBOOST_THREAD_VERSION=3D=
5 -DBOOST_THREAD_USES_DATETIME -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_MATH_NO=
_LONG_DOUBLE_MATH_FUNCTIONS -DBOOST_ENABLE_ASSERT_DEBUG_HANDLER -DBOOST_LOG=
_NO_SHORTHAND_NAMES -DBOOST_LOG_USE_NATIVE_SYSLOG -DBOOST_LOG_WITHOUT_THREA=
D_ATTR -DABSL_FORCE_ALIGNED_ACCESS -DHAVE_VERBOSE -DHAVE_FALLOCATE -DHAVE_S=
YNC_FILE_RANGE -DHAVE_ARM_NEON_INTRIN_H -D_GNU_SOURCE -DHAVE_BUILTIN_EXTENS=
ION_ZLIB -DHAVE_BUILTIN_EXTENSION_SNAPPY -DHAVE_BUILTIN_EXTENSION_ZSTD -Isr=
c/third_party/zstandard-1.4.3/zstd/lib -Isrc/third_party/snappy-1.1.7 -Ibui=
ld/opt/third_party/wiredtiger -Isrc/third_party/wiredtiger -Ibuild/opt/thir=
d_party/wiredtiger/src/include -Isrc/third_party/wiredtiger/src/include -Ib=
uild/opt/third_party/wiredtiger/build_linux -Isrc/third_party/wiredtiger/bu=
ild_linux src/third_party/wiredtiger/src/checksum/arm64/crc32-arm64.c
  cc1: warning: command-line option '-Wno-exceptions' is valid for C++/ObjC=
++ but not for C
  /tmp/ccGvwFgu.s: Assembler messages:
  /tmp/ccGvwFgu.s:45: Error: selected processor does not support `crc32cb w=
2,w2,w3'
  /tmp/ccGvwFgu.s:77: Error: selected processor does not support `crc32cx w=
2,w2,x4'
  /tmp/ccGvwFgu.s:103: Error: selected processor does not support `crc32cb =
w2,w2,w0'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 550fbc30d3..61f3c2df52 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -94,6 +94,7 @@ EXTRA_OESCONS =3D "PREFIX=3D${prefix} \
                  --use-system-zlib \
                  --nostrip \
                  --endian=3D${@oe.utils.conditional('SITEINFO_ENDIANNESS',=
 'le', 'little', 'big', d)} \
+                 --use-hardware-crc32=3D${@bb.utils.contains('TUNE_FEATURE=
S', 'crc', 'on', 'off', d)} \
                  --wiredtiger=3D'${WIREDTIGER}' \
                  --separate-debug \
                  ${PACKAGECONFIG_CONFARGS}"
--=20
2.42.0


