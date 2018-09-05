Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 13484793BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:19:32 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id o18-v6so9181515wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A3ggE7yTI7RB4KhzzcGROz0xRjBEPgQMHz4Ki0XwRIE=;
	b=XXvAbpgJmNb6Sxs5WyFgSnglxudYTDcQAdjTl6/oQqPkK3Zm7YHSEeWWwEfj/amxOo
	wRAUZ7K8tKBBi4EEEQIQRGjHPHWygxqsA8TsEr6VEZm3gItKDiPfXxJMejZ9Pn0isyFt
	bWbgOxnAe6sRNRSXU2NGYQvrbdH9dMyQRY9IR0eeOZAbfn/u4eu3XRbAtoIHTmuA548V
	1lWDhCylPyqti5YXo39zG4jJ4MV4RB1FTCRKi4gCjX48VZRsFfrpxZGEwbC305VTu8vA
	AQEpkWpYLSRdXcq8dvb8L4ML8SKKOsMfEHHLRZEgh6vkUtQhBPhKsPccA+Rel0FbyYAP
	RNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A3ggE7yTI7RB4KhzzcGROz0xRjBEPgQMHz4Ki0XwRIE=;
	b=nUoEljA4lCUDG1USIH447zM2ecuTxmntDDJYPdOcIi6cbnUBwcORDeImWZbEbE3gRG
	QPLgn8ZV1iJ03SfMFrUwoT5gDM+Oa4vI59GhPL+A/k0vnBH0qajJom1sngFwOhwpyD6T
	tzK1ytsephskYuGGbixH156Ob8ZwU4jGYYAPOgtZQMxk8pALSWgkjxq+wdv/rKY1y6fq
	Aw+7oCCp6dEnlnN09hbuaucIqjbX6J0HqA0HgvZLjfOCKjLESSwd75JZFnA+t0v/tiEW
	uWXEqWxNNr/vfLqWNyLJzpylYHprJsOqb2stgn5vgOzuMsbYcUmdVy/UsNfkwsJl0gCX
	5U3w==
X-Gm-Message-State: APzg51CHFNKym8cD4KDZWjyLlDAmZfnSxOXst5ovv4anEDSBUSRTe6Ba
	oGrwdUN9XwYP4dYVCQn384d/DzR7yR8/uYOQARY=
X-Google-Smtp-Source: ANB0Vdb3qz7a13dOH4Uasflk44qT2VX/4w1D1mQlmTHFpmYW3YUasG4gN6wuf2fpNgFF741+Or34lICOq0gLWXFpetE=
X-Received: by 2002:a1c:b441:: with SMTP id d62-v6mr142563wmf.17.1536182373770;
	Wed, 05 Sep 2018 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180905210224.21225-1-raj.khem@gmail.com>
	<20180905210224.21225-12-raj.khem@gmail.com>
In-Reply-To: <20180905210224.21225-12-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Sep 2018 23:19:23 +0200
Message-ID: <CA+chaQfAwZcj7W6UhhHa+ETR3O_1XCTdHNf_qvt6-n22urRkMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 12/12] rtmpdump: Depend on openssl10 and
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
X-List-Received-Date: Wed, 05 Sep 2018 21:19:33 -0000
Content-Type: text/plain; charset="UTF-8"

Nice series, thanks!

Something seems to be missing in the commit summary of the last one.

On Wed, Sep 5, 2018 at 11:04 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rtmpdump/rtmpdump/fix-racing-build-issue.patch     | 10 +++++-----
>  .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb        |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
> b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
> index bb3d8b0efe..6e11c9752e 100644
> ---
> a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
> +++
> b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
> @@ -8,11 +8,11 @@ Index: git/librtmp/Makefile
>  ===================================================================
>  --- git.orig/librtmp/Makefile
>  +++ git/librtmp/Makefile
> -@@ -107,6 +107,7 @@ install_base:      librtmp.a librtmp.pc
> +@@ -115,6 +115,7 @@ install_base:      librtmp.a librtmp.pc
>         cp librtmp.3 $(MANDIR)/man3
>
> - install_so:   librtmp.$(SO_EXT)
> + install_so:   librtmp$(SO_EXT)
>  +      -mkdir -p $(SODIR)
> -       cp librtmp.$(SO_EXT) $(SODIR)
> -       cd $(SODIR); ln -sf librtmp.$(SO_EXT) librtmp.$(SOX)
> -
> +       cp librtmp$(SO_EXT) $(SODIR)
> +       $(INSTALL_IMPLIB)
> +       cd $(SODIR); ln -sf librtmp$(SO_EXT) librtmp.$(SOX)
> diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
> b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
> index c5513b0252..a72b0d651e 100644
> --- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
> +++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
> @@ -5,9 +5,9 @@ HOMEPAGE = "http://rtmpdump.mplayerhq.hu/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -DEPENDS = "openssl zlib"
> +DEPENDS = "openssl10 zlib"
>
> -SRCREV = "3121324046e4ca1934e7e28293fc8326475d5053"
> +SRCREV = "fa8646daeb19dfd12c181f7d19de708d623704c0"
>  SRC_URI = " \
>      git://git.ffmpeg.org/rtmpdump \
>      file://fix-racing-build-issue.patch"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

