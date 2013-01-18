Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TwDGX-0007rh-SH
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 15:50:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0IEYU9H021093
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 06:34:30 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 06:34:30 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 0547D7FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 09:32:43 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 8A90B20657; Fri,
	18 Jan 2013 09:34:29 -0500 (EST)
Date: Fri, 18 Jan 2013 09:34:29 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130118143429.GC5511@windriver.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
	<FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
	<20130118135301.GB5511@windriver.com>
	<20130118141742.GV23233@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130118141742.GV23233@jama.palm1.palmone.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] traceroute: Remove bashisms
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
X-List-Received-Date: Fri, 18 Jan 2013 14:50:19 -0000
X-Groupsio-MsgNum: 42740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] traceroute: Remove bashisms] On 13.01.18=
 (Fri 15:17) Martin Jansa wrote:

> On Fri, Jan 18, 2013 at 08:53:01AM -0500, Joe MacDonald wrote:
> > [Re: [oe] [meta-networking][PATCH] traceroute: Remove bashisms] On 12.1=
2.21 (Fri 22:02) Little, Morgan wrote:
> >=20
> > > On 12/21/2012 04:37 PM, Martin Jansa wrote:
> > > > On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
> > > > <morgan.little@windriver.com> wrote:
> > > >> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> > > >> ---
> > > >>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb |=
 6 ++----
> > > >>  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/meta-networking/recipes-support/traceroute/traceroute=
_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> > > >> index 719d9fb..d855c67 100644
> > > >> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb
> > > >> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18=
=2Ebb
> > > >> @@ -32,10 +32,8 @@ do_install() {
> > > >>
> > > >>      install -d ${D}${mandir}
> > > >>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> > > >> -    pushd ${D}${mandir}
> > > >> -    ln -s ${PN}.8 ${PN}6.8
> > > >> -    ln -s ${PN}.8 tcptraceroute.8
> > > >> -    popd
> > > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> > > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
> > > >
> > > > Thanks for quick reply and fix, but I think this should be:
> > > >> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> > > >> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> > > >
> > > > ${D} path won't be valid on target and missing slash after mandir
> > > It looks like it should be. Thank you for noticing that.
> >=20
> > Fixed.  That one's easy.
>=20
> Great, thanks I'll reenable it in world build when it's pushed.

Just pushed.  Thanks for the reminder, Martin.

-J.

>=20
> > > >
> > > > And is there something referencing those man pages with different
> > > > name? Or why are those symlinks provided?
> > > I provided them because I was basing the do_install step off of the .=
spec file the Fedora uses in their RPM file. It does a similar symlink step=
=2E I believe that is can be removed.
> >=20
> > So, as far as I can tell, the links are provided to support
> > /etc/alternatives/ versions of the manpages in case you've got an
> > alternative implementation of traceroute/traceroute6/etc. on your
> > system.  Unless you think the links are adding unnecessary clutter, I'm
> > inclined to leave them even though I honestly have never installed an
> > alternative traceroute and never looked into why I might want to.
>=20
> I don't mind if they stay. (I'm not using traceroute on my targets).
>=20
> > -J.
> >=20
> > >=20
> > > //Morgan
> > > >
> > > > Cheers,
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> > >=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
--=20
-Joe MacDonald.
:wq

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD5XXUACgkQPN8S4W6ZZnfFOwCfXPonHQ7p2vW/ke3h4Ef3Iqsl
xVIAniugN87I5Gbvm57GyMqpmp81tlbW
=Z//J
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
