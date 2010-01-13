Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NV9Sa-0001Xf-6z
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 21:04:59 +0100
Received: from 88-109-31-216.dynamic.dsl.as9105.com ([88.109.31.216]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NV9QV-00079U-10
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 20:02:47 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <353547.18069.qm@web112505.mail.gq1.yahoo.com>
References: <353547.18069.qm@web112505.mail.gq1.yahoo.com>
Date: Wed, 13 Jan 2010 20:02:43 +0000
Message-ID: <1263412963.457.280.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IERvZXMgT0XigJlzIEFuZ3N0cm9tIExpbnV4IHN1cHBvcnQgU01QIChTeW1tZXRyaWMgbXVsdGlwcm9jZXNzaW5nKSBvbiBiZWFnbGUgYm9hcmQu?=
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
X-List-Received-Date: Wed, 13 Jan 2010 20:04:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It sounds as if you are hoping to use the DSP as a general purpose
application accelerator.  If that's the case then I fear you will be
disappointed; I don't believe there is any existing solution for that on
this hardware platform.  You can, obviously, use the DSP to accelerate
your own particular applications but you would need to write custom code
to do that.

If you want to do general purpose multiprocessing then you should
probably select a different processor: something like the Cortex-A9
MPCore would be much more suitable for this kind of application than the
CPU on the beagleboard.

p.

On Wed, 2010-01-13 at 07:06 -0800, gagan singh wrote:
> Hi Phil,
>             Thanks for the response.  So you recon Asynchronous Multi-Pro=
cessing (AMP) concept is better suited in beagle board configuration.   If =
so what exactly I have to do in angstom to get such thing working.=20
> =20
> regards
> =20
> Gagan
> =20
> =20
> --- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:
>=20
>=20
> From: Phil Blundell <philb@gnu.org>
> Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetric=
 multiprocessing) on beagle board.
> To: openembedded-devel@lists.openembedded.org
> Date: Tuesday, January 12, 2010, 11:44 AM
>=20
>=20
> I would have thought the interconnect performance would be the least of
> your worries.  It seems that a rather bigger obstacle to running any
> kind of SMP on this hardware would be the issue that the two cores have
> different instruction sets: the DSP can't execute ARM code, and the ARM
> can't execute DSP code.
>=20
> p.
>=20
> On Tue, 2010-01-12 at 07:51 -0800, gagan singh wrote:
> > Hi Phil,
> >               =20
> > I thought general response time of any general application time will be=
 faster.
> > Say Just getting a feeling of running General purpose Computer OS/appli=
cations  on a 1 GHz  processor while actually it is running on 500MHz CPU w=
ith SMP support(Keeping overhead time aside)
> >            DSP seems to remain idle most of the time while everything r=
uns on Arm core.  You says difficult to implement on that sort Of Cores. Do=
 the inter communication link/memory interface  is bottle neck for implemen=
ting shared workload.
> > =20
> > regards
> > =20
> > Gagan
> >=20
> >=20
> > --- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:
> >=20
> >=20
> > From: Phil Blundell <philb@gnu.org>
> > Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetr=
ic multiprocessing) on beagle board.
> > To: openembedded-devel@lists.openembedded.org
> > Date: Tuesday, January 12, 2010, 10:06 AM
> >=20
> >=20
> > On Tue, 2010-01-12 at 06:57 -0800, gagan singh wrote:
> > >                      Do the Angstrom version of Linux supports SMP fo=
r  Dual core (A8 + TI DSP 320C64x) beagle board. If not, where I should loo=
k in tutorial to work on adding support for such a feature.
> > >  I try Google it but no much could be located.
> >=20
> > I'm not quite sure what you are trying to do here.  It's hard to imagin=
e
> > how you could have any meaningful kind of "symmetric" multiprocessing o=
n
> > that combination of cores.
> >=20
> > What exactly are you hoping to achieve?
> >=20
> > p.
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> >=20
> >=20
> >      =20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
>      =20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




