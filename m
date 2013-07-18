Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA456B19D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 13:18:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6IDIEDO024755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2013 06:18:14 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 18 Jul 2013 06:18:13 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id F29CA7FE3;
	Thu, 18 Jul 2013 09:18:11 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id C3B86404D6; Thu,
	18 Jul 2013 09:18:12 -0400 (EDT)
Date: Thu, 18 Jul 2013 09:18:12 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20130718131812.GB7744@windriver.com>
References: <1373979075-15576-1-git-send-email-rongqing.li@windriver.com>
	<20130717184315.GA31259@windriver.com> <12162896.r64JGkun5K@helios>
	<51E7A048.6010704@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51E7A048.6010704@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0
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
X-List-Received-Date: Thu, 18 Jul 2013 13:18:16 -0000
X-Groupsio-MsgNum: 45413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline

--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0] On 13.07.18 =
(Thu 15:59) Rongqing Li wrote:

>=20
>=20
> On 07/18/2013 04:48 AM, Paul Eggleton wrote:
> >On Wednesday 17 July 2013 14:43:16 Joe MacDonald wrote:
> >>This adds (unconditional) support for tcp-wrappers and makes it a
> >>requirement for the upgraded vsftp.  Is this something we could make
> >>conditional based on tcp-wrappers being present?  Or does anyone think
> >>this is something worth doing?  tcp-wrappers is coming from oe-core and
> >>I don't have any systems where the new requirement would be a problem,
> >>but does anyone else have a system they'd want vsftp without
> >>tcp-wrappers?
> >
> >We've recently added tcp-wrappers to a number of recipes in OE-Core; at =
the
> >time there was a discussion about a possible follow-up to add a
> >DISTRO_FEATURES item to disable it system-wide. I guess whether or not i=
t's
> >worth it depends on what the overhead of having it enabled is.
> >
>=20
> I think the overhead is little.
> I will enable it based on PACKAGECONFIG, as it has in oe-core.

Perfect, thanks Roy.

-J.

>=20
>=20
> -Roy
>=20
>=20
> >Cheers,
> >Paul
> >
>=20
--=20
-Joe MacDonald.
:wq

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHn6xQACgkQPN8S4W6ZZnfpLgCeLNNUrO66pgz8GRwMI4LPARHa
dy4AnA0JVzw2ZXknAk7+xzgGRuI4Dgjt
=6cPw
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
