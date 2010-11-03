Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDkHt-0002Ue-IW
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 21:50:30 +0100
Received: by ywo7 with SMTP id 7so301946ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vx1wWKbl/dymPcXsmXLEgf2tji60VejHmx6EXkLCbFk=;
	b=rtwL+QYXoM6O5sjOBwXhBQf1git/bix+zgIzeRWdI4//agNut1YDMa9Ek2PhWSuAHw
	pAxC3/oXxtFSBF3hSVGaE86ACLWvqNJq7kNRrn5axqFJLnY0BcNxzJvg5PMJWfFA/xxM
	J4srkqyqXkbHCcZX7KZO/dLufVLk0Csj9/m/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oiG/kI3+QPLst+PIyuqZq/FsgD0Dl0Umd/pxIPG2W2K970AwOOtGqMM1yGR/M7DKjy
	65YulJJRKkRGZJHTO1cznxTtJU3Gw+IRQIWm7gbju5WtnsYqX6LyZfm+zKYw6H4bKMzX
	C/gLnBjleUBZ05lCb/MzpUgYyrvoJmuc1nDmU=
Received: by 10.90.20.1 with SMTP id 1mr25447agt.145.1288817377120; Wed, 03
	Nov 2010 13:49:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 13:49:16 -0700 (PDT)
In-Reply-To: <1288781221-14752-1-git-send-email-khimov@altell.ru>
References: <1288775679.3980.31.camel@mattotaupa>
	<1288781221-14752-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 13:49:16 -0700
Message-ID: <AANLkTi=EYwhkSxqJcaw97AskuGaC1uwt9qtX5V+MFsW+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpfring: update SVN revision to 4384
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
X-List-Received-Date: Wed, 03 Nov 2010 20:50:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 3:47 AM, Roman I Khimov <khimov@altell.ru> wrote:
> I guess it should be in sync with pf-ring kernel module as using module r=
evision
> 4384 with lib revision 4326 results in "mmap() failed" message on tcpdump=
 (using
> patched libpcap to support pf_ring) exit.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../libpfring/libpfring-makefile-fixes.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 16 ++++++++--------
> =C2=A0recipes/pf_ring/libpfring_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch b/r=
ecipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
> index 721f904..0344a7d 100644
> --- a/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
> +++ b/recipes/pf_ring/libpfring/libpfring-makefile-fixes.patch
> @@ -1,7 +1,7 @@
> =C2=A0Index: Makefile
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Makefile.orig =C2=A0 =C2=A0 =C2=A02010-08-02 17:31:55.000000000 +040=
0
> -+++ Makefile =C2=A0 2010-08-03 12:56:31.000000000 +0400
> +--- Makefile.orig =C2=A0 =C2=A0 =C2=A02010-11-03 13:37:30.000000000 +030=
0
> ++++ Makefile =C2=A0 2010-11-03 13:39:18.000000000 +0300
> =C2=A0@@ -8,7 +8,7 @@
> =C2=A0#
> =C2=A0# Installation directory
> @@ -11,16 +11,16 @@ Index: Makefile
>
> =C2=A0#
> =C2=A0# Search directories
> -@@ -29,6 +29,8 @@
> +@@ -32,6 +32,8 @@
> =C2=A0#
> - # C compiler and flags
> + # CROSS_COMPILE=3Darm-mv5sft-linux-gnueabi-
> =C2=A0#
> =C2=A0+AR =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ar
> =C2=A0+RANLIB =C2=A0 =C2=A0=3D ranlib
> - CC =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gcc
> - CFLAGS =C2=A0 =C2=A0=3D -g -O2 -Wall -fPIC ${INCLUDE} ${DNA_DEFINE}
> - LDFLAGS =C2=A0 =3D -shared
> -@@ -44,26 +46,29 @@
> + CC =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ${CROSS_COMPILE}gcc
> + CFLAGS =C2=A0 =C2=A0=3D -g =C2=A0-Wall -fPIC ${INCLUDE} ${DNA_DEFINE}
> + LDFLAGS =C2=A0 =3D -g -shared
> +@@ -47,26 +49,29 @@
> =C2=A0# Main targets
> =C2=A0#
> =C2=A0STATICLIB =C2=A0=3D libpfring.a
> diff --git a/recipes/pf_ring/libpfring_svn.bb b/recipes/pf_ring/libpfring=
_svn.bb
> index 06aa311..a903e3a 100644
> --- a/recipes/pf_ring/libpfring_svn.bb
> +++ b/recipes/pf_ring/libpfring_svn.bb
> @@ -7,7 +7,7 @@ PV =3D "4.4.0+svnr${SRCREV}"
>
> =C2=A0S =3D "${WORKDIR}/lib"
>
> -SRCREV =3D "4326"
> +SRCREV =3D "4384"
> =C2=A0SRC_URI =3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0svn://svn.ntop.org/svn/ntop/trunk/PF_RING/user=
land;module=3Dlib;proto=3Dhttps \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libpfring-makefile-fixes.patch;striplev=
el=3D0 \
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


