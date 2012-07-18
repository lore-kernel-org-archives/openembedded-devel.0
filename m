Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrSZ3-0001gy-Uq
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 13:37:09 +0200
Received: by weyr6 with SMTP id r6so860451wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SHE2juhgRbIcnTYwyhmS3KT3xTowztD800fVNyVNCa4=;
	b=K87cYtLd9o37YdfSkgNDstu+n0y4CMUkX6Rc2pClq00/IxUwvFxUsjFgs1xs0Thnwe
	mFUW0JHNM7ZQsdTvmyM7Pj1GDrfeHNPan7Wj1Chr1Hm04xFOlNfKguEM2d1o8u09ttbL
	xsy6vzNaNZOq1enrVhv5wIuZ7Irm/euSwTXX/VtbOk/2Euu/Zm3G94sxnzNQn3au/ynK
	wVyXTLdkhoj24LwPsmnMoodjeqj+/7c9E9wpfKU16Hv8PGVdOvF8q7Od1Be9GD0aNnEh
	2KLeho9bVX/YAp3RSm1PqKoplHL/xTd0QHeT/vKibytc78IjXuWZHg2jRC70xIdQ0F9j
	Injg==
Received: by 10.216.116.70 with SMTP id f48mr301748weh.162.1342610749467;
	Wed, 18 Jul 2012 04:25:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm32096999wiz.0.2012.07.18.04.25.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 04:25:48 -0700 (PDT)
Date: Wed, 18 Jul 2012 13:25:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120718112559.GK22569@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
	<20120716174642.GK3729@jama.jama.net>
	<CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
	<20120716175819.GM3729@jama.jama.net>
	<CAMKF1sqmBCMU4WgjzVWfukUpxV4enTs_7=bSw+kFhUWUEQ+HeQ@mail.gmail.com>
	<20120716180430.GN3729@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120716180430.GN3729@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Wed, 18 Jul 2012 11:37:10 -0000
X-Groupsio-MsgNum: 39740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kkRamCq5m5VQq0L6"
Content-Disposition: inline

--kkRamCq5m5VQq0L6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 08:04:30PM +0200, Martin Jansa wrote:
> On Mon, Jul 16, 2012 at 11:00:37AM -0700, Khem Raj wrote:
> > On Mon, Jul 16, 2012 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > >
> > > Yes, but that would require distro config to be updated from
> > > ANGSTROM_BLACKLIST_PN to PNBLACKLIST[pn] at the same time this class =
is
> > > moved or duplicate all blacklist entries now and then remove
> > > ANGSTROM_BLACKLIST_PN after it's moved..
> >=20
> > synchronisation can be worked out if you are willing.
>=20
> Yes, it can and I'm willing to do it.. that's why haven't responded just
> with NACK :).

meta-shr layer was updated yesterday to cope with both blacklist
implemntations..=20

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kkRamCq5m5VQq0L6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGnUcACgkQN1Ujt2V2gBxDEQCcCnRJzES6/B11/OFRDW1Gn/tx
UTcAn2O/B34ThFTdouA2CyzCd0iXLBYV
=y4Gt
-----END PGP SIGNATURE-----

--kkRamCq5m5VQq0L6--
