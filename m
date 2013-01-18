Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TwCcO-0006hm-So
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 15:08:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0IDr4h5025489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 05:53:04 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 05:53:02 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 4AA877FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 08:51:15 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id D337B222A6; Fri,
	18 Jan 2013 08:53:01 -0500 (EST)
Date: Fri, 18 Jan 2013 08:53:01 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130118135301.GB5511@windriver.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
	<FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
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
X-List-Received-Date: Fri, 18 Jan 2013 14:08:37 -0000
X-Groupsio-MsgNum: 42738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] traceroute: Remove bashisms] On 12.12.21=
 (Fri 22:02) Little, Morgan wrote:

> On 12/21/2012 04:37 PM, Martin Jansa wrote:
> > On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
> > <morgan.little@windriver.com> wrote:
> >> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> >> ---
> >>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6 +=
+----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0=
=2E18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> index 719d9fb..d855c67 100644
> >> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> >> @@ -32,10 +32,8 @@ do_install() {
> >>
> >>      install -d ${D}${mandir}
> >>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> >> -    pushd ${D}${mandir}
> >> -    ln -s ${PN}.8 ${PN}6.8
> >> -    ln -s ${PN}.8 tcptraceroute.8
> >> -    popd
> >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
> >
> > Thanks for quick reply and fix, but I think this should be:
> >> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> >> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> >
> > ${D} path won't be valid on target and missing slash after mandir
> It looks like it should be. Thank you for noticing that.

Fixed.  That one's easy.

> >
> > And is there something referencing those man pages with different
> > name? Or why are those symlinks provided?
> I provided them because I was basing the do_install step off of the .spec=
 file the Fedora uses in their RPM file. It does a similar symlink step. I =
believe that is can be removed.

So, as far as I can tell, the links are provided to support
/etc/alternatives/ versions of the manpages in case you've got an
alternative implementation of traceroute/traceroute6/etc. on your
system.  Unless you think the links are adding unnecessary clutter, I'm
inclined to leave them even though I honestly have never installed an
alternative traceroute and never looked into why I might want to.

-J.

>=20
> //Morgan
> >
> > Cheers,
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD5U70ACgkQPN8S4W6ZZnfQVACeOMzs5Y3Ta77jMYTOOzOmRsDe
xc8An0RfTz2zNMXPdjfZDW8MDBuuKDD1
=7XY9
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
