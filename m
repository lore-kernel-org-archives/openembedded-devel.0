Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q7AlB-0006rn-He
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 20:13:49 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p35IBZEm010009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Apr 2011 13:11:35 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p35IBYXM018386;
	Tue, 5 Apr 2011 13:11:34 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p35IBYtV017088;
	Tue, 5 Apr 2011 13:11:34 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Tue, 5 Apr 2011 13:11:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Apr 2011 13:11:21 -0500
Thread-Topic: [oe] [PATCH 5/5] am45x-evm: Add am45x-evm machine configuration
Thread-Index: Acvzr9RZgAG6V8/zTAac6ySTWQ88oQADOToA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340C684B7@dlee06.ent.ti.com>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
	<1302018111-20799-5-git-send-email-Chase.Maupin@ti.com>
	<20110405163747.GA7168@denix.org>
In-Reply-To: <20110405163747.GA7168@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] am45x-evm: Add am45x-evm machine configuration
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
X-List-Received-Date: Tue, 05 Apr 2011 18:13:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Tuesday, April 05, 2011 11:38 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH 5/5] am45x-evm: Add am45x-evm machine
> configuration
>=20
> On Tue, Apr 05, 2011 at 10:41:51AM -0500, Chase Maupin wrote:
> > * Added a new machine configuration for the am45x-evm device.
> > * This machine currently mimics the omap4430-panda configuration
> >   during the prototyping phase but is expected to change as the
> >   hardware and software evolves.
> > * The am45x-evm machine type is used to allow differentiating
> >   software components to be build and packaged (i.e. task lists)
> >   as well as to account for differences with the omap4430-panda
> >   device in the future.
>=20
> Chase,
>=20
> This would have been better explained in a cover letter for all the 5
> patches,
> as I was reading through the first 4 and wondering why do you use panda
> remnants, until I got to the 5th one... :)
>=20
> FYI, there are new repos on arago ready to be populated for linux-am45x
> and
> u-boot-am45x, so need to switch corresponding recipes in the future...

Thanks.  I'll do that in the future.

We will switch to the Arago repos when they are ready but that is not sched=
uled for over a month.  Until then this lets us keep prototyping and develo=
ping :)

>=20
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
> > ---
> >  conf/machine/am45x-evm.conf |   10 ++++++++++
> >  1 files changed, 10 insertions(+), 0 deletions(-)
> >  create mode 100644 conf/machine/am45x-evm.conf
> >
> > diff --git a/conf/machine/am45x-evm.conf b/conf/machine/am45x-evm.conf
> > new file mode 100644
> > index 0000000..3597d37
> > --- /dev/null
> > +++ b/conf/machine/am45x-evm.conf
> > @@ -0,0 +1,10 @@
> > +#@TYPE: Machine
> > +#@NAME: AM45X EVM
> > +#@DESCRIPTION: Machine configuration for the AM45x EVM
> > +
> > +# Currently the am45x-evm machine type mimics the panda
> > +# machine for its configuration.  This is expected to change
> > +# as the hardware and software evolves.  Currently the unique
> > +# machine type is used to differentiate software stack being
> > +# built for the two devices.
> > +require conf/machine/omap4430-panda.conf
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


