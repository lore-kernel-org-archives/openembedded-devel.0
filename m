Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UMgyV-0004v9-TA
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 17:48:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r31FVbBM028604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Apr 2013 08:31:37 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 1 Apr 2013 08:31:37 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 1C0347FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2013 11:30:42 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 8622B22BED; Mon,
	1 Apr 2013 11:31:35 -0400 (EDT)
Date: Mon, 1 Apr 2013 11:31:35 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130401153135.GJ10672@windriver.com>
References: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
	<20130328215943.GA6608@novatech.datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <20130328215943.GA6608@novatech.datenfreihafen.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] 6lowpan-tools: add git version
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
X-List-Received-Date: Mon, 01 Apr 2013 15:48:48 -0000
X-Groupsio-MsgNum: 43836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWEb1MG/o7IKOlQF"
Content-Disposition: inline

--bWEb1MG/o7IKOlQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] 6lowpan-tools: add git version] On 13.03=
=2E28 (Thu 21:59) Stefan Schmidt wrote:

> Hello.
>=20
> On Thu, 2013-03-28 at 16:32, Koen Kooi wrote:
> > The 0.3 release was 6 months ago and git HEAD contains fixes to make it=
 work with contiki, so build from git instead of backporting all the patche=
s.
>=20
> Sounds like a good idea. And not only because one of the patches is
> from me ;)
>=20
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  .../recipes-support/6lowpan/6lowpan-tools_git.bb     | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/6lowpan/6lowpan-too=
ls_git.bb
>=20
> Any special reason why this is named 6lowpan here?
>=20
> 6lowpan normally refers to IPv6 over LoWPAN while the lowpan-tools
> do not configure anything regarding IPv6 but the plain LoWPAN which is
> the protocol layer below. I would suggest renaming it to lowpan-tools.

I've not used these myself.  Based on what I saw on the project web
page, 6lowpan seems like a pretty good name:

   The goal of this project is to create an implementation of 802.15.4
   and several protocols which run on top of it (primarily 6LoWPAN) for
   Linux.

But a quick look around in my apt-cache turns up lowpan-tools.  Seems
like that's what it's also named in Fedora land, so I'm thinking that's
probably the right call here, too.

--=20
-Joe MacDonald.
:wq

--bWEb1MG/o7IKOlQF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFZqFcACgkQPN8S4W6ZZncDBACeMBMwJLaDVURfMIAXC7H4d9ZH
ASsAnRh93QIQzRBiN7qKdIWSB7MKJn5z
=q8+z
-----END PGP SIGNATURE-----

--bWEb1MG/o7IKOlQF--
