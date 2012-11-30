Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TeTlO-0008Dv-GJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 17:48:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUGYC32005308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:34:12 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 30 Nov 2012 08:34:12 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 765FD7FE2;	Fri, 30 Nov 2012 11:33:21 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	4590E6A7EA7; Fri, 30 Nov 2012 11:34:11 -0500 (EST)
Date: Fri, 30 Nov 2012 11:34:11 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121130163410.GP6912@windriver.com>
References: <50B8DC5A.7050203@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50B8DC5A.7050203@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: netperf in meta-networking
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
X-List-Received-Date: Fri, 30 Nov 2012 16:48:32 -0000
X-Groupsio-MsgNum: 41828
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jXoUnAu9pZeaHebo"
Content-Disposition: inline

--jXoUnAu9pZeaHebo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[netperf in meta-networking] On 12.11.30 (Fri 10:18) Mark Hatle wrote:

> I was helping someone with building netperf from meta-networking
> last night, and stumbled on what I think is a bug.
>=20
> SUMMARY =3D "A networking benchmarking tool"
> DESCRIPTION =3D "Network performance benchmark including tests for
> TCP, UDP, sockets, ATM and more."
> SECTION =3D "console/network"
> HOMEPAGE =3D "http://www.netperf.org/"
> LICENSE =3D "netperf"
> LICENSE_FLAGS =3D "commercial"
>=20
> In the above, the LICENSE_FLAGS are set to 'commercial'.  I think
> this is incorrect.  It should be set to 'non-commercial'.
>=20
> There is a subtle difference between them which is why I think it's a bug=
=2E..
>=20
> commercial -- there are some commercial requirements necessary to
> use this recipe in a commercial device... you are responsible for
> understanding them and doing whatever is necessary... (for
> non-commercial devices you can likely use it...)
>=20
> non-commercial -- this item is restricted to non-commercial users
> only.  As in the case of netperf, the license says it's only for
> non-commercial use.
>=20
> So anyway, my suggestion is to simply change the value of the flag.

Ugh.  I had a quick look around and the first thing I found was this:

http://www.netperf.org/svn/netperf4/trunk/include/netperf.h

So I had a look at the netperf source tree fetched by bitbake during a
build.  The COPYING file says this:

  The enclosed software and documentation includes copyrighted works
  of Hewlett-Packard Co. For as long as you comply with the following
  limitations, you are hereby authorized to (i) use, reproduce, and
  modify the software and documentation, and to (ii) distribute the
  software and documentation, including modifications, for
  non-commercial purposes only.

So I'm inclined to agree, this sounds like the definition of
non-commercial above to me.

--=20
-Joe MacDonald.
:wq

--jXoUnAu9pZeaHebo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC44AIACgkQPN8S4W6ZZncroACfdSUnRgSRGuVWfQRWqLe3tFTj
GzsAn3t/lokAsMg1RzMR8QOtDIcuE1Ev
=QV3G
-----END PGP SIGNATURE-----

--jXoUnAu9pZeaHebo--
