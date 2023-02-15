Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E29AC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:12:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5278.1676495566900560817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLOl93y8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f18-20020a7bcd12000000b003e206711347so112050wmj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 13:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDrqMrlwctDF8rqAvZHk4qMpVQX0jSK++hIDXov/8Ug=;
        b=ZLOl93y8L7ESUZp8BM+OZP6fc1tLHhYL2cEOYen7KwVN7xHdTaoI3LeKVqKzqJ9top
         yayfM2dUIS/ksJ9jxgaVJNYv7NSIF4VY5HeYssgfdMQaYH2D4cDnx+CI7uueoAsc8Q5C
         wC6z1HLAGMNxhzIBvBRmycd/eb7qdhSuWH9SXDtiYu9KOGaUnioipoAl+Hfkh5SirXZ7
         HR+d3KGxoxFAc4Ji+IUp+rh+EpNw/I5QBPoHOXo49RaNfGeBpmnknGowVE3PG779zimk
         6ODOiqndUZT2g4W01OMf2S6zNzaPkUCKnUkeLNO/jw8wbOV5ag8/ee0Hb3u8otpJ7Fpg
         VXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDrqMrlwctDF8rqAvZHk4qMpVQX0jSK++hIDXov/8Ug=;
        b=mi74dG7Q6YJjAi9iwNUM4eEJ49zNo5+g44ACGh+1HDFfafqX++IuXuws4RcVt0HkBn
         DnLjbwLtBbGwWYxkWPhyyA+gTqhEg2nZO/B7xcb7bBXT+qEuI1Y+3crMW2ke/mZKYCI3
         r7BuWCJ6rHjC/0+VETRcSw+NjNnOnFvnVAE/5bNzMGMizYgYriijWX/1y1gGaziAA+hj
         CPKe/LFg2Lv2VXdAg7Y3vplLtaQaSWgB8i0cXIkpPlOUQIPAieofy2JY7dH2Q+Z2XnQi
         oeu8wjZhzLt8kc+yQxqdeVDdYJHnPdmbZL2AaEx3qFOwHGhDf5/WOu+Z0+V8WDWl4bNA
         ovOQ==
X-Gm-Message-State: AO0yUKXEILVWpRtpmCF4P/MbJjk9Xf44TJSMpBcqkBp5Ak83bP82zXqN
	Eq9U7wlEPae0BqRMD4mj6tYLWg6/2H0=
X-Google-Smtp-Source: AK7set/DYmmOByPmhrgXQ8+Lo0u6jH/5ghVsLH9i7es7bc5ad2ZpZeSU+KCnSG/OfQVlR9knThCLcA==
X-Received: by 2002:a05:600c:3b05:b0:3e0:1ab:cf2a with SMTP id m5-20020a05600c3b0500b003e001abcf2amr2921187wms.39.1676495565256;
        Wed, 15 Feb 2023 13:12:45 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c348400b003df5be8987esm3218837wmq.20.2023.02.15.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 13:12:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: archana.polampalli@windriver.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: fix do_install failure with 'shared' PACKAGECONFIG
Date: Wed, 15 Feb 2023 22:12:39 +0100
Message-Id: <20230215211239.3250814-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <17441B2974A57F44.22975@lists.openembedded.org>
References: <17441B2974A57F44.22975@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 21:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101088

* tools/install.py uses:
  output_lib = 'libnode.' + variables.get('shlib_suffix')
  action([output_prefix + output_lib], variables.get('libdir') + '/'+ output_lib)

  and when libdir is absolute path (either ${D}${libdir} before:
  https://git.openembedded.org/meta-openembedded/commit/?id=42c0f0120ad1caf25118d079314c988d4633a437
  or just ${libdir} "/usr/lib") it doesn't respect prefix nor ${D}
  and fails to write to host's directory when "shared" PACKAGECONFIG
  is enabled:
  http://errors.yoctoproject.org/Errors/Details/689959/

if [ ! -r node ] || [ ! -L node ]; then \
  ln -fs out/Release/node node; fi
TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3 tools/install.py install 'TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/image' '/usr'
installing TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/image/usr/bin/node
installing /usr/lib/libnode.so.108
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/node-v18.12.1/tools/install.py", line 351, in <module>
    run(sys.argv[:])
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/node-v18.12.1/tools/install.py", line 342, in run
    files(install)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/node-v18.12.1/tools/install.py", line 179, in files
    action([output_prefix + output_lib], variables.get('libdir') + '/' + output_lib)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/node-v18.12.1/tools/install.py", line 77, in install
    try_copy(path, dst)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/node-v18.12.1/tools/install.py", line 67, in try_copy
    return shutil.copy2(source_path, target_path)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/recipe-sysroot-native/usr/lib/python3.11/shutil.py", line 436, in copy2
    copyfile(src, dst, follow_symlinks=follow_symlinks)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/18.12.1-r0/recipe-sysroot-native/usr/lib/python3.11/shutil.py", line 258, in copyfile
    with open(dst, 'wb') as fdst:
         ^^^^^^^^^^^^^^^
PermissionError: [Errno 13] Permission denied: '/usr/lib/libnode.so.108'
make: *** [Makefile:189: install] Error 1

* use just baselib "lib" so that it respects ${D} as well as ${prefix}
  while using e.g. lib32 or lib64 when multilib is enabled

* similarly as 'node' binary is installed to relative hardcoded path "bin" with:
  action([output_prefix + output_file], 'bin/' + output_file)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index 6ff9ef083a..9e274c5a2d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -148,7 +148,7 @@ do_configure () {
                --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
-               --libdir=${libdir} \
+               --libdir=${baselib} \
                ${ARCHFLAGS} \
                ${PACKAGECONFIG_CONFARGS}
 }
-- 
2.39.2


