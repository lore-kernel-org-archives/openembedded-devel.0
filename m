Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3060C65CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 07:08:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w84so6935583wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0CSchZqAX2FxUG7tacs+ZnUpwezWJfq6bOsGZhl4WNY=;
	b=aOOMSyLoxDp783dIlscoBG0NMpCzRojkPLr3crbu1JqgVkTK7YCkphyjzMZ+E3bsn+
	HD3OTJwb7Wh2kymSBHz1+47YFzTqYiYne97H3aDYgbJ+HoEpck49IkqzpiQX847b5xhI
	pi8/JMfNeYRaiplmumjwhwc2TlII8hRjyMNs7jdJBmrZCLsVv5muK2Dk+IhXBlaRLdUa
	XqegkTSekGW0Xv9cFM1jyvQPKVGJneGhaNS50oI//45LYn7n2hZLuS+gZIMsPwOYzxMh
	LyJLFkmXWhi9lXh2jj8KzqvpN8av+JXYx5qvjrmTFMOTN/5ZRZvF1V9j23Cwvq8xTQPV
	d8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0CSchZqAX2FxUG7tacs+ZnUpwezWJfq6bOsGZhl4WNY=;
	b=Bcv2s0mVMeF7XxvdfpOhcGGzn+IBlVis7mCXPuW7FHhBpZu/fIA80svo3f6E5DXNM1
	C9466mWt00lILDT9K/QqYkaaY/333eE3QCzP4MX9mpLoDSz0oYAxzbaLBzm+P+ixPasU
	Te/aAQuev+PQao4DDtCptQudA56F5eoGKGg+JTUjmeoQn6jOjsi5q7ETRk20h9WzKJoA
	oat+4P7DgmGOOpk181xGJgxadtrWPq05iXH6HymFyBIWxQ54vfKJpJ+PEh4UhdZuO5SZ
	c6OAptBG9NDIa2vDU9vKflcjpnFu72MYI9grr2R70H5nMbrrDw1yLXRQvGkZDdGwLo4H
	62FA==
X-Gm-Message-State: AE9vXwMrZQyaJ1A7YD/Y4ysm3cgNxRb92v1M4h63a7/KD21gPUKSASghETB2YsfKVyCsRQ==
X-Received: by 10.194.59.116 with SMTP id y20mr34711463wjq.181.1474441715812; 
	Wed, 21 Sep 2016 00:08:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	gr7sm32003196wjc.1.2016.09.21.00.08.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Sep 2016 00:08:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Sep 2016 09:08:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160921070836.GC3461@jama>
References: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
	<20160901122045.gpuxub43upiiniyt@jama>
	<57CCF446.4050703@windriver.com> <57DE47D6.8010304@windriver.com>
	<57E21DD7.1000601@windriver.com>
MIME-Version: 1.0
In-Reply-To: <57E21DD7.1000601@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe][PATCH] mariadb: add libdbi-perl to the depends of mariadb-server
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
X-List-Received-Date: Wed, 21 Sep 2016 07:08:35 -0000
X-Groupsio-MsgNum: 63230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 01:42:47PM +0800, Yu, Mingli wrote:
>=20
>=20
> On 2016=E5=B9=B409=E6=9C=8818=E6=97=A5 15:52, Yu, Mingli wrote:
> >
> >
> > On 2016=E5=B9=B409=E6=9C=8805=E6=97=A5 12:27, Zhixiong Chi wrote:
> >>
> >>
> >> On 2016=E5=B9=B409=E6=9C=8801=E6=97=A5 20:20, Martin Jansa wrote:
> >>> On Tue, Aug 23, 2016 at 11:10:30AM +0800, Zhixiong Chi wrote:
> >>>> The commands(mysql_convert_table_format and mysql_setpermission) need
> >>>> to the supported API provided by the libdbi-perl package.
> >>>> So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.
> >>> This isn't possible, libdbi-perl is in meta-perl and mariadb is in
> >>> meta-oe.
> >>>
> >>> meta-oe doesn't depend (and cannot) on meta-perl.
> >> The script mysql_convert_table_format(line 50) and
> >> mysql_convert_table_format
> >> (line 20) which located xxx/mariadb/scripts/ source path will call the
> >> DBI function
> >> with the sentence "use DBI", and this DBI function is provided by the
> >> libdbi-perl
> >> package.
> >>
> >> So the scripts will fail when start to work.
> >
> > Any update?
> >
> > The issue also exists in my environment as mariabdb-server rdepends on
> > DBI.pm which is provided by libdbi-perl.
> >
> > Thanks,
>=20
> Ping.

Pong.

Still cannot depend on meta-perl layer from meta-oe.

> Thanks,
>=20
> >
> >>
> >> Thanks.
> >>>> Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
> >>>> ---
> >>>>   meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
> >>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
> >>>> b/meta-oe/recipes-support/mysql/mariadb.inc
> >>>> index 73905b6..c2d2ecf 100644
> >>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> >>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> >>>> @@ -169,7 +169,7 @@ RDEPENDS_${PN}-client =3D "perl
> >>>> perl-module-getopt-long perl-module-file-temp \
> >>>>   RDEPENDS_${PN}-server =3D "perl perl-module-getopt-long
> >>>> perl-module-data-dumper \
> >>>>       perl-module-file-basename perl-module-file-path
> >>>> perl-module-sys-hostname \
> >>>>       perl-module-file-copy perl-module-file-temp perl-module-posix \
> >>>> -    ${PN}-client"
> >>>> +    ${PN}-client libdbi-perl"
> >>>>   RDEPENDS_${PN}-leftovers =3D "perl perl-module-cwd
> >>>> perl-module-benchmark perl-module-getopt-long \
> >>>>       perl-module-posix perl-module-data-dumper perl-module-sigtrap
> >>>> perl-module-threads \
> >>>>       perl-module-threads-shared perl-module-io-socket
> >>>> perl-module-sys-hostname perl-module-file-copy \
> >>>> --
> >>>> 1.9.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>>
> >>
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfiMfQACgkQN1Ujt2V2gBy7VwCglSXx9uBQF8deJKU1o4VbbkJS
IYEAoLBHJftwh6cz17E8OEFv996T8g56
=Cp8h
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
