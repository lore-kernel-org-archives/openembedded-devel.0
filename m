Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF83DCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:12:13 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.5452.1759169525277716951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hz9DETph;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7ae31caso709679766b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759169524; x=1759774324; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0xCc91T5ZLMbNNXLgXeeOZDJeXvSXMj3c4nJvZY2dE=;
        b=Hz9DETphY0BmOWr898QXnViIP9AlspEaHfL8uhWu3k+K6V2SKazqQrohGfRQUa7klj
         rfeUp1zyKobFLFsqFooS2YrPqJRgTiFTuq3IHVkxbCydIkTzBabb96LWrEj+2nGA29+Z
         qgPsfV3Uz/aByfMR228EBWE4W2E/t/lWEY+8hTANuGYIjxOVWE0HH8dluXobOY3dddKS
         FM5uPjTiS/1VdVd9y+B2dWGH8Ofb4/muptCzVGC6+Bs2f+aOnO9tGVudaCUOEMzPvlj3
         fJnsUQR+TtaZdKWzXsUoYjbE3fdSpnDenbc0sjbSXrXKnIZXOXwyBCLVvPmsLh1dSZfN
         W9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759169524; x=1759774324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0xCc91T5ZLMbNNXLgXeeOZDJeXvSXMj3c4nJvZY2dE=;
        b=h9MQoAwhKPOWAqIfaCuVFvU1Os/GnXr75M9DK5WWnAFzsB9Rjhkt4VgMJ6pt+MmZm/
         Ljl2i/2Oa8xYbJGHX6AojL2ocpf8PZzOhHAWNjtlSHDh7OMX2o0syot2Ww2XyvcCzwS0
         igQnKIxwwKwzlSvDRrgPx6do/LmL6Nw25mxz8+FBwqzb8xBuhe18za3DYyyh7AQ+UIZE
         26olZv58xrwnYw8EvYIJquxaQAyCwt3/4pIRIMp+K0nhzdfLAM70wSOD4bqpZGFAiqNG
         kgIlU+S9seJ84BYlapmx5n15R5JgcTgbnwOUhZJ0zF+yg6gwgrXHN3y4rCF4vIHiSCvv
         9m8A==
X-Gm-Message-State: AOJu0YzlsOxgs9/Gu+mbBoAXPdcjETOFXisxhEOGAILhMddeMO2mSLwS
	MXtD+qxbUns9vaHyVQ0siijoIMFuvL51W0An/ywlbqi0Ipiah4i21LQ7T8OIqg==
X-Gm-Gg: ASbGncsiHeqvv/pVdJyXlo0/nmb7mGWCkHXvmizaHqb3gxXKEEo3Oy7Yl5NwTBD4Aam
	8r1oLhhS9c/xt0m7d3rVKKO4scWvCc9+CXmac8pToBwCxfHn8S037LdHspUlYilp22kXj+5V1mf
	0E6He6rDrJMtasJWLlTuvsmbaZmKDrO8Gxky18Y2sq6wuroyrx16eNhOD16SweaWcRZi+xuDK1/
	vFF1sCjaGN4nQZLej/GQ/m14K8PKA7TlixDeNWFh0VonBNaOUyJwft9Bv3MaDgXAS/39Hz4JF4h
	KZaQ1waj4CH5dsT8zjng9t2pDmqOmlT4MbtWJ500HWIq4pTqN12GD0N09AUM5bZ9o0W5rh7vZEo
	FtFSK6dGo9AIh7SFu9LaqG7/VF77htLzaDoAaQjgZUQ==
X-Google-Smtp-Source: AGHT+IECXovuAqQrErh4xY5VjK2pzsPPVl0059RvmMzUQ/iKi0dcDRC79oFk8tR5pAhls6+1isN/0g==
X-Received: by 2002:a17:907:868d:b0:b04:4b0d:8e82 with SMTP id a640c23a62f3a-b34bbdc4529mr1780746266b.50.1759169523475;
        Mon, 29 Sep 2025 11:12:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3d62a59fcesm337706866b.91.2025.09.29.11.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 11:12:03 -0700 (PDT)
Message-ID: <f6a30f21-a222-44c6-9f6c-75e640ec4fa8@gmail.com>
Date: Mon, 29 Sep 2025 20:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 01/22] libtalloc: upgrade
 2.3.3 -> 2.3.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250929130425.2912077-1-skandigraun@gmail.com>
 <20250929130425.2912077-2-skandigraun@gmail.com>
 <CAMKF1souz+s4ex7f+Cqi7sKUKKWRc1tCPXaEU3gU3-sGwaEmdQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1souz+s4ex7f+Cqi7sKUKKWRc1tCPXaEU3gU3-sGwaEmdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 18:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120042

On 9/29/25 18:51, Khem Raj wrote:
> I think the changes here are a bit more than I would expect for a
> stable release. It also has some impact on python plugin support etc.
> if this does not fix anything specific I would be reluctant for this change.

Fair enough. The update contains 3 commits, which mostly touch the build
system, nothing very important.
Will drop it.

>
> On Mon, Sep 29, 2025 at 6:05 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: Yi Zhao <yi.zhao@windriver.com>
>>
>> * Refresh patches
>> * Add a patch to skip checking PYTHONHASHSEED
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit e558529eed212995aa52be7c99a8e27251d4c41e)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...-Add-configure-options-for-packages.patch} | 12 ++++----
>>  ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
>>  ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
>>  .../libtalloc/avoid-attr-unless-wanted.patch  | 19 ++++++++++--
>>  ...{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} | 10 +++----
>>  5 files changed, 62 insertions(+), 19 deletions(-)
>>  rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.2.0.patch => 0001-talloc-Add-configure-options-for-packages.patch} (96%)
>>  rename meta-networking/recipes-support/libtalloc/libtalloc/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (87%)
>>  create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
>>  rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} (85%)
>>
>> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
>> similarity index 96%
>> rename from meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
>> rename to meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
>> index 46fef1096b..026a348992 100644
>> --- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
>> @@ -1,4 +1,4 @@
>> -From 8a82056ba2f70137714f225d82993aa4b11042da Mon Sep 17 00:00:00 2001
>> +From 888bfe48236b4ce382dc3aa49791cadb70a1fbe4 Mon Sep 17 00:00:00 2001
>>  From: Wang Mingyu <wangmy@cn.fujitsu.com>
>>  Date: Fri, 25 Dec 2020 14:14:08 +0900
>>  Subject: [PATCH] talloc: Add configure options for packages
>> @@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>   2 files changed, 75 insertions(+), 21 deletions(-)
>>
>>  diff --git a/lib/replace/wscript b/lib/replace/wscript
>> -index a2bc604..2e2e7bf 100644
>> +index 827d74f..0348715 100644
>>  --- a/lib/replace/wscript
>>  +++ b/lib/replace/wscript
>>  @@ -25,6 +25,41 @@ def options(opt):
>> @@ -72,7 +72,7 @@ index a2bc604..2e2e7bf 100644
>>   @Utils.run_once
>>   def configure(conf):
>>       conf.RECURSE('buildtools/wafsamba')
>> -@@ -34,12 +69,25 @@ def configure(conf):
>> +@@ -35,12 +70,25 @@ def configure(conf):
>>       conf.DEFINE('HAVE_LIBREPLACE', 1)
>>       conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
>>
>> @@ -102,7 +102,7 @@ index a2bc604..2e2e7bf 100644
>>       conf.CHECK_HEADERS('port.h')
>>       conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
>>       conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
>> -@@ -121,8 +169,9 @@ def configure(conf):
>> +@@ -110,8 +158,9 @@ def configure(conf):
>>       conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
>>       conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>>
>> @@ -114,7 +114,7 @@ index a2bc604..2e2e7bf 100644
>>       conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
>>       conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
>>       conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
>> -@@ -418,20 +467,20 @@ def configure(conf):
>> +@@ -431,20 +480,20 @@ def configure(conf):
>>
>>       strlcpy_in_bsd = False
>>
>> @@ -150,7 +150,7 @@ index a2bc604..2e2e7bf 100644
>>       conf.CHECK_CODE('''
>>                   struct ucred cred;
>>  diff --git a/wscript b/wscript
>> -index b955d21..4ac6e1e 100644
>> +index 3089663..fdf9510 100644
>>  --- a/wscript
>>  +++ b/wscript
>>  @@ -31,7 +31,12 @@ def options(opt):
>> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
>> similarity index 87%
>> rename from meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
>> rename to meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
>> index 47ee4bb24e..058ac34f81 100644
>> --- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
>> @@ -1,4 +1,4 @@
>> -From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 2001
>> +From 6580e8191c219909d50c991662310e668973722d Mon Sep 17 00:00:00 2001
>>  From: Yi Zhao <yi.zhao@windriver.com>
>>  Date: Wed, 24 Nov 2021 13:33:35 +0800
>>  Subject: [PATCH] Fix pyext_PATTERN for cross compilation
>> @@ -40,18 +40,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>  diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
>> -index b1c8dd0..24faa31 100644
>> +index a23bd01..af202e0 100644
>>  --- a/third_party/waf/waflib/Tools/python.py
>>  +++ b/third_party/waf/waflib/Tools/python.py
>>  @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
>>         x = 'MACOSX_DEPLOYMENT_TARGET'
>>         if dct[x]:
>> -               env[x] = conf.environ[x] = dct[x]
>> --      env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
>> +               env[x] = conf.environ[x] = str(dct[x])
>> +-      env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
>>  +      env.pyext_PATTERN = '%s.so'
>>
>>
>>         # Try to get pythonX.Y-config
>>  --
>> -2.17.1
>> +2.25.1
>>
>> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
>> new file mode 100644
>> index 0000000000..617eaa7dc5
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
>> @@ -0,0 +1,30 @@
>> +From 4a1b8659235dcac5382a627a4add4d636a65a886 Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Wed, 28 Dec 2022 16:31:05 +0800
>> +Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
>> +
>> +Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + buildtools/wafsamba/wscript | 4 ----
>> + 1 file changed, 4 deletions(-)
>> +
>> +diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
>> +index 8729b08..a4d6f3e 100644
>> +--- a/buildtools/wafsamba/wscript
>> ++++ b/buildtools/wafsamba/wscript
>> +@@ -8,10 +8,6 @@ import wafsamba
>> + from samba_utils import symlink
>> + from optparse import SUPPRESS_HELP
>> +
>> +-phs = os.environ.get("PYTHONHASHSEED", None)
>> +-if phs != "1":
>> +-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
>> +-
>> + # this forces configure to be re-run if any of the configure
>> + # sections of the build scripts change. We have to check
>> + # for this in sys.argv as options have not yet been parsed when
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
>> index 5b7f69ec07..3c85a8a2d4 100644
>> --- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
>> @@ -1,6 +1,17 @@
>> +From e18370c204056de799064d8ac72a656eb3745f95 Mon Sep 17 00:00:00 2001
>> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
>> +Date: Fri, 25 Dec 2020 15:10:58 +0900
>> +Subject: [PATCH] avoid attr unless wanted
>> +
>> +---
>> + lib/replace/wscript | 4 +---
>> + 1 file changed, 1 insertion(+), 3 deletions(-)
>> +
>> +diff --git a/lib/replace/wscript b/lib/replace/wscript
>> +index 0348715..a8554d9 100644
>>  --- a/lib/replace/wscript
>>  +++ b/lib/replace/wscript
>> -@@ -947,8 +947,6 @@ def build(bld):
>> +@@ -967,8 +967,6 @@ def build(bld):
>>       if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
>>       if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
>>       if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
>> @@ -9,13 +20,15 @@
>>
>>       if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
>>           REPLACE_SOURCE += ' closefrom.c'
>> -@@ -962,7 +960,7 @@ def build(bld):
>> -                       # at the moment:
>> +@@ -983,7 +981,7 @@ def build(bld):
>>                         # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
>>                         private_library=True,
>> +                       provide_builtin_linking=True,
>>  -                      deps='dl attr' + extra_libs)
>>  +                      deps='dl' + extra_libs)
>>
>>       replace_test_cflags = ''
>>       if bld.CONFIG_SET('HAVE_WNO_FORMAT_TRUNCATION'):
>> +--
>> +2.25.1
>>
>> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
>> similarity index 85%
>> rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
>> rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
>> index b3f8b2ce25..ad812da803 100644
>> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
>> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
>> @@ -1,17 +1,17 @@
>>  SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
>> -HOMEPAGE = "http://talloc.samba.org"
>> +HOMEPAGE = "https://talloc.samba.org"
>>  SECTION = "libs"
>>  LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
>>  LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
>>                      file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
>>                      "
>>
>> -
>>  SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
>> -           file://options-2.2.0.patch \
>> -           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
>> +           file://0001-talloc-Add-configure-options-for-packages.patch \
>> +           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
>> +           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
>>  "
>> -SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
>> +SRC_URI[sha256sum] = "179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505"
>>
>>  inherit waf-samba
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120014): https://lists.openembedded.org/g/openembedded-devel/message/120014
>> Mute This Topic: https://lists.openembedded.org/mt/115494435/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


