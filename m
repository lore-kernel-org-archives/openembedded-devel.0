Return-Path: <gizero@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2A88560777
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 05:13:52 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n189so270459770qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 22:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZKnaV13dTlQFq+Ltb2Oc2j6L78eMrvXXLC6h63lApRI=;
	b=sDD3Pvbe1mnQR2vyanOV9kYu1bBMWRmgsKZciVDmYDanlHEBrzBOIdbM9HHZqH3AfP
	VR/oI6q0LPjSt/PjqSnnpsNPUG8uYI/u0nrFTJLlpoTxu1J0b5IcSug2SAwxer2U5mH2
	FYoFZJBn9m2b8I64Iym3p9uxcJf21Y8VsosTrJasIp73BSxZ6eIBGpbltwSoC4hLgn3/
	aUNFden8zxlTWdbjYRhzUuAV7g0Rvhx+Zb3O1t0xzwcwT17Ua3k5a3KZOhilpmmE8b9P
	Wokf8vL/LcYBieWV8/6rxb+ntEGFiT9ZALv/Go9n+jqNco44mf6MZfw2/G5T8n45Ocvn
	u+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZKnaV13dTlQFq+Ltb2Oc2j6L78eMrvXXLC6h63lApRI=;
	b=WGVwhAIs9KVCPTzBB/+/j90XMovq8Os/bimEMx4j/Y7eFwPGB7J74RpoqFs/MzAHJN
	9Cf0JMJnv4NOMG2dmSRGU+JaYE0Umt8P0IduXWy2TBllueAS9DdogVfgRPk1XIX0Xkx7
	zBhG/9qf1cUoaFWTr3b5HRec8MxBOLjbBu99/IX/n1vqkBgx7E04L4mkOrgwjz3YKccT
	YmrFJFhLAeVOwdY5KUGS99JpAkM8R1Wt21pEfduuQHNFh4biYFYwuMOTrmJ6r+d/H3am
	PAPyiYjZNR0ruT8CBwZn7Yk3RcDZLRKyjzKrfUsk/KX/1VY/+0HBWro7AF8johi5P9M5
	zsNA==
X-Gm-Message-State: AA6/9Rk9OYctKefvSoM3ygtIjwyjCnJt5Rg1XO5FCKclLu9vTqcvE6UXvRaQ3aZhRnB/qrNkjoEFxYTu7D6hzQ==
X-Received: by 10.194.250.1 with SMTP id yy1mr13169620wjc.219.1476767633013;
	Mon, 17 Oct 2016 22:13:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.117 with HTTP; Mon, 17 Oct 2016 22:13:52 -0700 (PDT)
In-Reply-To: <CAMKF1so2LPZcSai7QavZ+GdwTE5ydO4F7QC7SFoqG8yJFV=hMA@mail.gmail.com>
References: <1476739681-14848-1-git-send-email-gizero@gmail.com>
	<CAMKF1so2LPZcSai7QavZ+GdwTE5ydO4F7QC7SFoqG8yJFV=hMA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 18 Oct 2016 07:13:52 +0200
Message-ID: <CAC+thW0JN03ZQHj0f5RdfNCBqPkjFiWbxe7Zx5hX+FSzAVC2xg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] inotify-tools: add recipe
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
X-List-Received-Date: Tue, 18 Oct 2016 05:13:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On Mon, Oct 17, 2016 at 11:46 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Oct 17, 2016 2:30 PM, "Andrea Galbusera" <gizero@gmail.com> wrote:
> >
> > inotify-tools is a C library and a set of command-line programs for Linux
> > providing a simple interface to inotify.
> >
> > Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> > ---
> >  .../inotifywait-fix-compile-error-with-GCC-6.patch | 45
> ++++++++++++++++++++++
> >  .../inotify-tools/inotify-tools_git.bb             | 23 +++++++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644
> meta-oe/recipes-support/inotify-tools/inotify-tools/
> inotifywait-fix-compile-error-with-GCC-6.patch
> >  create mode 100644 meta-oe/recipes-support/inotify-tools/
> inotify-tools_git.bb
> >
> > diff --git
> a/meta-oe/recipes-support/inotify-tools/inotify-tools/
> inotifywait-fix-compile-error-with-GCC-6.patch
> b/meta-oe/recipes-support/inotify-tools/inotify-tools/
> inotifywait-fix-compile-error-with-GCC-6.patch
> > new file mode 100644
> > index 0000000..ba042a2
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/inotify-tools/inotify-tools/
> inotifywait-fix-compile-error-with-GCC-6.patch
> > @@ -0,0 +1,45 @@
> > +From 7affb288d6c0726e7b1ebc317a878927b6ef0d02 Mon Sep 17 00:00:00 2001
> > +From: Andrea Galbusera <gizero@gmail.com>
> > +Date: Tue, 13 Sep 2016 08:10:29 +0200
> > +Subject: [PATCH] inotifywait: fix compile error with GCC 6
> > +
> > +Fails to compile with misleading-indentation error
> > +
> > +| src/inotifywait.c: In function 'output_event_csv':
> > +| src/inotifywait.c:126:5: error: this 'if' clause does not guard...
> [-Werror=misleading-indentation]
> > +|      if (filename != NULL)
> > +|      ^~
> > +| src/inotifywait.c:129:2: note: ...this statement, but the latter is
> misleadingly indented as if it is guarded by the 'if'
> > +|   printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) )
> );
> > +|   ^~~~~~
> > +| cc1: all warnings being treated as errors
> > +
> > +Fix indentation to resolve.
> > +
> > +Upstream-Status: Submitted [
> https://github.com/rvoicilas/inotify-tools/pull/66]
> > +
> > +Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> > +---
> > + src/inotifywait.c | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/src/inotifywait.c b/src/inotifywait.c
> > +index c5ce5e3..404a85b 100644
> > +--- a/src/inotifywait.c
> > ++++ b/src/inotifywait.c
> > +@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
> > +
> > +
> > + void output_event_csv( struct inotify_event * event ) {
> > +-    char *filename =
> csv_escape(inotifytools_filename_from_wd(event->wd));
> > +-    if (filename != NULL)
> > +-        printf("%s,", filename);
> > ++      char *filename =
> csv_escape(inotifytools_filename_from_wd(event->wd));
> > ++      if (filename != NULL)
> > ++              printf("%s,", filename);
> > +
> > +       printf("%s,", csv_escape( inotifytools_event_to_str( event->mask
> ) ) );
> > +       if ( event->len > 0 )
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> > new file mode 100644
> > index 0000000..a8ef557
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY = "Command line tools and C library providing a simple interface
> to inotify"
> > +AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
> > +HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
> > +SECTION = "console/devel"
> > +LICENSE = "GPL-2.0"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424
> c6"
> > +
> > +SRCREV = "1df9af4d6cd0f4af4b1b19254bcf056aed4ae395"
> > +PV = "3.14+git${SRCPV}"
> > +
> > +SRC_URI = "git://github.com/rvoicilas/${BPN} \
> > +           file://inotifywait-fix-compile-error-with-GCC-6.patch \
> > +          "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OECONF = "--disable-doxygen"
> > +
> > +PACKAGES =+ "libinotifytools"
> >
> Why is this needed ?


The upstream project provides a thin C library and a couple of tools,
inotify{watch,wait}, built on to top of it. This was intended as an
improvement to the default packaging, to allow using and installing the
library for your own developments. The approach is inspired by i.e.
curl/libcurl recipe.


>




> > +FILES_libinotifytools = "${libdir}/lib*.so.*"
> > --
> > 1.9.1
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

