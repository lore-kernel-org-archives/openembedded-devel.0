Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 75E156E944
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:42:44 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so4348010eei.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2014 07:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AoiMBuHp43rA0eySQl2uabC1HQexjCRUMyGW/fz6JG0=;
	b=daqnBKlFdCIEUM5zMX1jPZrHO7K5VCIs2NrkDzwZ8SYDq3CIrB3ABHMg4q8uV38ksZ
	cp/nYrONbzPk1QLYiiongBBwIQuLUpE3e4sXvvjTpKssBMDEFLBVnts1xCmZJLrUSLzX
	TPluO0c60tj4uSORGiDESE+NXlvTfy6FyhDLOsMAsWYKk+ZiE9j+PJHjZXS8vij5gd3e
	1pnDOzZllXnKxUcyT/l3fwQRKVt4lHIOGNg0a2pqYtBy2wXa2sTUe23wI7TQMbDtLNJi
	VhSsFxnDu/CYri6XozUlf9v7gPLhBaKEyU3YSkcscUteNXdvwZuf+5lo9TWZh57XYYGt
	TyZg==
X-Received: by 10.14.206.194 with SMTP id l42mr3307306eeo.107.1391528564370;
	Tue, 04 Feb 2014 07:42:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm90318245een.13.2014.02.04.07.42.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 07:42:43 -0800 (PST)
Date: Tue, 4 Feb 2014 16:42:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140204154255.GI3698@jama>
References: <1391240222-2020-1-git-send-email-Martin.Jansa@gmail.com>
	<lcqbu0$vme$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <lcqbu0$vme$1@ger.gmane.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-multimedia 1/2] vlc: fix build with kernel headers 3.9 and newer
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
X-List-Received-Date: Tue, 04 Feb 2014 15:42:46 -0000
X-Groupsio-MsgNum: 48043
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCKy2vjPBX+S/5dE"
Content-Disposition: inline

--FCKy2vjPBX+S/5dE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2014 at 10:33:20AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Martin Jansa schreef op 01-02-14 08:37:
> > * V4L2_CID_HCENTER and V4L2_CID_VCENTER removed from linux v3.9
>=20
> Any volunteers to update vlc to 1.1.13 (2 years old) or 2.1.2 (2 months o=
ld)?

I would like to see 2* (required by emotion-generic-players), but don't
have plans to work on it myself, because I have no use for that in
runtime.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FCKy2vjPBX+S/5dE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLxCn8ACgkQN1Ujt2V2gBxiIACdH7e1Bb5fIVHAdGC5pFfDBM9s
TLgAnieyTU+3etdKIaPxYIoJwsFVr52n
=3lDB
-----END PGP SIGNATURE-----

--FCKy2vjPBX+S/5dE--
