Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9B765D67
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:09:08 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so2845933eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/3ldSxcaYRFR3oorqo1OPBOPhyKPzDo1dFMfEYKmFHg=;
	b=GUebKrOPASyJ0CGsYPGPJWOUkUraoImxNkyTEnig4gpRZX8FBh3bZkiiJ5YEMfWPwW
	cAm4CQoe7vkksLdOB8fLqqbKfbor20k4+YLSeOFOusBud5q3zVUoyo6fYfAef30xil8A
	XpDi3j4yQ3VCmqUvsd5ws4Chf7ZN+06ZZS8TqmP29qIH7SRwS5IIhnZwTmszbMUIzcxt
	fmNu4ZQb6WoWX8x2k1hgkFjqylYM25TbNZrL2z4cv8cfHkvUgLdYxbK2DTCkiPUdWeo5
	Geri/a8FnESjvY3VupIbMuC/mmBiDWVRQNyYUP18CelHIemovL0Fwx1Q3EbqemtXi5va
	fBZg==
X-Received: by 10.14.88.199 with SMTP id a47mr37147345eef.6.1397984949201;
	Sun, 20 Apr 2014 02:09:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm92874253eel.16.2014.04.20.02.09.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:09:08 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:09:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420090913.GS2486@jama>
References: <cover.1396947706.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1396947706.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 0/3] collectd: three fixes
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
X-List-Received-Date: Sun, 20 Apr 2014 09:09:09 -0000
X-Groupsio-MsgNum: 49300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctZH5Gqgrl5HoVnD"
Content-Disposition: inline

--ctZH5Gqgrl5HoVnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 05:07:47PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> v2 comment:
> "collectd: explicitly enable/disable libsensors support":
> changed the config option to be a PACKAGECONFIG option

I'm going to merge all 3, but can you add load.so, disk.so,
threshold.so to PRIVATE_LIBS to hide following warnings?

log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was
registered as shlib provider for load.so, changing it to collectd-5.2.2
because it was built later
log.world.20140418_190059.log/bitbake.log:WARNING:
libgphoto2-camlibs-2.4.11 was registered as shlib provider for disk.so,
changing it to collectd-5.2.2 because it was built later
log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was
registered as shlib provider for threshold.so, changing it to
collectd-5.2.2 because it was built later

>=20
> ---
> The following changes since commit bc969d3705c45928de8525ef3d2d9d28673118=
64:
>=20
>   inetutils: add -dbg packages for tftpd, telnetd and rshd (2014-04-02 11=
:18:54 -0400)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib jhuang0/r_collectd_1
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/r_colle=
ctd_1
>=20
> Ming Liu (1):
>   collectd: explicitly enable/disable libsensors support
>=20
> Wenzong Fan (2):
>   collectd: enable/disable libpq explicitly
>   collectd: fix init status
>=20
>  .../collectd/collectd/collectd.init                |   13 ++++++++++++-
>  .../recipes-extended/collectd/collectd_5.2.2.bb    |    6 ++++--
>  2 files changed, 16 insertions(+), 3 deletions(-)
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

--ctZH5Gqgrl5HoVnD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTjrkACgkQN1Ujt2V2gBxKzgCggTKaKRQlrrUD6O9mfx2qxIdj
y4IAn2FcPdmgJr29hCup7pFEB81qARRq
=UpyN
-----END PGP SIGNATURE-----

--ctZH5Gqgrl5HoVnD--
