Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REiWR-0006JH-Gh
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 16:14:03 +0200
Received: by bkat8 with SMTP id t8so2023419bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y+YTwc2IF0C8XmQ8xjN0sldO9LJowDmcVA4bV4EKUCM=;
	b=BMCU/aXl3xvLq+bNRYw0/nvfyyuKLJeIgOf57VZ/wWntdcnEvYGoqnPutmA3oGVu0D
	oWd8e2DMxzg/Su9TeMZ+UPT/4h+0O2GU2vpt3IY/wHRYhsIvUbJ8DVAVkx8Aes0yw2Nm
	riP9e20Ll+jF5S+ES613MfMU35KQPpYvj437Q=
Received: by 10.204.135.72 with SMTP id m8mr6885832bkt.101.1318601298525;
	Fri, 14 Oct 2011 07:08:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id rc12sm8591394bkb.10.2011.10.14.07.08.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 07:08:17 -0700 (PDT)
Date: Fri, 14 Oct 2011 16:08:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111014140810.GJ3542@jama.jama.net>
References: <4E984064.3010306@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4E984064.3010306@dresearch-fe.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Dirk Nilius <nilius@dresearch-fe.de>
Subject: Re: postinst problem: module vs. update-rc.d
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
X-List-Received-Date: Fri, 14 Oct 2011 14:14:03 -0000
X-Groupsio-MsgNum: 34752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Content-Disposition: inline

--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 04:00:04PM +0200, Steffen Sledz wrote:
> We have a problem with a package that needs to install a kernel module an=
d an initscript.
>=20
> The recipe contains
>=20
>   inherit module update-rc.d
>=20
> The generated postinst script is
>=20
>   #!/bin/sh
>   if [ -n "$D" ]; then
>         exit 1
>   else
>         depmod -a 2.6.24.7
>         update-modules || true
>   fi
>   if test "x$D" !=3D "x"; then
>         OPT=3D"-r $D"
>   else
>         OPT=3D"-s"
>   fi
>   update-rc.d $OPT somescript start 90 S . stop 10 0 1 6 .
>=20
> The 'exit 1' leads to an error if $D contains a nonzero length string (wh=
at is the case in the OE image creation step at the build host) and suppres=
ses the execution of the second (update-rc.d) part.
>=20
> Because of this error the postinst is run a second time when the target d=
evice boots the first time ("opkg-cl configure" from /etc/rcS.d/S40configur=
e).
>=20
> The problem is that the update-rc.d execution (and therefor the creation =
of the new symlink into rcS.d) is done from within rcS itself. So the rcS.d=
/S90somescript will *not* be executed at this boot. :(
>=20
> We see two possible solutions.
>=20
> A) Don't use "inherit module update-rc.d" but write the pkg_postint ourse=
lfs.
>=20
> B) Create two packages (one for the module, one for the initscript) with =
a runtime dependency.
>=20
> I don't like both of them. Any other ideas? Is it possible to force the o=
rder of postinst fragments (update-rc.d code before module code)?
>=20
> Regards,
> Steffen

BTW: there is another problem with update-modules:

SHR root@gjama ~ $ opkg files syslog-ng | grep modules.conf
/etc/modules.conf
SHR root@gjama ~ $ update-modules
Error: the current /etc/modules.conf is not automatically generated.
Use "update-modules force" to force (re)generation.

so if someone is using syslog-ng, than kernel-module-* or any "inherit
module" package won't update ie autoloads properly..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YQkoACgkQN1Ujt2V2gByXvwCdGYxWqmeOibaEjEYPk3DV4LEa
azcAn2QBDdLP4oGjSgzj2r2V2/FXE3iu
=Cyld
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--
