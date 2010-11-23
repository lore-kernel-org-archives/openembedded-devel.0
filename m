Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKmNi-0007wi-31
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 07:29:34 +0100
Received: by wyb40 with SMTP id 40so1100745wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 22:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6SsEW7qXJGmhyxK9i0pmqVRMboC/Lu61Uskk1n4vOns=;
	b=DcwiDz+FAsW5OpjClaZR7tre0nkVsMveTMpiQnSrOHFAZiEF87Ja25lySteWebxj8e
	zUZvMYJHx6af5XK7ngbjYztiWRxd5OEEPc8L+wRaZK5yNtWwLHSAjW6f/aXLQmGQxDgN
	Pm9eHIDyivtMqpLhvN9raKBqOWYiDX0P6IrBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Aba0jt9Uxu4ZlkTlCAQtBX00gLxjv3hbumr7Ze2YZblcgBnxnd3Kh97p6r2cY+jYEQ
	zdyeX4+EnAEB67lKrdmzg3Ze3lJg17jAgA749XCuMVgqQC02PP1F2wwwkgMa5wGRRs7s
	0/Pwc9bMkm0SkVUcYkzCoMnv8v+ysbZxz5LV4=
MIME-Version: 1.0
Received: by 10.227.134.149 with SMTP id j21mr7035800wbt.194.1290493700924;
	Mon, 22 Nov 2010 22:28:20 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Mon, 22 Nov 2010 22:28:20 -0800 (PST)
In-Reply-To: <1290489685-22499-1-git-send-email-raj.khem@gmail.com>
References: <1290489685-22499-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 16:58:20 +1030
Message-ID: <AANLkTin4Y-bNabg0w4FkhFU1MXZG+59XK=tmuwB1n9=T@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,LONGWORDS,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xserver-kdrive-common.inc: Add $PACKAGES to PROVIDES
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
X-List-Received-Date: Tue, 23 Nov 2010 06:29:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 23 November 2010 15:51, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes the issue where opkg complains about missing
> Unknown package 'xserver-kdrive-fbdev'.
> | Collected errors:
> | * opkg_install_cmd: Cannot install package =A0xserver-kdrive-fbdev.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/xorg-xserver/xserver-kdrive-common.inc | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/xorg-xserver/xserver-kdrive-common.inc b/recipes/xor=
g-xserver/xserver-kdrive-common.inc
> index 6272a3a..7ee22b1 100644
> --- a/recipes/xorg-xserver/xserver-kdrive-common.inc
> +++ b/recipes/xorg-xserver/xserver-kdrive-common.inc
> @@ -1,11 +1,12 @@
> =A0LICENSE =3D "MIT"
> =A0DEPENDS =3D "compositeproto damageproto fixesproto recordproto resourc=
eproto scrnsaverproto xineramaproto videoproto xextproto xproto \
> =A0 =A0 =A0 =A0libxau libxext libxdmcp libxfont libxrandr tslib virtual/l=
ibx11 xtrans xextproto-70-includes"
> -INC_PR =3D "r28"
> +INC_PR =3D "r29"
>
> =A0PKGN ?=3D "xserver-kdrive"
>
> =A0PROVIDES =3D "virtual/xserver"
> +PROVIDES +=3D "${PACKAGES}"
> =A0PACKAGES =3D+ "${PKGN}-fbdev \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0${PKGN}-sdl \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0${PKGN}-fake \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Tested with mipsel/minimal/x11-image.

Tested-by: Graham Gower <graham.gower@gmail.com>


