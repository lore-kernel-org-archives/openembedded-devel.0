Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8846CC83F2C
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 13:32:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.27501.1693747955756881362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 06:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UYP/XrL9;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so93068666b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693747954; x=1694352754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHvKODJxTlknl7AjtdX+5nukPOb5ahmUtLU+swULZpQ=;
        b=UYP/XrL9WnWHLgJyd0gHxFZb8dBG9j/xvFmxv5NHW4lR30mVyuu8BNB9B2kW9Ym1cF
         99oPBW5JHIHBnKmXQ5z9aOBZZ26qNp7UohLdHCESmUOpD284bh6oBDoU/R60SoXVKV92
         HOsfoXo6IpkQ/0AWcLPr4O+7EhX3Ys6uELdBJFa6YkdKv/rNxGCHSTae41bnoVJeBhGa
         6jcqUAmieKtaStOJsTp9LXolyZA9cjp3m8P18zW1DLxT5D0bpYuWMMm7423EcNf8sA+J
         GJRIGEpuMuXvru3O52liLewfE8V1TvIj29hdJTefe63CnxwaAK0zyMPZDgymvPSJgXuz
         64YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693747954; x=1694352754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHvKODJxTlknl7AjtdX+5nukPOb5ahmUtLU+swULZpQ=;
        b=aEb5zl68KtyjwJ+HYnukYSvHK26+nNwZDVDTl9HM2It2lF5GYzXaTwkO6k5bHpZGfI
         QNubo4hawRNld4DJJwdJkZpbryQWf3cH4w3OXAWy1W80foS34jHo6eC74edqiL9eoCxt
         1aM4PhlnBT+eu+SCbHjtGR+Y2rtMslPXGWRs36geRcIA8r9fsAeSwAXnY/ao7AqeP5pA
         0hpm4wgoXBiR8QPqrqYdXPvQ+C7ZUEbww9ri+4KZ6xVq1VpJcpVMSPqtVlTl7OEYqe5U
         3YC2fesJf5sN/hkbV4HCKNLkCjjzXeVcqe02xwPNf/Deqtj+z0cMsHwGB9cJTGaU1mKH
         iI7Q==
X-Gm-Message-State: AOJu0YwkYwKq+sgKrQQa9GM7faAivYK+XTjAoWDpNQlaDVF4FX74g6kr
	DlukL8ajSuE8qtbKSFZLwKoZILi1388=
X-Google-Smtp-Source: AGHT+IHD715UmqqkYZ59g/TuFY0dOZQdf/vGibQJrQtsQIxpk/SPxcK4JfZFDJAe+Ld+EAWPqdlXXg==
X-Received: by 2002:a17:906:5db4:b0:9a1:e011:1a62 with SMTP id n20-20020a1709065db400b009a1e0111a62mr4784227ejv.38.1693747953698;
        Sun, 03 Sep 2023 06:32:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q8-20020a170906940800b00988c0c175c6sm4785965ejx.189.2023.09.03.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 06:32:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] mongodb: enable hardware crc32 only with crc in TUNE_FEATURES
Date: Sun,  3 Sep 2023 15:32:09 +0200
Message-ID: <20230903133212.455899-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104697

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
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_gi=
t.bb
index 0ce58b13c4..21c3b10148 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -91,6 +91,7 @@ EXTRA_OESCONS =3D "PREFIX=3D${prefix} \
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


