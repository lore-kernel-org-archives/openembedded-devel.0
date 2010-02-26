Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nl3u1-0000CP-1I
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 18:23:02 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nl3rI-0004nU-NY from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 09:20:12 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 26 Feb 2010 09:20:12 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 26 Feb 2010 17:20:12 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	26 Feb 2010 10:20:08 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100226171447.GC3206@jama>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
	<201002261754.25997.marcin@juszkiewicz.com.pl>
	<1267204061.18176.561.camel@trini-m4400> <20100226171447.GC3206@jama>
Organization: Mentor Graphics Corporation
Date: Fri, 26 Feb 2010 10:20:08 -0700
Message-ID: <1267204808.18176.573.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 26 Feb 2010 17:20:12.0342 (UTC)
	FILETIME=[F4379D60:01CAB707]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Generating slightly different images for different IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 17:23:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-02-26 at 18:14 +0100, Martin Jansa wrote:
> On Fri, Feb 26, 2010 at 10:07:41AM -0700, Tom Rini wrote:
> > On Fri, 2010-02-26 at 17:54 +0100, Marcin Juszkiewicz wrote:
> > > Dnia pi=C4=85tek, 26 lutego 2010 o 17:39:16 Martin Jansa napisa=C5=82=
(a):
> > >=20
> > > > We're slowly stripping packages not really needed, but it would be
> > > > nice to remove whole /boot with kernel-image.
> > >=20
> > > > Is there better way to solve it or should we try harder to save spa=
ce
> > > >  somewhere else?
> > >=20
> > > Learn about ROOTFS_POSTPROCESS_COMMAND variable present in=20
> > > classes/rootfs_*.bbclass files. You can use it to launch your functio=
n after=20
> > > rootfs is populated.
> > >=20
> > > So for example your shr-lite-image has drop_kernel_from_boot function=
 in which=20
> > > you check "MACHINE=3D=3Dom-gta01" and if it is then "rm -rf /boot/uIm=
age". After=20
> > > your function all normal ext2/ubifs/jffs2/tarball images will be crea=
ted=20
> > > without kernel in them.
> >=20
> > Or (as there's a number of ways to do this):
> > PACKAGE_REMOVE =3D "kernel-image-*"
> > ROOTFS_POSTPROCESS_COMMAND_om-gta01 +=3D "opkg-cl ${IPKG_ARGS}
> > -force-depends \
> >                                 remove ${PACKAGE_REMOVE};"
>=20
> This removes it from ALL FSTYPEs... not just jffs2/ubi/ubifs

I would strongly argue (especially after my last email) that you either
always want a kernel in your rootfs, because it's actually booted from,
or you never do and it's just wasting space (and just not critically so
on other devices).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


