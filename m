Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NUjtU-0005Bg-S6
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:47:03 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NUjrP-0001yE-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:44:52 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NUjrP-0002ZQ-I2
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:44:51 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <338689.59324.qm@web112510.mail.gq1.yahoo.com>
References: <338689.59324.qm@web112510.mail.gq1.yahoo.com>
Date: Tue, 12 Jan 2010 16:44:48 +0000
Message-ID: <1263314688.3675.435.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
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
X-List-Received-Date: Tue, 12 Jan 2010 16:47:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would have thought the interconnect performance would be the least of
your worries.  It seems that a rather bigger obstacle to running any
kind of SMP on this hardware would be the issue that the two cores have
different instruction sets: the DSP can't execute ARM code, and the ARM
can't execute DSP code.

p.

On Tue, 2010-01-12 at 07:51 -0800, gagan singh wrote:
> Hi Phil,
>               =20
> I thought general response time of any general application time will be f=
aster.
> Say Just getting a feeling of running General purpose Computer OS/applica=
tions  on a 1 GHz  processor while actually it is running on 500MHz CPU wit=
h SMP support(Keeping overhead time aside)
>            DSP seems to remain idle most of the time while everything run=
s on Arm core.  You says difficult to implement on that sort Of Cores. Do t=
he inter communication link/memory interface  is bottle neck for implementi=
ng shared workload.
> =20
> regards
> =20
> Gagan
>=20
>=20
> --- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:
>=20
>=20
> From: Phil Blundell <philb@gnu.org>
> Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetric=
 multiprocessing) on beagle board.
> To: openembedded-devel@lists.openembedded.org
> Date: Tuesday, January 12, 2010, 10:06 AM
>=20
>=20
> On Tue, 2010-01-12 at 06:57 -0800, gagan singh wrote:
> >                      Do the Angstrom version of Linux supports SMP for =
 Dual core (A8 + TI DSP 320C64x) beagle board. If not, where I should look =
in tutorial to work on adding support for such a feature.
> >  I try Google it but no much could be located.
>=20
> I'm not quite sure what you are trying to do here.  It's hard to imagine
> how you could have any meaningful kind of "symmetric" multiprocessing on
> that combination of cores.
>=20
> What exactly are you hoping to achieve?
>=20
> p.
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




