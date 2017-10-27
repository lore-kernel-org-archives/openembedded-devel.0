Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 45E24782D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 21:47:29 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n14so5814356pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gtvB+EIPHoRn5Eg2PFAfiphlZGonBdIfAPTComWVk04=;
	b=eWbbOxXcnZwPJ8N6eWh+JcPG3/jkPPN+sVG7lnQzyG6EBbhmomj7V+4+NduoUkOXCQ
	97a/icsw7hIu+8ozgn0tYm82+xPorM2txS0Wi8EDZkPn2dwzath+cCSPOk1nwrg91NMQ
	3Lnji04uHc9YFWBFQpN8A08V15nx9yAzpgCZ0krTVXlB9xtCoa2G5SDnH1NhXRDdEkXV
	7e6TiQcg6Rx3/F7rG48d4aw1DzBXP/5vhbHtL/GutvXaKwro1GmpkBK6bB4LIzqLrFZ/
	kO8ACDnHCdanKzI5RQXAiiKY/qLbZqiDcdWN/sTPxUdBCziOVngZ7Ma5PIAUSUnE76Mh
	mCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gtvB+EIPHoRn5Eg2PFAfiphlZGonBdIfAPTComWVk04=;
	b=NumLtApcD9I423wZSBCMKV/VjeOgv969m6VudzqECofe71OzVyOZGLj5sHqoUWTMtF
	GW6DzAjzSnG3UDcz2V9D7PmqLFg6FKEt/Jiyh5VglYhr+22+7HNkiOvt43B2KNe36p+y
	EkMirjrr2kkxTzYq+gL05o9uga4JRO+6iR7FVZi39Z2MiEnzltm+eEedUTc90ioUVGpC
	wiOw3XbpKM1b9uyyoa06OjFOaSMTmE6YNHi1F/WUxl0zpD0yIzfbCwMbdrkvw4zL4m3k
	wCzgr5oE6VuCp/q+uAheVAhfJ+NccqsqpDKJRX/JdWLXrFnVuYWIkcSlELjzT1jn7HkL
	KJRw==
X-Gm-Message-State: AMCzsaX6fPsMMZKF8RZZOKCADpMQ2USPxsVvWZDgB5iA4kYrKKxNrqOz
	cJe+OfKs44n1EpyMkGHOaU/MH+tH+8199RgczrU2Jw==
X-Google-Smtp-Source: ABhQp+QYd5tHjrQmfJQkiPrAVUnUQOdy1EsOXF5m+kPZ+cA1OS5uCKhwLz5A3JHBgob4OzXpPUrbNH0/GNt1ZEyUo3g=
X-Received: by 10.99.152.17 with SMTP id q17mr1346929pgd.287.1509140850472;
	Fri, 27 Oct 2017 14:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 27 Oct 2017 14:47:00 -0700 (PDT)
In-Reply-To: <1509104625.420326963@apps.rackspace.com>
References: <1509104625.420326963@apps.rackspace.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Oct 2017 14:47:00 -0700
Message-ID: <CAMKF1som=YH4yOwYMrj+GojgmnrMfMGO3V99JcGq2TV7p71NNw@mail.gmail.com>
To: Scott Ellis <scott@jumpnowtek.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: mesa-gl build failing for RPi0
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
X-List-Received-Date: Fri, 27 Oct 2017 21:47:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 27, 2017 at 4:43 AM, Scott Ellis <scott@jumpnowtek.com> wrote:
> Using rocko
>
> ...
> | glsl/.libs/libstandalone.a(libmesautil_la-disk_cache.o): In function `evict_lru_item':
> | /usr/src/debug/mesa-gl/2_17.1.7-r0/mesa-17.1.7/src/util/disk_cache.c:615: undefined reference to `__atomic_fetch_add_8'
> | glsl/.libs/libstandalone.a(libmesautil_la-disk_cache.o): In function `cache_put':
> | /usr/src/debug/mesa-gl/2_17.1.7-r0/mesa-17.1.7/src/util/disk_cache.c:886: undefined reference to `__atomic_fetch_add_8'
> | glsl/.libs/libstandalone.a(libmesautil_la-disk_cache.o): In function `disk_cache_remove':
> | /usr/src/debug/mesa-gl/2_17.1.7-r0/mesa-17.1.7/src/util/disk_cache.c:637: undefined reference to `__atomic_fetch_add_8'
> | collect2: error: ld returned 1 exit status
> | Makefile:2076: recipe for target 'glsl_compiler' failed
> | make[4]: *** [glsl_compiler] Error 1
> | make[4]: Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/src/compiler'
> | Makefile:1528: recipe for target 'all' failed
> | make[3]: *** [all] Error 2
> | make[3]: Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/src/compiler'
> | Makefile:840: recipe for target 'all-recursive' failed
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/src'
> | Makefile:631: recipe for target 'all' failed
> | make[1]: *** [all] Error 2
> | make[1]: Leaving directory '/oe4/rocko/tmp-rocko/work/arm1176jzfshf-vfp-poky-linux-gnueabi/mesa-gl/2_17.1.7-r0/build/src'
> | Makefile:631: recipe for target 'all-recursive' failed
> | make: *** [all-recursive] Error 1
> | ERROR: oe_runmake failed
>
>
> The solution used for armv5 boards in mesa.inc works for armv6
>
>   CFLAGS_append_armv6 = " -DMISSING_64BIT_ATOMICS"
>

isn't rpi0 based on armv6k for which 64bit atomics should be fine.
are we using wrong tune files ?

>
> I'm using it in a private layer bbappend, but might belong
> in mesa.inc alongside the armv5 line.
>
>
> Some discussion of the bug here
>
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=874531
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

