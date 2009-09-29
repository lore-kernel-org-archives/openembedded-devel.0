Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1MsVwp-0003nl-1z
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 08:12:30 +0200
Received: by ey-out-1920.google.com with SMTP id 5so913902eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=E+Q67BSUJWgEcnYccqBd7xcY0AsaxhrEpPGO0aYaEPE=;
	b=rV4E5NL7lcmDOGx1QwQqsd16pwaVJN7G6g5HYBrQ69oEt0POvHLhF2HDJbErw+jZCu
	j1lSHzj9FrgalWq3Pw140UZ81f4PWOW19+6quGSYNOXktTP/C4pzk/jfo7TQmrlc+S5p
	cX2pFTv1qIAkfxOatmNfy2dPuepoRzsURhVus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=SLFkVzwf6hB6e3P7r25SRAQj9a6Zc4666LzNPXod5J+1l3xlnYtoLSdqGX2rYfl5ks
	Qvaw/zjP2T4DM9GEApBOGzCjwzknDMUOwJ8mwzMndqIET6VLUkdiiLpGYYvPGmP3xVT9
	8U9n1VDvNC2msQDEJUma+M5XaYZ1l3D3oW+nE=
Received: by 10.210.7.17 with SMTP id 17mr4593327ebg.50.1254204705770;
	Mon, 28 Sep 2009 23:11:45 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([195.222.64.17])
	by mx.google.com with ESMTPS id 24sm1134038eyx.14.2009.09.28.23.11.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 28 Sep 2009 23:11:44 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 09:11:15 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
References: <200909281752.11487.anarsoul@gmail.com>
	<20090929030152.GA7383@denix.org>
In-Reply-To: <20090929030152.GA7383@denix.org>
MIME-Version: 1.0
Message-Id: <200909290911.19203.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: udev problems on angstrom-2008.1
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
X-List-Received-Date: Tue, 29 Sep 2009 06:12:30 -0000
X-Groupsio-MsgNum: 13254
Content-Type: multipart/signed; boundary="nextPart6436828.e98jJE29Xt";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart6436828.e98jJE29Xt
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
29 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2009 06:01:52 =D0=B0=D0=
=B2=D1=82=D0=BE=D1=80 Denys Dmytriyenko =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=BB:

> Been there, done that.
> Short answer - you have too many requested devnodes for udev to handle
>  within 32MB of RAM. If you absolutely need all the devices enabled in the
>  kernel (try disabling/reducing LEGACY_PTY), consider replacing udev with
>  mdev (or static devnodes). Or try moving udev's database from tmpfs into
>  another partition, maybe on flash.
>=20
> Long answer - udev besides creating the actual devnodes also keeps its
> database in the same tmpfs filesystem. It consists of an internal directo=
ry
> structure with symlinks (a la sysfs) and is stored in /dev/.udev
> Keeping all that in tmpfs is not efficient, as it wastes inodes and
>  apparently inodes in tmpfs/ramfs are the size of a memory page (4KB). By
>  default tmpfs is limited to half the RAM, which in your case is 16MB. Th=
at
>  would allow roughly 4000 inodes. You definitely need more, because of the
>  above messages. Even if you fit all of them, using half of your available
>  RAM just for udev is a total waste. So, consider suggestions above.

Oh, older versions of udev used to work here... I didn't expect it to take =
so=20
much RAM :)

Anyway, thanks for help.

Regards
Vasily=20

--nextPart6436828.e98jJE29Xt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrBpQcACgkQRM6pQpltKE4azACdHEXe1b63qP9NcSTMOZAvZehO
gDYAn1KIf5iI5hugFiRFhGqUE7mB6XFJ
=pbYJ
-----END PGP SIGNATURE-----

--nextPart6436828.e98jJE29Xt--
