Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk1yI-0003gj-AP
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 22:07:13 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk1vc-0005PS-Pe from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 13:04:24 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 13:04:24 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 21:04:23 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 14:04:23 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100223205716.GC27420@denix.org>
References: <1266950939-3302-1-git-send-email-clarson@kergoth.com>
	<20100223205716.GC27420@denix.org>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 14:04:22 -0700
Message-ID: <1266959062.18176.73.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 21:04:24.0630 (UTC)
	FILETIME=[C72A9D60:01CAB4CB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 21:07:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 15:57 -0500, Denys Dmytriyenko wrote:
> On Tue, Feb 23, 2010 at 11:48:59AM -0700, Chris Larson wrote:
> > From: Tom Rini <tom_rini@mentor.com>
>=20
> How is it different from [1]? Or is it meant to be pushed to stable/2009?
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D8dc84=
badb1d772f5953492c4022c1f644c4fe278

Isn't.  Chris just missed me forgetting about the 2 ack policy for
bbclass files and just doing it.

> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > Signed-off-by: Chris Larson <chris_larson@mentor.com>
> > ---
> >  classes/kernel.bbclass |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> > index 83530b5..8121339 100644
> > --- a/classes/kernel.bbclass
> > +++ b/classes/kernel.bbclass
> > @@ -536,10 +536,12 @@ MODULES_IMAGE_BASE_NAME ?=3D modules-${PV}-${PR}-=
${MACHINE}
> >  do_deploy() {
> >  	install -d ${DEPLOY_DIR_IMAGE}
> >  	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_B=
ASE_NAME}.bin
> > +	package_stagefile_shell ${S}/${KERNEL_OUTPUT}
> >  	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}=
.bin
> > =20
> >  	if [ -d "${PKGD}/lib" ]; then
> >  		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tg=
z -C ${PKGD} lib
> > +		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAM=
E}.tgz
> >  	fi
> > =20
> >  	cd ${DEPLOY_DIR_IMAGE}
> > --=20
> > 1.6.3.3
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


