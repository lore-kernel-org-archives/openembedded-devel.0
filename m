Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87A1EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 15:04:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9458.1689951887261589409
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 08:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KNzqD1E6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so1692865f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689951885; x=1690556685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KH8YRS0jN5LGCS0e5b+ibzTIc6BrKC6XWofSGH/YuE=;
        b=KNzqD1E6pC9R5ZPVJ150VvtEoCgSIEWa6MMLwtLjHbbxT9XiFCWiXTBaOOXJvB+ywc
         v3u23aS9QLn/9so4fcvLpMRNAiLyRzYhnMq+3h8BYsn7wa4MNomsxJ8CHTmvhWP9XqdF
         lI7LADI1Px+NqHwRH0y1uY4n6K/lKxHFYde2FhTaiVO2kfvf/g8GqAge2acrk50l6Xzv
         CD0I6LsjCfC14yOmCZrBtby/2na/3jM2p6J3Qag/ld5J0BtWfnGcWcz3h5B1N6CH5dBg
         U9jQio3qT/eR0mcunrluJ390FAqt4lgv1cBD1wzu6z3oCjjzUw8J96ToEdhTkY0NVP4a
         Rc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951885; x=1690556685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KH8YRS0jN5LGCS0e5b+ibzTIc6BrKC6XWofSGH/YuE=;
        b=jAY+jev78MdRquVfEgDYYZq9Gbjh4NaH9GcsSG9gd7JsGugTY2OWWHOHkua3wj1EyI
         Km/o/DZ7UiKiD9qi6xf6QG54AQ54le56/cnUAGLdkxvhxJ/vQ7/FBwbAKW9LEjz8IUlh
         N0QNUZ2kzwjg49Us87dCR4QragDFEf3ofJMUIfvgSh90zVdRfEUTnnhbWBITD2gg+VGF
         9joEXjEQPK9d5+2UA0UFciB90q5s/JDwuvKfgE1kUjklqw0mj5vQqRDzFpxJ5sjwTGjn
         zM7h6lv33qMcvkDu/4bKn0mWqno4jT5Gson0DaCNOI2K7Ik6hgyvaPpnk85Cjh9ukPbH
         +hDQ==
X-Gm-Message-State: ABy/qLYF5F+JKdk4XtTET7yCnM/RXs6tPw8pGKI8uKEfnRuo2BpiG8Bm
	cxOSNXtQ0ExgX7tyZbJdc64lpM0qdcA=
X-Google-Smtp-Source: APBJJlHs5Cdui9yAbx5SV6PKjN8CkG/N5l/f9n8ncxrwKP4RMPqGQxAly9Uvkw78eUpXfSpBd42qTA==
X-Received: by 2002:a5d:6391:0:b0:314:2faa:a23 with SMTP id p17-20020a5d6391000000b003142faa0a23mr1646569wru.43.1689951885334;
        Fri, 21 Jul 2023 08:04:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600011c700b00313fd294d6csm4490308wrx.7.2023.07.21.08.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:04:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH] dlm: Do not use -fcf-protection=full on aarch64 platforms
Date: Fri, 21 Jul 2023 17:04:38 +0200
Message-ID: <20230721150438.3482382-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 15:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103970

Its not supported option, see:
http://errors.yoctoproject.org/Errors/Details/721121/

aarch64-oe-linux-gcc  -mcpu=3Dcortex-a57 -march=3Darmv8-a+crc -mbranch-prot=
ection=3Dstandard --sysroot=3DTOPDIR/tmp-glibc/work/cortexa57-oe-linux/dlm/=
4.2.0-r0/recipe-sysroot libdlm.c  -O2 -pipe -g -feliminate-unused-debug-typ=
es -fcanon-prefix-map  -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa57=
-oe-linux/dlm/4.2.0-r0/dlm-dlm-4.2.0=3D/usr/src/debug/dlm/4.2.0-r0  -fdebug=
-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa57-oe-linux/dlm/4.2.0-r0/dlm-dlm=
-4.2.0=3D/usr/src/debug/dlm/4.2.0-r0  -fmacro-prefix-map=3DTOPDIR/tmp-glibc=
/work/cortexa57-oe-linux/dlm/4.2.0-r0/dlm-dlm-4.2.0=3D/usr/src/debug/dlm/4.=
2.0-r0  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa57-oe-linux/dlm/4=
.2.0-r0/dlm-dlm-4.2.0=3D/usr/src/debug/dlm/4.2.0-r0  -fdebug-prefix-map=3DT=
OPDIR/tmp-glibc/work/cortexa57-oe-linux/dlm/4.2.0-r0/recipe-sysroot=3D  -fm=
acro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa57-oe-linux/dlm/4.2.0-r0/rec=
ipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa57-oe-lin=
ux/dlm/4.2.0-r0/recipe-sysroot-native=3D  -fcf-protection=3Dfull -D_GNU_SOU=
RCE -O2 -ggdb -Wall -Wformat -Wformat-security -Wmissing-prototypes -Wneste=
d-externs -Wpointer-arith -Wextra -Wshadow -Wcast-align -Wwrite-strings -Wa=
ggregate-return -Wstrict-prototypes -Winline -Wredundant-decls -Wno-sign-co=
mpare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=3D2 -Wp,-D_GLIBCXX_ASSERT=
IONS -fstack-protector-strong -fstack-clash-protection -fexceptions -fasync=
hronous-unwind-tables -fdiagnostics-show-option -fPIC -D_REENTRANT -c -o li=
bdlm.o
cc1: error: '-fcf-protection=3Dfull' is not supported for this target

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-netwo=
rking/recipes-extended/dlm/dlm_4.2.0.bb
index 094dbb1ad0..ee006efe28 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
@@ -39,6 +39,7 @@ export EXTRA_OEMAKE =3D ""
 CFPROTECTION ?=3D "-fcf-protection=3Dfull"
 CFPROTECTION:riscv64 =3D ""
 CFPROTECTION:arm =3D ""
+CFPROTECTION:aarch64 =3D ""
=20
 CFLAGS +=3D "${CFPROTECTION}"
=20
--=20
2.41.0


