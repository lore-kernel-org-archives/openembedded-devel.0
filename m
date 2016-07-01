Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60B7660111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:56:59 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id a2so11584045lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=c6/PfXnhJpvg0sHDIdnirVGILZdCQCBL9QuundkeN+k=;
	b=STb/VM9XQCpxRR9VeKljeHpqSN4sOl/nYW7ZY154ap79TAsi/+b6d3CmEGG/pdnvfJ
	swpjeS9KciXu6W1HIDtBFrQhllXWM3O7Og8NkT809Eh5QZ0uyPKhJgP48HLjbGPLTf4m
	dc6U4RdscEkK1wPIuTfIOP0Dm6YUioH0AuI4qKmzGGmsfrW5OMWxZpn/wcXax/KrhPf6
	xGfZgZCXNb9TAKEg2QA4ymtsqNs+jrr0+a+8kCxwPNflQsRVQ0tbZfqcvAcTw8exfr+e
	MRoqObKhrLwYbR3vuxCPydaEqEpLMEWiQ3Zg5+12hf5Pr7OnYpwrwR+Mpb33JKo3Wop1
	BOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=c6/PfXnhJpvg0sHDIdnirVGILZdCQCBL9QuundkeN+k=;
	b=L7hsOXH/1e1Ev7kZ3uVpXZAW1NOybWADHnswysxgymL9w3FMWXf5upRO67MQnV+15r
	ZVuoWvXRffRouqBJQzBnDHlvZ8wFGj4f3Uku7agmY3sPLwtXEsQzRRlvqMSUVKQe6KW7
	fC4LeqmLRiIwX4rPOLzkHVC2jpi1cDkbYpynvQ9EKu8CI/b6r24r5vw/VqfeVeiFvoXv
	LvgEemCd6Hx+c1YxwzQ3dwqNg/R3kYfN42pLNT4qmxpZ948klj7slw1qFAdzBPi2KN9D
	a70ZwdaWrgayxjt0QvXCis0hF1l6wjPPN4cSSE6T+dMMpVN+lYSOlJE+RV/GsA2YAOiN
	/XjA==
X-Gm-Message-State: ALyK8tIdN8igABaKDJVtLrM5f+YTVAymTnvUaT56CWUzhd4fGIV29UoOzxFSBdoUQkOa3YqOCDmU4Lf6oVxYNg==
X-Received: by 10.25.32.85 with SMTP id g82mr7577697lfg.184.1467385019679;
	Fri, 01 Jul 2016 07:56:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Fri, 1 Jul 2016 07:56:30 -0700 (PDT)
X-Originating-IP: [179.105.243.72]
In-Reply-To: <CAMKF1so5SPCvuyiVXej2z3M2n+Z2uCskG7_2f5hdYZx+3JGS9w@mail.gmail.com>
References: <1467378824-13923-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAMKF1so5SPCvuyiVXej2z3M2n+Z2uCskG7_2f5hdYZx+3JGS9w@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 1 Jul 2016 11:56:30 -0300
Message-ID: <CAAPZna0UsMMTXfQZi-Xuk3aRfrpV4yxZjKxjRP561FAaqjO5FA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH] firefox: Fix build using gcc 6
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
X-List-Received-Date: Fri, 01 Jul 2016 14:57:01 -0000
Content-Type: text/plain; charset=UTF-8

For me only worked with these options, but I can make more tests and try
without -fno-schedule-insn2 option.

On Fri, Jul 1, 2016 at 11:49 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jul 1, 2016 at 6:13 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > Append CFLAGS and CXXFLAGS to set work around code which gcc6 would
> > otherwise regard as out-of-specification and allow it to produce a
> > working program.
> > Add patch to to correct the source to be compatible with gcc6 by
> > preventing c++ scope errors.
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  ...-source-to-be-compatible-with-gcc6-by-pre.patch | 29
> ++++++++++++++++++++++
> >  recipes-mozilla/firefox/firefox_38.8.0esr.bb       | 19 +++-----------
> >  2 files changed, 33 insertions(+), 15 deletions(-)
> >  create mode 100644
> recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
> >
> > diff --git
> a/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
> b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
> > new file mode 100644
> > index 0000000..643fef2
> > --- /dev/null
> > +++
> b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
> > @@ -0,0 +1,29 @@
> > +From fd21526d36bd579f2a227b3add38bd615e59db5e Mon Sep 17 00:00:00 2001
> > +From: Fabio Berton <fabio.berton@ossystems.com.br>
> > +Date: Thu, 30 Jun 2016 16:57:00 -0300
> > +Subject: [PATCH] Correct the source to be compatible with gcc6 by
> preventing
> > + c++ scope errors
> > +Organization: O.S. Systems Software LTDA.
> > +
> > +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > +---
> > + nsprpub/config/make-system-wrappers.pl | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/nsprpub/config/make-system-wrappers.pl b/nsprpub/config/
> make-system-wrappers.pl
> > +index fa0873a..bf09583 100644
> > +--- a/nsprpub/config/make-system-wrappers.pl
> > ++++ b/nsprpub/config/make-system-wrappers.pl
> > +@@ -19,7 +19,9 @@ while (<STDIN>) {
> > +     open OUT, ">$output_dir/$_";
> > +     print OUT "#pragma GCC system_header\n";  # suppress include_next
> warning
> > +     print OUT "#pragma GCC visibility push(default)\n";
> > ++        print OUT "#define _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
> > +     print OUT "#include_next \<$_\>\n";
> > ++        print OUT "#undef _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
> > +     print OUT "#pragma GCC visibility pop\n";
> > +     close OUT;
> > + }
> > +--
> > +2.1.4
> > +
> > diff --git a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> > index bd9b82c..94e5e04 100644
> > --- a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> > +++ b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> > @@ -48,6 +48,7 @@ SRC_URI = "
> https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
> >
>  file://debian-hacks/Work-around-binutils-assertion-on-mips.patch \
> >
>  file://debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch \
> >             file://fixes/Fix-firefox-install-dir.patch \
> > +
>  file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
> >             "
> >
> >  SRC_URI[archive.md5sum] = "af46898414a433f8260c5373efb97d19"
> > @@ -63,6 +64,9 @@ EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
> >
> >  ARM_INSTRUCTION_SET = "arm"
> >
> > +CFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse
> -fno-schedule-insns2"
> > +CXXFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse
> -fno-schedule-insns2"
> > +
>
> I am ok with this patch, however am curious why -fno-schedule-insn2 is
> needed ?
>
>
> >  do_install_append() {
> >      install -d ${D}${datadir}/applications
> >      install -d ${D}${datadir}/pixmaps
> > @@ -105,18 +109,3 @@ PRIVATE_LIBS += " \
> >      libssl3.so \
> >      libsoftokn3.so \
> >  "
> > -
> > -# | i586-oe-linux-gcc  -m32 -march=i586
> --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -o
> WebMElement.o -c
> > -#  -I../../dist/system_wrappers -include
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/config/gcc_hidden.h
> -DMOZ_GLUE_IN_PROGRAM -DAB_CD=en-US -DNO_NSPR_10_SUPPORT
> > -#
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv
> -I.
> > -#  -I../../dist/include
>  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nspr
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nss
> > -#
> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/pixman-1
>  -fPIC   -include ../../mozilla-config.h -DMOZILLA_CLIENT -MD -MP -MF
> .deps/WebMElement.o.pp  -Wall -Wdeclaration-after-statement -Wempty-body
> -Wpointer-to-int-cast -Wsign-compare -Wtype-limits -Wno-unused -Wcast-align
> -Os -fsigned-char -fno-strict-aliasing -std=gnu99 -fgnu89-inline
> -fno-strict-aliasing -fno-math-errno -pthread -pipe  -DNDEBUG -DTRIMMED
> -freorder-blocks -Os -fomit-frame-pointer
>  /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv/WebMElement.c
> > -# | In file included from ../../../dist/system_wrappers/stdlib.h:3:0,
> > -# |                  from ../../../dist/include/mozilla/mozalloc.h:15,
> > -# |                  from ../../../dist/stl_wrappers/cstdlib:39,
> > -# |                  from
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/inc/Main.h:29,
> > -# |                  from
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/CmapCache.cpp:28,
> > -# |                  from
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/gfx/graphite2/src/Unified_cpp_gfx_graphite2_src0.cpp:11:
> > -# |
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/c++/6.1.1/stdlib.h:38:12:
> error: 'std::abort' has not been declared
> > -# |  using std::abort;
> > -PNBLACKLIST[firefox] ?= "BROKEN: fails to build with gcc-6"
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

