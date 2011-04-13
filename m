Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QA94I-0004CU-BA
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 01:01:50 +0200
Received: by fxm19 with SMTP id 19so949356fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 15:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=QT9OyTgDuEhAlPV1I17wPr5IgnFGvM/Vr76Y3qjOMf8=;
	b=evb9eWB0lopd3cUlEQJUDnnXPwXI1LUbKhKGgUGkC0ooDC6NqwmJxiloC7jA1HgKt9
	N3tJFSYReDz9RAfVskJlk+tYQ8Q2+jkEeOPuHt6n+2M5kegUhC4xJEoNpoCx+x4790iO
	Nk+la6TGB6r9xULZO+ksbAUeBqrJyxAlYH+v8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=qV86IPRFpo5HoVJeH26ugSwwySjHY1no+OCk220Cb8lEJ74DwogVRwMAJUGLOyQxbP
	0ldUSpaY+c9M5yuuhCCAbn8/bfOufdc3Ef/Wu4FDG5P2fn9OZKIyjJhdY2zEHlVXNd6M
	Zn6Xkxiwh0+PeCcuRbtCP4RjA/0rR7dTgeEiw=
Received: by 10.223.74.83 with SMTP id t19mr14639faj.149.1302735571126; Wed,
	13 Apr 2011 15:59:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Wed, 13 Apr 2011 15:59:01 -0700 (PDT)
In-Reply-To: <201104140046.05993.schnitzeltony@gmx.de>
References: <201104140046.05993.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2011 15:59:01 -0700
Message-ID: <BANLkTi=h+7Xbz+DMYG=1NjJN14d2XJ8geQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How to handle a http git repository
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
X-List-Received-Date: Wed, 13 Apr 2011 23:01:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 3:46 PM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> Hi,
>
> I would like to build =C2=A0u-boot for freescale iMX28 with OE. =C2=A0The=
re is u-boot
> support available at
>
> http://opensource.freescale.com/pub/scm/imx/uboot-imx.git/
>
> Problem is that it links to the *files* of a git repo not to the repo its=
elf. A
> manual git clone works but I do not find a good approach fetching the rep=
o in OE.
>
> I could do something like
>
> do_fetch () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0git clone http://opensource.freescale.com/pub/=
scm/imx/uboot-imx.git
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd uboot-imx
> =C2=A0 =C2=A0 =C2=A0 =C2=A0git checkout imx_v2009.08_10.12.01
> }
>

SRC_URI =3D "git://opensource.freescale.com/pub/scm/imx/uboot-imx.git;proto=
col=3Dhttp;tag=3Dimx_v2009.08_10.12.01"

> but (one of) the great disadvantage(s) of this hack is fetching on every =
build.
>
> Can anybody help me with a hint?
>
> Thanks in advance
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


