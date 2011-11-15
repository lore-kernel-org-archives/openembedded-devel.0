Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQFt4-0000Yl-Nu
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 11:05:06 +0100
Received: by bkbzs2 with SMTP id zs2so7154759bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Db1IXhod5q+6cFJW2qKOrsp7QO5GAQewJwgruzcQEpo=;
	b=QwM1u1VX15ogAOfvbaX4fGWvfsU9NezqpUxiiJY3izIXaXZb1Tf9xIiXnohpATx3JA
	sLAqUvfAJPZkmEiSryQXzPltCPLP4XEXuyvKLEBfwSgJSCyUh5dAQ5PRw5tCi3PT4eS4
	+HSstaRZ6xpw13yLc8F5hO184aO1fNCfA7QSQ=
Received: by 10.205.132.148 with SMTP id hu20mr15251207bkc.117.1321351124353; 
	Tue, 15 Nov 2011 01:58:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm16795915fad.7.2011.11.15.01.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 01:58:42 -0800 (PST)
Date: Tue, 15 Nov 2011 10:58:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111115095830.GC3600@jama.jama.net>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
	<20111114232852.GB3600@jama.jama.net>
	<6523650A-975B-4F60-A56D-59FC87F3F24E@microbee-systems.com>
	<178EDE95-8F2C-43B8-BAA9-AC130BA5FFCE@microbee-systems.com>
MIME-Version: 1.0
In-Reply-To: <178EDE95-8F2C-43B8-BAA9-AC130BA5FFCE@microbee-systems.com>
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
X-List-Received-Date: Tue, 15 Nov 2011 10:05:06 -0000
X-Groupsio-MsgNum: 35408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 06:22:27PM -0600, David Thomas wrote:
> Sorry, very frustrated. I am attempting to fix this issue. I apologize, I=
 do not even know what a hpveer is, I will keep trying.=20

hpveer is this device:
http://en.wikipedia.org/wiki/HP_Veer

I don't know where did you get cm-t35.conf but I guess it's not
selecting right kernel to use, maybe because it's not available in any
enabled layer..

Check PREFERRED_PROVIDER_virtual/kernel in cm-t35.conf but it should not
build linux-hpveer for cm-t35 for sure..

And yes linux-hpveer_git.bb is not optimal in forcing those=20
TARGET_CC_KERNEL_ARCH for everybody, because it assumes that everybody
is using default oe-core gcc which is currently 4.6. IIRC Angstrom is
using 4.5 by default.

Regards,
=20
>=20
> On Nov 14, 2011, at 6:11 PM, David Thomas wrote:
>=20
> > Well not everyone works this day in and day out now do they? Show me wh=
ere it states you have to use gcc.4.6 and for that matter, I specifically c=
hoose a LTS platform to avoid having to play latest and greatest.
> >=20
> > So I ask, what is gained by forcing the user to have to use the absolut=
e latest version?
> >=20
> > In addition, it is not necessarily clear to a OE newby how all this is =
pieced together? It is a hackers paradise, I am not a hacker, I have a sche=
dule to meet.
> > Perhaps=20
> >=20
> > In any event, it is moot, were dumping the cm-t35 and using a beagleboa=
rd for product demonstration as it is a dead end.=20
> >=20
> > "The toolchain problems wouldn't have been there if people had used an =
existing, working distro like angstrom, the kernel issues mentioned above a=
re all handled automagically by linux.inc."
> >=20
> > Really?
> >=20
> > On Nov 14, 2011, at 5:28 PM, Martin Jansa wrote:
> >=20
> >> On Mon, Nov 14, 2011 at 04:23:30PM -0600, David Thomas wrote:
> >>> OK, so I fight a install of gcc-4.6 onto ubuntu lts and same error. I
> >>> first tried for weeks to get Compulab CM-T35 stuff to work per their
> >>> instructions. Then I get the scripts and all seems well, now this. I
> >>> have spent a month on trying to build a cm-t35 so I can then add in
> >>> additional functionality. At ever turn it fails.  4 weeks and nothing.
> >>>=20
> >>> I mean, how hard can this be?
> >>=20
> >> How hard is to find out that
> >> meta-smartphone/meta-palm/recipes-kernel/linux/linux-hpveer_git.bb
> >> probably is not best kernel for CM-T35 as the hpveer in name suggests?
> >>=20
> >> And how hard is to open that recipe and read:
> >> # Workaround default -Werror setting and some warnings in kernel compi=
lation
> >> TARGET_CC_KERNEL_ARCH +=3D " -Wno-error=3Dunused-but-set-variable -Wno=
-error=3Darray-bounds"
> >>=20
> >> which is needed for newer gcc to not fail with -Wall -Werror.
> >>=20
> >> Regards,
> >>=20
> >>>=20
> >>>=20
> >>> On Mon, Nov 14, 2011 at 12:59 PM, McClintock Matthew-B29882
> >>> <B29882@freescale.com> wrote:
> >>>> On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
> >>>> <david.thomas@microbee-systems.com> wrote:
> >>>>> I am getting a gcc error
> >>>>>=20
> >>>>> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-b=
ut-set-variable
> >>>>>=20
> >>>>> Using the Angstrom scripts I can run machine=3Dbeagleboard and comp=
lete.
> >>>>> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
> >>>>>=20
> >>>>> I am having to guess that the machine file is all that was required,
> >>>>> it seems to pich all the right arch, etc.
> >>>>>=20
> >>>>> I had asked on Angstrom for any CM-T35 related info to no avail...
> >>>>=20
> >>>> This error is on by default for the compiler for OE now. You can get
> >>>> around it by
> >>>>=20
> >>>> 1) Fixing the (potential) errors in the source code
> >>>> 2) Turning off the error in the build (EXTRA_CFLAGS =3D
> >>>> "-Wno-error=3Dunused-but-set-variable" or something similiar)
> >>>>=20
> >>>> -M
> >>>>=20
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> >>>>=20
> >>>=20
> >>>=20
> >>>=20
> >>> --=20
> >>> Dave Thomas
> >>> MicroBee Systems, Inc
> >>> 1429 Weatherly Road, Suite G
> >>> Huntsville, AL 35803-1187
> >>> 256-489-6671 (Voice)
> >>> 256-426-2431 (Mobile)
> >>> 256-489-6673 (FAX)
> >>> www.microbee-systems.com
> >>> "Innovative Solutions for an Embedded World"
> >>>=20
> >>> This message is intended for the sole use of the addressee, and may
> >>> contain information that is privileged, confidential and exempt from
> >>> disclosure under applicable law. If you are not the addressee you are
> >>> hereby notified that you may not use, copy, disclose, or distribute to
> >>> anyone the message or any information contained in the message. If you
> >>> have received this message in error, please immediately advise the
> >>> sender by reply email and delete this message.
> >>>=20
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>=20
> >> --=20
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7CN8YACgkQN1Ujt2V2gBwnuQCgj2lbto4ogCwvvAaOHypxbnn5
oGUAn0HUTCBZnRp9J2BTtb/W9PlfDcmW
=nneG
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
