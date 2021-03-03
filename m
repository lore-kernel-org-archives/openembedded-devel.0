Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.2778.1614745941868302108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 20:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CsyWA2x6;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id e9so3367053pjs.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 20:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0d59bGegK5S3iZMkMPhe5dkN6OUDKJiD/+yxypf5w+E=;
        b=CsyWA2x665Iea/iHcD6o4E9DGfr826c/Ryp3gwDyZfWbO45Kq3QW9oyVALauIDJZiL
         4v7nDM0OopAxVDOY7kmkJ6/dqpm7v9RTOjqDnJQw43urQNXg2FQw3yqNAsGhrFBxGD0T
         5dWdOcmj7pI2I1Q2wIBChckCjT/YLg4QnRkufz5GCDQwvKl8U4ZtJF+2BQcLVuMLYVf8
         eYF0u93a0tFV1uYYF4z6/GNXN3h+XBm9fbKrgwBCEs+x+fPDjHf1orU97Ou6rSSEaXmc
         xL/3BfLRaWHHjAIhrOK2b2WAgGSAKG+ARygjPLYlBzICOTkxbgrkFR+IMf6X7a8vSLw+
         1A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0d59bGegK5S3iZMkMPhe5dkN6OUDKJiD/+yxypf5w+E=;
        b=R0J0CAcCLFVTppe8OsK3Uhs2w17wkxE177eTjQJ5SCe8VI1x+tVEoSNZTMU7Cnysi9
         hAE14l1wd6gDwcxmvU3hP4IV/ePzVIX5jzqIXInSRofikaaZPRw6WQDfIWhE/+EIe33/
         RgjYAJSw4iEAbJgywlSHgmo83hu66hGZfw7KmytmtskFDt1qn+7ju3ZkX+njCUbuj0ui
         M6Sa4wlVEnPlhWAb8fin7wcVwIhYn1kym9eLA92AZJsqD2HyTQDA0JadH0nIBDLqBJUu
         4qzc38q0DuQKOYHTBggQUjbWNt2ti9RmEiWgge58BII3UEn6mu2VW/y2lRUm7r0mGMxm
         NE3w==
X-Gm-Message-State: AOAM532rDVTe+AICNkV4pxRVoXgxePr5VeWkFYMNj4Db6iY9TUMIMyYt
	pbMUg/bkMH67LIP84l8qIdOrbYcK32uB5Q==
X-Google-Smtp-Source: ABdhPJwbW4rGDU9sdMeIjqBlY0ZXDOQIKQc3gq7CtK+Rdod5SfjS2MdcJnamygZ76ysG+3KkutG9ug==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id lx14mr7680111pjb.147.1614745941024;
        Tue, 02 Mar 2021 20:32:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::e4fa? ([2601:646:9200:a0f0::e4fa])
        by smtp.gmail.com with ESMTPSA id b17sm935877pfp.136.2021.03.02.20.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 20:32:20 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: update to 1.20.0
To: Ulrich ?lmann <u.oelmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
References: <20210302124120.17357-1-u.oelmann@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7d53aded-45d1-c1b0-7c1d-5008f988a532@gmail.com>
Date: Tue, 2 Mar 2021 20:32:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302124120.17357-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I am seeing some packaging errors

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/988

I have sent a followup patch, but please review it and test it out if 
its the right way when systemd is in DISTRO_FEATURES

On 3/2/21 4:41 AM, Ulrich ?lmann wrote:
> Add new buildtime configuration options, update context of two patches and
> remove two patches as there are fixes [1]-[3] found upstream in the meantime.
> 
> [1] 38f4ce74275a ("keytable: use input_event properly")
> [2] 8b7e6ce9367f ("keytable: add compatibility for input_event_sec")
> [3] 976a2f681b4e ("keymap.h needs sys/types.h and argp.h with musl")
> 
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   ...k-mc_nextgen_test-with-libargp-if-ne.patch |  2 +-
>   ...fine-error_t-and-include-sys-types.h.patch | 45 -------------------
>   ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 -----------------
>   .../v4l-utils/0007-Do-not-use-getsubopt.patch |  2 +-
>   ...4l-utils_1.18.1.bb => v4l-utils_1.20.0.bb} | 10 ++---
>   5 files changed, 7 insertions(+), 93 deletions(-)
>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>   rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.1.bb => v4l-utils_1.20.0.bb} (86%)
> 
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
> index 8033fcacf200..a849d465c7bc 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
> @@ -14,7 +14,7 @@ diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
>   index 0188fe2..dac07f3 100644
>   --- a/contrib/test/Makefile.am
>   +++ b/contrib/test/Makefile.am
> -@@ -40,7 +40,7 @@ sdlcam_CFLAGS = -I../.. $(SDL2_CFLAGS)
> +@@ -42,7 +42,7 @@ sdlcam_CFLAGS = -I../.. $(SDL2_CFLAGS)
>    sdlcam_LDADD = ../../lib/libv4l2/libv4l2.la  ../../lib/libv4lconvert/libv4lconvert.la
>    
>    mc_nextgen_test_CFLAGS = $(LIBUDEV_CFLAGS)
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
> deleted file mode 100644
> index 57948add6ed4..000000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 137ce23ae677b11e5483ef810751edae7bf96bb9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Nov 2019 18:40:06 -0800
> -Subject: [PATCH] Define error_t and include sys/types.h
> -
> -Fix 'unknown type name' for error_t and u_int32_t.
> -u_int32_t is defined in sys/type.h
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - utils/ir-ctl/keymap.h   | 4 ++++
> - utils/keytable/keymap.h | 5 +++++
> - 2 files changed, 9 insertions(+)
> -
> -diff --git a/utils/ir-ctl/keymap.h b/utils/ir-ctl/keymap.h
> -index f2b2963..1f8a3f8 100644
> ---- a/utils/ir-ctl/keymap.h
> -+++ b/utils/ir-ctl/keymap.h
> -@@ -2,6 +2,10 @@
> - #ifndef __KEYMAP_H
> - #define __KEYMAP_H
> -
> -+#include <sys/types.h>
> -+#ifndef error_t
> -+typedef int error_t;
> -+#endif
> - struct keymap {
> - 	struct keymap *next;
> - 	char *name;
> -diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
> -index f2b2963..345d55d 100644
> ---- a/utils/keytable/keymap.h
> -+++ b/utils/keytable/keymap.h
> -@@ -2,6 +2,11 @@
> - #ifndef __KEYMAP_H
> - #define __KEYMAP_H
> -
> -+#include <sys/types.h>
> -+#ifndef error_t
> -+typedef int error_t;
> -+#endif
> -+
> - struct keymap {
> - 	struct keymap *next;
> - 	char *name;
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
> deleted file mode 100644
> index a8926762edd2..000000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From b213da2d5fcc93cd24fc880c71c717d8e2ce2968 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Nov 2019 18:43:21 -0800
> -Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
> -
> -time element is deprecated on new input_event structure in kernel's
> -input.h [1]
> -
> -[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - utils/keytable/keytable.c | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> -index 6cb0217..59ff1ee 100644
> ---- a/utils/keytable/keytable.c
> -+++ b/utils/keytable/keytable.c
> -@@ -53,6 +53,11 @@
> -
> - # define N_(string) string
> -
> -+#ifndef input_event_sec
> -+#define input_event_sec time.tv_sec
> -+#define input_event_usec time.tv_usec
> -+#endif
> -+
> - struct input_keymap_entry_v2 {
> - #define KEYMAP_BY_INDEX	(1 << 0)
> - 	u_int8_t  flags;
> -@@ -1533,7 +1538,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
> -
> - 		for (i = 0; i < rd / sizeof(struct input_event); i++) {
> - 			printf(_("%ld.%06ld: event type %s(0x%02x)"),
> --				ev[i].time.tv_sec, ev[i].time.tv_usec,
> -+				ev[i].input_event_sec, ev[i].input_event_usec,
> - 				get_event_name(events_type, ev[i].type), ev[i].type);
> -
> - 			switch (ev[i].type) {
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> index ac704c72dcac..e3ce45d1673e 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> @@ -20,7 +20,7 @@ diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common
>   index 651917e..cea57b7 100644
>   --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>   +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> -@@ -782,15 +782,17 @@ static bool parse_subset(char *optarg)
> +@@ -785,15 +785,17 @@ static bool parse_subset(char *optarg)
>    
>    static bool parse_next_subopt(char **subs, char **value)
>    {
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> similarity index 86%
> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> index 193335deaace..7d9664622042 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> @@ -20,14 +20,14 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
>              file://mediactl-pkgconfig.patch \
>              file://export-mediactl-headers.patch \
>              file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
> -           file://0005-Define-error_t-and-include-sys-types.h.patch \
> -           file://0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
>              file://0007-Do-not-use-getsubopt.patch \
>              "
> -SRC_URI[md5sum] = "ff2dd75970683be9a301ed949b3372b3"
> -SRC_URI[sha256sum] = "25fc42253722401f8742f04dc50a444dfa9b75378e7d09b55035bcbb44c5f342"
> +SRC_URI[md5sum] = "46f9e2c0b2fdccd009da2f7e1aa87894"
> +SRC_URI[sha256sum] = "956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7"
>   
> -EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
> +EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev \
> +                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32 \
> +                --with-systemdsystemunitdir=${systemd_system_unitdir}"
>   
>   VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
>   
> 
> 
> 
> 
> 
