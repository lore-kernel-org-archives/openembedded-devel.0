Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEA6C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 17:07:01 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.15530.1633021620510022207
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 10:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxFbMQW7;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id dj4so25750450edb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 10:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbLsYo9uCDeG4hiKu2gfRZaFxaXzL7dLgdpgdIVH7C4=;
        b=cxFbMQW7y7OunFrkE67SXkMcS+P/4p5NxJjtcG/zb0o2iLlJWxzH721LjbbouDjm0A
         xuX03bGXFjHfswNROFs0Nw48z0l4DDDsvHjMG2VinmMq0e4RiwZRaOpB263kVasFukEA
         cblndLc0dmriu/S92Xui8X4v6QBwuTQvvVCCJzBKeC554xrnIDdsY0qZvUad5D/YsWBW
         G6DeYS3eXnzyDXlBUyoWVBWVAlTgxyXU1gqpxdtijLyuOb5l1cSkt2/ub6dfK7AqXeB1
         uoUpbwJMC6i8S3gC8koqPVAdvViNEMS4/7XEyZQlFHntznPvETZ934+U/tdIAsdZOJtE
         QECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbLsYo9uCDeG4hiKu2gfRZaFxaXzL7dLgdpgdIVH7C4=;
        b=H2tXxuvdGNHLExNXkFvn63EXOKJYlCAZAiqLJjiJd8tyi8wbjPhwnTnCOYoItyq0PE
         QXLdONtLyVhRbGpEQyAou5ruJVZ4GRGOyRyb0m5xgJA/ZL469AWFEM6G/Z7zEeDJLUwz
         SBFza8YxfgEHBhw0tRZ+aGQSHsjE/tFJIdyo4ONq03yyeSEzoM8vUjDXiuzV0alhkUc7
         W+AOxoAH32ov3HAogMuhcSPGLoAiPYbRnA0HuNmdtFXC3GktgItpeFqFo0Nk76x2oCLz
         MDz8QLickuCVtfIT8kqTnfhPGm4rtOsTiGl9AcX0lFM6cZw0ytMbuOO3SRaDqCE9vIMa
         RwLQ==
X-Gm-Message-State: AOAM531rY3WZMOyM0G1MXfJpj01qvIUHepHJjN5O2ilz2Q58mZgoijYY
	LXrptbfYKxx0LEn+rSqNOYiznz9loUA=
X-Google-Smtp-Source: 
 ABdhPJx4iBUhDlyy0TflClj079+MzyDT67IJdwHdLKN3nyLQbAgCFmIevu42dcIoNwSh68qb8ElDSQ==
X-Received: by 2002:a17:906:848f:: with SMTP id
 m15mr355409ejx.11.1633021618936;
        Thu, 30 Sep 2021 10:06:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b3sm1705332ejb.7.2021.09.30.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 10:06:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] gpsd: inherit pkgconfig
Date: Thu, 30 Sep 2021 19:06:56 +0200
Message-Id: <20210930170656.2277663-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 17:07:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93183

Newer oe-core doesn't pull many default dependencies anymore:
https://lists.openembedded.org/g/openembedded-core/message/156185
add explicit dependency on pkgconfig through pkgconfig.bbclass as
we're using it here.

Fixes:
| Checking pkg-config for dbus-1... no
| Turning off dbus-export support, library not found.
| Checking pkg-config for bluez... no
| Turning off Bluetooth support, library not found.
...
| ERROR: /usr/bin/ncurses5-config should not be used, use an alternative such as pkg-config
| OSError: 'ncurses5-config --libs --cflags' exited 1:
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/gpsd-3.23/SConstruct", line 63:
|     SConscript('SConscript',
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 660:
|     return method(*args, **kw)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 597:
|     return _SConscript(self.fs, *files, **subst_kw)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 285:
|     exec(compile(scriptdata, scriptname, 'exec'), call_stack[-1].globals)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/SConscript", line 1881:
|     cgps = env.Program('clients/cgps', ['clients/cgps.c'],
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 238:
|     return super().__call__(target, source, *args, **kw)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Util.py", line 748:
|     return self.method(*nargs, **kwargs)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Builder.py", line 653:
|     env = env.Override(env_kw)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 622:
|     env.MergeFlags(merges)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 832:
|     args = self.ParseFlags(args)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 815:
|     do_parse(arg)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 662:
|     for t in arg: do_parse(t)
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 667:
|     arg = self.backtick(arg[1:])
|   File "/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 579:
|     raise OSError("'%s' exited %d" % (command, status))
| ERROR: scons build execution failed.

Or on different host it shows better error message:

| Checking pkg-config for dbus-1... (cached) yes
| /bin/sh: 1: pkg-config: not found
| OSError: 'PKG_CONFIG_SYSROOT_DIR="/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot" pkg-config --cflags --libs dbus-1' exited 127:
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/SConstruct", line 63:
|     SConscript('SConscript',
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 660:
|     return method(*args, **kw)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 597:
|     return _SConscript(self.fs, *files, **subst_kw)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Script/SConscript.py", line 285:
|     exec(compile(scriptdata, scriptname, 'exec'), call_stack[-1].globals)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/SConscript", line 1107:
|     config.env.MergeFlags(dbusflags)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 832:
|     args = self.ParseFlags(args)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 815:
|     do_parse(arg)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 662:
|     for t in arg: do_parse(t)
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 667:
|     arg = self.backtick(arg[1:])
|   File "/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/SCons/Environment.py", line 579:
|     raise OSError("'%s' exited %d" % (command, status))
| ERROR: scons build execution failed.

Not sure why this one doesn't show up on CI, I guess some SCons magic.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
index aaf7429291..227ddb7848 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "b4f96cb01cbc06542b1cb66b3296078d"
 SRC_URI[sha256sum] = "522c2362a7eb2d7ac37eaa1504f12aded1c373479a87ba06cc6795974b567bbc"
 
-inherit scons update-rc.d python3-dir python3native systemd update-alternatives
+inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
 INITSCRIPT_PACKAGES = "gpsd-conf"
 INITSCRIPT_NAME = "gpsd"
-- 
2.32.0


