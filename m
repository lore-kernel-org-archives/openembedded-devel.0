Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE776E75A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 19:25:56 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id d10so1240216eaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 11:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XNgfnenwR+pnQ+I9y57NhjmgkrpTlKxbBUiFGG3Fihc=;
	b=HXYIQc1YZQifxHEWSMG2ugpQVq/hn1rZD/ZKMvGrx+nxRxyT9iq0z5xl2UpBtPOSoh
	IduUBeFR51mz8OSlFilf5HmyJ+al/2jSVqlO88TDlNHB2aYD4djk9PXWJezNBtWRHQg5
	YXU+PsdMCiNacavW5j8GIVC/YrXUfBQcbp6XPSDdXXAwDNr9vBQ2igTTnAHnfPNhM3Xw
	XvpekdqZ/GLiSbMyCo9GjIlDl0JLabaZrWRIXq8/T7k2Ysw6zTrBlq6weBFnTp0YsvNO
	bCq8uv3KTqpwoYJC62iRJl/kOO9xSSe8f7OiO9UhwVpg7oze8DnE438g3+pH7eQD0dvm
	txxA==
X-Received: by 10.15.75.66 with SMTP id k42mr7952192eey.2.1394047556883;
	Wed, 05 Mar 2014 11:25:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm12622899eee.2.2014.03.05.11.25.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 11:25:55 -0800 (PST)
Date: Wed, 5 Mar 2014 20:26:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305192603.GC26981@jama>
References: <1393948468-19612-1-git-send-email-florin.sarbu@windriver.com>
	<20140305182334.GB26981@jama> <53176E96.8050806@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53176E96.8050806@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][dora][PATCH] Fix Project ERROR: Module v8 has no public API. make[1]:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Mar 2014 19:25:56 -0000
X-Groupsio-MsgNum: 48531
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LdJ1tWgGI9xhaWs5"
Content-Disposition: inline

--LdJ1tWgGI9xhaWs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 08:36:06PM +0200, Florin Sarbu wrote:
> Sorry, I'm not following what you want me to do now. Send another commit=
=20
> up for review, this time with
>=20
> 7327781083aea593b4911b6da7105e4984e28c68
>=20
> cherry-pick'ed?

Yes, because you added the fix.missing.v8.public.api.patch file only to
qtwayland-5.1.0+git but included it in SRC_URI in qtwayland.inc so
also for qtwayland_git which will now fail in do_fetch.

Also mine commit has better commit message and commits to "release"
branches should be cherry-picks from master where possible.

> On 03/05/2014 08:23 PM, Martin Jansa wrote:
> > On Tue, Mar 04, 2014 at 05:54:28PM +0200, Florin Sarbu wrote:
> >> From: "florin.sarbu" <florin.sarbu@windriver.com>
> > Cherry-pick 7327781083aea593b4911b6da7105e4984e28c68 from meta-qt5/mast=
er
> >
> > Your version is breaking recipes-qt/qt5/qtwayland_git.bb recipe I guess.
> >
> >> Cherry-picked from:
> >> https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896=
c08a634909cb9d1
> >>
> >> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> >> ---
> >>   .../fix.missing.v8.public.api.patch                | 30 ++++++++++++=
++++++++++
> >>   recipes-qt/qt5/qtwayland.inc                       |  1 +
> >>   2 files changed, 31 insertions(+)
> >>   create mode 100644 recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8=
=2Epublic.api.patch
> >>
> >> diff --git a/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.=
api.patch b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.pa=
tch
> >> new file mode 100644
> >> index 0000000..6bbbaa1
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.pat=
ch
> >> @@ -0,0 +1,30 @@
> >> +From b455f5acaec811b70ae3eb896c08a634909cb9d1 Mon Sep 17 00:00:00 2001
> >> +From: Carsten Munk <carsten.munk@jollamobile.com>
> >> +Date: Wed, 17 Jul 2013 07:28:04 +0000
> >> +Subject: [PATCH] Fix Project ERROR: Module v8 has no public API. make=
[1]: ***
> >> + [sub-qml-compositor-make_first] Error 3
> >> +
> >> +Cherry-picked from:
> >> +https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb89=
6c08a634909cb9d1
> >> +
> >> +Signed-off-by: Carsten Munk <carsten.munk@jollamobile.com>
> >> +---
> >> + qtwayland/examples/qml-compositor/qml-compositor.pro | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/examples/qml-compositor/qml-compositor.pro b/examples/qm=
l-compositor/qml-compositor.pro
> >> +index 0bc0b02..e397002 100644
> >> +--- a/examples/qml-compositor/qml-compositor.pro
> >> ++++ b/examples/qml-compositor/qml-compositor.pro
> >> +@@ -2,7 +2,7 @@ DEFINES +=3D QT_COMPOSITOR_QUICK
> >> +
> >> + LIBS +=3D -L ../../lib
> >> +
> >> +-QT +=3D quick qml v8
> >> ++QT +=3D quick qml
> >> + QT +=3D quick-private
> >> +
> >> + QT +=3D compositor
> >> +--
> >> +1.8.4
> >> +
> >> diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.i=
nc
> >> index 40dd803..2d5d6af 100644
> >> --- a/recipes-qt/qt5/qtwayland.inc
> >> +++ b/recipes-qt/qt5/qtwayland.inc
> >> @@ -17,6 +17,7 @@ SRC_URI +=3D " \
> >>       file://0001-xcbcommon-should-not-be-a-mandatory-dependency.patch=
 \
> >>       file://0002-Temporarily-patching-this-out-as-Qt5.0.0-does-not-ha=
=2Epatch \
> >>       file://0003-eglCreateImageKHR-requires-the-context-to-be-NULL.pa=
tch \
> >> +    file://fix.missing.v8.public.api.patch \
> >>   "
> >>  =20
> >>   QT_WAYLAND_CONFIG ?=3D "wayland-compositor"
> >> --=20
> >> 1.8.3.1
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LdJ1tWgGI9xhaWs5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXeksACgkQN1Ujt2V2gBziPQCfXqxx/PFNGOkW2fx7uhiVbwzZ
OIYAni0hPMQysHphETP0l7dRrUFoSP0h
=ZaA5
-----END PGP SIGNATURE-----

--LdJ1tWgGI9xhaWs5--
