Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MeE3G-0001zR-Jh
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 22:16:03 +0200
Received: by qw-out-1920.google.com with SMTP id 4so106593qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vmvI0ShbSqxD2GNsp+PmNiS6fFHc9dNdZq0LWxIyIC8=;
	b=J9YvJ1oT/JdZbO9tlEQ7F0i7B3gFvBBViG2+co312cRdUyLP3TRB86vLu8qDQ8Dy/9
	HGeCohhpAulNqVUoDvLoV9xBEczIz6db8EIkXqcNaOsbwCD74OwGFsMf3joRnKDW4lxq
	M1OCAnOayasliNX0VOqCTkxyl+1AQqnDi6Fhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=h3IQUf02gj1RlTDJYfW+e9ev7ddMNpc1bShrGiYkZ47bfAS5r9dGgnFcbqbu6kdj1j
	6LTjLOr5XGvu7UJzQ7dAaVXxXPjqVDkmnQPXGnecnuyMcnb0l/S5fQOYFVufl7hHclmr
	OjW93QAmdgWUNge1E8N/2x/E3e7fTsa1TLa8c=
MIME-Version: 1.0
Received: by 10.229.27.19 with SMTP id g19mr43305qcc.11.1250798323290; Thu, 20 
	Aug 2009 12:58:43 -0700 (PDT)
In-Reply-To: <20090820053123.GD4952@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
	<20090818154440.GQ2227@smtp.west.cox.net>
	<20090818212827.GA26614@gmail.com>
	<20090818232002.GZ2227@smtp.west.cox.net>
	<19c1b8a90908181648nb43120bg978baa4ac0faa2cb@mail.gmail.com>
	<20090820053123.GD4952@smtp.west.cox.net>
Date: Thu, 20 Aug 2009 12:58:43 -0700
Message-ID: <19c1b8a90908201258s1d1ba49aice5020132e2e5ba0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Thu, 20 Aug 2009 20:16:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2009 at 10:31 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Tue, Aug 18, 2009 at 04:48:20PM -0700, Khem Raj wrote:
> [snip]
>> > So are we on the same page again, micro/minimal-uclibc can go away and
>> > micro/minimal can ?=3D LIBC? :)
>>
>> no. LIBC provides other packages too which is different for uclibc
>> its same for glibc and eglibc so having same for glibc and eglibc is ok =
but not
>> for uclibc
>
> You've lost me, again. =C2=A0What does uclibc.inc not set correct for ucl=
ibc?
>

e.g.

PREFERRED_PROVIDER_virtual/libintl      =3D "proxy-libintl"
PREFERRED_PROVIDER_virtual/libiconv     =3D "libiconv"

but if we move these to sane-toolchain-uclibc inc then yes
we could basically use LIBC knob with some little work

> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


