Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1U628x-0005AO-CT
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 17:59:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1EGgYUG010372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:42:34 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 14 Feb 2013 08:42:31 -0800
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id BE4D67FCE;
	Thu, 14 Feb 2013 11:42:29 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 2590E20465; Thu,
	14 Feb 2013 11:42:30 -0500 (EST)
Date: Thu, 14 Feb 2013 11:42:30 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Aws Ismail <aws.ismail@windriver.com>
Message-ID: <20130214164229.GF3156@windriver.com>
References: <1360606580-27697-1-git-send-email-aws.ismail@windriver.com>
	<1360606580-27697-2-git-send-email-aws.ismail@windriver.com>
	<20130214033444.GD3156@windriver.com>
	<511D1213.4080905@windriver.com>
MIME-Version: 1.0
In-Reply-To: <511D1213.4080905@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] traceroute: resolve multilib issues
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
X-List-Received-Date: Thu, 14 Feb 2013 16:59:28 -0000
X-Groupsio-MsgNum: 43160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline

--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH  1/3] traceroute: resolve multilib issues] On =
13.02.14 (Thu 11:34) Aws Ismail wrote:

> On 02/13/2013 10:34 PM, Joe MacDonald wrote:
> >[[meta-networking][PATCH  1/3] traceroute: resolve multilib issues] On 1=
3.02.11 (Mon 13:16) Aws Ismail wrote:
> >
> >>Make recipe changes to enable successfull building
> >>when multilib is being used.
> >>
> >>Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> >>---
> >>  .../traceroute/traceroute_2.0.18.bb                |    8 +++++---
> >>  1 files changed, 5 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.=
18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >>index 6eca731..f5f96b2 100644
> >>--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >>+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >>@@ -11,6 +11,8 @@ LICENSE =3D "GPL-2.0 LGPL-2.1"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f \
> >>                      file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee=
802b37ff"
> >>+PR =3D "r1"
> >>+
> >>  inherit update-alternatives
> >>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2=
=2E0.18/traceroute-2.0.18.tar.gz \
> >>@@ -26,13 +28,13 @@ do_compile() {
> >>  do_install() {
> >>      install -d ${D}${bindir}
> >>-    install -m755 ${PN}/${PN} ${D}${bindir}
> >>+    install -m755 ${BPN}/${BPN} ${D}${bindir}
> >>      install -m755 wrappers/tcptraceroute ${D}${bindir}
> >>      install -d ${D}${mandir}
> >>-    install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> >>-    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> >>+    install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}
> >>+    ln -s ${PN}.8 ${D}${mandir}/${BPN}6.8
> >>      ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> >Are the targets actually installed as ${PN}.8 and not ${BPN}.8 in a
> >multilib build scenario?  What I'm asking is should the above be changed
> >to this instead:
> >
> >     ln -s ${BPN}.8 ${D}${mandir}/${BPN}6.8
> >     ln -s ${BPN}.8 ${D}${mandir}/tcptraceroute.8
> >
> I think you're right. It should be like that but the odd
> thing is that even with ln -s ${PN}.8 no errors were
> seen.

Weird.  But okay.

So, so long as the BPN version is doing the right thing -- meaning it's
actually creating a proper link and not a broken link, because ln is
pretty happy to do whatever you tell it even if it doesn't make sense --
can you send out a revised patch set?

--=20
-Joe MacDonald.
:wq

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEdE/UACgkQPN8S4W6ZZndRwACbBxSdalG91MmcuOyvJzqxomtS
5CQAn1rPpungE39w8/RtrCiXICvL6DmH
=+uPt
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
