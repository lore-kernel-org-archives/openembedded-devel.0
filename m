Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1ba2-0007jh-9L
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 10:39:18 +0100
Received: by bwz10 with SMTP id 10so4596251bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mQgXT35eNW3H2Vh7Fcs3l/bipHi5iuulcuMrr+/TMII=;
	b=B+bORWA18rcu69/kBQ2IV5oQwMCnaPbGiGmlCfVOY7jdI3E0ZaBQOZ+pYqm3cAyv+r
	7AAWOgyI08BUxwrBiE72/xSmphXeSr47/MGzWW8P4Ndwus7YCZWiyZd/aoLINVi1f0v7
	7xMO76Jf+xNmc/1i1sPmTGuXDLGVD37SCJiSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FN7eqyUQfXC6C+pL9UuRkfeK5Cq7hs0qc5QEmCZPcxV/i9x+yMKkgD19SnqJWoyQ1A
	PfFK3dHIy31U81mkSt4jvIDr7KSMd/X7cGm7QB5mlHhXXiCYv51f2s6V8tnkWfkimDto
	QVw3twL7BWh5MGYN/3z1Ww9D+ntRPshXpPqx4=
Received: by 10.204.22.202 with SMTP id o10mr3534103bkb.70.1300700249617;
	Mon, 21 Mar 2011 02:37:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm897050bkm.6.2011.03.21.02.37.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 02:37:27 -0700 (PDT)
Date: Mon, 21 Mar 2011 10:37:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110321093721.GC3798@jama.jama.net>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<1300456829-25755-3-git-send-email-Martin.Jansa@gmail.com>
	<1300463691.9054.83.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1300463691.9054.83.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 03/12] libnl: add RREPLACES libnl2 for upgradable path
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
X-List-Received-Date: Mon, 21 Mar 2011 09:39:18 -0000
X-Groupsio-MsgNum: 30460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2011 at 03:54:51PM +0000, Phil Blundell wrote:
> On Fri, 2011-03-18 at 15:00 +0100, Martin Jansa wrote:
> > +# for upgradable path from libnl2_2.0 to libnl_2.0
> > +RREPLACES_${PN} =3D "${PN}2"
> > +RREPLACES_${PN}-route =3D "${PN}2-route"
>=20
> Don't you also want RPROVIDES, RCONFLICTS?

Actually, I can probably drop this patch completely. At least for people
using debian naming. (someone not using debian naming can test and send pat=
ch=20
if needed).

see:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/031155.h=
tml

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQ2U398070+RC21q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2HHFEACgkQN1Ujt2V2gBy/BgCfbw4yLDrbJigb43ppfEyG2e6M
rekAoKRWT5aZtAtQ+/NIkRGch6rqlKlJ
=fUP5
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
