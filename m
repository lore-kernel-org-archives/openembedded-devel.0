Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D238879659
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:23:34 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m13-v6so4496114qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5/rkfwopTHDlB4iFHdzxyQnYx3jbwejvJIEBWWrUuG8=;
	b=UQ3v1qUON0zv0tQW1DC/y4FcZSdbiWNkZn+w1c1diNT0inJaqvi4zIYh5mQ1yrP//s
	4UMzw5UhysPkZbl0z2qsnP66B5LeSDxjBuVMcwoZzs3jcgf0cyheFY9PkL6K4Gp9r6Sl
	+q2ZE+JyaV2GhFxMCW+F+YwLjY7o5F6u+7TqXvPxz2Ou0W3j8Mt0636UEq3j7SgzNaLx
	yyJx+nMyKZenin/w3tw3LyyOE0pEgouS4cev2i8YE7LcLY5E4m1/si6FidN16KXsCZN1
	m4uVo9zX9kbLU+NRjPbeu/S6Uh4LrRM1EVoG1O8OoO7MTHbce8oNM/sC60lhNbo9iFmE
	6p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5/rkfwopTHDlB4iFHdzxyQnYx3jbwejvJIEBWWrUuG8=;
	b=kBcKVn4DY6oQ7BWnD7FB2zQL/JmvIH78PqEoa9PoGRSO2es0xujgsA4jUYRclcT+VX
	iqUctWuBiwC4T62NWdF25Pi5rTsCGk1xlil5UK59P+1DX4V8fMbklPwKf8ZuejShWKZJ
	ieZ3ftYakt/TiSEQAQ/aoOx3xSIcgz7b0+FT8h4N2AG5X6nybszUNw1IioNM2/9fUdni
	5E1URtdeR1oD2C94/5AGwb5Rx075a+lmpjmsRcOTMHO8CKxUFZhmrAZKnqwlZ/ZjHr3R
	ebwA/N3Lr1cpzEdlN3tUyj0hgw08LwnNHKapj2TNyHtReZ128+QuLbJ+D1j+fpRetSDR
	EaHA==
X-Gm-Message-State: APzg51ASFamihI4sTB40y3rBw8+rUWt7HRxtk45zxRjKinf7m26M1BOx
	QWFP0Ze7QjIm9mh4flEzjJou7Mx+LlnPy586aLA=
X-Google-Smtp-Source: ANB0VdZ7itS5iul4hIdW2F/hzYKJkylr6oupAdna+SCtoswwKkh1sCiPUM1ukNuOVB2k+FE2ELmNgnMNo0o+VrEd/wM=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr4066738qtm.295.1536823415530; 
	Thu, 13 Sep 2018 00:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <1536817056-344059-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sp5dPsAkGnJ53yRUTX=ahaVpm0A+F+d7V-inCkouXy4dg@mail.gmail.com>
	<784ca7f8-3c8c-4d5f-0b7a-c703221667dd@windriver.com>
In-Reply-To: <784ca7f8-3c8c-4d5f-0b7a-c703221667dd@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 00:23:09 -0700
Message-ID: <CAMKF1sr_hrZD3gBtri-qS+6=wqevcsr-txO_QTAH0O9tF3R8RA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] spice: fix compile error on 32bit system
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
X-List-Received-Date: Thu, 13 Sep 2018 07:23:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 13, 2018 at 12:00 AM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
>
> On 09/13/2018 01:58 PM, Khem Raj wrote:
>
> On Wed, Sep 12, 2018 at 10:38 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix below compile error on 32bit system,  since input argument
> is uLong, but use format %d:
> format '%d' expects argument of type 'int', but argument 6 has type
> 'long unsigned int' [-Werror=format=]
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-spice-fix-compile-fail-problem.patch      | 36 ++++++++++++++++++++++
>  meta-networking/recipes-support/spice/spice_git.bb |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
>
> diff --git a/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> new file mode 100644
> index 0000000..1f9d5fd
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice/0001-spice-fix-compile-fail-problem.patch
> @@ -0,0 +1,36 @@
> +From 7023732c65b4dc509c46a54fb7715da275b5597f Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 13 Sep 2018 12:39:44 +0800
> +Subject: [PATCH] spice: fix compile fail problem
> +
> +compile error:
> +format '%d' expects argument of type 'int', but argument 6 has
> +type 'long unsigned int' [-Werror=format=]
> +
> +spice compile failed on 32bit system, since upstream commit
> +9541cd2fe(in V0.14.1) change %ld to %PRIdPTR, %PRIdPTR is %d, but argument
> +strm.total_out is uLong.
> +
> +Upstream-Status: Submitted[https://github.com/freedesktop/spice/pull/1]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + server/red-replay-qxl.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
> +index 1fce76c..bd33b58 100644
> +--- a/server/red-replay-qxl.c
> ++++ b/server/red-replay-qxl.c
> +@@ -266,7 +266,7 @@ static replay_t read_binary(SpiceReplay *replay, const char *prefix, size_t *siz
> +             exit(1);
> +         }
> +         if ((ret = inflate(&strm, Z_NO_FLUSH)) != Z_STREAM_END) {
> +-            spice_error("inflate error %d (disc: %" PRIdPTR ")", ret, *size - strm.total_out);
> ++            spice_error("inflate error %d (disc: %ld)", ret, *size - strm.total_out);
>
> these values seem to be size_t types so please use PRIuPTR instead of PRIdPTR
>
>
> the format %ld is for "*size - strm.total_out",   and strm.total_out is defined in zlib.h, is uLong.
> if use PRIuPTR(%u), we will still met compile error:
> format '%u' expects argument of type 'unsigned int', but argument 6 has type 'long unsigned int' [-Werror=format=]

hmmm yes if its uLong then this might be fine.

>
> Besides,  "*size - strm.total_out" ,   size is unsigned int,  and strm.total_out is uLong,  but I think here we should use %ld,
>  and need to convert unsigned to signed, to get the diff of these two value,  maybe unsigned in meaningless to read the reported error.
>
> spice_error("inflate error %d (disc: %ld)", ret, (long int)(*size - strm.total_out));
>
> How do you think?
>
> //Sandy
>
> +             if (ret == Z_DATA_ERROR) {
> +                 /* last operation may be wrong. since we do the recording
> +                  * in red_worker, when there is a shutdown from the vcpu/io thread
> +--
> +2.7.4
> +
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 871bb0f..c7e4b03 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>      git://anongit.freedesktop.org/spice/spice;name=spice \
>      git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
>      file://0001-Convert-pthread_t-to-be-numeric.patch \
> +    file://0001-spice-fix-compile-fail-problem.patch \
>  "
>
>  FOO = "\
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> BRs
>
> Sandy(Li Changqing)
> Wind River Linux

