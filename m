Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSK5h-0008E0-QB
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 23:40:37 +0100
Received: by ug-out-1314.google.com with SMTP id i24so4602276ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2008 14:40:27 -0800 (PST)
Received: by 10.67.30.6 with SMTP id h6mr1560939ugj.6.1203633627530;
	Thu, 21 Feb 2008 14:40:27 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id e23sm509082ugd.56.2008.02.21.14.40.21
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 14:40:22 -0800 (PST)
Date: Fri, 22 Feb 2008 00:42:09 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Using OE <openembedded-users@lists.openembedded.org>
Message-ID: <20080222004209.1e620727@widy.localdomain>
In-Reply-To: <e5e16330802211323s32c8d7d4g8456d5192740344b@mail.gmail.com>
References: <1203623870.13925.82.camel@MP-L057.nanofluidics.com>
	<e5e16330802211323s32c8d7d4g8456d5192740344b@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.172
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: x86_64 multilib system
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2008 22:40:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 22:23:20 +0100
"Kees Jongenburger" <kees.jongenburger@gmail.com> wrote:

> Hello Casey,
> 
> I played with getting mamona to compile "native" on my amd64 machine
> (I was quite far but gave up at one point). Here a some notes that
> might or might not be helpfull
> they where certainly not checked against somebody with positive OE
> karma. but who knows

Thanks for the patches below, but for full use from them they'd rather
be submitted to bugtracker where they have more chance to improve
situation.

> 
> 
> in kernel-arch I I removed the "," between x81_64 and i386 I think
> this was a bug causing
> some flags to not be set correctly
> 
> ============================================================
> --- classes/kernel-arch.bbclass
> 2c3267a2a81eb0cb438cf4a9c97de95535bedf94 +++
> classes/kernel-arch.bbclass 7ea458d4d49227e7004dac30da9b196af78b7adc
> @@ -5,7 +5,7 @@ valid_archs = "alpha cris ia64 \ #
> 
>  valid_archs = "alpha cris ia64 \
> -               x86_64,i386 \
> +               x86_64 i386 \
>                 m68knommu m68k ppc powerpc ppc64  \
>                sparc sparc64 \
>                 arm  arm26 \


Committed.

> 
> glibc (I think the scripts where not ready for x86_64 ) they do some
> magic with the header files but not in this situation (therefore I
> pointed to the "running" headers
> ============================================================
> --- packages/glibc/glibc_2.6.1.bb
> 1753994ceec7d4c54e81239f486d92052e46c752 +++
> packages/glibc/glibc_2.6.1.bb
> b10038068973152df71cda0d5b20ba23c8db5dbd @@ -80,7 +80,7 @@
> EXTRA_OECONF = "--enable-kernel=${OLDEST --without-cvs
> --disable-profile --disable-debug --without-gd \ --enable-clocale=gnu
> \ --enable-add-ons=${GLIBC_ADDONS} \
> -               --with-headers=${STAGING_INCDIR} \
> +               --with-headers=${STAGING_DIR_TARGET}/kernel/include \
>                 --without-selinux \
>                 ${GLIBC_EXTRA_OECONF}"
> 
> I was missing a site file for the amd64 therefore I copied pasted
> until it all worked
> ============================================================
> --- site/ix86-common    d8fa481822d52ac3e2192ceabc012ca07c564206
> +++ site/ix86-common    cf3e197d35f354997be356fc45deb95c81d66aff
> @@ -262,3 +262,5 @@ ac_cv_have_abstract_sockets=${ac_cv_have
> 
>  #dbus
>  ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
> +
> +ac_cv_func_shmat=${ac_cv_func_shmat=no}
> ============================================================
> --- site/x86_64-linux   05744d78da6f03499c0638db01b23ffc637b18b2
> +++ site/x86_64-linux   e102617a308de8f8fe7d7bfd738b26bfb0b0426a
> @@ -1,8 +1,10 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func
>  ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
>  ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
>  ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
>  ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
>  ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
> +ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
> +ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
>  ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
>  ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
>  ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
> @@ -48,6 +50,7 @@ glib_cv_sane_realloc=${glib_cv_sane_real
>  glib_cv_long_long_format=${glib_cv_long_long_format=ll}
>  glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
>  glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
> +lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
>  glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=40}
>  glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
>  glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=8}
> @@ -78,5 +81,14 @@ am_cv_func_working_getline=${am_cv_func_
>  # gettext
>  am_cv_func_working_getline=${am_cv_func_working_getline=yes}
> 
> +#gstreamer
> +as_cv_unaligned_access=${as_cv_unaligned_access=no}
> +
>  #gcc
>  ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
> +
> +apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
> +apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
> +
> +dpkg_cv_va_copy=${ac_cv_va_copy=yes}
> +dpkg_cv___va_copy=${ac_cv___va_copy=yes}
> 
> 
> 

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


