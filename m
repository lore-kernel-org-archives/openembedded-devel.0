Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sgrl4-0001tN-Ka
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 08:17:46 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 3B511EA040;
	Tue, 19 Jun 2012 08:14:51 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A10FA604DE; Tue, 19 Jun 2012 08:07:03 +0200 (CEST)
Date: Tue, 19 Jun 2012 08:07:03 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120619060703.GA4845@hermes>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120619052932.GN3178@jama.jama.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Tue, 19 Jun 2012 06:17:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 19-Jun-12, Martin Jansa a =E9crit:
> On Tue, Jun 19, 2012 at 01:42:10AM +0200, Apelete Seketeli wrote:
> > This fix regenerates the gtk+-2.20.1/no-demos.patch file because the
> > targeted Makefile.am file changed since gtk+-2.10.1.
> > The gtk+_2.20.1.bb recipe is also updated to fix an issue where
> > no-demos.patch was not taken into account during the do_patch() stage=
.
> >=20
> > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > ---
> >  recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
> >  recipes/gtk+/gtk+_2.20.1.bb             |    3 +--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/g=
tk+-2.20.1/no-demos.patch
> > index 0fc4c48..ac0730d 100644
> > --- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> > +++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> > @@ -1,7 +1,8 @@
> > ---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
> > -+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
> > -@@ -1,6 +1,6 @@
> > +--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
> > ++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
> > +@@ -1,7 +1,7 @@
> >   ## Makefile.am for GTK+
> > + include $(top_srcdir)/Makefile.decl
> >  =20
> >  -SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules demos tests perf contrib
> >  +SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules tests perf contrib
> > diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.b=
b
> > index 9cffee1..6e3c291 100644
> > --- a/recipes/gtk+/gtk+_2.20.1.bb
> > +++ b/recipes/gtk+/gtk+_2.20.1.bb
> > @@ -1,10 +1,9 @@
> >  require gtk+.inc
> > =20
> > -SRC_URI_append_virtclass-native =3D " file://no-demos.patch \
> > -"
> >  SRC_URI_append =3D "file://gtk-dnd-grab-deadlock-fix.patch \
> >  		  file://cross-nm.patch \
> >  		  file://xkb-ifdef.patch \
> > +		  file://no-demos.patch \
>=20
> I guess this was because demos were working for target case and were
> intentionally disabled only for native..

In my oe setup I did not build gtk+-native. I added gtk+-native to the
ASSUME_PROVIDED list in local.conf instead, and installed
libgtk2.0-dev on my host machine.
As a consequence, I faced this gtk+ issue while baking a target
package, not a native one.

Do you mean I shouldn't have fixed the issue the way I did ? What
would be the best course of action then ?

Regards.
--=20
        Apelete


