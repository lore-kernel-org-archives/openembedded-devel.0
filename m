Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1To1Zf-00021I-3z
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Dec 2012 01:43:52 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so3608699eaa.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 16:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=NkrO5nyioOogspXRQO/bOxksG6Z5BPlM/jjksItLmkA=;
	b=FKlzpfwt7Sn+VmxsvCAeOToGFzm82BW0CDfg2PY36ypeNTBg8Xbq3NQUYcJe+EjexO
	SwNpQFdqfPR3kkflsd/UrNu+HtFyEj+NbM6p3Ua6jLJ3P1dCy5BiNv8+aB16CPmcB7kq
	FRfXPTo/jQAKLe6VKzwRMQHwHYTLccHBqD+S8R8qNBSEBioW2InC5hZ/QhBLQJLs+muc
	jLwLy0hECwpoOvTZ7VcZcfSwkHAPNOwnhsNZ4r63jdCcS6DJ6XXMXR2h1zArzW1fM7NZ
	d/fEDw6/H2+nAWJdFToHixl+e9hHG5sbdbV095n6s5aqqn6eIDnrKv2JijLXvpn5IMFr
	/btg==
X-Received: by 10.14.178.196 with SMTP id f44mr73712866eem.14.1356568137661;
	Wed, 26 Dec 2012 16:28:57 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id 6sm56352743eea.3.2012.12.26.16.28.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 16:28:56 -0800 (PST)
Date: Thu, 27 Dec 2012 02:28:44 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121227002844.GA21277@gmail.com>
References: <20121224185436.GA1230@gmail.com>
	<20121226105254.GA18297@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20121226105254.GA18297@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQm4OAwMCMxi8THNXzNaQq1USzjPih/bi6+Sul3bTX8/D5rr5Q/682fhfIskYw2P/shzMGVs
Subject: Re: Linker Problem: Unrecognized '-Wl,-O1'
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
X-List-Received-Date: Thu, 27 Dec 2012 00:43:53 -0000
X-Groupsio-MsgNum: 42424
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 26, 2012 at 11:52:54AM +0100, Henning Heinold wrote:
> Hi,

Hello,

> easy to fix edit the buildsystem to usee gcc as linker no ld directly
> or fix the build system not to use CFLAGS for linking, but LDFLAGS.

Thanks for your suggestion! I have set "LD =3D ${CC}" in .bb file and it
compiles right now. It seems to work correctly.

There is no problem with the usage of CFLAGS or LDFLAGS but Makefile of
aprx seems to be wrong. All the other packages I have looked so far
utilized autotools and used the compiler for linking. However, aprx
directly sets the linker and it seems to be using autotools as well. I
don't know how the error originated but I guess it's better that I
contact the maintainer and let him know.

### BEGIN: Makefile.in ###

# Compiler and flags
CC=3D             @CC@
CFLAGS=3D         @CFLAGS@

# Linker and flags
LD=3D             @LD@
LDFLAGS=3D        @LDFLAGS@ $(PROF)

PROGAPRX=3D   aprx

$(PROGAPRX):    $(OBJSAPRX) VERSION Makefile                           =20
        $(LD) $(LDFLAGS) -o $@ $(OBJSAPRX) $(LIBS) =20

### END: Makefile.in ###

> Bye Henning

Regards,
Eren

--=20
    . 73! DE TA1AET
      http://linkedin.com/in/erenturkay

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQ25Y8AAoJEOM7bMm6HhcT84wP/2vcIyw2PX/uA28L6itvRyPP
mzapGlh48mvTzsbuELp7D2IvJzif1I1RlhVZQJ66q5WFPmAoeGpr6vRuqBj7At6k
lj5tzZtiKiXFxBcMaxkFpBsmmFT1CpVVZGkmIiTrf6hxS/QT5Y6I7k0kYH+LzPd7
0AHB18vaKQ3U4HfhYVqAi1T06lcUvREnhE1bVF4IGVv2zVrGktfVRgy6wK5ggqGJ
66v4YlQMT/WD4LLuFTQhe+1oC+TtQhepS//pmn5XjhtyM6n4uAPwx58XHJCYLzUx
Yly60GecdJu6xN6o7GUzvgpUnVy1roas2Wu2jE75PNgmvybwbfQ+jB5XIr7soV5O
xrh8u6npMoWoHNslJ+4DYnbcbBLFKq8zY84WmOFV+uHOOmW+0T9vR5rxUmWyMLMB
W0CdNMtvWlDP+rZj9VlH3BTR3Clq+E40zAktX8rKuzrX/2M/HkNPoatY64xfFM5f
z7ZfYZFW21CwPj9dntWjaoxrfy+s/0rrmKBqSb0GOOI4HkRP60Kf4ThaBZJf+/Nj
j5I/Pt1hYKKWoARe+I9fmSo9aC+1byg0FAFiUf4C2x3YNMA9VdUvLD7FA8obqrBq
SQfB9IgMe3wWkKuQZlbkaU4s2Mg6GvoUCco/Z2MCbuljG2zok+WuYkXIL/njvp9d
R+wBkT4wmwfhrSLiBCbZ
=pHXN
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
