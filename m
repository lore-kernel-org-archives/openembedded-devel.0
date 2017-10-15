Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 493626E671
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 23:14:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b189so6248810wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 16:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nLeKeX+ndVMwwujCWlXrAzTUwWYBndu6Nocpd0SfttU=;
	b=HYTu9u5n/10XvWhz8quy8F13ZfTzrUD+5ANNzNf5Kgy6whJMXUf/13UosTyPjwBQ91
	ibOd9964e2WxZZcZs9knJdNv/7FACkrbBkIu0bRehvciRJ+KJp+4385VjZHF8f9kFBpv
	isoMoIrJR3PEBnTpw8/uqTcM3EhOfG7FLU7N6KGZ3XOPHbvDcXfCyP6BtDNTvnbhtrWx
	RwrcvC3YMaIZ17jfiej97ZH0LRFUw+G9n/YyDQndIURa8o0H/1YL33bHbA+mDDUeEaqV
	3V2CNGiOVqA2tu2b2DXmKy89+dIROe9iX7e2tp7jyN3jB3+Bwiszb/kd7XOtpgVTdLrd
	OKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nLeKeX+ndVMwwujCWlXrAzTUwWYBndu6Nocpd0SfttU=;
	b=sZp4AuuPMXYSJQ+3VaAgxsWjVBLw3ImrGWAE0i/uUxVX6tO8KxAZtTxn3Q+1Hblpml
	jTAbgZg2cpouUzImV6WjVmS0L+05/25w27/ChivLpkgYZBxmpkY/gTWdwDoa4k1A4vUZ
	BeSaIIkBmRCmjk3BvhHzASq7tJYRV0dea8pmDafAgvNVguFivw0l3aLCrcI66QZlqap2
	6427mKetUyqaLoq0Ugb3dZBq/Tl0GdmB1nabF8JydsFF4swMoAYzEi/kvRq/aSAIF9ZG
	FLCYx/R0vbbLsKbA6LcoD4675rccSM+VvEselBnvm34KbOZy6xs+2PbCAE/EO9yXm/I9
	DAzw==
X-Gm-Message-State: AMCzsaUPzdzCuVKuRR+KDvV2KAAw6fgmMQVp2Tuqea8cDRZ0EJLRoGXQ
	mzi9T/H+l6ZJJJ9lcfcd+BsLiObSt3SaM/97v1ZHhA==
X-Google-Smtp-Source: ABhQp+QI5WdTz04ZlXCUPiIiMaRL9v41tW8dOhfUV9ULo/Ijfp4a9YWHGiAKsjdGPGR2Gx7MVaifnOuRvzrmJT3D+vc=
X-Received: by 10.223.134.68 with SMTP id 4mr7271871wrw.67.1508109293950; Sun,
	15 Oct 2017 16:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Sun, 15 Oct 2017 16:14:53 -0700 (PDT)
In-Reply-To: <20171011073521.15508-1-mikko.ylinen@linux.intel.com>
References: <20171011073521.15508-1-mikko.ylinen@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 01:14:53 +0200
Message-ID: <CA+chaQdLD0cS0vFugYi7xK8o1=MzyyE7pC3X4ReKCppGae_Faw@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Sun, 15 Oct 2017 23:14:53 -0000
Content-Type: text/plain; charset="UTF-8"

Breaks qemuarm builds:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'nodejs' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb
RDEPENDS on or otherwise requires it)
nodejs was skipped: incompatible with machine qemuarm (not in
COMPATIBLE_MACHINE)
NOTE: Runtime target 'nodejs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nodejs']
NOTE: Runtime target 'upm-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['upm-dev', 'mraa', 'nodejs']
NOTE: Runtime target 'upm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['upm', 'mraa', 'nodejs']
NOTE: Runtime target 'mraa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mraa', 'nodejs']
ERROR: Nothing RPROVIDES 'mraa-dev' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'mraa-dev'
NOTE: Runtime target 'mraa-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mraa-dev']



On Wed, Oct 11, 2017 at 9:35 AM, Mikko Ylinen <mikko.ylinen@linux.intel.com>
wrote:

> HAVE_NODEJS is a leftover from meta-refkit-core where the
> layer had to adapt to different BBLAYER combinations (some
> where nodejs wasn't available but mraa/upm were).
>
> Since that check is no longer needed and nodejs is in fact
> part of meta-oe, nodejs bindings can be enabled by default.
>
> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb
> b/meta-oe/recipes-extended/mraa/mraa_git.bb
> index 616048fac..56557cca8 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -31,7 +31,7 @@ FILES_${PN}-utils = "${bindir}/"
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-mraa="python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS')
> or '0') else '' }"
> +BINDINGS ??= "python nodejs"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}',
> 'nodejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '',
> d)}"
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb
> b/meta-oe/recipes-extended/upm/upm_git.bb
> index 38065ce53..a258ac8b2 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -26,7 +26,7 @@ inherit distutils3-base cmake
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-upm="python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS')
> or '0') else '' }"
> +BINDINGS ??= "python nodejs"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}',
> 'nodejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '',
> d)}"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

