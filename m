Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q83PO-0002aS-1Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 06:34:58 +0200
Received: by bwz5 with SMTP id 5so2669828bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 21:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=05qBxgpRgNfsj5F0MtzlCu55KTvdTyTQULKQ8FqXg7s=;
	b=lrg6opvv/LvDVc8Lgq9H8MPZU2DvyseU7R3aBr/ACXvjQ2zH8u84kEF1SWfMBGOBsZ
	yGgaysqi1R779MkXrzXa0d7FTG9VHtizabCD1ZXzburbEbGYGFnQ2r+jCVODDDeBxEiw
	rnL/VuC0DDyoSNzRoQZ1DCwP5t2yE1BLvVCFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pr4THeHZejZm9Id4DWrz1HCZLN8mliLCGXu5+ASGr/mPqL7DlGCNT0tQ6jCMX8cOvD
	aoa/tmpMCedEYrMRX/xdITHdXBzdHSuH6DR+qlh1m1E/sl4r2Z0+L0Rx3IDOheRbpduk
	PorF6VxmMxO7GH6LXMw47fe3bX84T9AfU9tOI=
Received: by 10.204.82.143 with SMTP id b15mr1536293bkl.118.1302237168573;
	Thu, 07 Apr 2011 21:32:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q24sm1412873bks.21.2011.04.07.21.32.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 21:32:47 -0700 (PDT)
Date: Fri, 8 Apr 2011 06:32:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110408043245.GC3180@jama.jama.net>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1302196981.14449.444.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 08 Apr 2011 04:34:58 -0000
X-Groupsio-MsgNum: 31045
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2011 at 06:23:01PM +0100, Phil Blundell wrote:
> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
> >  XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> >  LZMA_COMPRESSION_LEVEL ?=3D "-e -9"
> > +GZIP_COMPRESSION_LEVEL ?=3D "-9"
> > +BZIP2_COMPRESSION_LEVEL ?=3D "-9"
>=20
> It seems a bit sad to have to keep adding new vars to the global
> configuration set (and hence parse them for every single recipe) every
> time someone wants to tweak a new compression format.  Can we not just
> have a single IMAGE_COMPRESSION_LEVEL that does for everything?

Please check RP's changes in oe-core
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-March/000739.ht=
ml

IMHO would be great to integrate this before such changes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2ej+0ACgkQN1Ujt2V2gBysrgCcDzkQzVtN+WlyjpL4M773W6T1
mIkAoLXpWdWzGTyYin7UzHKEms0xrdG2
=pEug
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
