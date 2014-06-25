Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA0060CF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:12:04 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h15so5333903igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=IN4NHtBEldePB9iSHw1nshfvroWs7pEGOi+syASHHVA=;
	b=knKikgjNRw6imCa8fP4eeGKw80TcayfHwwAcy+WquirCK6EKmdWUibRF+lSBTCDqsy
	whUDQ18lAUBepyyMED9JF02vjz851oLbNjXj+RMBbaPJzIIFMjt1kNh0kJT3g1HHoHUl
	vtdjFVEJKtzRzLCperkePJiTpCtK+5WuoxOTElNeuSxs5FVBOLZA0r10Htjktt7A5NnD
	pz2DYwH+4Kh/d40VYFJOTYuWhdfZOxkEV9K01RQJvSTTqm1bh+RrpyQm01GFPdmG23/b
	8RB5f4fy2u4ROBCEWZWPfH5CujmfXEGXcgT3MNRIaBuWHV7Nyhs6xR88P1qoUuMXZEgb
	ACRA==
X-Gm-Message-State: ALoCoQnbGxLHjqXHqrTNhPBt2T3EsKYeuE994/DHR8r//ydtIORU+yKwsuDxBEn37y1so82JYqzq
X-Received: by 10.42.120.80 with SMTP id e16mr3978566icr.55.1403655125480;
	Tue, 24 Jun 2014 17:12:05 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id h2sm1773392igy.22.2014.06.24.17.12.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 17:12:04 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 973D5168543; Tue, 24 Jun 2014 20:12:03 -0400 (EDT)
Date: Tue, 24 Jun 2014 20:12:03 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140625001201.GA31512@deserted.net>
References: <53AA0672.7070606@balister.org>
MIME-Version: 1.0
In-Reply-To: <53AA0672.7070606@balister.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 00:12:10 -0000
X-Groupsio-MsgNum: 50562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] State of the art for creating an image that you can dd to an SD card]=
 On 14.06.24 (Tue 16:14) Philip Balister wrote:

> What's the best available solution for creating an image you can dd to
> an SD card? It seems like this wheel has been invented several times and
> I am wondering if people are converging on one approach.

I don't know about that, but I always resort to the same methodology a
friend of mine used to call "stone axes and hammers" (that is, simple,
basic tools that are efficient if not elegant).

   dd if=3D/dev/zero of=3Drootfs.img bs=3D1M count=3D<however_many_meg_I_ne=
ed>
   mke2fs -j rootfs.img
   mount -o loop rootfs.img /mnt
   tar -C /mnt -[jJz]xf <path_to_image>
   umount /mnt

> Bonus points for resizing the linux partition.

Half marks for solving half the problem?  :-)

   dd if=3D/dev/zero >> rootfs.img
   e2fsck -f junk.img
   resize2fs rootfs.img

It would probably work to shrink it by doing something like resize2fs -M
then doing a dd with if=3Djunk.img of=3Dsmaller-junk.img, but I don't ever
recall needing to shrink and image where I didn't just go create a
smaller image and use something like pax or rsync to copy the data from
one to the other.

>=20
> How are people doing this today?
>=20
> Philip
--=20
-Joe MacDonald.
:wq

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEUEARECAAYFAlOqE7oACgkQwFvcllog0XzrqgCgtvWROMlQZQwT52e7CwAsCHjx
xDQAl1KZgQ+YXE9ZHnf9LRjBqQeD38Q=
=OOef
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
