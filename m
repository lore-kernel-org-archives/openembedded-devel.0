Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PnGHT-0000tH-Tn
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:04:52 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p19K3kuZ000968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Feb 2011 14:03:46 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p19K3kQs007259
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Feb 2011 14:03:46 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p19K3j1t006907
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Feb 2011 14:03:46 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 9 Feb 2011 14:02:03 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Feb 2011 14:02:01 -0600
Thread-Topic: [oe] bitbake does not fail when QA issues encountered
Thread-Index: AcvFOenMioGksNaARcSzFWPV/UQPFgDWh8VA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08032A3023DE@dlee06.ent.ti.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
	<AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
	<AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
	<AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
In-Reply-To: <AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Wed, 09 Feb 2011 20:04:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Saturday, February 05, 2011 7:35 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] bitbake does not fail when QA issues encountered
>=20
> 2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
> > On Fri, Feb 4, 2011 at 15:26, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> The recipes at hand are:
> > ...
> >> cups: there is someone bitching about that this is 1.2, but he
> >> apparently prefers bitching upon resolving the issue. Probably the
> >> best solution is to drop the DP =3D -1 from the 1.4.4 recipe
> > ...
> >
> > I can work on cups next week (I am on VAC right now).
>=20
> Actually the cups thing is the one I would feel fairly comfortable with.
> The question here is mainly when/how to drop the DP =3D -1.
> A pinning of 1.4.4 is already in my local.conf for quite a while.

Frans,

Have you already got a patch for version 1.2.12 to fix the desktop file QA =
errors?  If not I was going to work on this because this is breaking my bui=
ld scripts which check the return status of the build.

Chase

>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


