Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C973CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 05:31:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.8968.1757655105900396911
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 22:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzBp/BWk;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e96so192590a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 22:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757655104; x=1758259904; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbN8chaexdrKFNWUsHVNBMm7QOdByQnQRlFqmlFRJpY=;
        b=GzBp/BWkJ9FeeukGYtDwA+95PoJdpspGThdLizzRn3N2NWt1zImhylJ9vObqjgjLFr
         t+XBO86MJC7YFOOC1fDa7hNZfAEpYn4n+n3xvBdBWoL4Ga5aRdORND7rTTGvWk7StU6U
         iQQt2R++XbA0kjXqT0Or3fl5vJTdlCVK98o1tt/2M7zTI4uWtixSmgVUoomUCQRlf1PL
         753pgIYTaPuFcvZxUJ0z5cEzBEsKWYUT8JWaw3d23OKlhZwtt/IiXfwVU3oGwTL6cPix
         RW2kkxoBN3N5w5ddG87ad06TAJAYzHnO7+IpB0z3BpkjuUEyfNo7CkEEdBV1aEevzRze
         XsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757655104; x=1758259904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbN8chaexdrKFNWUsHVNBMm7QOdByQnQRlFqmlFRJpY=;
        b=a45zqeq4GYKIB9pbJFakfsLUrPotCViaci2VnjuH/RiWNB4qlEk5fjeI4NdWccQi38
         52F463VyUGPcDKyAtvQ2wg4Y0f2jlGylX63qOeSSbuQO7sKKPNOvPnBBsqPY7I84XwdO
         ew6v4OLk7S1X4dyU5RsX/HdfDP+qhmgjly0yveqTncKu+N3iVEH+DAzfko8IUB6b3pjk
         0tbZ6ndqzF6hRj+FofFjTt6GuoyrcpXSsgFQhJvFx9MdOq/ihS02KAVP45BpomXEYMf0
         2NCkv3GrJzz4P1cQa826Me95NMU+ceO2Yw23ZO6u34mEPwsjbohga7RgxPNML3F3mptj
         cM1w==
X-Forwarded-Encrypted: i=1; AJvYcCXcRu4MPvNGyWcuZOfnpO4aQEKGjmGKOFQiKcPf3Zy5nBwGqoIY2x6wQCGVF0hZQLp3RGqlkMWDCsJWs7nRtmBzDzU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YysNdf5iIQ4KWOhj9756AM84d9fxS1JOxW53Oia4VxdiKGPnoUf
	hyqwzl0Ay4SYiqlFhzghhJ34pP5IQPsLV4LNcbv8MVrQ4DLE/SDK4ViK
X-Gm-Gg: ASbGncv1Jeebg0tTShmqJVdkXpWjKPzisg5DwhBEIMc6LKWuh6xKj498cDxKDoMC0y2
	QMkQleBqRdykRUzt9xbGSrcUmsKu4u19CzaQCY12l6qtX73O6GijsORdy+ozdjAqtGr/Csme2oj
	FXglsEARTRbgiB6+dblxPg1CtG+efRljehG12RQK/h/rbS2+zPBxPEk1k8ryS31e2SHp6uoK/4c
	I7oqUhi5NbKAlIsEEJETd+lgvzR3o4C+BRJZwvkNAxoHqtE4ytFqWTYffpZtUEcNMRtGGkQdaym
	dZtFKq+EMHY88scVCT13KxEnln4O+ih4bHqQOi5v/pYOaM4kp0ecFcYYP+MKqlpTCESmTWcx/Wd
	FfkFkLG1tRElAuEGDY0mKPJQLI28rLVM=
X-Google-Smtp-Source: AGHT+IFpdpE0MpK16tDA4TAMYpdgrhYavwO2cc4lxkoZx6QORAyiLFLfx1sDf5+h+VAqe2jsL0ZXxA==
X-Received: by 2002:a17:907:9408:b0:b07:880c:145a with SMTP id a640c23a62f3a-b07c396e9f7mr160612766b.55.1757655103685;
        Thu, 11 Sep 2025 22:31:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da33dsm292552666b.1.2025.09.11.22.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 22:31:43 -0700 (PDT)
Message-ID: <b58147c8-aef8-4c76-92e3-c7c275adfb73@gmail.com>
Date: Fri, 12 Sep 2025 07:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
To: Jiaying.Song.CN@windriver.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <18566FD02919233B.1178@lists.openembedded.org>
 <IA4PR11MB94207CB4386B7615A2F354CCB809A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <IA4PR11MB94207CB4386B7615A2F354CCB809A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 05:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119373

On 9/11/25 05:38, Song, Jiaying (CN) via lists.openembedded.org wrote:
> kindly ping for walnascar branch.

It is queued for the next walnascar release.

>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
> Sent: Monday, July 28, 2025 10:14 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> * Remove GLIBC_64BIT_TIME_FLAGS="" to enable _TIME_BITS=64 by default,
>   which avoids the following QA issue during builds on 32-bit systems:
>
>   WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bin/cec-compliance uses 32-bit api 'time'
>
> * Undefine _TIME_BITS to fix the build error:
>
>   /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
>  .../v4l2apps/v4l-utils_1.28.1.bb              |  5 +--
>  2 files changed, 39 insertions(+), 4 deletions(-)  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
> new file mode 100644
> index 0000000000..f41dde0e16
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix
> +++ -arm-_TIME_BITS-64-error.patch
> @@ -0,0 +1,38 @@
> +From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
> +From: Hans Verkuil <hverkuil@xs4all.nl>
> +Date: Sat, 12 Apr 2025 12:30:13 +0200
> +Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
> +
> +Undefine _TIME_BITS to avoid this error on 32-bit arm:
> +
> +/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> +
> +Upstream-Status: Backport 
> +[https://github.com/gjasny/v4l-utils/commit/d517cfdcdc16533ab7e06e97c07
> +ca089cf261aef]
> +
> +Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + meson.build | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 269a9da7..31927cda 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
> +     # As the library needs to provide both 32-bit and 64-bit versions
> +     # of file operations, disable transparent large file support (fixes
> +     # 'Error: symbol `open64/mmap64' is already defined' compile failure
> +-    # otherwise)
> ++    # otherwise).
> ++    #
> ++    # Also disable _TIME_BITS=64 since this is allowed only with
> ++    # _FILE_OFFSET_BITS=64, which is now 32.
> +     '-U_FILE_OFFSET_BITS',
> ++    '-U_TIME_BITS',
> +     '-D_FILE_OFFSET_BITS=32',
> +     '-D_LARGEFILE64_SOURCE',
> + ]
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> index afe217e1f3..5d21df04af 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> @@ -13,10 +13,6 @@ DEPENDS = "jpeg \
>  DEPENDS:append:libc-musl = " argp-standalone"
>  DEPENDS:append:class-target = " udev"
>  LDFLAGS:append = " -pthread"
> -# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to -# both 32 and 64 bit file APIs.  But it does not handle the time side?
> -# Needs further investigation
> -GLIBC_64BIT_TIME_FLAGS = ""
>  
>  inherit meson gettext pkgconfig
>  
> @@ -29,6 +25,7 @@ SRC_URI = "\
>      git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
>      file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
>      file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
> +    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
>  "
>  
>  SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119351): https://lists.openembedded.org/g/openembedded-devel/message/119351
> Mute This Topic: https://lists.openembedded.org/mt/115182764/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


