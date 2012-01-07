Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjMwH-0001mW-II
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 04:27:26 +0100
Received: (qmail invoked by alias); 07 Jan 2012 03:20:01 -0000
Received: from p5B0A1340.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.19.64]
	by mail.gmx.net (mp015) with SMTP; 07 Jan 2012 04:20:01 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/Y6ihf9M/YdmdUqGe3cpPVe3hO2NOoDYVFb/O+oi
	c26RuLWW1HRilg
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Jan 2012 04:21:08 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201201070403.39356.schnitzeltony@gmx.de>
In-Reply-To: <201201070403.39356.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201201070421.08388.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Howto break circular dependencies for gvfs / gnome-disk-utility / nautilus
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
X-List-Received-Date: Sat, 07 Jan 2012 03:27:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, January 07, 2012 04:03:39 AM Andreas M=FCller wrote:
> Hi
>=20
> I have tested by manual rebuilding/installation: To make thunar-volman
> properly mount removable devices, gvfs-gdu-volume-monitor ( gdu =3D
> gnome-disk-utility ) is required. For a build from scratch gvfs configure
> disables this because it can not find gnome-disk-utility. As mentioned in
> a comment of gvfs recipe, gnome- disk-utility can not be added to DEPENDS
> because of circular dependencies:
>=20
> nautillus depends gvfs
> gvfs depends gnome-disk-utility
> gnome-disk-utility depends nautilus
>=20
> The only possible solution for this I see right now is to add a dummy
> build: E.g: Within gvfs-recipe before configuring gnome-disk-utilty is
> configured / compiled and installed. After install all stuff from
> gnome-disk-utilty is removed and gnome-disk-utilty is only made RDEPENDS.
> Since this is a very dirty hack which causes extra maintenance when
> gnome-disk-utilty version changes:
>=20
> Does anybody have a better solution to break the circular dependency
> without causing plugins/libs missing?
>=20
> All suggestions welcome :)
>=20
How about adding a recipe just for gvfs-gdu-volume-monitor?

Andreas


