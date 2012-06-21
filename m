Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shm0i-0005gM-S8
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:21:40 +0200
Received: by werg55 with SMTP id g55so593682wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T880RjCCR+zVx8QRHEN+4no0QUbXTtGZTAPSiayjCck=;
	b=eoR0CM+1lBw+ap0v0+pniWkNhtG9gJSYkHsBhRtfm5U5/psDjQ1vAPvOXSPfN3BRtV
	i8uA6YuxEcEywd5XEEF0h1qpiCxriPbYFXcf49czNVCro74rFSTvYmz1E4qe8U5dRtc1
	1Oql6j+gvEKx6q8yvUdGlo8eDPFbfPtK2Be4gZVrVTic4bxaMI4PfhWxcHnB8Bvoz34K
	6TTsT6G8+Ix43Q4CzhzJEoDni1Qf/yMzzojTdaiL+cBjOIKz91PdlUZoI+WldcNj5MpM
	FdRkLsQGh8mwTMqzM6ZqmB3kEcaaRoy4lThKWZyHv1FlWWvNEE2oNIuAyzfYfQGfyUky
	C8ig==
Received: by 10.180.79.166 with SMTP id k6mr22221364wix.8.1340302249017;
	Thu, 21 Jun 2012 11:10:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm91173968wid.5.2012.06.21.11.10.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 11:10:47 -0700 (PDT)
Date: Thu, 21 Jun 2012 20:10:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120621181047.GF9352@jama.jama.net>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
	<1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
	<jrvngo$vv$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jrvngo$vv$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 18:21:40 -0000
X-Groupsio-MsgNum: 39329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 08:00:56PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 21-06-12 09:35, Martin Jansa schreef:
> > From: Andreas M=FCller <schnitzeltony@googlemail.com>
> >=20
> > contents of ${sysconfdir}/default/xserver-nodm were moved from=20
> > FILES_${PN}-systemd to FILES_${PN}
> >=20
> >=20
> > ---
> >=20
> > v2: xserver-nodm.conf was moved to meta-systemd and kept in ${PN}-syste=
md
> > where it belongs
> >=20
> >=20
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Will git pick these SOBs up below the comment mark?

Ah sorry, it doesn't (at least from pw).

Andreas said off list that he plans to send v2 of whole patchset (there
will be small change from gpsd too). Andreas: do you want me to send v3
or will you fix SOBs yourself?

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iQIcBAEBAgAGBQJP42FYAAoJEHZqAkdh1vT6PksQAIPwAaXH8m3161uikHBUkAvv
> E+mNYZtvbSW+7j3Yr3LYJIC/AGgM+i1DcA64Ng5U8bVNdyH0vAKihMe8SGZqMO2K
> +mSflKSznvF7PwHJVwzsgGMhfqd95hCS8oyO/U91FeQnIBsAfivv1VBMbc0dgaic
> ZjFD9+7M2FSnIWwrAKellIG3fZQAuk6VmNB7wgvxE5e11R6tYYYvZ1lywB34cHLY
> 5vr7rzwBeIu+hrBF56o0qD+7JYtDY/oa3NA3IAvRz4g88CPotQSDtOhvobhmzthd
> otKJAmSbx31pBM3/+IncO19M7bxjk1AxPBgFVa+ZFFLtK8ZLfgYggBJ8zbrzhrW7
> 7pIh26hztbjTs9Ey3tDzF3rNWQcv+AxRFJ33FvEvWIy+n6M+olfTHeRD2yl9Oru5
> yYuudeB+m+gvJE0r9PvKKsHBvgEoqjrW2d57VpTposnGkYFsgwIoSUMPFr7cMQJD
> zinb+mbfakZVnWgvHDxp9rotMslDtmg6kmJG54Y6oYEkQuMoTZaefOZsEUSO7CDJ
> 4ADRBP3a3jn/cTvSwNSM5F35D8K7JljjOtsjjG9FYm3j3b1c6c2T2DYDPKhfvj+e
> yCPr5OXO6FbVRLWFmEh3MhxQZRqnu+ueoiFXW0LRPVRdTCyueTr16mWnE9etKFty
> WdHLCUCK34fXL9/J0ndj
> =3DjZhK
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/jY6cACgkQN1Ujt2V2gBxEZQCbBs8ujXPN0zlwASxCNXg6Eczh
MQsAoKUSFK5b7YjUF0W580FtUB9MGVxC
=I20c
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
