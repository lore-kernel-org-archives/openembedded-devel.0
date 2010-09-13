Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvDjV-0003GX-9m
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 20:26:26 +0200
Received: by gxk10 with SMTP id 10so1123461gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=90PDRwionlyIiSPQ+PC/C7+0P/rXrYJhzbRxHhSmfLw=;
	b=hY6LwIvORibAngSLAYcX+XtYRWhvKFSLbkH55TS2SUcV8X9Y6DhIzUtDtsb7c4C2y/
	1DMGs/MuOv0UsOzTA3L3MBp4ScqiL5L+4EwZKLVLgjrCW4WXhj9vfpFb9MjujQAt2tQB
	K4rG8vglS0TPYW+S4IE4Hnynyg5/PxDpPFlJE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QgalWdCNjX58CC/YJ80wZfmL6DrxQ5ttMImzN1j/Ds2P2zu89HS0IxzCgpDePyX87F
	ms2nWpUJfgCQJSVCZYiWbo238vD7L9Agv4/C2PVESxdlGskclQONHCmPy9Zz7c7YZN6r
	T0KPj6Iz2gEC3pZ/dXyGANBUqJqySV/IVYch0=
Received: by 10.151.10.10 with SMTP id n10mr549753ybi.137.1284402334672; Mon,
	13 Sep 2010 11:25:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 13 Sep 2010 11:25:14 -0700 (PDT)
In-Reply-To: <D56B4474-3D63-40D5-8BB1-E1E0CECAF26D@chumby.com>
References: <D56B4474-3D63-40D5-8BB1-E1E0CECAF26D@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Sep 2010 11:25:14 -0700
Message-ID: <AANLkTi=+pHxp3S8VuRG5b4rU0+kkxATN=u3-urRNudhj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] driftnet: fix recipe to work with a modern build system
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
X-List-Received-Date: Mon, 13 Sep 2010 18:26:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2010 at 6:46 PM, Sean Cross <sean@chumby.com> wrote:
> The driftnet recipe seems to be patching the Makefile to explicitly speci=
fy a compiler called arm-linux-gcc, and to remove the dependency on pkg-con=
fig. =C2=A0I believe both of these are obsolete practices now.
>
> Signed-off-by: Sean Cross <sean@chumby.com>

looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/driftnet/driftnet-0.1.6/arm.patch | =C2=A0 13 +------------
> =C2=A01 files changed, 1 insertions(+), 12 deletions(-)
>
> diff --git a/recipes/driftnet/driftnet-0.1.6/arm.patch b/recipes/driftnet=
/driftnet-0.1.6/arm.patch
> index 340a6cf..c5b7155 100644
> --- a/recipes/driftnet/driftnet-0.1.6/arm.patch
> +++ b/recipes/driftnet/driftnet-0.1.6/arm.patch
> @@ -5,7 +5,7 @@
>
> =C2=A0# Compiler to use.
> =C2=A0-#CC =3D gcc
> -+CC =3D arm-linux-gcc
> ++CC ?=3D arm-linux-gcc
>
> =C2=A0# Basic compiler, linker flags; should not need any changes.
> =C2=A0CFLAGS +=3D -g -Wall
> @@ -17,17 +17,6 @@
> =C2=A0#LDFLAGS +=3D -L/path/to/libpcap.so
>
> =C2=A0# Required on Linux to get BSDish definitions of the TCP/IP structs=
.
> -@@ -31,8 +31,8 @@
> -
> - # Optional C compiler and linker flags. Typical driftnet builds have su=
pport
> - # for displaying captured images in an X window, and need the following=
 flags:
> --CFLAGS =C2=A0+=3D `gtk-config --cflags`
> --LDLIBS =C2=A0+=3D -ljpeg -lungif `gtk-config --libs`
> -+CFLAGS =C2=A0+=3D -I$(STAGING_INCDIR)/glib-2.0 -I$(STAGING_INCDIR)/gtk-=
2.0 -I$(STAGING_INCDIR)/../lib/gtk-2.0/include -I$(STAGING_INCDIR)/atk-1.0
> -+LDLIBS =C2=A0+=3D -ljpeg -lungif -lgtk-x11-2.0 -lgdk-x11-2.0 -rdynamic =
-lgmodule-2.0 -lglib-2.0 -ldl -lXext -lX11 -lm
> -
> - # Alternatively, you can build a version of driftnet which can only be =
used
> - # in `adjunct' mode as the back end for some other image-processing pro=
gram. To
> =C2=A0@@ -81,13 +81,13 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0( echo '.\" DO NOT EDIT THIS FILE-- edit drift=
net.1.in instead' ; sed s/@@@VERSION@@@/$(VERSION)/ ) < driftnet.1.in > dri=
ftnet.1
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


