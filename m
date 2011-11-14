Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQ63l-0005Iv-UU
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 00:35:30 +0100
Received: by bkbzs2 with SMTP id zs2so6685920bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 15:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dF5h2hyx1pUb5Wzl5Ma1ZL59m5rtiZvtRKvwXen8JTo=;
	b=Z2yLX3TkQDCKD0KKMNSAS9HdL6Czn1OeeMU6yeBdpOSCUsLcVwmrLwE988Wexgfv+f
	OfFLAiEokpofVf5wxuDasETNPcKyti9JuvWIkQBUKWhkfogXMfgG9c+tOpzFsBuFn6H2
	LUO+0kzUQSYW9Smt/ya1gAMXzglUj4TRXRBtA=
Received: by 10.204.133.216 with SMTP id g24mr13900625bkt.82.1321313344892;
	Mon, 14 Nov 2011 15:29:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e20sm171518fab.2.2011.11.14.15.29.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 15:29:04 -0800 (PST)
Date: Tue, 15 Nov 2011 00:28:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111114232852.GB3600@jama.jama.net>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 23:35:30 -0000
X-Groupsio-MsgNum: 35405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 04:23:30PM -0600, David Thomas wrote:
> OK, so I fight a install of gcc-4.6 onto ubuntu lts and same error. I
> first tried for weeks to get Compulab CM-T35 stuff to work per their
> instructions. Then I get the scripts and all seems well, now this. I
> have spent a month on trying to build a cm-t35 so I can then add in
> additional functionality. At ever turn it fails.  4 weeks and nothing.
>=20
> I mean, how hard can this be?

How hard is to find out that
meta-smartphone/meta-palm/recipes-kernel/linux/linux-hpveer_git.bb
probably is not best kernel for CM-T35 as the hpveer in name suggests?

And how hard is to open that recipe and read:
# Workaround default -Werror setting and some warnings in kernel compilation
TARGET_CC_KERNEL_ARCH +=3D " -Wno-error=3Dunused-but-set-variable -Wno-erro=
r=3Darray-bounds"

which is needed for newer gcc to not fail with -Wall -Werror.

Regards,

>=20
>=20
> On Mon, Nov 14, 2011 at 12:59 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
> > <david.thomas@microbee-systems.com> wrote:
> >> I am getting a gcc error
> >>
> >> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-but-=
set-variable
> >>
> >> Using the Angstrom scripts I can run machine=3Dbeagleboard and complet=
e.
> >> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
> >>
> >> I am having to guess that the machine file is all that was required,
> >> it seems to pich all the right arch, etc.
> >>
> >> I had asked on Angstrom for any CM-T35 related info to no avail...
> >
> > This error is on by default for the compiler for OE now. You can get
> > around it by
> >
> > 1) Fixing the (potential) errors in the source code
> > 2) Turning off the error in the build (EXTRA_CFLAGS =3D
> > "-Wno-error=3Dunused-but-set-variable" or something similiar)
> >
> > -M
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
> --=20
> Dave Thomas
> MicroBee Systems, Inc
> 1429 Weatherly Road, Suite G
> Huntsville, AL 35803-1187
> 256-489-6671 (Voice)
> 256-426-2431 (Mobile)
> 256-489-6673 (FAX)
> www.microbee-systems.com
> "Innovative Solutions for an Embedded World"
>=20
> This message is intended for the sole use of the addressee, and may
> contain information that is privileged, confidential and exempt from
> disclosure under applicable law. If you are not the addressee you are
> hereby notified that you may not use, copy, disclose, or distribute to
> anyone the message or any information contained in the message. If you
> have received this message in error, please immediately advise the
> sender by reply email and delete this message.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7BpDQACgkQN1Ujt2V2gBxYegCgtbZJKGvvBu46MX1rnQKWCsc7
CPEAn2id231DQZNi1SCDgJPTifBDvIGi
=4V03
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
