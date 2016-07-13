Return-Path: <prvs=1002adb369=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8114A6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:41:34 +0000 (UTC)
X-AuditID: 0a00029b-f79dd6d00000338a-83-5786531dcb74
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	AD.90.13194.D1356875; Wed, 13 Jul 2016 09:41:33 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 13 Jul 2016 09:41:33 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] nodejs: newer npm?
Thread-Index: AQHR3NmxfJRA5kqUrEazkUEVribB2aAWVlKAgABY6wCAAA+EAIAABKeA
Date: Wed, 13 Jul 2016 14:41:32 +0000
Message-ID: <2194432.uJc0j0dgcv@localhost.localdomain>
References: <5785F022.8030404@mlbassoc.com>
	<2056819.lo3LDqAOXZ@localhost.localdomain>
	<57864F34.2010704@mlbassoc.com>
In-Reply-To: <57864F34.2010704@mlbassoc.com>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.158]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWyRiBPQ1c2uC3cYNEHI4tLvRPYLS4eXsrs
	wORxbuMKRo+vmyexBDBFcdskJZaUBWem5+nbJXBntN3/xVRwhLdi6tcNbA2Md7i6GDk5JARM
	JBacPMMEYYtJXLi3nq2LkYtDSOAoo8SGl6dYIJxZjBIbH80Eq2ITMJI4d30TI4gtIhArMW8T
	RJxZQFni256rbCC2sICKRMPa70wQNaoS815sZYaw3SRWHX7LCmKzAMUb+xewgNi8AmYSr6d3
	g9lCAhUSr95sBuvlFNCR+L9yMhNE3Eyi7eFLsBpGoEu/n1oDtVdc4taT+VAfCEgs2XOeGcIW
	lXj5+B/QLg4gW07i+xdPiHIdiQW7P7FB2FYSs1dfYYawtSWWLXzNDHGOoMTJmU9YJjBKzEKy
	YRaS9llI2mchaZ+FpH0BI+sqRr5cI73U4uKy/JJUveT83E2MwNjjYmCavYNxzwSHQ4wCHIxK
	PLwBUa3hQqyJZcWVuYcYpTlYlMR5VYSUwoUE0hNLUrNTUwtSi+KLSnNSiw8xMnFwHmKU4OCS
	EilOzUtJLUosLcmIB0VzfDEwnqUaGLXChL6IfO6tcbvV7CHYaPhTK+7rgv8Kz4Q7mTc1/4r/
	UKDx6r6oVdqnTcZrL1c3CJ7/sW5Hm9vz0tLHXUz3YgsLD3DoVpc1e9Qku1gUn5r3uVfwsPHB
	bq0lDX/Pz5XkDJ0ffJdtRs6jX+rB97Ms/8Sr/PK+GCzR++jn9oPJlxc84ikW44psVmIpzkg0
	1GIuKk4EACZNOda5AgAA
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: nodejs: newer npm?
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
X-List-Received-Date: Wed, 13 Jul 2016 14:41:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <742C8AF963299F44B1E7E55751DE71FB@essvote.com>
Content-Transfer-Encoding: quoted-printable

I am building for intel core2-32 with an nginx backend. =20
I believe the layer exists to keep packages more closely aligned with the=20
upstream project.  I personally use it for the current 6.x releases of node=
js.




On Wednesday, July 13, 2016 04:24:52 PM Gary Thomas wrote:
> On 2016-07-13 15:29, Davis, Michael wrote:
> > I am currently using angular from a different meta layer.
> > https://github.com/imyller/meta-nodejs
> > It maintains newer versions of nodejs.
> > It might be something you want to try.
>=20
> I have tried this and yes, the versions are newer, but my simple example
> still does not work :-(
>=20
> What target/platform are you using?
> Any idea why there is a separate layer for something that is in a
> more mainstream (meta-oe) layer for the same things?
>=20
> > On Wednesday, July 13, 2016 10:11:05 AM Gary Thomas wrote:
> >> On 2016-07-13 09:39, Gary Thomas wrote:
> >>> The current (at least 4.4.4) nodejs recipe also creates nodejs-npm
> >>> which is npm version 2.15.1.  I'm trying to run angularjs that needs
> >>> npm >=3D 3.3.x.  I've not yet tried the update to 4.4.5, so if this
> >>> fixes the issue just let me know.
> >>>=20
> >>> What needs to be done to get a newer npm?
> >>>=20
> >>> BTW, the current one segfaults when trying to install the
> >>> attached package file.
> >>=20
> >> I have now tried nodejs-4.4.5 which has npm-2.15.5  It no longer
> >> segfaults on the install step, but it doesn't really work :-(
> >> Any access just returns 'Cannot GET /'
> >>=20
> >> Anyone have suggestions on how I might debug this?  It's a known
> >> working (simple) application I got from
> >> https://angular.io/docs/ts/latest/quickstart.html=

