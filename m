Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0bfI-0001QV-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 16:32:36 +0100
Received: by bwz10 with SMTP id 10so3234547bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zlOw2IBLB5dt4mYwiWXfFGF/IokTpI7smNS9GqmZajE=;
	b=NKwv+CBQxRBOfZOj4dCAMUUahx11GDODeVaXE5qga6nFkPbUR+Mcmjv6jjUZ59jdvn
	Y9QxpNGQ4ClM/gA6FziinDOvmKcesaMlvl5zw5E1xxppCla6y3Qafy/mcdMcXbD5zHzX
	/HtvK21JlVrPO/TGMot1WZMUERoH+gmc6KdiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vO9dwBc3uzXjrbAzuy82oZPLqgXz6t4OGh9Qi4/hLKBOLrY+kEKYhCE0KsbUjHCClZ
	W/Tyz2HIWXULBMSCw9g8We+3nQYF49k4wNrmbCgrKQrzczTwDcwfFZVQDOQneFoWxoSN
	7+R29pMNMgqrXtQYuyF4zu5wfxmMHsWNbNqEY=
Received: by 10.204.141.12 with SMTP id k12mr1098897bku.44.1300462250743;
	Fri, 18 Mar 2011 08:30:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm2225655bkf.20.2011.03.18.08.30.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 08:30:49 -0700 (PDT)
Date: Fri, 18 Mar 2011 16:30:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110318153048.GC17785@jama.jama.net>
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103171654.31619.pgsellmann@portner-elektronik.at>
	<0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
	<201103181408.16366.pgsellmann@portner-elektronik.at>
MIME-Version: 1.0
In-Reply-To: <201103181408.16366.pgsellmann@portner-elektronik.at>
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
X-List-Received-Date: Fri, 18 Mar 2011 15:32:36 -0000
X-Groupsio-MsgNum: 30416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2011 at 02:08:15PM +0100, Peter Gsellmann wrote:
> Am Freitag, 18. M=E4rz 2011, 09:59:17 schrieb Hauser, Wolfgang (external):
> > >> > Mark some files in ${sysconfdir} as configuration files so they are
> > >> not blindly overwritten when upgrading
> > >>=20
> > >> I would suggest a pre-/post processing in the packages, like debian
> > >> does.
> > >> If a config file exists or is changed, the current File will be
> > rotated
> > >> or, if possible, left as it is and the new=20
> > >> file is installed beside the changed one.
> >=20
> > >The opkg does not touch a present config file, but installs the new
> > file with the name *-opkg
> > >So if you do a find /etc -name \*-opkg you see the conflicts.
> >=20
> > >Any sensible conversion from old to new config file should be made by
> > the package itself.
> >=20
> > As I experienced, opkg exits with an error code if a config file already
> > exists, so if you want to create an image, the process will break at
> > that error.
> > It wasn't possible to create an image automatically then.
> If you create a fresh new image, the config files should not exist.
> opkg should not complain.

Looks like you two are talking about 2 different things.

W) If 2 different packages are installing same config file, opkg won't
overwrite it and image creation would also fail

P) If same package is trying to install newer version of config file it
overwrites it silently when md5 sums are the same or file is not in
CONFFILES or creates config.file-opkg otherwise.

So the patch idea looks sane to me, only please check why there is
unused conffiles variable and maybe use it as default CONFFILES or
remove it completely.

Regards,
=20
> Problem arises if you do a 'opkg upgrade' from the running target;
> With patch, opkg knows about Conffiles of base-files:
> root@us-3:~# opkg info base-files
> Package: base-files
> Version: 3.0.14-r101.9
> Provides:
> Status: install user installed
> Section: base
> Architecture: pcontrol_g20
> Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
> MD5Sum: d5553232d20233866c7f626b7f1d6d4f
> Size: 4336
> Filename: base-files_3.0.14-r101.9_pcontrol_g20.ipk
> Conffiles:
>  /etc/fstab 8a0d747a1565dfb39ae3b27b33ab5031
>  /etc/hostname 0e97f4187e8f27c48206165806f9310a
>  /etc/motd d41d8cd98f00b204e9800998ecf8427e
>  /etc/profile 573d43f3c53d5bdabca7ec2317f5eb28
>  /etc/nsswitch.conf 109e33e2c91d1853b5bc56078a96aa18
>  /etc/host.conf a61b9f6548d337c1cc1e5a4de39f7b7f
> Source: file://nsswitch.conf file://motd file://inputrc file://host.conf =
file://profile file://profile.d file://fstab file://filesystems file://issu=
e.net file://issue file://usbd file://share/dot.bashrc file://share/dot.pro=
file file://licenses/BSD file://licenses/GPL-2 file://licenses/GPL-3 file:/=
/licenses/LGPL-2 file://licenses/LGPL-2.1 file://licenses/LGPL-3 file://lic=
enses/GFDL-1.2 file://licenses/Artistic
> Description: Miscellaneous files for the base system.
> Installed-Time: 1300270958
>=20
>=20
> As you can see, opkg maintains some md5-hash value for the unchanged Conf=
file so a sensible conflict resolution is possible.
> If it is not done so, its a opkg bug
>=20
> Tested: it is possible to create an image with this patch.
> Tested: 'opkg upgrade' handles the Conffiles as expected.
>=20
> Peter
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2DeqcACgkQN1Ujt2V2gBzbEQCghsLUNsuJx8TRW3La0ZAK9eeQ
uvwAnRsB/GEGPRjBPJxxPg2OyGiOWJ7l
=jnSu
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
