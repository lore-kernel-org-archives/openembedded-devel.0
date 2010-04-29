Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O7WUC-00025O-KU
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 18:21:15 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 18:17:29 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 18:17:29 +0200
Received: from [192.168.1.116] ([80.117.39.139]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 29 Apr 2010 18:17:29 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BD9A0EA.1070801@eukrea.com>
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>
	<1272114888-16964-2-git-send-email-eric@eukrea.com>
	<1272114888-16964-3-git-send-email-eric@eukrea.com>
	<1272202763.2387.1.camel@gnutoo-desktop>
	<1272205477.2387.2.camel@gnutoo-desktop>
	<1272206485.2387.3.camel@gnutoo-desktop>
	<1272548191.2313.0.camel@gnutoo-desktop> <4BD98C53.1070000@eukrea.com>
	<1272553558.2313.5.camel@gnutoo-desktop> <4BD9A0EA.1070801@eukrea.com>
Date: Thu, 29 Apr 2010 18:17:28 +0200
Message-ID: <1272557848.2313.14.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 29 Apr 2010 16:17:29.0331 (UTC)
	FILETIME=[76E63430:01CAE7B7]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Thu, 29 Apr 2010 16:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-29 at 17:08 +0200, Eric B=C3=A9nard wrote:
> Le 29/04/2010 17:05, GNUtoo a =C3=A9crit :
> > On Thu, 2010-04-29 at 15:40 +0200, Eric B=C3=A9nard wrote:
> >> do you want that I add dependencies vs libxxf86dga and libxscrnsaver ?
> > I think that's a good idea,because without it seem that mplayer_svn
> > can't even run in my setup(eee701,angstrom)
>=20
> I assume you meet this problem when trying to run it under X ?
> I'll also try with X and submit an updated recipe.
In mplayer_svn I see:
DEPENDS =3D "[...] virtual/libx11 [...]" so it depends on X

The problem I had was that it didn't find the libraries(the ones you see
with ldd not dlopened libraries) so normally even in console it
shouldn't have worked...
Strange(unless you removed X build dependencies or maybe I had more
packages installed and configure detected them and built support for
them)

Denis.



