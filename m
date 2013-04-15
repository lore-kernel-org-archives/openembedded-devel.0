Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1URj1K-0000dz-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 15:00:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3FCgxei022216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 05:42:59 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Apr 2013 05:43:00 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 184877FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:41:49 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 5456E43E4B; Mon,
	15 Apr 2013 08:42:59 -0400 (EDT)
Date: Mon, 15 Apr 2013 08:42:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130415124259.GI3914@windriver.com>
References: <20130413134648.GE2477@jama>
	<1365891129-8299-1-git-send-email-Martin.Jansa@gmail.com>
	<kkelis$rj6$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <kkelis$rj6$1@ger.gmane.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] recipes: Unify indentation
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
X-List-Received-Date: Mon, 15 Apr 2013 13:00:47 -0000
X-Groupsio-MsgNum: 44193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline

--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH] recipes: Unify indentation] On 13.04.14 (Sun 18:=
30) Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 14-04-13 00:12, Martin Jansa schreef:
> > * This change is only aesthetic (unlike indentation in Python tasks). *
> > Some recipes were using tabs. * Some were using 8 spaces. * Some were
> > using mix or different number of spaces. * Make them consistently use 4
> > spaces everywhere. * Yocto styleguide advises to use tabs (but the only
> > reason to keep tabs is the need to update a lot of recipes). Lately this
> > advice was also merged into the styleguide on the OE wiki. * Using 4
> > spaces in both types of tasks is better because it's less error prone
> > when someone is not sure if e.g. do_generate_toolchain_file() is Python
> > or shell task and also allows to highlight every tab used in .bb, .inc,
> > .bbappend, .bbclass as potentially bad (shouldn't be used for indenting
> > of multiline variable assignments and cannot be used for Python tasks).
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I still hate spaces for shell methods, but I support the reasons behind i=
t, so:
>=20
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

I completely agree.  The only spot where I see this as being not optimal
is something like this (hunk simplified for clarity):

 PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
-            ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
-             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
+    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
+    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"

The former state wasn't great, but in general if I'm doing this type of
thing, I'll tend to align them thus:

PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
             ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"

Probably leaving such things as they are in the tree is more trouble
than it's worth, but we could, I'd like to avoid restyling after a line
continuation.  I won't object to the proposal as it stands, though,
since on the whole it looks to be doing much more good than harm.

--=20
-Joe MacDonald.
:wq

--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFr9dIACgkQPN8S4W6ZZnfBvwCeOAJVgAY7o4FiAfQ7CjrsydyU
XNgAnjHX0mTccBodKpNB0tQMAcqioJwl
=OCRJ
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
