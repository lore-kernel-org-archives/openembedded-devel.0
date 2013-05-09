Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UaVaT-0000mJ-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 20:29:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r49IB0IX010475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 May 2013 11:11:00 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 9 May 2013 11:11:00 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 459D57FCE;
	Thu,  9 May 2013 14:10:53 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 201EC410F6; Thu,
	9 May 2013 14:10:59 -0400 (EDT)
Date: Thu, 9 May 2013 14:10:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130509181058.GM5905@windriver.com>
References: <1368034148-3512-1-git-send-email-otavio@ossystems.com.br>
	<20130508174906.GC9137@windriver.com>
	<CAP9ODKrxBvfMMMVP95PsGE+O2zBRmu9SwmYZUr_Bp=ODJJFTSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrxBvfMMMVP95PsGE+O2zBRmu9SwmYZUr_Bp=ODJJFTSg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendation to CIFS kernel module
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
X-List-Received-Date: Thu, 09 May 2013 18:29:22 -0000
X-Groupsio-MsgNum: 44642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nj4mAaUCx+wbOcQD"
Content-Disposition: inline

--Nj4mAaUCx+wbOcQD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommen=
dation to CIFS kernel module] On 13.05.08 (Wed 14:54) Otavio Salvador wrote:

> On Wed, May 8, 2013 at 2:49 PM, Joe MacDonald
> <Joe.MacDonald@windriver.com> wrote:
> > [[oe] [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommen=
dation to CIFS kernel module] On 13.05.08 (Wed 14:29) Otavio Salvador wrote:
> >
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >> Note: This patch has been tested in master and danny. Please
> >>       consider it for master, dylan and danny branches.
> >>
> >>  meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/=
meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >> index 19b60ad..de2786a 100644
> >> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> >> @@ -5,6 +5,7 @@ LICENSE =3D "GPLv3 & LGPLv3"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
> >>
> >>  PV =3D "5.9"
> >> +PR =3D "r1"
> >
> > For the sake of one patch in all branches, I think we're okay, but in
> > master we don't actually need PR anymore, do we?
>=20
> In master it is not required (but still accepted) however to keep the
> upgrade path from danny -> dylan -> dylan+1 we need.

Okay, so, merged for master.  Thanks.

--=20
-Joe MacDonald.
:wq

--Nj4mAaUCx+wbOcQD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGL5rIACgkQPN8S4W6ZZneH4gCfWhuyXy3En3bVzxCHt2m2FuES
bE0An0hmLFAzXcwgHA9Us22KMDuZF5jW
=BnOH
-----END PGP SIGNATURE-----

--Nj4mAaUCx+wbOcQD--
