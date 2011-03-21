Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1baV-0007mV-PX
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 10:39:47 +0100
Received: by fxm19 with SMTP id 19so5248358fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 02:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6Zd7KXL/00zJZkONyveGTgEivZYFhdxmJE8y1gjCgaU=;
	b=C7y8jz0TB7p4O9LXN5Z2Occ6NWCnPgAgrJryVfyq5mhsscdLhqoTxIVpwBsz5kr/9o
	dNHoGnC+mBCqY+Jd3qtuTwUdVl/vmKUlZNxdow+5pWiGO1Itmmv4sJNjkt8+Kz35mjiu
	S9gBoil363DzO0qdZxtEYTxpBnCay2pqsiy/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=P4uXifrgNM9kJ6JPK9hOv4JXrRl81Kdzr/1EMPeZ/zWIZV3M9GasA0SzppCY8/04+w
	aVlQqSR2nyU7g4gbZapTEtgaHpHqA7JP1LObw0lx5t/+VV28kHwlQ+Aqq+iSryBlsNYe
	zSYRlsXfqTQTdKlmpFfaMPDaqCeA+Kf7QQuuo=
Received: by 10.223.1.73 with SMTP id 9mr4699020fae.44.1300699829001;
	Mon, 21 Mar 2011 02:30:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm2379327fam.4.2011.03.21.02.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 02:30:27 -0700 (PDT)
Date: Mon, 21 Mar 2011 10:30:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110321093020.GB3798@jama.jama.net>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103181408.16366.pgsellmann@portner-elektronik.at>
	<20110318153048.GC17785@jama.jama.net>
	<201103181837.04944.pgsellmann@portner-elektronik.at>
MIME-Version: 1.0
In-Reply-To: <201103181837.04944.pgsellmann@portner-elektronik.at>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 09:39:47 -0000
X-Groupsio-MsgNum: 30461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2011 at 06:37:04PM +0100, Peter Gsellmann wrote:
> Hi Martin!

Hi,
=20
> Am Freitag, 18. M=E4rz 2011, 16:30:48 schrieb Martin Jansa:
> > On Fri, Mar 18, 2011 at 02:08:15PM +0100, Peter Gsellmann wrote:
> > > Am Freitag, 18. M=E4rz 2011, 09:59:17 schrieb Hauser, Wolfgang (exter=
nal):
> > > > >> > Mark some files in ${sysconfdir} as configuration files so the=
y are
> > > > >> not blindly overwritten when upgrading
> > > > >>=20
> > > > >> I would suggest a pre-/post processing in the packages, like deb=
ian
> > > > >> does.
> > > > >> If a config file exists or is changed, the current File will be
> > > > rotated
> > > > >> or, if possible, left as it is and the new=20
> > > > >> file is installed beside the changed one.
> > > >=20
> > > > >The opkg does not touch a present config file, but installs the new
> > > > file with the name *-opkg
> > > > >So if you do a find /etc -name \*-opkg you see the conflicts.
> > > >=20
> > > > >Any sensible conversion from old to new config file should be made=
 by
> > > > the package itself.
> > > >=20
> > > > As I experienced, opkg exits with an error code if a config file al=
ready
> > > > exists, so if you want to create an image, the process will break at
> > > > that error.
> > > > It wasn't possible to create an image automatically then.
> > > If you create a fresh new image, the config files should not exist.
> > > opkg should not complain.
> >=20
> > Looks like you two are talking about 2 different things.
> >=20
> > W) If 2 different packages are installing same config file, opkg won't
> > overwrite it and image creation would also fail
> This should considered as bug in opkg;
> why 2 packages may not use the same Conffile?
> For example one would split 'ntp' into 'ntpd' and 'ntpdate':
>   both should use the servers in /etc/ntp.conf .
> In present configuration you have to syncronize 2 files /etc/ntp.conf
>   and /etc/ntp/step-tickers .

well maybe it makes sense for files from CONFFILES, but certainly you
don't want some other package to overwrite binary owned by other package
etc.. so I think that it's working the same for CONFFILES and such
"usefull" colisions are so seldom that nobody cared to create exception.

> > P) If same package is trying to install newer version of config file it
> > overwrites it silently when md5 sums are the same or file is not in
> > CONFFILES or creates config.file-opkg otherwise.
> This should considered as user error to 'install' a package instead of 'u=
pgrade'.

it's the same with upgrade, by "install newer version" I actually meant
"opkg upgrade", sorry I wasn't clear.

> > So the patch idea looks sane to me, only please check why there is
> > unused conffiles variable and maybe use it as default CONFFILES or
> > remove it completely.
> I think you talk about CONFFILES_${PN}_micro, CONFFILES_${PN}_nylon, CONF=
FILES_${PN}_slugos ?

No, about conffiles (lowercase)
<snip>
volatiles =3D "cache run log lock tmp"
conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
             ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue=
=2Enet \
             ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
             ${sysconfdir}/default"
</snip>

> For 'nylon' and 'slugos' it generates an additional empty file /etc/resol=
v.conf .
> Otherwise this file is not owned by any package even so it exists!
>   (anybody knows who creates it?)
> Could this be written as:
> CONFFILES_${PN}_nylon =3D ${CONFFILES_${PN}} + "${sysconfdir}/resolv.conf"
>   or is there a smarter syntax?
>=20
> OTOH, declaring 'base-files' as owner of /etc/resolv.conf for _all_ images
>   would be the better solution (in my opinion). Votings?
>=20
>=20
> For 'micro' the list is empty! What is the advantage of an empty list for=
 this image?
> I dont know and for this i am a bit reluctant to remove it.

IIRC someone in this thread said it's because micro is not using ONLINE_PAC=
KAGE_MANAGEMENT..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2HGqwACgkQN1Ujt2V2gBxxwwCfeYT1jXbybenWIDednqdAFlUy
jScAn1OjReDQIYEoUEcYWrpMB8fYTsH6
=oWbQ
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
