Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECBAC6A591
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:39:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r53Cdcex005673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Jun 2013 05:39:38 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 3 Jun 2013 05:39:36 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C89227FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 08:39:33 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id BDA11406FB; Mon,
	3 Jun 2013 08:39:35 -0400 (EDT)
Date: Mon, 3 Jun 2013 08:39:35 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130603123935.GG4723@windriver.com>
References: <m6pgd2s6a4yg.fsf@cisco.com> <5272086.yW5j78zTuC@helios>
	<m6pg8v2tanv6.fsf@cisco.com>
MIME-Version: 1.0
In-Reply-To: <m6pg8v2tanv6.fsf@cisco.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos
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
X-List-Received-Date: Mon, 03 Jun 2013 12:39:36 -0000
X-Groupsio-MsgNum: 44955
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Content-Disposition: inline

--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] net-snmp: Backport fix for NETSNMP_NO_SY=
STEMD typos] On 13.06.01 (Sat 10:48) Thomas Fitzsimmons wrote:

> Hi Paul,
>=20
> Paul Eggleton <paul.eggleton@linux.intel.com> writes:
>=20
> > Hi Thomas,
> >
> > On Friday 31 May 2013 23:24:23 Thomas Fitzsimmons wrote:
> >> This patch fixes a net-snmp build failure for non-systemd builds [1]:
> >> | .libs/snmpd.o: In function `main':
> >> | [...]/net-snmp/5.7.2-r0/net-snmp-5.7.2/agent/snmpd.c:459: undefined
> >> | reference to `netsnmp_sd_listen_fds' collect2: error: ld returned 1 =
exit
> >> | status
> >>=20
> >> It backports a typo fix from upstream:
> >>=20
> >> commit 3692875172352f72cf3afd0d35f355e83d7e421b
> >> Author: Bart Van Assche <bvanassche@acm.org>
> >> Date:   Mon Aug 8 18:22:08 2011 +0200
> >>=20
> >>     Fix typos introduced in commit 19499c3c90bf9d7b2b9e5d08baa26cc6bba=
28a11.
> >> Unbreaks the build.
> >>=20
> >> Thomas
> >>=20
> >> 1. Previously reported here:
> >>    http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57756
> >>=20
> >> Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
> >> ---
> >>  .../net-snmp/net-snmp/systemd-support.patch        |    5 +++--
> >>  1 files changed, 3 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git
> >> a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.=
patch
> >> b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.=
patch
> >> index 18955f2..b88531f 100644
> >> ---
> >> a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.=
patch
> >> +++
> >> b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.=
patch
> >> @@ -7,6 +7,7 @@ fef6cddfdb94da1a6b1fb768af62918b80f11fd3
> >>  0641e43c694c485cbbffef0556efc4641bd3ff50
> >>  76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
> >>  bf108d7f1354f6276fc43c129963f2c49b9fc242
> >> +3692875172352f72cf3afd0d35f355e83d7e421b
> >>  74412748067c685e1d8ab6ed3bcc3ca9c2774844
> >>  86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
> >>  63557cf8986a33dba1d4429b583a901361052c4f
> >> @@ -89,10 +90,10 @@ index b177d5b..08bdfc7 100644
> >>   #endif
> >>=20
> >>   #ifndef WIN32
> >> -+#ifndef NETSNMP_NO_SYSYSTEMD
> >> ++#ifndef NETSNMP_NO_SYSTEMD
> >>  +    /* check if systemd has sockets for us and don't close them */
> >>  +    prepared_sockets =3D netsnmp_sd_listen_fds(0);
> >> -+#endif /* NETSNMP_NO_SYSYSTEMD */
> >> ++#endif /* NETSNMP_NO_SYSTEMD */
> >>  +
> >>       /*
> >>        * close all non-standard file descriptors we may have
> >
> > Could you please include a header with the description, Signed-off-by a=
nd=20
> > "Upstream-Status: Backport" at the top of the inner patch itself? This =
makes=20
> > things easier when upgrading the recipe in future.
>=20
> This is actually a patch to an existing backport patch that has a header
> (but no signed-off-by):
>=20
> Systemd support backported from the master branch as of 23/04/2012 (post =
5.7.1, pre 5.8).
>=20
> The following commits have been cherry-picked:
>=20
> 19499c3c90bf9d7b2b9e5d08baa26cc6bba28a11
> fef6cddfdb94da1a6b1fb768af62918b80f11fd3
> 0641e43c694c485cbbffef0556efc4641bd3ff50
> 76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
> bf108d7f1354f6276fc43c129963f2c49b9fc242
> 3692875172352f72cf3afd0d35f355e83d7e421b
> 74412748067c685e1d8ab6ed3bcc3ca9c2774844
> 86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
> 63557cf8986a33dba1d4429b583a901361052c4f
>=20
> Upstream-Status: Backport
>=20
> I updated the header with the extra commit I cherry-picked.  How should
> I handle Signed-off-by in this situation?

It's possible (read:  likely) that others have different ideas about it,
but personally I like to see a sign-off from the person providing the
patch, even if it's a simple back-port or a refresh caused by a
cherry-pick.  I don't read anything into "signed-off-by" except that
it's a statement like "I know where this code came from and I am
confident you can have it".

--=20
-Joe MacDonald.
:wq

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGsjocACgkQPN8S4W6ZZndoPwCfdhkCIXVOtOv1YE6hlXJWtRNp
jcsAn2fWv56X8Nvm9Y6DDAqdExhPvfhD
=YAIH
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
