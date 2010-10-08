Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P46Yv-0000mN-AC
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 08:36:14 +0200
Received: by iwn5 with SMTP id 5so321197iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uOdIY4ja9VwYSNovCBB2jQMpsQN7PAymWgddX2I+tGc=;
	b=yD8Xk8uVrRlZcN+atj0HKD1oQNBwGhedPlyBiRAsVJG9A9xhcZ6uJqsgynrE05mSmn
	v169GNI5l78Ulq7WCV9On/N9o4Tcm8BcVIGBBacs0TAXmwqf6i1FhnhGet+8kvf+aZ9Z
	cDFpKli+diLXP70CWfJnJapSsOX3jGHCyX/p4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VpXeO4b0RFnmB4vwvkBCCx/VY2IaWBGHpaG31PVqk5xVUHEjwcQiJ0mdN69JKCc9bL
	HldFH3NitLIO8DGyx/2K/EY9z6Qg+HnLs2jgV10fNOuBFpnfW1cPFI/Q0WROAWWPZAqC
	yWt19MzWpCtoTNkKJzOGw3T0yQx/XZuvxGYJs=
MIME-Version: 1.0
Received: by 10.231.16.75 with SMTP id n11mr1886431iba.49.1286519304929; Thu,
	07 Oct 2010 23:28:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 23:28:24 -0700 (PDT)
In-Reply-To: <1286499432.3659.37.camel@mattotaupa>
References: <1286499432.3659.37.camel@mattotaupa>
Date: Fri, 8 Oct 2010 08:28:24 +0200
Message-ID: <AANLkTi=m3Q50RKSvMpTMsyBCai95U22oui8TAoj3f8Yb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cairo_1.10.0: add `glib-2.0-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 08 Oct 2010 06:36:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/8 Paul Menzel <paulepanter@users.sourceforge.net>:
> Date: Thu, 7 Oct 2010 13:38:44 +0200
>
> `do_compile()` of `cairo_1.10.0.bb` fails with the following error.
>
> [=85]
> =A0 =A0 =A0 =A0make[4]: Entering directory `/oe/build/angstrom-dev/work/a=
rmv7a-angstrom-linux-gnueabi/cairo-1.10.0-r0/cairo-1.10.0/util/cairo-gobjec=
t'
> =A0 =A0 =A0 =A0 =A0CC =A0 =A0 libcairo_gobject_la-cairo-gobject-enums.lo
> =A0 =A0 =A0 =A0In file included from cairo-gobject-enums.c:8:
> =A0 =A0 =A0 =A0cairo-gobject.h:44:25: error: glib-object.h: No such file =
or directory
> =A0 =A0 =A0 =A0In file included from cairo-gobject-enums.c:8:
> =A0 =A0 =A0 =A0cairo-gobject.h:52: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'cairo_gobject_context_get_type'
> =A0 =A0 =A0 =A0cairo-gobject.h:56: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'cairo_gobject_device_get_type'
> =A0 =A0 =A0 =A0cairo-gobject.h:60: error: expected '=3D', ',', ';', 'asm'=
 or '__attribute__' before 'cairo_gobject_pattern_get_type'
> =A0 =A0 =A0 =A0[=85]
>
> `glib-object.h` is only in sysroot of the build host.
>
> =A0 =A0$ find angstrom-dev/ -name glib-object.h
> =A0 =A0angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.=
h
>
> `cairo_1.8.8.bb` builds fine.
>
> Adding `glib-2.0-native` to `DEPENDS` puts `glib-object.h` also into the =
sysroot of the target machine and fixes the build.
>
> =A0 =A0$ find angstrom-dev/ -name glib-object.h
> =A0 =A0angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.=
h
> =A0 =A0angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gl=
ib-2.0/glib-object.h
>
> Build tested with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =A0recipes/cairo/cairo_1.10.0.bb | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/cairo/cairo_1.10.0.bb b/recipes/cairo/cairo_1.10.0.b=
b
> index 7530cd1..9859b9c 100644
> --- a/recipes/cairo/cairo_1.10.0.bb
> +++ b/recipes/cairo/cairo_1.10.0.bb
> @@ -1,5 +1,7 @@
> =A0require cairo.inc
>
> +DEPENDS +=3D "glib-2.0-native"
> +
> =A0SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=
=3Dcairo \
> =A0"
>
> --


Hm. Personally I'd say glib should put the include file in
angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0
I'd say you need a depend on glib-2.0 not on glib-2.0-native

As i see it, dependencies on native packages should only be needed if
you need a binary from another package to build your package (unless
ofc you are a binary package yourself, in which case you need native
headers)
 (and yeah, I know there are several exceptions).

Frans


