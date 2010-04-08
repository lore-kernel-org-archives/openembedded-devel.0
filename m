Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O00cU-0006zg-Lq
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 00:54:44 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O00ZC-0005lc-AU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:51:18 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 8 Apr 2010 15:51:17 -0700
Received: from 172.30.80.171 ([172.30.80.171]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  8 Apr 2010 22:50:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Apr 2010 15:50:37 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BBE4B91.40602@mwester.net>
References: <20100408162117.e7638f69.ospite@studenti.unina.it>
	<1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
	<4BBE4B91.40602@mwester.net>
Organization: Mentor Graphics Corporation
Date: Thu, 08 Apr 2010 15:50:37 -0700
Message-ID: <1270767037.29304.40.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 08 Apr 2010 22:51:17.0931 (UTC)
	FILETIME=[FFF7AFB0:01CAD76D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glib-2.0: remove old glib-2.0-native recipes
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
X-List-Received-Date: Thu, 08 Apr 2010 22:54:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-08 at 16:33 -0500, Mike Westerhof wrote:
> Antonio Ospite wrote:
> > Having these around can cause some conflict in recipes depending on
> > recent glib-2.0-native, see [1].
> >=20
> > What can happen is that, when no preferred versions are set (like in
> > DISTRO=3Dminimal), bitbake picks up an older -native recipe even if a m=
ore
> > recent one using the BBCLASSEXTEND =3D "native" mechanism exists.
> >=20
> > [1] http://tinderbox.openembedded.org/packages/540390/
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > ---
> > Please check if the commit message is clear enough, I think I've figure=
d
> > out what's happening behind the scenes, but I have not that deep
> > knowledge of bitbake.
> >=20
> > Thanks,
> >    Antonio Ospite
> >    http://ao2.it
> >=20
> >=20
> >  .../glib-gettextize-dir.patch                      |   11 --
> >  recipes/glib-2.0/glib-2.0-native_2.12.4.bb         |   49 ----------
> >  recipes/glib-2.0/glib-2.0-native_2.16.1.bb         |   40 --------
> >  recipes/glib-2.0/glib-2.0-native_2.18.0.bb         |   40 --------
> >  recipes/glib-2.0/glib-2.0-native_2.2.3.bb          |  100 ------------=
--------
> >  recipes/glib-2.0/glib-2.0-native_2.22.1.bb         |   39 --------
> >  recipes/glib-2.0/glib-2.0-native_2.4.6.bb          |   49 ----------
> >  recipes/glib-2.0/glib-2.0-native_2.6.5.bb          |   51 ----------
> >  recipes/glib-2.0/glib-2.0-native_2.6.6.bb          |   51 ----------
> >  9 files changed, 0 insertions(+), 430 deletions(-)
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettex=
tize-dir.patch
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.12.4.bb
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.16.1.bb
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.18.0.bb
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.2.3.bb
> >  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.22.1.bb
>=20
> NACK.  This glib version is still in use; don't delete it:
> /u/slug/slugos/tmp/work/x86_64-linux/glib-2.0-native-2.22.1-r6.2
>=20
> (Surely there must a better way to fix this than removal of active recipe=
s?)

If 2.22.1 was converted to BBCLASSEXTEND, the rest of the mechanisms
would work right again.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


