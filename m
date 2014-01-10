Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id C896260DF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:22:29 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2000754eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZnwjPapX8KhHt44vFINHUWV5eCdmw23gBJzJHpTMdeQ=;
	b=pX0MnvZidgUL4La29U1obQwQOAyaYXfrcV4j3ZuGwIMv1QAHG3NDtX/qjIsr+1zrx4
	F+ucmAhg3dP9JzwjNp/mYTkFMfRmkonavPiKzynuxmInht1Yr+0Nl8mrMDZAeciJwKac
	UWMVU+s5S3nmI3FX63BYIsk0ER4MdTVTEQ8YBVrctEt+cegJrrZQ+vpVknupg2XB0/Gt
	EiTZVAXeEOkig5hLd01qIcSU85pDszSePpUZzHZpzlIA8fKkyf/QHvRNQY5E1VzACpIS
	qO/K4bYpSxar04m489gAsQ6TqDQslDIwsOUcDLW7CCbsOsvMdkgLC6HIt7g5IeIXC1wR
	MOWQ==
X-Received: by 10.15.53.200 with SMTP id r48mr4730053eew.111.1389367350400;
	Fri, 10 Jan 2014 07:22:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id d2sm302545eeh.3.2014.01.10.07.22.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 07:22:29 -0800 (PST)
Date: Fri, 10 Jan 2014 16:22:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140110152242.GS3709@jama>
References: <20130913135936.GD11500@jama> <20130919125515.GH18414@jama>
	<1636291.7by8ZStO7f@helios> <525616C1.4040905@windriver.com>
	<20131014122216.GC3708@jama> <525C993B.3040702@windriver.com>
	<20131015112919.GA3703@jama> <525E2D36.6050705@windriver.com>
MIME-Version: 1.0
In-Reply-To: <525E2D36.6050705@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: meta-perl, meta-filesystems maintenance
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
X-List-Received-Date: Fri, 10 Jan 2014 15:22:30 -0000
X-Groupsio-MsgNum: 47683
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kd7cwL6IYJrQFfWn"
Content-Disposition: inline

--kd7cwL6IYJrQFfWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 02:07:50PM +0800, Hongxu Jia wrote:
> On 10/15/2013 07:29 PM, Martin Jansa wrote:
> > On Tue, Oct 15, 2013 at 09:24:11AM +0800, Hongxu Jia wrote:
> >> On 10/14/2013 08:22 PM, Martin Jansa wrote:
> >>> On Thu, Oct 10, 2013 at 10:53:53AM +0800, Hongxu Jia wrote:
> >>>> Hi Martin,
> >>>>
> >>>> Sorry to be so lazy to reply, I just come back from holiday.
> >>>>
> >>>> For the patches about the meta-perl and meta-filesystems layers:
> >>>>
> >>>> If not OK, I will figure it out;
> >>>> If it looks OK without my ACK, you don't always wait for it.
> >>>>
> >>>> I don't have write access and am asking Khem to add it for me.
> >>>>
> >>>> Sorry again for the belated reply.
> >>> Can you please send me patchwork IDs of commits ready for merge in
> >>> http://patches.openembedded.org/bundle/jama/meta-filesystems/?archive=
=3Dboth
> >>> http://patches.openembedded.org/bundle/jama/meta-perl/?archive=3Dboth
> >>> ? perl patches are quite a mess, so I would like to get some sort of
> >>> consolidated pull request or patchwork IDs.
> >> The url is valid?
> >>
> >>
> >>    502 Bad Gateway
> > It's valid but new patchwork is broken..
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-Septemb=
er/092259.html
> >
> > You can search for them from main page
> > meta-filesystems:
> >
> > 	[meta-filesystems,v1] yaffs2: Adds git version recipe (initial recipe)=
	2013-08-21	Pengyu Ma		New
>=20
> It's fine to me
>=20
> > 	[meta-filesystems,v1] yaffs2: Adds git version recipe (initial recipe)=
	2013-08-21	Pengyu Ma		New
>=20
> Duplicated with above.
>=20
> > 	[meta-oe] ntfs-3g-ntfsprogs does not rdepend on util-linux-mount 2013-=
09-12	mike.looijmans@topic.nl		New
>=20
> It's fine to me
>=20
> >
> > meta-perl:
> > 	Added recipes for Test::More and its dependency Test::Harness Signed-o=
ff-by: Emil Petersen <erp@movis.dk>	2013-08-19	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	Added recipes for Test::More and its dependency Test::Harness Signed-o=
ff-by: Emil Petersen <erp@movis.dk>	2013-08-19	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	perl-module-test-more: deleted, perl-module-test-simple: add Test::Sim=
ple contains Test::More and a number of other packages. As such, Test::More=
 has been removed and Test::Simple added with RPROVIDES and PROVIDES set.	2=
013-08-19	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	perl-module-common-sense: added, perl-module-json-xs: added	2013-08-19=
	Emil Petersen		New
>=20
> It missed DEPENS in perl-module-json-xs.
>=20
> > 	perl-module-test-simple: renamed	2013-08-19	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	perl-module-scalar-list-utils: rename, perl-module-test-harness: renam=
e	2013-08-19	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	libtest-harness-perl: added	2013-09-03	Emil Petersen		New
>=20
> It's fine to me
>=20
> > 	libcarp-perl: added	2013-09-03	Emil Petersen		New
>=20
>=20
> It's fine to me
>=20
>=20
> > 	libtest-perl_1.26: added	2013-09-03	Emil Petersen		New
>=20
> s/libfile-spec-perl/perl-module-libfile-spec/
>=20
> > 	[meta-perl] libtest-harness-perl_3.28: added	2013-09-03	Emil Petersen	=
	New
>=20
> It's fine to me
>=20
> > 	[meta-perl] libtest-simple-perl_0.98.bb: added	2013-09-03	Emil Peterse=
n		New
>=20
> It's fine to me
>=20
> > 	[meta-perl] libwww-perl_5.834: added	2013-09-03	Emil Petersen		New
>=20
> No recipe provides 'libhttp-*', 'liblwp-mediatypes-perl',
> 'libnet-http-perl', 'liburi-perl', 'liburi-escape-perl',
> 'libwww-robotrules-perl'
>=20
>=20
> s/libio-select-perl/perl-module-io-select/
> s/libio-socket-perl/perl-module-io-socket/
> s/libmime-base64-perl/perl-module-mime-base64/
> s/libnet-ftp-perl/perl-module-net-ftp/
>=20
> > 	[meta-perl] libdigest-md5-perl_2.53: added	2013-09-03	Emil Petersen		N=
ew
>=20
> s/libdigest-base-perl/perl-module-digest-base/
>=20
> > 	[meta-perl] libencode-perl_2.52: added	2013-09-03	Emil Petersen		New
>=20
>=20
> It's fine to me
>=20
> > 	[meta-perl] libencode-locale-perl_1.03: added	2013-09-03	Emil Petersen=
		New
>=20
> It's fine to me
>=20
> > 	[meta-perl] libfile-listing-perl_6.04: added	2013-09-03	Emil Petersen	=
	New
>=20
> No recipe provides libhttp-date-perl.
>=20
> > 	[meta-perl] libhtml-parser-perl_3.71.bb: added	2013-09-03	Emil Peterse=
n		New
>=20
>=20
> Which recipe provoides libhtml-tagset-perl?
>=20
> s/libxsloader-perl/perl-module-xsloader/
>=20
> > 	[meta-perl] libdevice-modem-perl_1.56: added	2013-09-05	Emil Petersen	=
	New
>=20
> It's fine to me
>=20
> > 	[meta-perl] libdevice-serialport-perl_1.04: added	2013-09-05	Emil Pete=
rsen		New
>=20
>=20
> It's fine to me
>=20
> > 	[meta-perl] libdevice-gsm-pelr_1.60: added	2013-09-05	Emil Petersen		N=
ew
>=20
> It's fine to me
>=20
> > 	[meta-perl] libdevice-gsm-perl: modified	2013-09-05	Emil Petersen		New
>=20
> It's fine to me
>=20
> >
> >> Thanks,
> >> Hongxu
> >>
> >>
> >>> Thanks
> >>>
> >>>> On 09/26/2013 06:57 PM, Paul Eggleton wrote:
> >>>>> On Thursday 19 September 2013 14:55:15 Martin Jansa wrote:
> >>>>>> On Fri, Sep 13, 2013 at 03:59:36PM +0200, Martin Jansa wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> there were some patches for meta-perl, meta-filesystems
> >>>>>>> do you want me to merge patches which looks OK without your ACK or
> >>>>>>> should I always wait for it (you're listed in meta-perl as Mainta=
iner
> >>>>>>> and in meta-filesystems for couple of recipes + you created it)?
> >>>>>>>
> >>>>>>> If you don't have write access I'm OK with pushing them for you o=
nce
> >>>>>>> they are acked on ML - or even better if you send me list of patc=
hwork
> >>>>>>> IDs to merge or some consolidated pull request.
> >>>>>>>
> >>>>>>> You can see what's in queue:
> >>>>>>> http://patches.openembedded.org/bundle/jama/meta-filesystems/?arc=
hive=3Dboth
> >>>>>>> http://patches.openembedded.org/bundle/jama/meta-perl/?archive=3D=
both
> >>>>>>>
> >>>>>>> If you don't have maintainer permission for patchwork, please ask=
 Khem
> >>>>>>> to add it for you.
> >>>>>> ping
> >>>>> Hongxu, if you haven't already replied to Martin could you please d=
o so?
> >>>>>
> >>>>> Thanks,
> >>>>> Paul
> >>>>>

Those patches still aren't merged and now they are marked as Rejected on
patchwork, can you please resolve them?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kd7cwL6IYJrQFfWn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLQEEIACgkQN1Ujt2V2gBzoZQCgkM6cb43Lgve1VPQHyKYwu457
sEkAnigRmIGp6cUYRnIDpnfkgCFI8Ez7
=6WFr
-----END PGP SIGNATURE-----

--kd7cwL6IYJrQFfWn--
