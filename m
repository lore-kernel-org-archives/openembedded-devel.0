Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLJ2P-00017I-8g
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 19:26:17 +0100
Received: (qmail invoked by alias); 01 Nov 2011 18:20:10 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp047) with SMTP; 01 Nov 2011 19:20:10 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/w9vMcgRfwNhCp3Az/rbcSlp20/4vi2F8chcjEl3
	pSHc7LvUN0nQFy
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Nov 2011 19:24:41 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1320148597-10157-1-git-send-email-schnitzeltony@gmx.de>
	<201111011430.12670.schnitzeltony@gmx.de>
	<j8os5g$837$1@dough.gmane.org>
In-Reply-To: <j8os5g$837$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201111011924.41459.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-gnome] gnome-control-center: fix unshipped packages
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
X-List-Received-Date: Tue, 01 Nov 2011 18:26:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 01, 2011 02:28:16 PM Koen Kooi wrote:
> Op 01-11-11 14:30, Andreas M=C3=BCller schreef:
> > On Tuesday, November 01, 2011 12:59:22 PM Koen Kooi wrote:
> >> Op 01-11-11 12:56, Andreas M=C3=BCller schreef:
> >>> warnings fixed: WARNING: For recipe gnome-control-center, the
> >>> following files were installed but not shipped in any package:
> >>> WARNING: /usr/share/mime/XMLnamespaces WARNING:
> >>> /usr/share/mime/version WARNING: /usr/share/mime/subclasses WARNING:
> >>> /usr/share/mime/globs2 WARNING: /usr/share/mime/globs WARNING:
> >>> /usr/share/mime/types WARNING: /usr/share/mime/mime.cache WARNING:
> >>> /usr/share/mime/icons WARNING: /usr/share/mime/generic-icons
> >>> WARNING: /usr/share/mime/treemagic WARNING:   /usr/share/mime/magic
> >>> WARNING: /usr/share/mime/aliases
> >>=20
> >> THose aren't meant to be shipped, mime.bbclass should already package
> >> the stuff it needs.
> >=20
> > How about adding a dummy package gnome-control-center-mime to clean up
> > log and keep further enthusiastic patchers away?
>=20
> I'd suggest rm'ing them in do_install
>=20
Sorry for making noise for this 'cosmetic' issue but I would like get a bet=
ter=20
understanding on this.=20
mime.bbclass seems to pack all folders in /usr/share/mime, files will not b=
e=20
packed.

I looked a bit around and added

EXTRA_OECONF +=3D "--disable-update-mimedb"

in the recipe. With this no files are installed but there is also=20
/usr/share/mime/application/missing/x-gnome-theme-package.xml missing. Coul=
d=20
this be a solution ( even for mime.bbclass )?

Andreas


