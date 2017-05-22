Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 73D9A77F3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 17:16:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so34424945wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AKQIaeVR+xaxJ3y1j7oF4DIOxOlv2rtuoDkQeiaoxHI=;
	b=ddjUSFm2m2ZD8k15R4r7cKZEFxcHWO96emWIE58Ufy4JGFBWWN6YIsadkaodRIBpaW
	kC99lvssjadu5EQgWvTORiBBC0pX8Nwi5CBAPQn3fCDOeh2ZOvMM5kn5Hcc+c4/2s7RR
	PrtFbwvhQ1P5UsoKdhb1dH1UuNb6GL3ZShponW9J2zHF8USKaQDIE9iWKrJvaG4VIbK7
	UeoxyPT57tVsG37U46y3n4Hlm9/RywJPE+o9RgpkjTWjt+e37bV8OEFgqB2+g4sbxtTb
	2dIMU7SA1eSJAVPTd90bwS+9P9IRhSZzISAPY3q9dUgrdhZZKSHjDDW8ePeCidMJs4/r
	uMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AKQIaeVR+xaxJ3y1j7oF4DIOxOlv2rtuoDkQeiaoxHI=;
	b=FuLBJDF+YHbfVNshzHIwUUgyrKq5wCSSXdANPEG9Yeez80lVKFmlW4R0WYBdY53JZ4
	o5/A7zH8HqX7fVXgiLP+eIGf0Gwzs92T0zh6ZiqwhCsd+j2cdat2lJLd7p88FFByFBoR
	bC57NclhmZ2kPu6oVWXVyE+DlEHOpRxi7efTKJ9Aq5gVt1osQQ/lfwcerK1dEZi+tjl4
	5t1yGKXyLKe7Cvnag/daMsNzSQl6p+Sl0wP85S5b39Elvj9aUz5tiar48SwRr0mrK6Q9
	JfJrsbBXAFXABB81UMuKuVm/+fRueedE7sYZZ4RL5FPEIL1NO6tnWwCFcqYj9BbFIQ8T
	CZ/g==
X-Gm-Message-State: AODbwcCgECS94YpCvfemqOtC38CnTH3RVCks8vpV4uSCe4MYfOxLMskB
	xyABnieZK8BJfKWZysRLuzBD4Esqwg==
X-Received: by 10.80.144.118 with SMTP id z51mr17593712edz.143.1495473385818; 
	Mon, 22 May 2017 10:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 22 May 2017 10:15:55 -0700 (PDT)
In-Reply-To: <1495446128-16379-1-git-send-email-mingli.yu@windriver.com>
References: <1495446128-16379-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2017 10:15:55 -0700
Message-ID: <CAMKF1srditLnzmDSqv8TnjpidS_yyE7T3AWu3fykPBfkm80POw@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] opensaf: Add -latomic to LDFLAGS
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
X-List-Received-Date: Mon, 22 May 2017 17:16:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 2:42 AM,  <mingli.yu@windriver.com> wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * Add "-Wl,--as-needed -latomic -Wl,--no-as-needed"
>   to LDFLAGS to let the libatomic handled automatically
>   if required to fix below build error as atomic
>   operations on some arch such as x86 are supplied by
>   the compiler. For other arch which lacks the instructions,
>   a standardized external call provided by external library
>   libatomic will be made to perform the operation.
>
>   | src/amf/amfd/bin_osafamfd-main.o: In function `std::__atomic_base<unsigned long long>::load(std::memory_order) const':
>   | $Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/recipe-sysroot/usr/include/c++/6.3.0/bits/atomic_base.h:396: undefined reference to `__atomic_load_8'
>   | $Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/recipe-sysroot/usr/include/c++/6.3.0/bits/atomic_base.h:396: undefined reference to `__atomic_load_8'
>   | collect2: error: ld returned 1 exit status
>   | make[2]: *** [Makefile:8200: bin/osafamfd] Error 1
>   | make[2]: *** Waiting for unfinished jobs....
>   | make[2]: Leaving directory '$Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/build'
>   | make[1]: *** [Makefile:19749: all-recursive] Error 1
>   | make[1]: Leaving directory '$Prj/build/tmp/work/ppc7400-wrs-linux/opensaf/5.2.0-r0/build'
>   | make: *** [Makefile:6175: all] Error 2
>
>  Reference: https://gcc.gnu.org/wiki/Atomic/GCCMM/LIbrary#line-23
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> index babf03e..be79ba8 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
> @@ -43,6 +43,8 @@ PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' sys
>
>  PKGLIBDIR="${libdir}"
>
> +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
> +

it would be better if the configury could detect libatomic and then we
could use a PACKAGECONFIG knob to control it based on if libatomic
is avaliable in a given combination or not.

>  do_install_append() {
>      cp -av --no-preserve=ownership ${B}/lib/.libs/*.so* ${D}${libdir}
>      rm -fr "${D}${localstatedir}/lock"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

