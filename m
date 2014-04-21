Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F81965D33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:33:25 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so3608979eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2v2kMsT09VVkX1A6XkGE4qAHMa5PvZeSee7h6G+IAk4=;
	b=Pzd9PitSskTOR0s5YYNJ6ZucMGQ/u/FLg+6o9yIQGoopmFIoIMS3MK95jVQa8Vb5I9
	b7JdTVVJz/0PIrhZX5MIMS6Wmk4Ip5/4kAuPPuF/T4U31PRDN/rxNhXc6ic8XYrWROoK
	UN6UgxKLaYhmsCc/Dy+x7E5VqcNFYEkFK+JjvsEUo6eLoOIoWMsIUIhljtQ9yqKMAN6v
	EkVXut+NjycPSgHZs4dqrgtsJ0UEMK6If5jgThDTzf6endUVdh1v9cc0KEZbBHo/vQgF
	H3lJkIipZi3yp/4YWSj1ZJRs12S2+tSuuDISbBuBpq6AsPSej2Zf05LR+oMCFEGeDHZm
	pG8g==
X-Received: by 10.14.180.2 with SMTP id i2mr47288537eem.53.1398080005843;
	Mon, 21 Apr 2014 04:33:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm102829355eee.2.2014.04.21.04.33.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:33:25 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:33:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421113331.GZ2486@jama>
References: <cover.1397545082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1397545082.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 0/3] gd: update to version 2.1.0 and two fixes
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
X-List-Received-Date: Mon, 21 Apr 2014 11:33:27 -0000
X-Groupsio-MsgNum: 49392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oQzL12nKbmSHS3MD"
Content-Disposition: inline

--oQzL12nKbmSHS3MD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2014 at 03:01:23PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Merged 2 from 3 and 1 mine, thanks

"add perl" one has some feedback

>=20
> --
> The following changes since commit 477ccd867cc71f8277f2670b7be34b3b153000=
52:
>=20
>   klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib jhuang0/t_gd_140415-1
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/t_gd_14=
0415-1
>=20
> Hongxu Jia (1):
>   gd: add perl to RDEPENDS
>=20
> Jackie Huang (1):
>   gd: update to version 2.1.0
>=20
> Robert Yang (1):
>   gd: fix the subdir-objects error
>=20
>  .../gd/gd-2.1.0/fix-the-subdir-objects-error.patch |   39 ++++++++++++++=
++++++
>  .../gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.bb}     |   25 ++++++++-----
>  2 files changed, 55 insertions(+), 9 deletions(-)
>  create mode 100644 meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-ob=
jects-error.patch
>  rename meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.=
bb} (40%)
>=20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oQzL12nKbmSHS3MD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVAgsACgkQN1Ujt2V2gBxDOgCfUBhX82Wi7q/0dJRT1gSOfKMf
K7QAnjp8kt0Hwyh41NLbI8Y83kfPQwLO
=lrxt
-----END PGP SIGNATURE-----

--oQzL12nKbmSHS3MD--
