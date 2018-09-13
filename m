Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8083560116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 05:58:34 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j7-v6so4354932qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DENUAGwuTazhoZgsMr3zSJs7M6sXVIPnJTb35UJQTXo=;
	b=iOEcwRsuUcLCNA6ZELj43FwVJ1M5f5Opt8OQu35uzSvvjILMRNJbaUcK/rApgouc4v
	waTvB94N2ScGjLWiNgG1Uup1gcU4wVasXN6zb1Ke4rM9k4xEjT03u3vQYkTOgXGO7K+9
	ariXeVl9MMaPJK5lSWQyutkd0YhIm7sOau8eLH2zFZLL740gnqSzoqULLTOSWFE62xkr
	wZfBpTUB2RmyD2oOynGyx5RSZwkLjQM40IiE6A8xR/nUf1iY02hL/XxjSrYUEMBsn631
	ShvJNITCRR/eZhdcWy6BXadeuOYhvE99Wl2nwcKmFk9m7hmLggMvdbHMmttQ0WvgNh2U
	Cc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DENUAGwuTazhoZgsMr3zSJs7M6sXVIPnJTb35UJQTXo=;
	b=NZiabmTQF5bQlmbJRgG6EcujdmYj92fBZIw1kEkCGezUA5BJFW7Lnr8577rur6xJm3
	a25jsCcYu4ZQx9d0Jtuyqxsqunq8DPvI7l/fxW4l9FVLSkzSAB9zqhZyaeYxo2qxDZXY
	8fvGt7MB15LH8TtVx3PfL1eilbc83k9dZ23yFqyK6EvBkT9ghDrcmERIEjGlOSkLZFyM
	5og0RDbY4rHK/kAto+DKJRuP4xxs3Tx5jnvb1HKbNSe6+tNeJkNMg6VqPEFRcomo4mgA
	zpvGm+5qoTPpc6b1XLCQAQ7UitjFp392f4xT9HhLtFz2lXzedtmCbC9tognZNhYBXxdp
	IyDg==
X-Gm-Message-State: APzg51DqVHr0qZzaMcInGfsfY+5hMSLsjLIAJBaS/X+Yg0Jy8zrsnLwv
	xWalNprjduosvr+7AcuutIqVZBTG1Vh6oDy7iFM=
X-Google-Smtp-Source: ANB0Vdb9JuDfg68rkTZsD9IU1oyC8DbK/RF5vFqKU7biaMmaqXhO/CWPVN3/c/GAinG2PmHPBRkfnakPGpVlCmdeB1k=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr4039792qte.218.1536818315042; 
	Wed, 12 Sep 2018 22:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <1536817056-344059-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1536817056-344059-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 22:58:08 -0700
Message-ID: <CAMKF1sp5dPsAkGnJ53yRUTX=ahaVpm0A+F+d7V-inCkouXy4dg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Sep 2018 05:58:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 10:38 PM <changqing.li@windriver.com> wrote:
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

these values seem to be size_t types so please use PRIuPTR instead of PRIdPTR

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

