Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RtLUG-0003Nj-8W; Fri, 03 Feb 2012 16:55:44 +0100
Received: by eaal10 with SMTP id l10so771485eaa.6
	for <multiple recipients>; Fri, 03 Feb 2012 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mEnpr4VQozeZmFtx3twLD1p4Kg7DE2248tHdnvtG4MM=;
	b=ZoFUPmbex9nehk2vwhfGqZZd13AEyy66mRih/mrglBFZ9+fSWnBjhwnU1FohgDvinR
	WwC0vr6PAf29Yt2/aIAfpYdQ+/aOadC7gQVJj0XnbQ+Xlhu4nythRh9/R5GTg2iXcUH6
	fDpWtxoSj147Xbk6dTLPsvsC1nINUQOHfli2c=
Received: by 10.213.13.80 with SMTP id b16mr1821006eba.146.1328284066565;
	Fri, 03 Feb 2012 07:47:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm23192149eei.1.2012.02.03.07.47.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 07:47:44 -0800 (PST)
Date: Fri, 3 Feb 2012 16:47:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120203154742.GM3893@jama.jama.net>
References: <20120201080441.DA76610333@opal>
	<20120203131451.GJ3893@jama.jama.net>
	<CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqdXtrAqUY=1XHE4QDpRPyNbOV5ZswKihCWbSWU9+L05w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Fri, 03 Feb 2012 15:55:44 -0000
X-Groupsio-MsgNum: 36869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5fECsWged6836Ycf"
Content-Disposition: inline

--5fECsWged6836Ycf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2012 at 01:30:37PM -0200, Otavio Salvador wrote:
> On Fri, Feb 3, 2012 at 11:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Can we move this only to packages which are really depending on systemd
> > compiled?
> >
> > I have use-case where
> > small cpio image has busybox
> > busybox depends on systemd just because of this
> > systemd depends on kernel (because RRECOMMENDS on modules)
> > kernel depends on that cpio image which is used as ramdisk
> >
> > So in order to finish cpio.do_rootfs I have to finish kernel and kernel
> > fails to build because doesn't have cpio available yet (DEPENDS =3D "cp=
io"
> > is not enough because doesn't need do_rootfs to finish AFAIK).
> >
>=20
> I understand your use case but it seems in this case you ought to override
> it in a bbappend. It doesn't seems right as this is the exception, not the
> rule. If we don't depends on it, we can end with the binaries being not
> available in case a rootfs generation.

Which recipes really depend on systemd during build? I know about
polkit, something else?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5fECsWged6836Ycf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8sAZ4ACgkQN1Ujt2V2gBx8RQCfR8/nzYeNZsbJkQT+XlKOQlZW
w28AnRZPhzHbOCRsIfmW5dYNC9RPXxFR
=84Vh
-----END PGP SIGNATURE-----

--5fECsWged6836Ycf--
