Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ECC7777E71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 19:46:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so5999557wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uyVGOdW3wMhhUdUI/bUDjh5BswAzBzzsPgskf6OQH3E=;
	b=azMIdkR/qSnAX6NEkxlexXCnIsj2L2QgihEdJWkqBOx/AZcDxBkSw0itYA1xSsCi+I
	G8SQ8fJ8MWMgWUEM+rNLnj7IEcR8Tb9nb2cOGz7SpDSXFQzmQSg+d+seDC8edIyJacOp
	c1aqD0Cg9oBBWahDfmdb9FEnKWTNvu3XRMIMTgIIGL6hQdhSAWApUBlBtWjl3hXyurAu
	2xSU9KyrmzlSMZiwJ9SqVOjQcuDxjFWF0G6AdPgyOY6mPzHDiwkBA7+EcyTUOGJexOnz
	ygHcLFmQKlHrR4Oigxa89D58N30a8NTet40B4MkeArkzJiW7G87nUiOGWOvSo22akp67
	9jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uyVGOdW3wMhhUdUI/bUDjh5BswAzBzzsPgskf6OQH3E=;
	b=lsJbNAOaeE83BLB+1Mm/r5cEBtyxoVtXx+3xTU/uxiBTN3L0fKrmNejrLfGC8vP+a9
	eI8jjP/EFquG9A/if3wxQhdw6ta/7tUjiFsq96nNtnjw+BLRYMFnfALCAmsJWYAcC1dZ
	g0riOJaIXmfctgY2K53lMwEpXQddiGPaZs2jCGRierfHddrCZXA40O4Rmb4Vo02/Hpt/
	cvL3lEGhX0sdV+OANDPxxnMZozGbQwh1U+90r2zSlnEAuNcbb56PArg/Can9tREB37SI
	i+fOYj1SAbvOR2ClTkYnxkUYdIQvHyiyy4rVQa+RyogH5J1/3VaibvCAxG4ZkiSLaxU+
	pqNw==
X-Gm-Message-State: AODbwcCIM1S795FnmefIF/GyaAyAakvTc0WuYEomdgw+QXJoUjzSgM2h
	eD6AS9mCipY5AjQiWDQhloRHO6SQsg==
X-Received: by 10.80.137.56 with SMTP id e53mr303193ede.67.1495050387471; Wed,
	17 May 2017 12:46:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 17 May 2017 12:45:56 -0700 (PDT)
In-Reply-To: <20170517181502.20574-1-Randy.MacLeod@windriver.com>
References: <20170517181502.20574-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 May 2017 12:45:56 -0700
Message-ID: <CAMKF1sqdCv=Pk4Bt==m+QrZK0WL6C9S73_8Y70GrxRki-S6BAQ@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rrdtool: add gettext-native dependency
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
X-List-Received-Date: Wed, 17 May 2017 19:46:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 17, 2017 at 11:15 AM, Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
> Add gettext-native dependency to use autopoint.
>
> When building rrdtool for a 'tiny' distro, ie one that does
> not have internationalization support in glibc, configure
> fails with the error:
>    autoreconf: failed to run autopoint: No such file or directory
> autopoint is part of gettext so add that native dependency.
> This must happen transitively for builds using a regular configuration
> of glibc.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
> index db2df28a0..160dea58d 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
>
> -DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
> +DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native gettext-native"

perhaps inherit gettext is more appropriate ?


>
>  SRCREV = "61f116744262c4c18922dcf806e496715f199669"
>  PV = "1.6.0"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

