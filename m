Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 673C57F29D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 13:59:32 +0000 (UTC)
IronPort-SDR: zHw+s27Uxdy5gXZ7SQJpsdU10eoZW1PSEOrbRsOvDMutdfOt70s++8AHUpUII2jBqJ9bn4atbU
	4Aq0I/oTs4QlvgDHT15hofHs46IpMZnlFNMn1Y0c1MYBapkVz0UPzPWEfPNVFxYfNafPe9Od1I
	fOD8I8jQUrcS7TPOB/1gz29taVZupH+UdjRp6ayNglutW9jYJRddqSALlOkD3xQKWSD/3WJIve
	lEt2fgEdVcfmbWa0fV5C6qQbH4xkmTKAvS0exWY3big5hJcHJevx7T++a+CMngUU/7gLXW0+cb
	Rrs=
X-IronPort-AV: E=Sophos;i="5.69,241,1571695200"; 
   d="scan'208";a="2891080"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>, Niko Mauno <niko.mauno@iki.fi>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][warrior][PATCH 1/2] gitpkgv.bbclass: Use
	--git-dir option
Thread-Index: AQHVoua9nXe2wv9id0yBcw/6rp4sxaeb6rvQ
Date: Mon, 25 Nov 2019 13:59:31 +0000
Message-ID: <66640d95f6224fdda2e71556a3a44588@XBOX03.axis.com>
References: <20191123134631.81271-1-niko.mauno@iki.fi>
	<2c4e2cac-ff7b-d598-b0a8-f2d8de2d1201@gmail.com>
In-Reply-To: <2c4e2cac-ff7b-d598-b0a8-f2d8de2d1201@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-oe][warrior][PATCH 1/2] gitpkgv.bbclass: Use --git-dir option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 13:59:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Uhm, what do you mean with "wrong ml"? Given that the=20
gitpkgpv.bbclass is in meta-oe, this should be the correct=20
mailing list for at patch to it...

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of akuster808
> Sent: den 24 november 2019 17:46
> To: Niko Mauno <niko.mauno@iki.fi>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][warrior][PATCH 1/2] gitpkgv.bbclass: Use --
> git-dir option
>=20
> wrong ml
>=20
> On 11/23/19 5:46 AM, Niko Mauno wrote:
> > From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
> >
> > Avoid redundant shell working directory change by resorting to
> > '--git-dir' option for git command instead.
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/classes/gitpkgv.bbclass | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-
> oe/classes/gitpkgv.bbclass
> > index 2d9680a35..22609f584 100644
> > --- a/meta-oe/classes/gitpkgv.bbclass
> > +++ b/meta-oe/classes/gitpkgv.bbclass
> > @@ -87,10 +87,8 @@ def get_git_pkgv(d, use_tags):
> >
> >                  if not os.path.exists(rev_file) or
> os.path.getsize(rev_file)=3D=3D0:
> >                      commits =3D bb.fetch2.runfetchcmd(
> > -                        "cd %(repodir)s && "
> > -                        "git rev-list %(rev)s -- 2> /dev/null "
> > -                        "| wc -l" % vars,
> > -                        d, quiet=3DTrue).strip().lstrip('0')
> > +                        "git --git-dir=3D%(repodir)s rev-list %(rev)s =
--
> 2>/dev/null | wc -l"
> > +                        % vars, d, quiet=3DTrue).strip().lstrip('0')
> >
> >                      if commits !=3D "":
> >                          oe.path.remove(rev_file, recurse=3DFalse)
> > @@ -105,9 +103,8 @@ def get_git_pkgv(d, use_tags):
> >                  if use_tags:
> >                      try:
> >                          output =3D bb.fetch2.runfetchcmd(
> > -                            "cd %(repodir)s && "
> > -                            "git describe %(rev)s 2>/dev/null" % vars,
> > -                            d, quiet=3DTrue).strip()
> > +                            "git --git-dir=3D%(repodir)s describe %(re=
v)s
> 2>/dev/null"
> > +                            % vars, d, quiet=3DTrue).strip()
> >                          ver =3D gitpkgv_drop_tag_prefix(output)
> >                      except Exception:
> >                          ver =3D "0.0-%s-g%s" % (commits, vars['rev'][:=
7])
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

