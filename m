Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADBE71A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 14:20:05 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b189so3328037wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NW+8hTmmHP7t/q+ksiK8EoF0v6finmpjqZd1zxNbJpc=;
	b=N2AbVIUEE0BB3QdQAZKNz8Kbbb1JOEs9i0+nLYr9nNw/vNzU4TVQdBKDMa8bda4sD/
	FKGIlRR/AnT//adh1tqz+/ZO+24q0bIsJN2hQ7gCnIiu2YRJMsza+rO5PNJmlIPviFbJ
	cW7Jk1tB5RpjDErUjFGx8D1By2eYcqwNLahw94SksUem/TyyfHors7yK7/ghWX8xgfiY
	cyl9+SQmVl+5fIYWZDNhvmK0HNVeSSYQk8y/FYEnut0DqClp1EkxiSTT32NtxdkcKw7j
	SVwStyygi0uYDmIdxLiuji3Q0UoX6H6GN4ATSXVPUqn9MUegZ/NcgW78/LrWRYDaU40Z
	NH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NW+8hTmmHP7t/q+ksiK8EoF0v6finmpjqZd1zxNbJpc=;
	b=l7UJ4bQzD7fadwSAiqaFZxc4DhGeMStnJTH9So6v0i43hxmyJTUSzuAq3xlvxT67RO
	+5Lzihzb4X4x1yDW89au+w7pOT9bkaZMY2NysdVCrRiQLUS904WCfj4ePI/nzqdEoKyn
	vl5DXBxMonETnQCRbQjdRgxGiJizlaCCyyFdqmKppSbu1CKDivBHG0AaZKeTstIZEQ4B
	yS+6g6ZgqdvJcT6FYavK5d32t2cJjsDkVdWWUj+0ZHBmc5grOJf1rcirKPN4xJkIbJtg
	pTMnlD+dXMbuUCQboPu114VUPL/xdKXvKS01nGBX5NzLyG2FVoZSSkaIX35x87VPe42D
	P+1A==
X-Gm-Message-State: AJaThX4mB5b4HrZ9VQK000SR+Af0PCxaNRuRDh5UlY86UM4RLN5JHCF5
	4nDFvNEwIJA+DwxlnusSbNnz8KqibRwJq4IQMU4=
X-Google-Smtp-Source: AGs4zMaCzGlioLQw21UqAd05qrqnMGAnomOsW+T7PIjWvGLAVRIvXNh6xvVr/0DQL+cD5eJbXw6YMDcCWD0cVo6gRds=
X-Received: by 10.28.118.19 with SMTP id r19mr1891021wmc.10.1510755606908;
	Wed, 15 Nov 2017 06:20:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Wed, 15 Nov 2017 06:20:06 -0800 (PST)
In-Reply-To: <CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2017 15:20:06 +0100
Message-ID: <CA+chaQdu0YSkvx9cX9rOR81ihqpqS6f7MbkkADSw64VijQGTzA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2017 14:20:06 -0000
Content-Type: text/plain; charset="UTF-8"

With the DEPENDS fix applied it still fails to build with musl:

http://errors.yoctoproject.org/Errors/Build/48408/
| In file included from ../../third_party/ffmpeg/libavutil/autorename_
libavutil_cpu.c:2:0:
| ../../third_party/ffmpeg/libavutil/cpu.c:42:10: fatal error:
sys/sysctl.h: No such file or directory
|  #include <sys/sysctl.h>
|           ^~~~~~~~~~~~~~
| compilation terminated.

I'm doing local qemuarm64 build now to see what happens before that out of
memory crash.


On Wed, Nov 15, 2017 at 1:38 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Thanks for very good changes.
>
> Yesterday I've tried to build this on "bitbake world" servers and the
> build for qemuarm64 failed with:
>
> | [30609/30609] python "../../build/toolchain/gcc_link_wrapper.py"
> --output="./chrome" -- aarch64-oe-linux-g++  -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/work/
> aarch64-oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot -pie
> -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack
> -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread
> -Wl,--as-needed -fuse-ld=gold -B -Wl,--icf=all -Wl,-O1 -Wl,--gc-sections
> -Wl,-rpath-link=. -Wl,--disable-new-dtags -Wl,--export-dynamic -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
> -Wl,-z,relro,-z,now -o "./chrome" -Wl,--start-group @"./chrome.rsp"
> -Wl,--end-group   -ldl -lpthread -lrt -lpangocairo-1.0 -lpango-1.0
> -lgobject-2.0 -lglib-2.0 -lcairo -lX11 -lX11-xcb -lxcb -lXcomposite
> -lXcursor -lXdamage -lXext -lXfixes -lXi -lXrender -lXtst -lgmodule-2.0
> -lgthread-2.0 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3 -lplds4 -lplc4 -lnspr4
> -lxml2 -lexpat -lfontconfig -ldbus-1 -latomic -lXss -lfreetype -ljpeg
> -lwebp -lwebpdemux -lwebpmux -lXrandr -lresolv -lgio-2.0 -lpci -lasound -lm
> -lz -latk-1.0 -lFLAC -lgtk-3 -lgdk-3 -lcairo-gobject -lgdk_pixbuf-2.0 -lxslt
> | FAILED: chrome
> | python "../../build/toolchain/gcc_link_wrapper.py" --output="./chrome"
> -- aarch64-oe-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
> -Wformat -Wformat-security -Werror=format-security
> --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/work/
> aarch64-oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot -pie
> -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack
> -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread
> -Wl,--as-needed -fuse-ld=gold -B -Wl,--icf=all -Wl,-O1 -Wl,--gc-sections
> -Wl,-rpath-link=. -Wl,--disable-new-dtags -Wl,--export-dynamic -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
> -Wl,-z,relro,-z,now -o "./chrome" -Wl,--start-group @"./chrome.rsp"
> -Wl,--end-group   -ldl -lpthread -lrt -lpangocairo-1.0 -lpango-1.0
> -lgobject-2.0 -lglib-2.0 -lcairo -lX11 -lX11-xcb -lxcb -lXcomposite
> -lXcursor -lXdamage -lXext -lXfixes -lXi -lXrender -lXtst -lgmodule-2.0
> -lgthread-2.0 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3 -lplds4 -lplc4 -lnspr4
> -lxml2 -lexpat -lfontconfig -ldbus-1 -latomic -lXss -lfreetype -ljpeg
> -lwebp -lwebpdemux -lwebpmux -lXrandr -lresolv -lgio-2.0 -lpci -lasound -lm
> -lz -latk-1.0 -lFLAC -lgtk-3 -lgdk-3 -lcairo-gobject -lgdk_pixbuf-2.0 -lxslt
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/aarch64-
> oe-linux/chromium/62.0.3202.89-r0/recipe-sysroot-native/
> usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/
> aarch64-oe-linux/7.2.0/ld.gold: out of memory
> | collect2: error: ld returned 1 exit status
> | ninja: build stopped: subcommand failed.
>
> longer log in http://errors.yoctoproject.org/Errors/Details/158898/
>
> I know what linking needs *a lot* of memory, but this server has 219GB
> available and "only" 128GB from it can be taken by tmpfs, so there should
> be still plenty RAM for successful linkage.
>
> Build for x86_64 (on similar server) was successful.
>
> Build for x86 + musl failed even before start, because there is missing
> space in the append:
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86 =
> "yasm-native"
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86-64 =
> "yasm-native"
>
> and unlike x86_64 it doesn't have trailing space in previous DEPENDS,
> because of:
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_libc-musl
> = " libexecinfo"
>
> Causing:
> ERROR: Nothing PROVIDES 'libexecinfoyasm-native' (but
> /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/
> chromium_62.0.3202.89.bb DEPENDS on or otherwise requires it). Close
> matches:
>   libxinerama-native
>   texinfo-native
>   libyaml-native
>
> I'll fix that missing space, but any other ideas why it might fail with
> out of memory? Are you building for aarch64 as well?
>
> Regards,
>
>
>
> On Wed, Nov 15, 2017 at 1:04 PM, Raphael Kubo da Costa <
> raphael.kubo.da.costa@intel.com> wrote:
>
>> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
>> > I believe this has finally reached a stage where it's ready for public
>> > consumption, hence the CFT:
>> >
>> >     https://github.com/rakuco/meta-browser/tree/chromium62
>> >
>> > I'd like people to look at my commits and let me know if there's any big
>> > issue that would prevent those changes from landing into meta-browser.
>> > If everything's OK, I'd then start sending the patches to the list (or
>> > pull requests on GitHub, whichever is preferred).
>>
>> Thanks to everyone who chimed in on GitHub and Otavio for merging my
>> pull requests.
>>
>> We now have Chromium 62 in meta-browser, and I intend to keep the recipe
>> up-to-date from now on.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

