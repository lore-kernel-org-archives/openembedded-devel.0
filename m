Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3D77A76AE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:22:36 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so241848304wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ALzlc7J4piFcJjkgc0v15TLf+zcE9GfhlI815LXIHiU=;
	b=UHV7isEH5fogcdvwMNoBsrjY7yw3zMIspYtPXd38yQN4WYTngguNrQqxYGEjikAP2E
	JmECdDK/1a7b27/hBTJOOS42PUahsBan5kYob+hM7NWuppPfBfbfj9g69sOvfy7jWwhG
	dKo7464puMZlrTY6Tas1xhM7W3g/oigUlwn1YQecEz6oxTD0uqEI2VaQGPCNrA5VeB2d
	zOXf0XeVIoM+cgt6oaU45oPqX46VKZ8AuR7lCFo2WDmSi1IXR0wm/dCyTY0Cr165wrk0
	22Tb+hnLEMJD6NAU8FQGY0GBtfiot5Eyme2X0rEScCIXRw2EGuDjk5d70wz8yyRwZtYT
	Ia5g==
X-Received: by 10.195.11.40 with SMTP id ef8mr5867875wjd.103.1444846956600;
	Wed, 14 Oct 2015 11:22:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bf8sm11530782wjc.22.2015.10.14.11.22.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 11:22:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 20:22:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151014182252.GE22448@jama>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<20151014183556.GB3552@dent.vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20151014183556.GB3552@dent.vctlabs.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Wed, 14 Oct 2015 18:22:37 -0000
X-Groupsio-MsgNum: 57817
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 11:35:56AM -0700, S. Lockwood-Childs wrote:
> http://patchwork.openembedded.org/patch/99875/
>=20
> Apparently this patch is still not in master, and I just ran across the
> problem with an externally built module (omaplfb from omap3-sgx-modules)=
=20
> in meta-ti layer.
>=20
> What's the plan for getting a correct Module.symver into shared_workdir=
=20
> for external modules to build against? Above patch, or does someone have
> an even better idea?

This needs to be discussed in openembedded-core ML

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYenXsACgkQN1Ujt2V2gBy5pgCfaGpPF85ymN7tVxpVo6QTUUzL
QzIAni65e2F3K7bn/O74t7lFe7woMesM
=RD5g
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
