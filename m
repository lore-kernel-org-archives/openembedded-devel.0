Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E046072FA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7F18E1808A;
	Tue, 28 Feb 2017 16:33:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lsWEKPgma-0x; Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 74D2118328;
	Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 242AD1A169;
	Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1921D1A15F;
	Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 0CD2679D;
	Tue, 28 Feb 2017 16:33:33 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 28 Feb 2017 16:33:33 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 28 Feb 2017 16:33:32 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 28 Feb 2017 16:33:32 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>, Derek Straka <derek@asterius.io>
Thread-Topic: [oe] [meta-oe][PATCH] syslog-ng: update inherit to work
	correctly with RSS
Thread-Index: AQHSkaRl32d5RebKn0eNtXiBlXJJcaF+i2Qw
Date: Tue, 28 Feb 2017 15:33:32 +0000
Message-ID: <741960ebbae947bd8fa4297e4f60cd88@XBOX02.axis.com>
References: <1487973264-29272-1-git-send-email-derek@asterius.io>
	<CA+chaQdjpaUPga2h0rN8BFdjsubgrc8M+LxQhJ0K0cQ6FXJaog@mail.gmail.com>
In-Reply-To: <CA+chaQdjpaUPga2h0rN8BFdjsubgrc8M+LxQhJ0K0cQ6FXJaog@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] syslog-ng: update inherit to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 15:33:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: den 28 februari 2017 10:24
> To: Derek Straka
> Cc: openembedded-devel
> Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: update inherit to work
> correctly with RSS
>=20
> Now it complains about libtool version :/
>=20
> http://errors.yoctoproject.org/Errors/Details/134288/

I have a solution for this where it executes autoreconf twice=20
to make it work. I do not really know why that is necessary, or=20
why it changed with RSS, but at least it seems to work. syslog-ng=20
has sub-projects with their own autotools files, and that has=20
probably got something to do with it...

I will also include an update to version 3.8.1 that I have been=20
meaning to provide for a while now.

> On Fri, Feb 24, 2017 at 10:54 PM, Derek Straka <derek@asterius.io>
> wrote:
>=20
> > Resolves build issue exposed by RSS
> > http://errors.yoctoproject.org/Errors/Details/130631/
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 2 +-
> >  meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb | 2 --
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/=
recipes-support/syslog-ng/syslog-ng.inc
> > index 21d1748..0dbcc6e 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -22,7 +22,7 @@ SRC_URI =3D "http://www.balabit.com/downloads/files/s=
yslog-ng/sources/${PV}/source
> >             file://configure.ac-add-option-enable-thread-tls-to-manage-=
.patch \
> >  "
> >
> > -inherit autotools systemd pkgconfig update-rc.d
> > +inherit autotools gettext systemd pkgconfig update-rc.d
> >
> >  EXTRA_OECONF =3D " \
> >      --enable-dynamic-linking \
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/met=
a-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > index bee1e19..73609af 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > @@ -13,5 +13,3 @@ SRC_URI +=3D " \
> >
> >  SRC_URI[md5sum] =3D "e9f401615e92e5eb27396c995c1446ba"
> >  SRC_URI[sha256sum] =3D "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b2=
23776a853d9106f4e7"
> > -
> > -PNBLACKLIST[syslog-ng] ?=3D "Fails to build with RSS http://errors.yoc=
toproject.org/Errors/Details/130631/"
> > --
> > 2.7.4

//Peter


