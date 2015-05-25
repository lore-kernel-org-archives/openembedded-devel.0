Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id EFD536AC15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 16:27:46 +0000 (UTC)
Received: by iesa3 with SMTP id a3so75389057ies.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=O+OzpgJ3trt37PFCYUeUL5F/kCkrqLyqGH9wO+wReqo=;
	b=Fsp+YYbkdbEVR74JGsrxHHODPmRgONC9X7xcVQy4izCyM/8Q6vYwzAdzdN3J5bQ6s7
	bLJih3kQgs9UnP5wwO3l/EJLBH1Hw/jH+6D0HAJ2ADzd22ofOglWSmjtsNfWqUnp7H7V
	IPWvH/w6K/SV60gQeA/+gzNM1ZfOIDa4VXOJTNyZZJAm+eOYaoX+okrfUVjx8U/fFORo
	ohJSghV54CqLeamAdFXJ9Bz9C6Mhlt+SI3ltnwDAXRDHEtJbulhXqSYP2H5Sl6sQdmXC
	9lOI3gxiLjr3OdK1njlocDim6Wy+NO5fn+yhQ897Kyne7oGgs2x+qbGk/EJGaKVj1zuK
	ncXw==
MIME-Version: 1.0
X-Received: by 10.107.136.42 with SMTP id k42mr28019340iod.63.1432571267141;
	Mon, 25 May 2015 09:27:47 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Mon, 25 May 2015 09:27:47 -0700 (PDT)
In-Reply-To: <1431239259-21577-1-git-send-email-victor.rodriguez.bahena@intel.com>
References: <1431239259-21577-1-git-send-email-victor.rodriguez.bahena@intel.com>
Date: Mon, 25 May 2015 11:27:47 -0500
Message-ID: <CAK5mtew-f34qhf+nJdcAN3sjn=KM+WmzEfE5UDAoQdNa5TOxFw@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] mpich: added BASH_SHELL to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Mon, 25 May 2015 16:27:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 10, 2015 at 1:27 AM, Victor Rodriguez
<victor.rodriguez.bahena@intel.com> wrote:
> On Fedora 17, bash has moved to /usr/bin/bash and the configure process finds
> it on the host machine there, this ensures that it is set correctly for the
> target.
>
> Signed-off-by: Victor Rodriguez <victor.rodriguez.bahena@intel.com>
> ---
>  meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
> index 0225cee..eb6ceba 100644
> --- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
> +++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
> @@ -12,6 +12,8 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "40dc408b1e03cc36d80209baaa2d32b7"
>  SRC_URI[sha256sum] = "455ccfaf4ec724d2cf5d8bff1f3d26a958ad196121e7ea26504fd3018757652d"
>
> +CACHED_CONFIGUREVARS += "BASH_SHELL=${base_bindir}/bash"
> +
>  RDEPENDS_${PN} += "bash perl libxml2"
>  S = "${WORKDIR}/${PN}-${PV}"
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Hi team .. this patch is important otherwise we can not create an
image with mpich in Fedora

If there is other way or is already fixed I am more than happy to know
to apply that

Thanks and regards

Victor Rodriguez

