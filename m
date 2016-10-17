Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85ECC60767
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 21:46:47 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 83so7631644vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gWKKlNQWvZgaN6t12gxQsq0jCeLiKkVlwCwy3of1BAY=;
	b=itEiJWsY4fDek176bXHjpjzKAi9BJrtk8lAtnCTtl6kdBPp6Mwhc+p9FMHQV8fkk9j
	95CoupBD3bTJjhnBxV66XSZCKMkW2pULM8+GOegBxI/KcJFU/+iQFaBGACXS3w95H22N
	802CMcs1xamMv+OtMcroBobfn5cXScJuHITfsymeWFDrQpUc0OYEU3t027/8kcrCavRV
	eR4NHnsYNLyZDBzPYc+4s+tuyBmxx7aSWnv5XAaJ7CJ/YSYWce6zpBSSgrg5XINOg4wm
	PD3axAMtROEaDqBDB2fSnx0JOl42A6vHySai93bOYCbVu03oHaQBD5FacBOa/cA4zd5+
	t4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gWKKlNQWvZgaN6t12gxQsq0jCeLiKkVlwCwy3of1BAY=;
	b=BbrXTdNX6Gn6xluacqmtC/g9Ex7EKSf2wisBCz/THjy51vS74zA0JWYwk4px+KpyWh
	oDITykh7aaHev1DTXPlL0wwfhEcBhSokC42pDXecbesgx5buhehi8+Vc8k5K7h126Do7
	7jKT+jKXJfBmsIUlmakpEhZTYGTOc50FOGPTf+IlVF9R0pzGz3G3vAswXAPtG57nQOS0
	8vGRi4tzf18/A2+gww7e/jZohpS0vsnihtmuJSzQApchJgSNBKwmT9shGinKuFirU4Tw
	qL83aTSUGPmDTjZcwS9lPWKE+gu0k2Et/JzmZSqXvv9eZh4syze0NdM+E3EThxx5boBh
	2fxA==
X-Gm-Message-State: AA6/9RlGPHIbzUzOLQvyuoyb7VTGhTf9oskiOmmwwT40TixVwo2jasoO3XDPxI8OBWfbQ0EeYLHDhic1FqRhMA==
X-Received: by 10.31.244.14 with SMTP id s14mr20009028vkh.31.1476740808222;
	Mon, 17 Oct 2016 14:46:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 17 Oct 2016 14:46:46 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Mon, 17 Oct 2016 14:46:46 -0700 (PDT)
In-Reply-To: <1476739681-14848-1-git-send-email-gizero@gmail.com>
References: <1476739681-14848-1-git-send-email-gizero@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2016 14:46:46 -0700
Message-ID: <CAMKF1so2LPZcSai7QavZ+GdwTE5ydO4F7QC7SFoqG8yJFV=hMA@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 21:46:47 -0000
Content-Type: text/plain; charset=UTF-8

On Oct 17, 2016 2:30 PM, "Andrea Galbusera" <gizero@gmail.com> wrote:
>
> inotify-tools is a C library and a set of command-line programs for Linux
> providing a simple interface to inotify.
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  .../inotifywait-fix-compile-error-with-GCC-6.patch | 45
++++++++++++++++++++++
>  .../inotify-tools/inotify-tools_git.bb             | 23 +++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644
meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
>  create mode 100644 meta-oe/recipes-support/inotify-tools/
inotify-tools_git.bb
>
> diff --git
a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
> new file mode 100644
> index 0000000..ba042a2
> --- /dev/null
> +++
b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
> @@ -0,0 +1,45 @@
> +From 7affb288d6c0726e7b1ebc317a878927b6ef0d02 Mon Sep 17 00:00:00 2001
> +From: Andrea Galbusera <gizero@gmail.com>
> +Date: Tue, 13 Sep 2016 08:10:29 +0200
> +Subject: [PATCH] inotifywait: fix compile error with GCC 6
> +
> +Fails to compile with misleading-indentation error
> +
> +| src/inotifywait.c: In function 'output_event_csv':
> +| src/inotifywait.c:126:5: error: this 'if' clause does not guard...
[-Werror=misleading-indentation]
> +|      if (filename != NULL)
> +|      ^~
> +| src/inotifywait.c:129:2: note: ...this statement, but the latter is
misleadingly indented as if it is guarded by the 'if'
> +|   printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) )
);
> +|   ^~~~~~
> +| cc1: all warnings being treated as errors
> +
> +Fix indentation to resolve.
> +
> +Upstream-Status: Submitted [
https://github.com/rvoicilas/inotify-tools/pull/66]
> +
> +Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> +---
> + src/inotifywait.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/inotifywait.c b/src/inotifywait.c
> +index c5ce5e3..404a85b 100644
> +--- a/src/inotifywait.c
> ++++ b/src/inotifywait.c
> +@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
> +
> +
> + void output_event_csv( struct inotify_event * event ) {
> +-    char *filename =
csv_escape(inotifytools_filename_from_wd(event->wd));
> +-    if (filename != NULL)
> +-        printf("%s,", filename);
> ++      char *filename =
csv_escape(inotifytools_filename_from_wd(event->wd));
> ++      if (filename != NULL)
> ++              printf("%s,", filename);
> +
> +       printf("%s,", csv_escape( inotifytools_event_to_str( event->mask
) ) );
> +       if ( event->len > 0 )
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> new file mode 100644
> index 0000000..a8ef557
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Command line tools and C library providing a simple interface
to inotify"
> +AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
> +HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
> +SECTION = "console/devel"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
> +
> +SRCREV = "1df9af4d6cd0f4af4b1b19254bcf056aed4ae395"
> +PV = "3.14+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/rvoicilas/${BPN} \
> +           file://inotifywait-fix-compile-error-with-GCC-6.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-doxygen"
> +
> +PACKAGES =+ "libinotifytools"
>
Why is this needed ?

> +FILES_libinotifytools = "${libdir}/lib*.so.*"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

