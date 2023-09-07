Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61AAEC875F
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 21:52:07 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.26305.1694123527131280933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 14:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RgvRPEnl;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1d4e0c29028so926001fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694123526; x=1694728326; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7to6YZZySFxP4YNnXIyDwxULdAlYIWSq1C5qADt47W4=;
        b=RgvRPEnlrIlVh/KpjYNZTApIHyD3kTXMGwNzXbnsBoeqBVz32v+Bls9i2nxZz2GUob
         PICVNrD4/nO6NOzYnMmnAvKI19pvxJKhzvLXaM39Ahsnua0h5aOBXqtjd61fsjOwrp2W
         oBHxwtqleH+V/M5TIJPRcOFplKVBWtycLiOoLBpqcBYkHjys5wpt92i0lIch8/U9OWTI
         3VGR1wOY/izCcjX+pFywea33xLWR54f/Smyjy+CCzFf7LPsBGnxApLsNNSFhE+YpN/il
         5O1c/BLo/roQL0t7EeRCyqSlzoeMdeXODDaQbOybzOx8C1HkoljdmZqAetji0gqiM2BF
         YDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694123526; x=1694728326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7to6YZZySFxP4YNnXIyDwxULdAlYIWSq1C5qADt47W4=;
        b=lrVWE5AXAtqukZVriklgb7c83CHFcK8ONMZwgeZfq2bzIhq3PmQ8Giorv/V2fH1urd
         5kYBNWgKrJjT2b2wyTpXNIGrZr1YhLmuZf+ltHEPE7CLVZCi1Pu2Gq0P9PT+wsdonXeG
         XelX9W/MxuzLQVCcOQfzZyAtGYwOnIg1XjqWIb7lazA65h8BJVnr5RuooM7JIWKOuyIj
         cmlDfXajZnBFp5mKC29Wo3A2QOCzQ2ScolslmKAQ9uCWSMu7e4c/3CjtZWyrWZNYairU
         yXogegWFUDm0+LvEuOO+enL4BvlROsNnPYBVgRSkXRympkncz3UeVXCzPSJmpkLLpHQK
         ZZPw==
X-Gm-Message-State: AOJu0YzHcBvSJkWGdxL5uEIiKFGfMVKAoQ22QUmE/q5Q0A8q+a4L7coS
	e19iQBRmyZBt9HQy8vxul2RZOEhLVqpwXO+hkt+aMa0DgKQ=
X-Google-Smtp-Source: AGHT+IH1F7RTH8uoCFwPu6yRjJ2orOsBS0tgjdOENvq7zX6XDFx/6yifolPVY5iFIbyYMDX78Gop1PpW1zdoizC+4fI=
X-Received: by 2002:a05:6870:b48b:b0:1bb:89b1:77b7 with SMTP id
 y11-20020a056870b48b00b001bb89b177b7mr979714oap.16.1694123526271; Thu, 07 Sep
 2023 14:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <b1b6801cea68ac6fba6f44a4749220064d0de5ee.camel@infinera.com>
In-Reply-To: <b1b6801cea68ac6fba6f44a4749220064d0de5ee.camel@infinera.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 14:51:40 -0700
Message-ID: <CAMKF1sqfhRRQGzq2gV4K0mxCcR=1zAd-AFytH5JEZLGjgUTU9w@mail.gmail.com>
Subject: Re: [oe] luaposix_35.1.bb fails build, hostenv seems to leek into the build
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 21:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104796

On Thu, Sep 7, 2023 at 8:41=E2=80=AFAM Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=3Dinfinera.com@lists.openembedded.org> wrote:
>
> Here is a partial log:
> [2023-09-07T14:27:47.651Z] ERROR: lib32-luaposix-35.1-r0 do_compile: Exec=
utionError('/home/builduser/workspace/XR/XR_PretestJobs/yocto_pipeline/buil=
d/build/infn-
> xr/gmcu/tmp/work/cortexa53-32-xrmllib32-linux-musleabi/lib32-luaposix/35.=
1-r0/temp/run.do_compile.25384', 1, None, None)
> [2023-09-07T14:27:47.651Z] ERROR: Logfile of failure stored in: /home/bui=
lduser/workspace/XR/XR_PretestJobs/yocto_pipeline/build/build/infn-xr/gmcu/=
tmp/work/cortexa53-32-
> xrmllib32-linux-musleabi/lib32-luaposix/35.1-r0/temp/log.do_compile.25384
> [2023-09-07T14:27:47.651Z] Log data follows:
> [2023-09-07T14:27:47.651Z] | DEBUG: Executing shell function do_compile
> [2023-09-07T14:27:47.651Z] | creating lib/posix/version.lua
> [2023-09-07T14:27:47.651Z] | creating build-aux/config.ld
> [2023-09-07T14:27:47.651Z] | arm-xrmllib32-linux-musleabi-gcc  -march=3Da=
rmv8-a+crc -mcpu=3Dcortex-a53 -fstack-protector-strong  -Os -D_FORTIFY_SOUR=
CE=3D2 -Wformat -Wformat-security -
> Werror=3Dformat-security --sysroot=3D/home/builduser/workspace/XR/XR_Pret=
estJobs/yocto_pipeline/build/build/infn-xr/gmcu/tmp/work/cortexa53-32-xrmll=
ib32-linux-musleabi/lib32-
> luaposix/35.1-r0/lib32-recipe-sysroot -O2 -shared -fPIC   -DPACKAGE=3D'"l=
uaposix"' -D_XOPEN_SOURCE=3D700 -D_POSIX_C_SOURCE=3D200809L -D_FORTIFY_SOUR=
CE=3D2 -DNDEBUG -
> DVERSION=3D'"builduser"' -Iext/include -I/usr/include/lua5.4 ext/posix/si=
gnal.c -o linux/posix/signal.so -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-nee=
ded -fmacro-prefix-
> map=3D/home/builduser/workspace/XR/XR_PretestJobs/yocto_pipeline/build/bu=
ild/infn-xr/gmcu/tmp/work/cortexa53-32-xrmllib32-linux-musleabi/lib32-luapo=
six/35.1-
> r0=3D/usr/src/debug/lib32-luaposix/35.1-r0                      -fdebug-p=
refix-map=3D/home/builduser/workspace/XR/XR_PretestJobs/yocto_pipeline/buil=
d/build/infn-
> xr/gmcu/tmp/work/cortexa53-32-xrmllib32-linux-musleabi/lib32-luaposix/35.=
1-r0=3D/usr/src/debug/lib32-luaposix/35.1-r0                      -fdebug-p=
refix-
> map=3D/home/builduser/workspace/XR/XR_PretestJobs/yocto_pipeline/build/bu=
ild/infn-xr/gmcu/tmp/work/cortexa53-32-xrmllib32-linux-musleabi/lib32-luapo=
six/35.1-r0/lib32-recipe-
> sysroot=3D                      -fdebug-prefix-map=3D/home/builduser/work=
space/XR/XR_PretestJobs/yocto_pipeline/build/build/infn-xr/gmcu/tmp/work/co=
rtexa53-32-xrmllib32-linux-
> musleabi/lib32-luaposix/35.1-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-z=
,now
> [2023-09-07T14:27:47.651Z] | cc1: warning: include location "/usr/include=
/lua5.4" is unsafe for cross-compilation [-Wpoison-system-directories]
> [2023-09-07T14:27:47.651Z] | In file included from /usr/include/lua5.4/lu=
a.h:16,
> [2023-09-07T14:27:47.651Z] |                  from ext/include/_helpers.c=
:59,
> [2023-09-07T14:27:47.651Z] |                  from ext/posix/signal.c:25:
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/luaconf.h:43:9: error: #=
error "No ABI matched, please report a bug to bugs.gentoo.org"
> [2023-09-07T14:27:47.651Z] |    43 | #       error "No ABI matched, pleas=
e report a bug to bugs.gentoo.org"
> [2023-09-07T14:27:47.651Z] |       |         ^~~~~
> [2023-09-07T14:27:47.651Z] | In file included from ext/include/_helpers.c=
:59,
> [2023-09-07T14:27:47.651Z] |                  from ext/posix/signal.c:25:
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:90:9: error: unkno=
wn type name 'LUA_NUMBER'
> [2023-09-07T14:27:47.651Z] |    90 | typedef LUA_NUMBER lua_Number;
> [2023-09-07T14:27:47.651Z] |       |         ^~~~~~~~~~
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:94:9: error: unkno=
wn type name 'LUA_INTEGER'
> [2023-09-07T14:27:47.651Z] |    94 | typedef LUA_INTEGER lua_Integer;
> [2023-09-07T14:27:47.651Z] |       |         ^~~~~~~~~~~
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:97:9: error: unkno=
wn type name 'LUA_UNSIGNED'
> [2023-09-07T14:27:47.651Z] |    97 | typedef LUA_UNSIGNED lua_Unsigned;
> [2023-09-07T14:27:47.651Z] |       |         ^~~~~~~~~~~~
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:100:9: error: unkn=
own type name 'LUA_KCONTEXT'
> [2023-09-07T14:27:47.651Z] |   100 | typedef LUA_KCONTEXT lua_KContext;
> [2023-09-07T14:27:47.651Z] |       |         ^~~~~~~~~~~~
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:153:1: error: unkn=
own type name 'LUA_API'
> [2023-09-07T14:27:47.651Z] |   153 | LUA_API lua_State *(lua_newstate) (l=
ua_Alloc f, void *ud);
> [2023-09-07T14:27:47.651Z] |       | ^~~~~~~
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:153:19: error: exp=
ected '=3D', ',', ';', 'asm' or '__attribute__' before '*' token
> [2023-09-07T14:27:47.651Z] |   153 | LUA_API lua_State *(lua_newstate) (l=
ua_Alloc f, void *ud);
> [2023-09-07T14:27:47.651Z] |       |                   ^
> [2023-09-07T14:27:47.651Z] | /usr/include/lua5.4/lua.h:154:8: error: expe=
cted ';' before 'void'
>
> One can see -I/usr/include in the build cmd.
>
> building on latest Kirstone

yeah 32bit build seems to be leaking into host includes, this should
be contained. Perhaps Makefiles of luaposix reveat something?

>
>   Jocke
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104791): https://lists.openembedded.org/g/openembedde=
d-devel/message/104791
> Mute This Topic: https://lists.openembedded.org/mt/101217104/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

