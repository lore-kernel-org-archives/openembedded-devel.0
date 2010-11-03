Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PDauh-0007Ud-Fk
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 11:49:55 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 5C5DE46E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Nov 2010 13:48:55 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Nov 2010 13:48:54 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.3-desktop; KDE/4.4.4; x86_64; ; )
References: <1288775679.3980.31.camel@mattotaupa>
In-Reply-To: <1288775679.3980.31.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201011031348.54553.khimov@altell.ru>
X-Altell-MailScanner-ID: 5C5DE46E1.64F41
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pf-ring: update to r4384 to fix `pf_ring.c:329:3: error: implicit declaration of function 'vmalloc_32'`
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
X-List-Received-Date: Wed, 03 Nov 2010 10:49:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 03 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010=
 12:14:39 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Paul Menzel =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> 	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi=
/p
> 	| f-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c: In function 'rvmalloc':
> 	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/
> 	| pf-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:329:3: error: implicit
> 	| declaration of function 'vmalloc_32'
> 	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/
> 	| pf-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:329:7: warning: assignment
> 	| makes pointer from integer without a cast
> 	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/
> 	| pf-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c: In function 'rvfree':
> 	| /oe/build-minimal-eglibc/minimal-dev/work/beagleboard-oe-linux-gnueabi/
> 	| pf-ring-4.4.0+svnr4326-r90/kernel/pf_ring.c:377:3: error: implicit
> 	| declaration of function 'vfree'
>=20
> 	[=E2=80=A6]
>=20
> 	Build Configuration:
> 	BB_VERSION        =3D "1.10.0"
> 	METADATA_BRANCH   =3D "org.openembedded.dev"
> 	METADATA_REVISION =3D "8fc09c071a6fba0766c3b002209c758572298d26"
> 	TARGET_ARCH       =3D "arm"
> 	TARGET_OS         =3D "linux-gnueabi"
> 	MACHINE           =3D "beagleboard"
> 	DISTRO            =3D "minimal"
> 	DISTRO_VERSION    =3D "dev-snapshot-20101103"
> 	TARGET_FPU        =3D "hard"
>=20
> Updating to revision 4384 fixes the problem. It was build tested with
> `minimal`, `minimal-uclibc`, `angstrom-2008.1` and `angstrom-2010.x` for
> `MACHINE =3D "beagleboard"`.

Run-tested on x86_64 with custom distro, please also try my follow-up patch.

Acked-by: Roman I Khimov <khimov@altell.ru>


