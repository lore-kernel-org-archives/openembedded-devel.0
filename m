Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7EU-0005Lz-38
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:50:30 +0200
Received: by wibhm11 with SMTP id hm11so318668wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jSkQ8TfheDOGIVJztOfZm/Ugr1qglElqoCbt/mXsbNA=;
	b=Yxg0Fvy7NPbmWzjrllkfh/W4Mhr+LgyxdW4d31dfUH2Ez0dNL4dBMJsOK+FmWPLfVl
	kWoQGGfE3BanWvFuVOS7ew1Bdj9MzaWienGaH0d+HLAZ4mfGiQlnEdfyJ/BORMWWQ4gi
	MeBLeWhDygX3t3/SVuejlqGuVFZ6mvEjtBno5IPWIJ+EuKdlSyTSjjTnc/61CWq2+YgM
	dfFoRydNolL18XU97bjwC+L6nN87gCwmW8VRM/RfT2Q8T1CPH+izWZ7WMUF8HZGOmwcW
	V3y8NwSyli+5rLOMlpxPIhsaqaGA0Lo5g1RfqDKcwHW00evhdLVNN37sQKbYjh2LTFU9
	WhKg==
Received: by 10.180.103.136 with SMTP id fw8mr3956996wib.20.1342528750956;
	Tue, 17 Jul 2012 05:39:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm39759323wib.8.2012.07.17.05.39.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:39:10 -0700 (PDT)
Date: Tue, 17 Jul 2012 14:39:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120717123919.GA22569@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<20120716175038.GL3729@jama.jama.net>
	<CAMKF1srccbhEC5JztcmzpOGeosO5TSbi=EoBTqFLf2vyUnnk4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srccbhEC5JztcmzpOGeosO5TSbi=EoBTqFLf2vyUnnk4w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][PATCH 1/3] kernel.bbclass: Rename to machine_kernel_pr.bbclass which provides added functionality
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
X-List-Received-Date: Tue, 17 Jul 2012 12:50:30 -0000
X-Groupsio-MsgNum: 39723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 10:55:44AM -0700, Khem Raj wrote:
> On Mon, Jul 16, 2012 at 10:50 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >
> > There is also this change
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/02160=
8.html
> > which never made it to oe-core version..
>=20
> I missed that part. That would need an enhancement in OE-Core to
> provide a variable to override uImage if a machine asks for.

I've sent kernel.bbclass patches from oe-core to update meta-oe copy, so
that the diff will be smaller again.. then we can try to replace it with
machine_kernel_pr.bbclass..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAFXPcACgkQN1Ujt2V2gBwunwCfXL4HyKFplLBkmOkpSFCzGWl+
sGUAoJ2AHRPJW5cyKdes7EHIuzuYsje7
=RkZ4
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
