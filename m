Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QTo3m-0001S7-DC
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 06:38:34 +0200
Received: by qyk27 with SMTP id 27so2789164qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 21:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=tRQAk+BTj0j9lYSsy38k+f++XeN2zF/Au5kt9ab18Ag=;
	b=IWpVLs8Bm6DHr+2JwKVkob+zCOXqkqEc6z0p2xJ0y6jT6pAxBw8pqiuVKAbw9eGFvL
	LB/Szq+Sfwzmz7pNBZhFSgR3L4qyBaDHsvt2bi+/6YTIzC1m5xBL3agnXEkc0RjIXRm1
	CQatdJmTMgqp92vPVdua/MF5C8AwscEAAJsek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aSsoiY+1X4jlq+SderpLBUFUtNDhsFJTycLyoIdC9E2lFfvbG5qEcp0zEBzPqGqAvo
	W7xEiDy0uOwH0EuzCrjosnq9C4yBaHWwacnHli/TOuyFl2ESmFH2SSTptx2p9xFtef9B
	4BKSDyMpofW+oE4zqvzZg7bEkDs8FySn40Yjs=
MIME-Version: 1.0
Received: by 10.224.108.66 with SMTP id e2mr2412416qap.208.1307421315960; Mon,
	06 Jun 2011 21:35:15 -0700 (PDT)
Received: by 10.224.67.200 with HTTP; Mon, 6 Jun 2011 21:35:15 -0700 (PDT)
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B03751C140E@dbde02.ent.ti.com>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03751C140E@dbde02.ent.ti.com>
Date: Tue, 7 Jun 2011 10:05:15 +0530
Message-ID: <BANLkTi=XBb_9MdRt+DwT2x8mV=agBi1L2Q@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libgles-omap3: Specify the Window System to be updated in powervr.ini
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
X-List-Received-Date: Tue, 07 Jun 2011 04:38:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 2, 2011 at 6:32 PM, Balagopalakrishnan, Anand <anandb@ti.com> w=
rote:
> From a5a2d6f4356db3a8be1c7cb536d78af834aa60f9 Mon Sep 17 00:00:00 2001
> From: Anand Balagopalakrishnan <anandb@ti.com>
> Date: Thu, 26 May 2011 21:11:50 +0530
> Subject: [PATCH] libgles-omap3: Specify the Window System to be updated i=
n powervr.ini
>
> * SGX driver looks at /etc/powervr.ini for the Window System to be used.
> =A0This patch introduces a variable to specify which Window System should
> =A0be specified in powervr.ini file.
> * By having this variable, it's easy to override the default Window Syste=
m
> =A0through a config file or amendment
>
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Acked-by: Siddharth Heroor <heroor@ti.com>

> ---
> =A0recipes/powervr-drivers/libgles-omap3.inc | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-=
drivers/libgles-omap3.inc
> index db7681d..36c311d 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -28,6 +28,8 @@ ES3LOCATION ?=3D "${S}/gfx_rel_es3.x"
> =A0ES5LOCATION ?=3D "${S}/gfx_rel_es5.x"
> =A0ES6LOCATION ?=3D "${S}/gfx_rel_es6.x"
>
> +LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_FRONTWSEGL.so.1"
> +
> =A0do_configure() {
> =A0 =A0 =A0 =A0# Attempt to fix up the worst offenders for file permissio=
ns
> =A0 =A0 =A0 =A0for i in $(find ${S} -name "*.h") $(find ${S} -name "*.c")=
 $(find ${S} -name "Make*") ; do
> @@ -152,7 +154,7 @@ do_install () {
>
> =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}
> =A0 =A0 =A0 =A0echo "[default]" > ${D}${sysconfdir}/powervr.ini
> - =A0 =A0 =A0 echo "WindowSystem=3DlibpvrPVR2D_FRONTWSEGL.so.1" >> ${D}${=
sysconfdir}/powervr.ini
> + =A0 =A0 =A0 echo "WindowSystem=3D${LIBGLESWINDOWSYSTEM}" >> ${D}${sysco=
nfdir}/powervr.ini
>
> =A0 =A0 =A0 =A0# The ES2.x, ES3.x, ES5.x and ES6.x CPUs have different SG=
X hardware, so we need to install multiple sets of userspace
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


