Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 64F8D60703
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 15:53:22 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id il7so7870500vcb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cFEG/iVG7D9KcA4zYA3M0uPbsWu4b05YLqmeEHrVJB0=;
	b=kQv5KOavy+9zKvE3dpRBdqePI/fKLkLgVSHGFd+W1FVNain0x1y4wPwqDcPIbgyJi6
	/FiZ5ouEG7YZb5aHGGtlryea7hA87oSqAzQeQuFvb4FIjM5y1fjal0mLYROxOkDri+3Y
	19PM2gkofaJzukwCVqg9NBU60QgRd5gZhXUJaMsYdu0ROOVZSl+oUYNIP/Uww4zShbqQ
	yHgZKRmO1bZx1/r0ctweKr8hC4Xraf99j454nfdnM6IaPKhpWsOJd4WPcEdq0rPk8Ke4
	mln9WI0OkqFww4wjQlDM1dRbRxLCNh15Gz1wIfvE7G58rjXcYhbvvmIzgFFRV3jjXrCH
	FqkQ==
X-Received: by 10.58.127.130 with SMTP id ng2mr1239956veb.64.1404143603467;
	Mon, 30 Jun 2014 08:53:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Mon, 30 Jun 2014 08:52:53 -0700 (PDT)
In-Reply-To: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 30 Jun 2014 08:52:53 -0700
Message-ID: <CAK8F28krbuC6BfaLkpyyRRW-mGFMR=PyEs0uAjYOigL37RsUuQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libeigen: remove obsolete setting for default out-of-tree build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jun 2014 15:53:30 -0000
Content-Type: text/plain; charset=UTF-8

This commit works well for me---thanks Lukas.

Tested-by: Ash Charles <ashcharles@gmail.com>

On Thu, Jun 26, 2014 at 7:56 AM, Lukas Bulwahn
<lukas.bulwahn@oss.bmw-carit.de> wrote:
> Since commit 783fb88f@openembedded-core, out-of-tree builds of
> cmake-based recipes are the default, and the variables
> OECMAKE_BUILDPATH and OECMAKE_SOURCEPATH were deprecated.
>
> With the commit 2c23d7ab@openembedded-core, the variable
> OECMAKE_SOURCEPATH was put back into action, but this causes the
> libeigen recipe to fail as OECMAKE_SOURCEPATH is set in the
> recipe, but OECMAKE_BUILDPATH is set to the bbclass default.
>
> This commit simply removes both variables from the libeigen recipe
> and hence sets the recipe to do a default out-of-tree build.
> This resolves the build failure of libeigen with
> 2c23d7ab@openembedded-core, and furthermore, the adjusted recipe
> still works with the cmake.bbclass of 783fb88f@openembedded-core.
>
> The build failure was discovered during the regression testing of
> the meta-ros layer. The exact build error message and its
> investigation is recorded in issue #276 of the meta-ros issue
> tracker at https://github.com/bmwcarit/meta-ros/issues/276.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
> index 4183f05..de5186f 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.0.bb
> @@ -13,9 +13,6 @@ S = "${WORKDIR}/eigen-eigen-ffa86ffb5570"
>
>  inherit cmake
>
> -OECMAKE_SOURCEPATH = ".."
> -OECMAKE_BUILDPATH = "build"
> -
>  EXTRA_OECMAKE += "-Dpkg_config_libdir=${libdir}"
>
>  FILES_${PN} = "${includedir} ${libdir}"
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

