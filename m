Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6084F6011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 12:08:03 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id h129so116029859lfh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2016 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8FRAA50FPFgjhQokBQrQLiyoV0TifLbprgEdC621voE=;
	b=amYB3wkPfkFB+pdoYAl3DPmz1x2kF01ZpBhWYAYIKZx2usI6uJEtjs93vkeeoqCCzo
	OcU+T4klGRsosUgAQA5AFwk/i55U1E+ysYIrLHcBdngEP/bHvPwkkHO70ghWOrLR4hhY
	SLXvUNP7n5IFS8SnfBxhk5uYRMPa4no9hk0SDLJbRkZk1gY5bdiXTWmy8D7+0Mc5cz0D
	sag5UB+kCBqZ9j59ptAoEY9aSWBGBquQeuOYZAH3di7nCEpq9XSi20UcJYsHBkOk0DQ/
	BTh97yXsFK+i73zTJHbsXxqUkHlK1ry0Nq9zOd/7DiGz/UunNKYrFRRnAiCh5BdOr6gb
	yXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8FRAA50FPFgjhQokBQrQLiyoV0TifLbprgEdC621voE=;
	b=i1CqhsYJd4CwDzV4wsVnMa97wrvjUIKFa9F+y8kPJ8adlNqDwTWP6MNEt90XhxfEXi
	cPYsWqAEJYgxAHlolN6SpEkrAg1Wrgg3nr0EAiDvbfq+2eHQadFqYaqupPHjSnU2UdWo
	uoBQFkdtZVhhTXt6iW5LYp15pu5HaL5lzybq3rq2FnYgLW9SeNurdmllwr4bogMaX9FG
	AdKEWBiqPB2f+Ob32QS5jgqAF2putcQYYbWCh+6WZI2ipd+DDEz3E8aoN3kDpuWDiQ5S
	IeXPmIJbviiUIa38t8rtK6stsLdDgmnW/QcGwT2/9uumfxr42AnMbz11X4y8zkzw0cpG
	woog==
X-Gm-Message-State: ALyK8tJ9x97f88wWmrZt1wLHflI45SGes2oK3RYf1ztjViIR3FAe9nPKvS+s9P8Q2NUS8xaeElBnTkZbz6CSWg==
X-Received: by 10.25.157.142 with SMTP id g136mr3464718lfe.216.1467634083812; 
	Mon, 04 Jul 2016 05:08:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Mon, 4 Jul 2016 05:07:34 -0700 (PDT)
X-Originating-IP: [179.105.243.72]
In-Reply-To: <CAAPZna0UsMMTXfQZi-Xuk3aRfrpV4yxZjKxjRP561FAaqjO5FA@mail.gmail.com>
References: <1467378824-13923-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAMKF1so5SPCvuyiVXej2z3M2n+Z2uCskG7_2f5hdYZx+3JGS9w@mail.gmail.com>
	<CAAPZna0UsMMTXfQZi-Xuk3aRfrpV4yxZjKxjRP561FAaqjO5FA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 4 Jul 2016 09:07:34 -0300
Message-ID: <CAAPZna2Aq719=Eu6uO13r09iHcz6dgR5iEvVztdEaQxe+Ve25g@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Jul 2016 12:08:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

The option -fno-schedule-insn2 is not needed. I sent a v2.

Thanks.

On Fri, Jul 1, 2016 at 11:56 AM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> For me only worked with these options, but I can make more tests and try
> without -fno-schedule-insn2 option.
>
> On Fri, Jul 1, 2016 at 11:49 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Fri, Jul 1, 2016 at 6:13 AM, Fabio Berton
>> <fabio.berton@ossystems.com.br> wrote:
>> > Append CFLAGS and CXXFLAGS to set work around code which gcc6 would
>> > otherwise regard as out-of-specification and allow it to produce a
>> > working program.
>> > Add patch to to correct the source to be compatible with gcc6 by
>> > preventing c++ scope errors.
>> >
>> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > ---
>> >  ...-source-to-be-compatible-with-gcc6-by-pre.patch | 29
>> ++++++++++++++++++++++
>> >  recipes-mozilla/firefox/firefox_38.8.0esr.bb       | 19 +++-----------
>> >  2 files changed, 33 insertions(+), 15 deletions(-)
>> >  create mode 100644
>> recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
>> >
>> > diff --git
>> a/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
>> b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
>> > new file mode 100644
>> > index 0000000..643fef2
>> > --- /dev/null
>> > +++
>> b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
>> > @@ -0,0 +1,29 @@
>> > +From fd21526d36bd579f2a227b3add38bd615e59db5e Mon Sep 17 00:00:00 2001
>> > +From: Fabio Berton <fabio.berton@ossystems.com.br>
>> > +Date: Thu, 30 Jun 2016 16:57:00 -0300
>> > +Subject: [PATCH] Correct the source to be compatible with gcc6 by
>> preventing
>> > + c++ scope errors
>> > +Organization: O.S. Systems Software LTDA.
>> > +
>> > +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > +---
>> > + nsprpub/config/make-system-wrappers.pl | 2 ++
>> > + 1 file changed, 2 insertions(+)
>> > +
>> > +diff --git a/nsprpub/config/make-system-wrappers.pl b/nsprpub/config/
>> make-system-wrappers.pl
>> > +index fa0873a..bf09583 100644
>> > +--- a/nsprpub/config/make-system-wrappers.pl
>> > ++++ b/nsprpub/config/make-system-wrappers.pl
>> > +@@ -19,7 +19,9 @@ while (<STDIN>) {
>> > +     open OUT, ">$output_dir/$_";
>> > +     print OUT "#pragma GCC system_header\n";  # suppress include_next
>> warning
>> > +     print OUT "#pragma GCC visibility push(default)\n";
>> > ++        print OUT "#define _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
>> > +     print OUT "#include_next \<$_\>\n";
>> > ++        print OUT "#undef _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
>> > +     print OUT "#pragma GCC visibility pop\n";
>> > +     close OUT;
>> > + }
>> > +--
>> > +2.1.4
>> > +
>> > diff --git a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
>> b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
>> > index bd9b82c..94e5e04 100644
>> > --- a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
>> > +++ b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
>> > @@ -48,6 +48,7 @@ SRC_URI = "
>> https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
>> >
>>  file://debian-hacks/Work-around-binutils-assertion-on-mips.patch \
>> >
>>  file://debian-hacks/Revert-Bump-search-engine-max-icon-size-to-35kB.patch \
>> >             file://fixes/Fix-firefox-install-dir.patch \
>> > +
>>  file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch \
>> >             "
>> >
>> >  SRC_URI[archive.md5sum] = "af46898414a433f8260c5373efb97d19"
>> > @@ -63,6 +64,9 @@ EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
>> >
>> >  ARM_INSTRUCTION_SET = "arm"
>> >
>> > +CFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse
>> -fno-schedule-insns2"
>> > +CXXFLAGS +=" -fno-delete-null-pointer-checks -fno-lifetime-dse
>> -fno-schedule-insns2"
>> > +
>>
>> I am ok with this patch, however am curious why -fno-schedule-insn2 is
>> needed ?
>>
>>
>> >  do_install_append() {
>> >      install -d ${D}${datadir}/applications
>> >      install -d ${D}${datadir}/pixmaps
>> > @@ -105,18 +109,3 @@ PRIVATE_LIBS += " \
>> >      libssl3.so \
>> >      libsoftokn3.so \
>> >  "
>> > -
>> > -# | i586-oe-linux-gcc  -m32 -march=i586
>> --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -o
>> WebMElement.o -c
>> > -#  -I../../dist/system_wrappers -include
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/config/gcc_hidden.h
>> -DMOZ_GLUE_IN_PROGRAM -DAB_CD=en-US -DNO_NSPR_10_SUPPORT
>> > -#
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv
>> -I.
>> > -#  -I../../dist/include
>>  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nspr
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nss
>> > -#
>> -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/pixman-1
>>  -fPIC   -include ../../mozilla-config.h -DMOZILLA_CLIENT -MD -MP -MF
>> .deps/WebMElement.o.pp  -Wall -Wdeclaration-after-statement -Wempty-body
>> -Wpointer-to-int-cast -Wsign-compare -Wtype-limits -Wno-unused -Wcast-align
>> -Os -fsigned-char -fno-strict-aliasing -std=gnu99 -fgnu89-inline
>> -fno-strict-aliasing -fno-math-errno -pthread -pipe  -DNDEBUG -DTRIMMED
>> -freorder-blocks -Os -fomit-frame-pointer
>>  /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv/WebMElement.c
>> > -# | In file included from ../../../dist/system_wrappers/stdlib.h:3:0,
>> > -# |                  from ../../../dist/include/mozilla/mozalloc.h:15,
>> > -# |                  from ../../../dist/stl_wrappers/cstdlib:39,
>> > -# |                  from
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/inc/Main.h:29,
>> > -# |                  from
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/CmapCache.cpp:28,
>> > -# |                  from
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/gfx/graphite2/src/Unified_cpp_gfx_graphite2_src0.cpp:11:
>> > -# |
>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/c++/6.1.1/stdlib.h:38:12:
>> error: 'std::abort' has not been declared
>> > -# |  using std::abort;
>> > -PNBLACKLIST[firefox] ?= "BROKEN: fails to build with gcc-6"
>> > --
>> > 2.1.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

