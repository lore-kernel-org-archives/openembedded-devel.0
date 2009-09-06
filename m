Received: from [209.85.221.200] (helo=mail-qy0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MkDFI-0003vR-M5
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 10:37:12 +0200
Received: by qyk38 with SMTP id 38so817181qyk.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 01:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nMirDTIGMfDCYgx7B+1H8WgicPryzhQPBhxhGTYLPR8=;
	b=IkGSmE+Hp8i5AjCAhL2bS8lYF8YNkrWGMwTleaXYQHchEz+0/dZPlCfT+6bi7Nm27M
	A3XKoMQZvhBaQmziMAAP0FkMP/coHZLg9p0lwCLujQjEWeayQXZk/YtPgvjd13rqrlEz
	sh7MfsIl34hhYLMKQ1U4CakXBQP+wlprPZdW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aoyVGPp0PJ2Tq1DNxCDxxdoWvvocfm0vU9aDTOPHvx8MRKCThRwfqwQeZuJ6kKoPNo
	+HVbmurh42MxTbFWYsmPL6665fyDdT6b8Ymc0NGMqwbxwH4TaJ0GP1ipy9E5L4s/0OUC
	uUmiMhSJ9piNfxipyyX4MQ+EHRgSTKK/4AGMY=
MIME-Version: 1.0
Received: by 10.229.44.2 with SMTP id y2mr3525665qce.76.1252225081298; Sun, 06 
	Sep 2009 01:18:01 -0700 (PDT)
In-Reply-To: <27c25bc40909060001w4e236953v4503216cac29a12f@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
	<1252181231.4490.148.camel@lenovo.internal.reciva.com>
	<19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
	<27c25bc40909060001w4e236953v4503216cac29a12f@mail.gmail.com>
Date: Sun, 6 Sep 2009 01:17:58 -0700
Message-ID: <19c1b8a90909060117p70dbda1fk4df80fb3dcb55aed@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: unable to bitbake ortp
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
X-List-Received-Date: Sun, 06 Sep 2009 08:37:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2009 at 12:01 AM, Juan Backson<juanbackson@gmail.com> wrote:
> Hi
>
> I have the following in my ortp0.7 recipe. =C2=A0How should I change it t=
o get
> bitbake to work?

I have committed a fix for it on .dev if you are using .dev branch
just update your copy.


>
> DESCRIPTION =3D "An LGPL implementation of RTP - RFC3550"
> LICENSE =3D "LGPL"
> DEPENDS =3D "glibc"
>
> PR =3D "r1"
>
> inherit autotools pkgconfig
>
> SRC_URI =3D "
> http://download.savannah.nongnu.org/releases/linphone/${PN}/sources/${P}.=
tar.gz
> "
>
> do_compile_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s:${STAGING_DIR_TARGET}::g \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s:/${TARGET_SYS}::g \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ortp.pc
>
> }


