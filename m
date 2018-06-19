Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0B0275435
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3120518523;
	Tue, 19 Jun 2018 14:08:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id q5YG0rRZQ19C; Tue, 19 Jun 2018 14:08:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 07F101851D;
	Tue, 19 Jun 2018 14:08:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E70D61E096;
	Tue, 19 Jun 2018 14:08:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA1E61E095;
	Tue, 19 Jun 2018 14:08:11 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 19 Jun 2018 14:08:11 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id CD074F93;
	Tue, 19 Jun 2018 14:08:11 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Jun 2018 14:08:11 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Jun 2018 14:08:11 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 19 Jun 2018 14:08:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>, Joe Slater <joe.slater@windriver.com>
Thread-Topic: [oe] [meta-oe][PATCH V2 1/1] syslog-ng: fix build without json
Thread-Index: AQHUBNWqcS9tivhhy0iZlqYA+2/3qKRhi/sAgAX1pMA=
Date: Tue, 19 Jun 2018 12:08:11 +0000
Message-ID: <c03a98d9d4974d76a56596457df13e59@XBOX02.axis.com>
References: <20180615182105.727-1-joe.slater@windriver.com>
	<CAJ86T=XEoACNdVJhYZa24R5pF3cgDtkwKsu+WOF0z-FEb1_eOA@mail.gmail.com>
In-Reply-To: <CAJ86T=XEoACNdVJhYZa24R5pF3cgDtkwKsu+WOF0z-FEb1_eOA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Tue, 19 Jun 2018 12:08:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Andre McCurdy
> Sent: den 15 juni 2018 21:04
> To: Joe Slater <joe.slater@windriver.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH V2 1/1] syslog-ng: fix build without
> json
>=20
> On Fri, Jun 15, 2018 at 11:21 AM, Joe Slater <joe.slater@windriver.com>
> wrote:
> > Remove configurations requiring json from target.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-
> oe/recipes-support/syslog-ng/syslog-ng.inc
> > index cb7ca31..6c5adbd 100644
> > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > @@ -85,6 +85,13 @@ do_install_append() {
> >      install -d ${D}/${localstatedir}/lib/${BPN}
> >      # Remove /var/run as it is created on startup
> >      rm -rf ${D}${localstatedir}/run
> > +
> > +    # If json is not supported, remove certain conf files.
> > +    if ${@bb.utils.contains('PACKAGECONFIG','json','false','true',d)} =
; then
>=20
> Inverting the result of bb.utils.contains() by swapping true and false
> makes this a little difficult to read. Perhaps this would be clearer:
>=20
>   if ! ${@bb.utils.contains('PACKAGECONFIG','json','true','false',d)} ; t=
hen
>=20
> ?

Alternatively you can write:

    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'json', d)}" ]; then

> > +        for f in loggly logmatic cim elasticsearch ; do
> > +            rm -rf ${D}${datadir}/${BPN}/include/scl/$f
> > +        done
> > +    fi
> >  }
> >
> >  FILES_${PN} +=3D "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/to=
ols"
> > --
> > 2.7.4

//Peter


