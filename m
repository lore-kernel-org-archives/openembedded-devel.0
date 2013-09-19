Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D49D610FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:10:09 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so4085635eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0CAkZLQrBla8KFC3qsnCC2V3OLPlisaWisLOdpyW3k0=;
	b=noysm1GbK8D7OB5RzvG/XfM68cXNoFGDV6eHQ49PnXmSmexpTQJVcaiP+nViE/OGTG
	+KDmR/6eURJ3JEgcX03lIw1KWkxWLN825MamXykOvGCWVi3zBa4lkZ2nJq9I+moGs6V5
	ef9XgjbL/R7AEtvZd3gx/Y0cHcIisrv600Knu/+FWhAr7fkQ/cIvw/zaqGNS3fz9LOxr
	VBRvDmnM8SAyk74929TTQqVb8gFIa7YzQGcUSEiEKwHxAoRRcLCydRsI10vtjZTzrdhC
	3rHRMMkSVL/pDacApKJFetbL+pJdvdvDrZd9Ay1AlAMDR1TolQFj5FYG/c1iT716OBAw
	8fPg==
X-Received: by 10.14.22.8 with SMTP id s8mr567597ees.108.1379592611282;
	Thu, 19 Sep 2013 05:10:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm10790224eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:10:10 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:11:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919121148.GF18414@jama>
References: <cover.1378998806.git.muhammad_shakeel@mentor.com>
	<20130914110818.GC30637@jama>
MIME-Version: 1.0
In-Reply-To: <20130914110818.GC30637@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][PATCH 0/3] Remove systemd support for the packages which already have it in oe-core
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
X-List-Received-Date: Thu, 19 Sep 2013 12:10:10 -0000
X-Groupsio-MsgNum: 46251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline

--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2013 at 01:08:18PM +0200, Martin Jansa wrote:
> On Thu, Sep 12, 2013 at 08:28:08PM +0500, Muhammad Shakeel wrote:
> > Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > The following changes since commit a506a9efc86cda9dbf36cd916dbbfb1ae216=
2c45:
> >=20
> >   log4cplus: add recipe (2013-09-10 22:48:36 +0200)
> >=20
> > are available in the git repository at:
> >=20
> >   https://github.com/mshakeel/meta-oe.git master
> >   https://github.com//tree/master
> >=20
> > Muhammad Shakeel (3):
> >   openssh: Remove systemd support which is merged in oe-core
> >   lighttpd: Remove systemd support which is merged in oe-core
> >   rpcbind: Remove systemd support which is merged in oe-core
>=20
> Thanks!
>=20
> You cannot remove PRINC unless PV was incremented in oe-core, so I'll
> restore PRINC in rpcbind and lighttpd (you don't need to send v2 for
> that).

Merged, thanks

>=20
> >  .../openssh/openssh/sshd.socket                    |   11 -----------
> >  .../openssh/openssh/sshd@.service                  |    9 ---------
> >  .../openssh/openssh/sshdgenkeys.service            |   10 ----------
> >  .../openssh/openssh_6.2p2.bbappend                 |   16 ------------=
----
> >  .../lighttpd/lighttpd/lighttpd.service             |   13 -------------
> >  .../lighttpd/lighttpd_1.4.32.bbappend              |   15 ------------=
---
> >  .../rpcbind/rpcbind/rpcbind.service                |   13 -------------
> >  .../rpcbind/rpcbind_0.2.0.bbappend                 |   16 ------------=
----
> >  8 files changed, 103 deletions(-)
> >  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/o=
penssh/sshd.socket
> >  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/o=
penssh/sshd@.service
> >  delete mode 100644 meta-systemd/oe-core/recipes-connectivity/openssh/o=
penssh/sshdgenkeys.service
> >  delete mode 100644 meta-systemd/oe-core/recipes-extended/lighttpd/ligh=
ttpd/lighttpd.service
> >  delete mode 100644 meta-systemd/oe-core/recipes-extended/rpcbind/rpcbi=
nd/rpcbind.service
> >=20
> > --=20
> > 1.7.9.5
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66gQACgkQN1Ujt2V2gBwtngCdHMLOFE8cXp8FcqZNaZg0ul3C
MywAn3pVoHoysW/gvzFE8pbF98isFIcA
=O8lx
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
