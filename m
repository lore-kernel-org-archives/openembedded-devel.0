Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QuSxX-0002u0-9W
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 19:34:19 +0200
Received: by qyk9 with SMTP id 9so1573466qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TB95z7DKnsFFHsPT3/hDbTM810+R1zG5Iu3viAeiwSs=;
	b=VdSQ5p6W5NPEjEuqKfF+BEQOnVtZBL0FKKc01nOilUZzr+trXzCDJSKGz3QF/8iKaA
	claeKx70KUTNPraJp7BZC0jsSqeEM3sg0NkCeV9TlrCwmy/4pfHdn9fQlHZB9Nvpyi05
	gPAbRhVFfAygfei/pWaN690NGwY6W4G4zRTvc=
Received: by 10.224.200.3 with SMTP id eu3mr2271252qab.279.1313774978088; Fri,
	19 Aug 2011 10:29:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.239.76 with HTTP; Fri, 19 Aug 2011 10:29:18 -0700 (PDT)
In-Reply-To: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
References: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 19 Aug 2011 19:29:18 +0200
Message-ID: <CACrTVg+4fzGY7OcPqxAEkjriRHQYXHB1iou9HNjtBo=z1fam4Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] shr : initscripts-shr, changed mountdevsubfs.sh init level from 04 to 05 S to fix issue for machines using udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 17:34:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry it is missing a [oe] in the title.
This patch is for old oe.

2011/8/19 Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>

>  * since this commit
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D974dfb8777=
8a26b80983b44c94922d0acb257e33machines using udev and mountdevsubfs.sh had =
issue of pts not mounted
>  because both were at init level S04 despite mountdevsubfs.sh was dependi=
ng
> on udev..
>
> Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
> ---
>  recipes/shr/initscripts-shr_0.0.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/
> initscripts-shr_0.0.1.bb
> index 02e2205..803bcdf 100644
> --- a/recipes/shr/initscripts-shr_0.0.1.bb
> +++ b/recipes/shr/initscripts-shr_0.0.1.bb
> @@ -97,7 +97,7 @@ do_install () {
>        ln -sf          ../init.d/mountkernfs.sh
>  ${D}${sysconfdir}/rcS.d/S01mountkernfs.sh
>        ln -sf          ../init.d/hostname.sh
> ${D}${sysconfdir}/rcS.d/S02hostname.sh
>        ln -sf          ../init.d/checkroot.sh
>  ${D}${sysconfdir}/rcS.d/S02checkroot.sh
> -       ln -sf          ../init.d/mountdevsubfs.sh
>  ${D}${sysconfdir}/rcS.d/S04mountdevsubfs.sh
> +       ln -sf          ../init.d/mountdevsubfs.sh
>  ${D}${sysconfdir}/rcS.d/S05mountdevsubfs.sh
>        ln -sf          ../init.d/alignment.sh
>  ${D}${sysconfdir}/rcS.d/S06alignment.sh
>        ln -sf          ../init.d/mountall.sh
> ${D}${sysconfdir}/rcS.d/S35mountall.sh
>        ln -sf          ../init.d/populate-volatile.sh
>  ${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
> --
> 1.7.4.1
>
>

