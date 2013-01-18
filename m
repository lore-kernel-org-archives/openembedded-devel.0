Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwD0L-0007Ma-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 15:33:29 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so2080741pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h4A5djkJPQLauWYza/MQZyVHJZE2j8aVsjYVCyCfe1g=;
	b=Gts3ooFy2MjsEnQzb0urc3Rv2dqlvc9zQq1MNqVE2GjNh645qx/2qyfTpPvVN1lYHn
	BxiUO0szQA+TbWXMk8bfXIXI02m6gglHGDEbgH3AU8k5fcLwz1Qqz7CipCNkwDQ9MekY
	Mz5eCEhfwZn1LehsuFsMK2bMWxOT8ReSvD+xFAnbRzRPj5zISvwe2jMKEMefcM+nUKRw
	Pk2m1e2bY4vsgBCzRj80pPJSNA/ieXapgRhIblvjYr/qHslUG7qTqeaW3wV/I8XhRK1Z
	SYk6TzNB5ZrMyf4mtW1LvZfG748uVTCUSj/0MfGToHYP26WC0IfLQIYJ6zu3WNNu0pHK
	/btw==
X-Received: by 10.68.217.104 with SMTP id ox8mr5539324pbc.105.1358518668150;
	Fri, 18 Jan 2013 06:17:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y9sm3527534paw.1.2013.01.18.06.17.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 06:17:47 -0800 (PST)
Date: Fri, 18 Jan 2013 15:17:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130118141742.GV23233@jama.palm1.palmone.com>
References: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
	<CA+chaQc+bcUof-4h9qc=SPUK5eTe4sRiNLXp774U_m-Vv=ozKg@mail.gmail.com>
	<FCBA1E696337B442ADB5A7C30428F068BD84E8@ALA-MBA.corp.ad.wrs.com>
	<20130118135301.GB5511@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130118135301.GB5511@windriver.com>
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
X-List-Received-Date: Fri, 18 Jan 2013 14:33:36 -0000
X-Groupsio-MsgNum: 42739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 08:53:01AM -0500, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] traceroute: Remove bashisms] On 12.12.=
21 (Fri 22:02) Little, Morgan wrote:
>=20
> > On 12/21/2012 04:37 PM, Martin Jansa wrote:
> > > On Fri, Dec 21, 2012 at 10:23 PM, Morgan Little
> > > <morgan.little@windriver.com> wrote:
> > >> Signed-off-by: Morgan Little <morgan.little@windriver.com>
> > >> ---
> > >>  meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6=
 ++----
> > >>  1 file changed, 2 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2=
=2E0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> > >> index 719d9fb..d855c67 100644
> > >> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> > >> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
> > >> @@ -32,10 +32,8 @@ do_install() {
> > >>
> > >>      install -d ${D}${mandir}
> > >>      install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
> > >> -    pushd ${D}${mandir}
> > >> -    ln -s ${PN}.8 ${PN}6.8
> > >> -    ln -s ${PN}.8 tcptraceroute.8
> > >> -    popd
> > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
> > >> +    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
> > >
> > > Thanks for quick reply and fix, but I think this should be:
> > >> +    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
> > >> +    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> > >
> > > ${D} path won't be valid on target and missing slash after mandir
> > It looks like it should be. Thank you for noticing that.
>=20
> Fixed.  That one's easy.

Great, thanks I'll reenable it in world build when it's pushed.

> > >
> > > And is there something referencing those man pages with different
> > > name? Or why are those symlinks provided?
> > I provided them because I was basing the do_install step off of the .sp=
ec file the Fedora uses in their RPM file. It does a similar symlink step. =
I believe that is can be removed.
>=20
> So, as far as I can tell, the links are provided to support
> /etc/alternatives/ versions of the manpages in case you've got an
> alternative implementation of traceroute/traceroute6/etc. on your
> system.  Unless you think the links are adding unnecessary clutter, I'm
> inclined to leave them even though I honestly have never installed an
> alternative traceroute and never looked into why I might want to.

I don't mind if they stay. (I'm not using traceroute on my targets).

> -J.
>=20
> >=20
> > //Morgan
> > >
> > > Cheers,
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> -Joe MacDonald.
> :wq



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5WYYACgkQN1Ujt2V2gBwfjACdHpbr+LglwWWzWCej8SUgiQFQ
1UoAn0T8W6quPZLkVFPzYoTV3IKn0RpU
=V2gw
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
