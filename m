Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FEFEB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 19:56:39 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.153.1687982192969203168
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 12:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=i8jiXXD1;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so7784723a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687982191; x=1690574191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKlvjeBVWFm611eUw9HMp5LOXc4fLX4kPkbQd6yTN88=;
        b=i8jiXXD16G8IRU8wrG+BD4BaNxTQc/SvAbGmnMM3W7Iq1qMhO3rxmfh5GLuUPj0PQi
         cu7DScOMeOd8Gafr6VOOUJHybsH7VOU8R+FkpnLgvN2pILxWNEIA8YPUzUVlTlXOg3zp
         bdywuuhiykoDod0fcLc5mE0NclfZHC9EB5vIfilI2n8k5lByuBaJpSE1fZXtT+wh6ty7
         BA3ss1rLTVa8hZqv9ZzfkJhRADs9aZQcu/3AZsHx40qaYLGyd1It4FaaoGp/oiaKAewk
         PgVpWu7jFi02cPNe0uXt4OdNGYDblzX9NAjYzHKpcDb9c5zJD3UBYhAO8u6i8KSUZZ2z
         Trvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982191; x=1690574191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKlvjeBVWFm611eUw9HMp5LOXc4fLX4kPkbQd6yTN88=;
        b=jldBuVOHJXD7+5XLuGibn46a+ViyoiS7qOnYeOoX6hjxRS9jsGrPRc1pByNyu8ebSA
         XTHUKhg9NYkQyI8XwBXySDpIYHVAyOF/4geU87S/JmV4Olp1YT4Tm14RgNabQRPNwF/2
         xW55mjczcW2Lh4aHFGP2KsPDFBVO27GsCX8h8dTNdSA2A1hyh9v7xezTQx+eN8z9YrQ4
         2TlRTx5AxXkcO3sUDo0nhjY3A0Qfc2DSw5f1tuflej88Ha8tDg4RA/sFYbVGtsQKuLKs
         keaiC7bcLog6JheC+hq63da5DylcvylitcaJXQwcwLKG61eiIDde76S4VGoEAMTaknER
         OnOQ==
X-Gm-Message-State: AC+VfDwmVJlTu4wPR4U6hJ7Y9a53ziWXCQh+CEqzxOxZThpC02LSNwwp
	T60YVKgMr7/EMPaW8NyMjOC/YmS8xg8=
X-Google-Smtp-Source: ACHHUZ7zIOibBmPY6Y29rt8nM79rNvJsdUI2SVckEC2nMoB65mby7s4uvzbcX+R3G6bqBtO03++m3w==
X-Received: by 2002:a17:907:2d26:b0:992:1bb2:61d9 with SMTP id gs38-20020a1709072d2600b009921bb261d9mr5507740ejc.54.1687982191011;
        Wed, 28 Jun 2023 12:56:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b0098d66ce416esm6132900ejb.142.2023.06.28.12.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 12:56:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] nodejs: use PIE for host binaries
Date: Wed, 28 Jun 2023 21:56:08 +0200
Message-ID: <20230628195610.744894-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 19:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103633

* mksnapshot is built as host binary, but then gets executed under
  qemu-arm, because for 32bit target we need to run 32bit mksnapshot
  even when building on x86-64 host

* unfortunately since upgrade to qemu-8 in:
  https://git.openembedded.org/openembedded-core/commit/?id=3Dfe8125565af07=
b73f9b29db2188ecb6e884bcc70

  the mksnapshot fails to execute with:
  LD_LIBRARY_PATH=3D/OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-l=
inux-gnueabi/nodejs/18.16.0-r0/node-v18.16.0/out/Release/lib.host:/OE/build=
/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-gnueabi/nodejs/18.16.0-r=
0/node-v18.16.0/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_=
PATH; cd ../tools/v8_gypfiles; mkdir -p /OE/build/oe-core/tmp-glibc/work/co=
rtexa8t2hf-neon-oe-linux-gnueabi/nodejs/18.16.0-r0/node-v18.16.0/out/Releas=
e/obj.target/v8_snapshot/geni; "/OE/build/oe-core/tmp-glibc/work/cortexa8t2=
hf-neon-oe-linux-gnueabi/nodejs/18.16.0-r0/node-v18.16.0/out/Release/v8-qem=
u-wrapper.sh" "/OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-=
gnueabi/nodejs/18.16.0-r0/node-v18.16.0/out/Release/mksnapshot" --turbo_ins=
truction_scheduling "--target_os=3Dlinux" "--target_arch=3Darm" --startup_s=
rc "/OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-gnueabi/nod=
ejs/18.16.0-r0/node-v18.16.0/out/Release/obj.target/v8_snapshot/geni/snapsh=
ot.cc" --embedded_variant Default --embedded_src "/OE/build/oe-core/tmp-gli=
bc/work/cortexa8t2hf-neon-oe-linux-gnueabi/nodejs/18.16.0-r0/node-v18.16.0/=
out/Release/obj.target/v8_snapshot/geni/embedded.S" --no-native-code-counte=
rs

  #
  # Fatal process OOM in Failed to reserve virtual memory for CodeRange
  #

  /OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-gnueabi/nodej=
s/18.16.0-r0/node-v18.16.0/out/Release/v8-qemu-wrapper.sh: line 7: 669880 T=
race/breakpoint trap   (core dumped) PSEUDO_UNLOAD=3D1 qemu-arm -r 5.15 -L =
/OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-gnueabi/nodejs/=
18.16.0-r0/recipe-sysroot -E LD_LIBRARY_PATH=3D/OE/build/oe-core/tmp-glibc/=
work/cortexa8t2hf-neon-oe-linux-gnueabi/nodejs/18.16.0-r0/recipe-sysroot/us=
r/lib:/OE/build/oe-core/tmp-glibc/work/cortexa8t2hf-neon-oe-linux-gnueabi/n=
odejs/18.16.0-r0/recipe-sysroot/lib "$@"

  It was failing only in some of my builds first, in the end
  I was able to narrow the difference between the build where
  it fails and where it doesn't fail to
  require conf/distro/include/security_flags.inc
  then
  GCCPIE =3D "--enable-default-pie"
  and lastly this PIE enabled just for nodejs to work around
  this issue without downgrading qemu-native.

* using -strace with qemu doesn't help much, just confirms that
  the OOM error message is really caused by failed mmap2:

  --- SIGPROF {si_signo=3DSIGPROF, si_code=3DSI_TKILL, si_pid=3D2908258, si=
_uid=3D1026} ---
  clock_gettime64(CLOCK_MONOTONIC,0x407ef640) =3D 0 ({tv_sec=3D20187,tv_nse=
c=3D678404286})
  rt_sigreturn(0x407efb70) =3D -1 errno=3D513 (Successful exit from sigretu=
rn)
  write(3,0x141e538,28) =3D 28
  write(3,0x141e538,28) =3D 28
  write(3,0x141e538,32) =3D 32
  mmap2(0x0097a000,33554432,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESER=
VE,-1,0) =3D -1 errno=3D12 (Cannot allocate memory)
  mmap2(0x0097a000,33554432,PROT_NONE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESER=
VE,-1,0) =3D -1 errno=3D12 (Cannot allocate memory)

* diffoscope on this 1.7G binary didn't really help as it got killed by OOM=
K after a while
  Out of memory: Killed process 1136999 (diffoscope) total-vm:404300108kB, =
anon-rss:122594688kB, file-rss:512kB, shmem-rss:0kB, UID:1026 pgtables:7642=
40kB oom_score_adj:0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_18.16.0.bb
index 06631f27db..3adb51549e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
@@ -79,9 +79,9 @@ PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
 # and we need to use the right flags during host compile,
 # too.
 EXTRA_OEMAKE =3D "\
-    CC.host=3D'${CC}' \
+    CC.host=3D'${CC} -pie -fPIE' \
     CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
-    CXX.host=3D'${CXX}' \
+    CXX.host=3D'${CXX} -pie -fPIE' \
     CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
     LDFLAGS.host=3D'${LDFLAGS}' \
     AR.host=3D'${AR}' \
--=20
2.41.0


