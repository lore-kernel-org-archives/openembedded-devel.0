Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id B082871A9D;
	Thu, 16 Feb 2017 22:08:26 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id l19so15229660ywc.2;
	Thu, 16 Feb 2017 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gAOc40eqiDx251WrOZ5AhyqA99o2CAycUsCEoqTYf8s=;
	b=dpA7nkk/+FqkCjWa28sD7p8F1mxPhP3zaqp7Jepo7YOm4MTBD5m3RZBKS1WPwlVWWJ
	fVELqrUfgy3nAqBV+gdf/K4FJXXh/hECIBhbhh6h8fg/HIzfqeDGG5kPGvu8rwVgYJi6
	EH6J3MHgiqIjNUNLXij9E0DcsdwDpLqwL3w4JOYeeb2VrSfhbEbz/eeU94UYzPqP/Myu
	E0tFhaLQMuy8kB9OkPIwczHjiIoB/FSY50BSxmYz2PV5ERUTVvDSdT5Hzos77zblZmSG
	a0/W6T0+CAZC55JjAHS/B4+OMxRI/F2IN8uQTPi6s7UiQ/g7fUzLZq2zWrl7JnUalnV+
	awcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gAOc40eqiDx251WrOZ5AhyqA99o2CAycUsCEoqTYf8s=;
	b=KM4ETaxv+WCKDqisZw4JVXWi5RdZBx2hJ8TEh2AeQoNLL7FxJYUCun/qISxGZLzCRo
	+l72D7qcgp5Hh5Vt6praAXehxMei/H2gieFgTdTUlcd3g2mPaqNMUfR35wMM6I8bBan8
	/UQDuJXlxazKd13C9zNhoAqsIcpPa+IXNN8IhdwQOINngbuZv5WEZi2ZCofR/pd4c5nk
	E85e13DDpUpHZNpE5lC23JTXG4LxGAyw3JqtNvVCr+SBFHL88F7WN3YispHQUIhKfPCJ
	x/GPBzjn3hge7CyRAPTbAkOWNI60VyI7cIC3mADuwjb0eRRl8wNRoT+qNkCucl4DdfLj
	+/2w==
X-Gm-Message-State: AMke39nprN8iGL5CDG6fEmuPdaQRlyTsqDQyHnJ0seL4/hXsWb/xOstk9CHX4WoldE1ucTn6kGn7NwXSDPEJXQ==
X-Received: by 10.129.158.78 with SMTP id v75mr3419748ywg.5.1487282906320;
	Thu, 16 Feb 2017 14:08:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.83.68.39 with HTTP; Thu, 16 Feb 2017 14:08:25 -0800 (PST)
In-Reply-To: <20170216124415.GC3621@jama>
References: <20170216124415.GC3621@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Feb 2017 23:08:25 +0100
Message-ID: <CA+chaQe=BDKT49-jnDzsTObntQ-wte4J4cmBcdjmBxUq2_XZYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, Failed tasks 2017-02-14
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
X-List-Received-Date: Thu, 16 Feb 2017 22:08:27 -0000
Content-Type: text/plain; charset=UTF-8

There are 2 more issues in oe-core once I enable ptest (together with
already enabled gold):

oe-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_ptest_base

| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_init'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_mutexattr_settype'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_mutexattr_destroy'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_trylock'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_attr_setstacksize'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecific'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecific'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
| collect2: error: ld returned 1 exit status
| make[1]: *** [globalmutexchild] Error 1


oe-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base

| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined
reference to 'uuid_generate'
| collect2: error: ld returned 1 exit status
| make: *** [fs-resize] Error 1


Once my morty builds are finished I'll try to reproduce this in
master, but I think I've seen this failure with ptest before yesterday
for master as well.


On Thu, Feb 16, 2017 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Another run with couple unblacklists
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2017-02-14    ||0     ||1     ||0     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||198           ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-02-14 ==
>
> INFO: jenkins-job.sh-1.8.17 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170214_164708.log
>
> === common () ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (1) ===
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.
> 0.2785.143.bb:do_compile
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (1) ===
> {| class=wikitable
> |-
> || qemuarm      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170214_135645.log/ ||
> |-
> || qemux86      || 1     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170214_135710.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32480/
> |-
> || qemux86_64   || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170214_151408.log/ ||
> |}
>
> === PNBLACKLISTs (445) ===
>
> === QA issues (198) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||198   ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170214_151247.log/
>
> No issues detected
>

