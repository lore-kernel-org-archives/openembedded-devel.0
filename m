Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKaZA-0001X6-VI
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 20:24:52 +0200
Received: by fxm19 with SMTP id 19so1429008fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 11:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ifywqvw/X7MwfwFNtTrfaRn1+s0h+2ftGRx5hiWv/PI=;
	b=CHLK48yDoLE/XK5f8NgNn2mMqltQpQHWPXRQeDnjvGnT9XfpMTfwnaYJjpG0iTOVgS
	GD0A4K0+FquDqEopxD77iSnY3F2CMaAJbGMOvxRM+qT29d1GqCvvLQxKZrCixrSogYYm
	XyUEDVvazIYTn5wMUnD5RBfDzhcDcT+R0/jxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fnsXtfHvB9eOlSbDulgDZHJNB1GA2vUnQ131tymZtKW8UNLDwGCOjLvH08q5B2pgEi
	Bv6JzWUVZgBH6XQB3Em02SOx6WFLhmbEWHQs4XVO8n40GuULN4rKTaVcKucgePJHDKqw
	nwq8GyXt4Xa4TDXPjEoykO4ifs1sPC6BvJ3P8=
Received: by 10.223.44.86 with SMTP id z22mr662899fae.3.1305224521865;
	Thu, 12 May 2011 11:22:01 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j12sm567033fax.33.2011.05.12.11.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 11:22:00 -0700 (PDT)
Date: Thu, 12 May 2011 20:21:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110512182158.GA3162@jama.jama.net>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305019695.8000.132.camel@phil-desktop>
	<20110510093616.GB3673@jama.jama.net>
	<20110512163919.GD21678@denix.org>
MIME-Version: 1.0
In-Reply-To: <20110512163919.GD21678@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Thu, 12 May 2011 18:24:53 -0000
X-Groupsio-MsgNum: 31946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 12:39:19PM -0400, Denys Dmytriyenko wrote:
> On Tue, May 10, 2011 at 11:36:16AM +0200, Martin Jansa wrote:
> > On Tue, May 10, 2011 at 10:28:15AM +0100, Phil Blundell wrote:
> > > On Tue, 2011-05-10 at 09:39 +0200, Martin Jansa wrote:
> > > >   | /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/=
temp/run.SRC_DISTRIBUTECOMMAND.17340: line 95: /pixman: No such file or dir=
ectory
> > >=20
> > > If '&' in ${LICENSE} is breaking SRC_DISTRIBUTECOMMAND then that
> > > suggests there is a bug in that code (probably some sort of missing
> > > quotes).  Removing the &s might be a fine thing to do anyway, but it
> > > would also be a good idea to track down and fix the underlying bug.
> >=20
> > it calls cd tmp/deploy/sources/$license/pixman
> > where with $license =3D=3D '&' (because LICENSE field is splitted by ' =
' and
> > then '|'), it ends doing cd on background and then complaing about /pix=
man
> >=20
> > Directory named & even when created with right backslash
> > is still hard to use, so I think it would be better to have QA check=20
> > that LICENSE field has sane value, even better when we have list of
> > possible values etc.
>=20
> I would agree with Phil that fixing distribute_sources is required, but I=
'd go=20
> even further as to say that the current implementation of distribute_sour=
ces=20
> is quite bad. It splits the LICENSE field into tokens based on the wrong=
=20
> assumptions that all the whitespaces are used to separate multiple licens=
es.=20
> In other words, "Public Domain" is a valid license and shouldn't be repla=
ced=20
> with "PD". What are you going to do with "GPLv2+ w/ GCC RLE"? Which stand=
s for=20
> "GPL version 2 (or later) with GCC Runtime Library Exception" and is a va=
lid=20

> license with an exception... Sorry, but "GPL+libraryexception" is just bo=
gus=20
> (and it's not a personal remark - I do understand your constrains, see be=
low).

Agreed, but do you find
LICENSE =3D "GPL + library exception"
better?

> I understand that distribute_sources is quite important and useful. So, m=
aybe=20
> the correct way is to adopt a proper and stricter syntax for the LICENSE=
=20
> field, which uses some other characters to separate multiple licenses. Sa=
y,=20
> something like ":" or "|" should work. Using "," would be even better, bu=
t I'm=20

'|' is alredy used for split in distribute_sources, but I'm not sure if
my interpretation that it means logical OR in LICENSE context is right
(and space as logical AND).

> afraid it can easily be used inside the license name on its own... Basica=
lly,=20
> something along the lines of "GPL:MIT:Public Domain:Texas A&M Proprietary=
" etc.
>=20
> Any comments or objections?

oe-core does more with LICENSEs (like LIC_FILES_CHKSUMs and keeping
common licenses in
/OE/shr-core/openembedded-core/meta/files/common-licenses which could be
used for QA check on LICENSE field) so I think it should be discussed on
oe-core ML first and then use the same syntax in oe.dev or just switch
to oe-core..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3MJUYACgkQN1Ujt2V2gByAlQCfTSgnHx3svge0vxrkaSjD5HDq
0RkAn0KEdZDQ3Yo4lq/EGNWYAcTjuLLq
=SrH8
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
