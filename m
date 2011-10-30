Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKVw5-00056E-Ce
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 15:00:29 +0100
Received: by faas16 with SMTP id s16so5407694faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gOVci5o4dFZLzCZXgIeb2u/4jMwPJTRwimFE24ScGig=;
	b=gK026qxdbXZkiQIv1Px8liZJpJD/BAzXQMeUK9z25g4Ycdoe83PHDppBvIxbJ3ZUSf
	ngPO4cnfEpwrVoJhozusMEDkbYcZvFzaOPcJNXZBiygcxevgK/KRYXQN46MNe5yCSmK/
	4gKTnp44fKhzdPmQKGep5Eot1QM052WZnpRsM=
Received: by 10.223.91.73 with SMTP id l9mr17450207fam.22.1319982865551;
	Sun, 30 Oct 2011 06:54:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm31529556fae.16.2011.10.30.06.54.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Oct 2011 06:54:24 -0700 (PDT)
Date: Sun, 30 Oct 2011 14:54:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111030135417.GD5065@jama.jama.net>
References: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
	<20111030103021.GA3822@rhein.zuhause.netz>
	<1240131A-F61F-49B7-9645-F34056E3ED88@microbee-systems.com>
	<CA+eR4cGOJUzp+JdZAzsiZBH=J_MSVy8+Mg48pFEiXcMSq39sQA@mail.gmail.com>
	<AA655079-FC52-4BF8-92A3-A95881DC1AD0@microbee-systems.com>
MIME-Version: 1.0
In-Reply-To: <AA655079-FC52-4BF8-92A3-A95881DC1AD0@microbee-systems.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Help?
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
X-List-Received-Date: Sun, 30 Oct 2011 14:00:29 -0000
X-Groupsio-MsgNum: 35096
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline

--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2011 at 08:00:28AM -0500, David Thomas wrote:
> I had a feeling it was a process issue. It is happening on bb.fire.event =
and so I was thinking it has something to do with that event wanting to do =
something unallowed.

I do not remember the exact error, but I would check the permissions on
/dev/shm or /run/shm (depends on your distribution).

Regards,

>=20
>=20
>=20
>=20
> On Oct 30, 2011, at 7:53 AM, Martin Panter wrote:
>=20
> >>> On Sat, Oct 29, 2011 at 04:50:58PM -0500, David Thomas wrote:
> >>>> File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
> >>>> parseConfigurationFiles
> >>>>   bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
> >>>> IOError: [Errno 1] Operation not permitted
> >=20
> > =E2=80=9COperation not permitted=E2=80=9D is EPERM, which is different =
=66rom EACCESS
> > =E2=80=9CPermission denied=E2=80=9D. Normally you get the permission de=
nied issue for
> > file permission issues, and =E2=80=9Cnot permitted=E2=80=9D for trying =
to do something
> > like killing a root process as a normal user.
> >=20
> > Have you tried using strace on bitbake? See if you can find if there's
> > an actual system call returning EPERM just before Python raises the
> > IOError exception.
> >=20
> > -Marty
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6tVwkACgkQN1Ujt2V2gBwmKwCfTYYNCeFFrvmU6AS+HrjBPkAX
BboAn3HRhcmg6sGOtzj+MT3rSuQHUuLu
=ZRM4
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
