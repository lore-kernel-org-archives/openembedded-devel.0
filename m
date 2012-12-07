Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1Th5bM-00020L-Aw
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 22:36:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB7LMS8e008466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2012 13:22:28 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 7 Dec 2012 13:22:28 -0800
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E88A87FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2012 16:21:28 -0500 (EST)
Received: by skynet (Postfix, from userid 1000)	id 6A124600549; Fri,  7 Dec
	2012 16:22:05 -0500 (EST)
Date: Fri, 7 Dec 2012 16:22:05 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121207212201.GA16424@windriver.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 00/11] More networking recipes
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
X-List-Received-Date: Fri, 07 Dec 2012 21:36:56 -0000
X-Groupsio-MsgNum: 42049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged from your contrib tree.  Thanks.

-J.

[[oe] [meta-networking][PATCH 00/11] More networking recipes] On 12.12.03 (=
Mon 17:44) Paul Eggleton wrote:

> These are updated, rebased and extended versions of patches originally
> submitted by Vladimir Redzhepoff and Yauhen Kharuzhy, now applied to
> meta-networking after discussion with them. This series also moves
> libnfnetlink to meta-networking and adds some additional netfilter
> library recipes needed for current versions of the netfilter suite.
>=20
> Note that the original patch for pure-ftpd said that it was an updated
> version of a recipe from OE-Classic; there was no such recipe in
> OE-Classic however so I have commented it as a new recipe.
> The libnetfilter-queue recipe was written from scratch as I did not
> notice it was in OE-Classic; neither version has anything particularly
> interesting in it and this version is more up-to-date.
>=20
>=20
> The following changes since commit 85ab35f4edac91ecc180161e97c6698f1c1092=
8b:
>=20
>   netperf: Correct license flags (2012-11-30 11:49:56 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/networking2
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/networking2
>=20
> Paul Eggleton (11):
>   netcat: add from OE-Classic
>   libnfnetlink: move to meta-networking and update to 1.0.1
>   libmnl: add new recipe for version 1.0.3
>   libnetfilter-conntrack: add from OE-Classic and update
>   libnetfilter-cttimeout: add new recipe for version 1.0.0
>   libnetfilter-cthelper: add new recipe for version 1.0.0
>   libnetfilter-queue: add new recipe for version 1.0.2
>   conntrack-tools: add from OE-Classic, update and tidy up
>   ebtables: add from OE-Classic, update and tidy up
>   pure-ftpd: add new recipe for 1.0.36
>   pptp-linux: add from OE-Classic, update and tidy up
>=20
>  ...coded-usr-local-includes-from-configure.a.patch |   38 ++++
>  .../pure-ftpd/pure-ftpd/nostrip.patch              |   30 ++++
>  .../recipes-daemons/pure-ftpd/pure-ftpd_1.0.36.bb  |   19 ++
>  .../conntrack-tools/conntrack-tools_1.4.0.bb       |   33 ++++
>  .../conntrack-tools/files/conntrack-failover       |   77 ++++++++
>  .../recipes-filter/conntrack-tools/files/init      |   87 +++++++++
>  .../ebtables-2.0.10-4/01debian_defaultconfig.patch |   50 ++++++
>  .../ebtables/ebtables-2.0.10-4/ebtables.init       |  186 ++++++++++++++=
++++++
>  .../ebtables-2.0.10-4/installnonroot.patch         |   43 +++++
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |   52 ++++++
>  .../recipes-filter/libmnl/libmnl_1.0.3.bb          |   12 ++
>  .../libnetfilter/libnetfilter-conntrack_1.0.2.bb   |   14 ++
>  .../libnetfilter/libnetfilter-cthelper_1.0.0.bb    |   14 ++
>  .../libnetfilter/libnetfilter-cttimeout_1.0.0.bb   |   13 ++
>  .../libnetfilter/libnetfilter-queue_1.0.2.bb       |   14 ++
>  .../libnfnetlink/libnfnetlink_1.0.1.bb             |   11 +-
>  .../pptp-linux/pptp-linux-1.7.2/options.pptp       |   30 ++++
>  .../pptp-linux/pptp-linux_1.7.2.bb                 |   29 +++
>  .../recipes-support/netcat/netcat_0.7.1.bb         |   21 +++
>  19 files changed, 768 insertions(+), 5 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0=
001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
>  create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/n=
ostrip.patch
>  create mode 100644 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1=
=2E0.36.bb
>  create mode 100644 meta-networking/recipes-filter/conntrack-tools/conntr=
ack-tools_1.4.0.bb
>  create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/=
conntrack-failover
>  create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/=
init
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.=
10-4/01debian_defaultconfig.patch
>  create mode 100755 meta-networking/recipes-filter/ebtables/ebtables-2.0.=
10-4/ebtables.init
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.=
10-4/installnonroot.patch
>  create mode 100644 meta-networking/recipes-filter/ebtables/ebtables_2.0.=
10-4.bb
>  create mode 100644 meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
>  create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfil=
ter-conntrack_1.0.2.bb
>  create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfil=
ter-cthelper_1.0.0.bb
>  create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfil=
ter-cttimeout_1.0.0.bb
>  create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfil=
ter-queue_1.0.2.bb
>  rename meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb =
=3D> meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb (60%)
>  create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-lin=
ux-1.7.2/options.pptp
>  create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-lin=
ux_1.7.2.bb
>  create mode 100644 meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>=20
--=20
-Joe MacDonald.
:wq

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlDCXfkACgkQPN8S4W6ZZne/HQCbBOpqJA2W7lrFfZDtvp9y1IYv
rtIAnjc0+DKOA1QYBTBsSyox+ork4RK6
=L6Df
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
