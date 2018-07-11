Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 06F8A7711B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:02:16 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e139-v6so13120197vkf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZxzW2qg2WQGZxv3HUPWszuSLqguQXZs/gCScR7GTszs=;
	b=DeCurCInfy2g6eIRhg6OXF9xmhbm0UZ3bWXS765NMSQOTu2bCLCKV9yHgcdrhH95+1
	xxOG1xGgCQv2w5rooJXf5OAb0wuuEIFeUxDz9hPEjy7iTkAVUDn/WKN/xitKvWwqYg8e
	FRU3ivNwzUstDJzhomp/9+Ygg58SZooRBzhhhbduCZEri/4YvN3N61cvnM+swEeFvAho
	O3tniUqBpRaZTtV7lyMfTpaFm0wf3jpqnRIzAI7LUYrY48KEgq/4nKi6kZS7pQrA18WS
	Q9aN50nMFOIj5j9JDUdcPRoB8CKAwI+22LCHkmBd0ZPmFKJACgtEoz8MSvr4o4iiqZpg
	KhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZxzW2qg2WQGZxv3HUPWszuSLqguQXZs/gCScR7GTszs=;
	b=UR+zwEgf2SxgMv9pMqvjb/EQQo+dTJH+a5oId9xPg4TS+/N2yYqagGdXRtvf/BlYwR
	TlaYkXp1sH4RpXdE4KYQeHjM5uq83qYxrGy3z+/JTeYeEpKamO8rClI2Sg5QrDdMIiBa
	9vs7wIOhao4RZCoP083yWv3IyBZ+nPaCVRVDKNTahUkCEZgq/NpnYzYQbiOVK70HJ14Q
	lfftGOhRw2d6KQEKpWQSTbZzXixP8k0VqA0hdniDoMPv9c8YVw+Gn0NqICev+Npu0q5y
	Ar7/EO20fvnyh/3UtqVuMT6ut+3jlVCdBcxPaoJbLD8VpjabxnwuAQzh9v5YtkDkS3io
	BGIA==
X-Gm-Message-State: APt69E0NSVnFRXhEW2kXo49zjSxcGHbyNoPZfttcSIMGUFO4nJufFnku
	9GmRTyxNv0tuPgdA1dHr8WCd+/bEOT9pXAXiqrb2fA==
X-Google-Smtp-Source: AAOMgpe2a3fGMEZFxNch1RdwZ/oPTiIr4O5lJ7kMi9r/DnoZpZtsjBxbbVQq8tS0I6RqsHUZwMPSA8QmX0uTMgOIoV4=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr16667787vkh.4.1531321337352;
	Wed, 11 Jul 2018 08:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <1531226869-12905-1-git-send-email-derek@asterius.io>
In-Reply-To: <1531226869-12905-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2018 09:01:51 -0600
Message-ID: <CAMKF1soW02TrSHmS25gCdr=nZK4V9GdHBQysaDXM28cL4NHKmg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-gevent: update to version 1.3.4
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
X-List-Received-Date: Wed, 11 Jul 2018 15:02:17 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build on some platforms e.g. qemuarm and raspberrypi3

| In file included from
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/recipe-sysroot-native/usr/include/python2.7/Python.h:61,
|                  from src/gevent/_greenlet_primitives.c:24:
| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/recipe-sysroot-native/usr/include/python2.7/pyport.h:895:2:
error: #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."
|  #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."
|   ^~~~~
| In file included from
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/recipe-sysroot-native/usr/include/python2.7/Python.h:83,
|                  from src/gevent/_greenlet_primitives.c:24:
| src/gevent/_greenlet_primitives.c: In function '__Pyx_PyBool_FromLong':
| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/recipe-sysroot-native/usr/include/python2.7/object.h:769:6:
warning: dereferencing type-punned pointer will break strict-aliasing
rules [-Wstrict-aliasing]
|      ((PyObject*)(op))->ob_refcnt++)
|      ~^~~~~~~~~~~~~~~~
| src/gevent/_greenlet_primitives.c:668:28: note: in expansion of
macro 'Py_INCREF'
|  #define __Pyx_NewRef(obj) (Py_INCREF(obj), obj)
|                             ^~~~~~~~~
| src/gevent/_greenlet_primitives.c:6007:14: note: in expansion of
macro '__Pyx_NewRef'
|    return b ? __Pyx_NewRef(Py_True) : __Pyx_NewRef(Py_False);
|               ^~~~~~~~~~~~
| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/recipe-sysroot-native/usr/include/python2.7/object.h:769:6:
warning: dereferencing type-punned pointer will break strict-aliasing
rules [-Wstrict-aliasing]
|      ((PyObject*)(op))->ob_refcnt++)
|      ~^~~~~~~~~~~~~~~~
| src/gevent/_greenlet_primitives.c:668:28: note: in expansion of
macro 'Py_INCREF'
|  #define __Pyx_NewRef(obj) (Py_INCREF(obj), obj)
|                             ^~~~~~~~~
| src/gevent/_greenlet_primitives.c:6007:38: note: in expansion of
macro '__Pyx_NewRef'
|    return b ? __Pyx_NewRef(Py_True) : __Pyx_NewRef(Py_False);
|                                       ^~~~~~~~~~~~
| error: command 'arm-bec-linux-gnueabi-gcc' failed with exit status 1
| ERROR: python setup.py build execution failed.
| WARNING: /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/temp/run.do_compile.6087:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/python-gevent/1.3.4-r0/temp/log.do_compile.6087)


On Tue, Jul 10, 2018 at 6:48 AM Derek Straka <derek@asterius.io> wrote:
>
> License-Update: Update the checksum to include a file added in the latest release
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-gevent.inc               | 6 +++---
>  .../python/{python-gevent_1.2.2.bb => python-gevent_1.3.4.bb}       | 0
>  .../python/{python3-gevent_1.2.2.bb => python3-gevent_1.3.4.bb}     | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-gevent_1.2.2.bb => python-gevent_1.3.4.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-gevent_1.2.2.bb => python3-gevent_1.3.4.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
> index 13513f2..074e62f 100644
> --- a/meta-python/recipes-devtools/python/python-gevent.inc
> +++ b/meta-python/recipes-devtools/python/python-gevent.inc
> @@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
>  HOMEPAGE = "http://www.gevent.org"
>  LICENSE = "MIT & Python-2.0 & BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
> -                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
> +                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
>                      file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
>  DEPENDS += "libevent"
>  DEPENDS += "${PYTHON_PN}-greenlet"
> @@ -19,8 +19,8 @@ SRC_URI_append = " \
>      file://libev-conf.patch;patch=1;pnum=1 \
>  "
>
> -SRC_URI[md5sum] = "7f0baf355384fe5ff2ecf66853422554"
> -SRC_URI[sha256sum] = "4791c8ae9c57d6f153354736e1ccab1e2baf6c8d9ae5a77a9ac90f41e2966b2d"
> +SRC_URI[md5sum] = "97deaf53196ba430808e8f18b731112a"
> +SRC_URI[sha256sum] = "53c4dc705886d028f5d81e698b1d1479994a421498cd6529cb9711b5e2a84f74"
>
>  # The python-gevent has no autoreconf ability
>  # and the logic for detecting a cross compile is flawed
> diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python-gevent_1.3.4.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
> rename to meta-python/recipes-devtools/python/python-gevent_1.3.4.bb
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python3-gevent_1.3.4.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-gevent_1.3.4.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

