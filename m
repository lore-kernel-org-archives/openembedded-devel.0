Received: from smtp22.4emm.com ([69.18.222.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QWf2B-0000ax-D8
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 03:36:43 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB22.4emm.local ([fe80::7cff:1819:796a:2546%14]) with mapi;
	Tue, 14 Jun 2011 21:30:56 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] prelink: Added prelink-20100106, which works on ARM.
Thread-Index: Acwq+22JbEM7taGQTdCfoDyiVVXiXQ==
Date: Wed, 15 Jun 2011 01:33:48 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02EABE@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Wed, 15 Jun 2011 01:36:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jun 2011 14:37:53 +0200, Paul Menzel wrote:
> Am Dienstag, den 14.06.2011, 15:49 +0800 schrieb James Limbouris:
> > This version of prelink, together with a patch by
> > Carsten Munk <carsten@maemo.org>, taken from MeeGo,
> > fixes an ARM incompatibility with 20090925.
> >
> > Signed-off-by: James Limbouris <james@digitalmatter.com.au>
>=20
> What build configuration do you use for testing? Using `angstrom-2010.x`
> or `minimal{,-uclibc}` for `MACHINE =3D "beagleboard"` `elfutils_0.143.bb=
`
> does not even compile.
>=20
> With ?ngstr?m the error is the following.
>=20
> | strip.c: In function 'process_file':
> | strip.c:301:7: error: implicit declaration of function 'stat64'
> | strip.c:335:3: error: implicit declaration of function 'fstat64'
> | strip.c:356:63: error: 'ACCESSPERMS' undeclared (first use in this func=
tion)
> | strip.c:356:63: note: each undeclared identifier is reported only once =
for
> each function it appears in
> | strip.c: In function 'handle_elf':
> | strip.c:1641:4: error: implicit declaration of function 'fchmod'
> | make[2]: *** [strip.o] Error 1
>=20
>=20
> Thanks,
>=20
> Paul

Hi,

I had the same problem, but I thought it might just be my build system so I=
 didn't supply a patch.
The solution was to use elfutils from oe-core. I've just submitted a patch =
for it now.

I'm using angstrom-2010.x on a Freescale iMX25 based machine.
Is there a suggested / required testing config for submitting patches?

Regards,
James


