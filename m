Return-Path: <p.patat@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 196846D99E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:22:02 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so3757004wib.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 05:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=PeH3lpf4FpYGYFPcFh901peXqjIsD7QmrgVCW2anIeU=;
	b=toehYcJQl7MKJODRN5MC6wpb5lecuINEpjMKi6a26SxYjeKQYkh/FS09IAkzBuVyBx
	gBhezTcLpbXfBt59m7v3HZSDg5BBuc1QVrpYcB1oH7oHTnb0XYAX+1n0l/CxABX4/3Pg
	m2uJvMLT6wuyRTMa3bEZfma3AExjeOsUwXWRuQwu47Z2/xuDn7YAwouz/6HaPD1fTZjd
	0i42il6OzionLUvkhiz/YSynslaQJbaWrjlD0I5JXDa7Ea2vxO7mRwjdmqJDHAHUfrmv
	qZwJiB5AFodh4oMHBuSbegBxzGtwhMneOsYqPhKbWrJP3OpXFfmewY2rRkfltcpN5n62
	EBlA==
X-Received: by 10.194.93.193 with SMTP id cw1mr32596980wjb.38.1386163322027;
	Wed, 04 Dec 2013 05:22:02 -0800 (PST)
MIME-Version: 1.0
Sender: p.patat@gmail.com
Received: by 10.194.9.33 with HTTP; Wed, 4 Dec 2013 05:21:40 -0800 (PST)
In-Reply-To: <9496065.268AkWkQYa@sencha>
References: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
	<9496065.268AkWkQYa@sencha>
From: patrick patat <patrick.patat@innotis.org>
Date: Wed, 4 Dec 2013 14:21:40 +0100
X-Google-Sender-Auth: iofyZupQOq2KrvTpjDVN4ipTxf4
Message-ID: <CAF+NyK7MseQWPauZqufJ_958643S0q-m+NXAnbkg7iQ673q88Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 13:22:03 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2013 at 12:28 PM, Roman Khimov <khimov@altell.ru> wrote:

> =F7 =D0=C9=D3=D8=CD=C5 =CF=D4 4 =C4=C5=CB=C1=C2=D2=D1 2013 11:59:07 =D0=
=CF=CC=D8=DA=CF=D7=C1=D4=C5=CC=D8 Patrick Patat =CE=C1=D0=C9=D3=C1=CC:
> > +DEPENDS +=3D "perl openssl"
> > +
> > +EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING_L=
IBDIR}
> > -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'" +
> > +S =3D "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> > +
> > +inherit cpan
> > +
> > +do_compile() {
> > +        export LIBC=3D"$(find ${STAGING_DIR_TARGET}${base_libdir}/ -na=
me
> > 'libc-*.so')" +       export OTHERLDFLAGS=3D'-Wl,-rpath'
> > +        cpan_do_compile
> > +}
>
> Although this one:
>
> http://git.openembedded.org/openembedded/commit/?id=3D0f2de8ebc390406205f=
d0b27f62c833895aa6901
> is for a bit different version in a bit different kind of OE, I think you
> don't need this kind of CPANFLAGS and do_compile mangling. Also, inheriti=
ng
> cpan already sets proper perl DEPENDS/RDEPENDS.
>

Without EXTRA_CPANFLAGS I have the following error at run time:
Can't load
'/usr/lib/perl/vendor_perl/5.14.3//auto/Crypt/OpenSSL/RSA/RSA.so' for
module Crypt::OpenSSL::RSA:
/usr/lib/perl/vendor_perl/5.14.3//auto/Crypt/OpenSSL/RSA/RSA.so: undefined
symbol: RSA_public_encrypt at /usr/lib/perl/5.14.3//DynaLoader.pm line 194.

Then with EXTRA_CPANFLAGS I have QA issue about bad RPATH so this is why I
add OTHERLDFLAGS in do compile.


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

