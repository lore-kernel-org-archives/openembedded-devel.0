Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id F05AD7864A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 16:00:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id B82092607DE
Message-ID: <1505318441.3560.14.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 18:00:41 +0200
In-Reply-To: <CA+chaQfAJ1-wgtemxav-4Zx_xXaRS02WJYXjbmYaDRkt_2PoOQ@mail.gmail.com>
References: <20170911125009.9837-1-fabien.lahoudere@collabora.co.uk>
	<CA+chaQdYaQa1-D9tRvvRksdv0vhudTaeUKKgRwwRte-PVLRCcg@mail.gmail.com>
	<CA+chaQdHXzf+u5dAjWXsUU_wBf+hG6hi+VsOKosF+AEHb1kXMg@mail.gmail.com>
	<1505315397.3560.12.camel@collabora.co.uk>
	<CA+chaQfAJ1-wgtemxav-4Zx_xXaRS02WJYXjbmYaDRkt_2PoOQ@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] libupnp: Bump to version 1.8.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 16:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I send "[meta-multimedia][PATCH v3 0/2] Add libupnp1.8 recipe" that allow to build mpd and gerbera
here.


On Wed, 2017-09-13 at 17:31 +0200, Martin Jansa wrote:
> Only if both versions can be installed in parallel otherwise it will still fail for either gerbera
> or mpd.
> 
> On Wed, Sep 13, 2017 at 5:09 PM, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > It seems libupnp breaks its API and mpd doesn't support it yet (I also test last release
> > 0.20.10).
> > 
> > I will revert libupnp deletion and rename the one for gerbera support libupnp-1.8.
> > Is that solution acceptable?
> > 
> > On Wed, 2017-09-13 at 16:20 +0200, Martin Jansa wrote:
> > > Please fix this ASAP, because I've already merged gerbera recipe (tested together with this
> > > libupnp change), but now with libupnp upgrade dropped from master-next because of this issue
> > > gerbera fails as well in master due to old upnp:
> > >
> > > -- Found UPnP: gerbera/1.0+gitAUTOINC+4435b165d1-r0/recipe-sysroot/usr/lib/libupnp.so (found
> > > version "1.6.21") 
> > > CMake Error at CMakeLists.txt:380 (message):
> > >   gerbera requires libupnp 1.8.0 or above.
> > >
> > >
> > > On Mon, Sep 11, 2017 at 6:51 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > > This probably break mpd build:
> > > > http://errors.yoctoproject.org/Errors/Details/155531/
> > > >
> > > > On Mon, Sep 11, 2017 at 2:50 PM, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk> wrote:
> > > > > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > > > > ---
> > > > >  .../libupnp/libupnp/sepbuildfix.patch              | 34 ----------------------
> > > > >  .../{libupnp_1.6.21.bb => libupnp_1.8.2.bb}        | 12 ++++----
> > > > >  2 files changed, 7 insertions(+), 39 deletions(-)
> > > > >  delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> > > > >  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.6.21.bb =>
> > libupnp_1.8.2.bb}
> > > > > (66%)
> > > > >
> > > > > diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> > b/meta-
> > > > > multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> > > > > deleted file mode 100644
> > > > > index 0493cea0e..000000000
> > > > > --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
> > > > > +++ /dev/null
> > > > > @@ -1,34 +0,0 @@
> > > > > -From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
> > > > > -From: Andre McCurdy <armccurdy@gmail.com>
> > > > > -Date: Tue, 9 Jun 2015 12:20:45 -0700
> > > > > -Subject: [PATCH] Fix builds when using separate source and build directories.
> > > > > -
> > > > > -Upstream-Status: Pending
> > > > > -
> > > > > -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > > > > ----
> > > > > - configure.ac           | 10 +++++-----
> > > > > - 1 files changed, 5 insertions(+), 5 deletions(-)
> > > > > -
> > > > > -diff --git a/configure.ac b/configure.ac
> > > > > -index a8731b5..54a3c3d 100644
> > > > > ---- a/configure.ac
> > > > > -+++ b/configure.ac
> > > > > -@@ -744,9 +744,9 @@ AC_OUTPUT
> > > > > - #
> > > > > - # Files copied for windows compilation.
> > > > > - #
> > > > > --echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
> > > > > --test -d build/inc || mkdir -p build/inc
> > > > > --cp autoconfig.h build/inc/autoconfig.h
> > > > > --echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
> > > > > --cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
> > > > > -+echo "configure: copying \"autoconfig.h\"          to
> > \"\$srcdir/build/inc/autoconfig.h\""
> > > > > -+test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
> > > > > -+cp autoconfig.h $srcdir/build/inc/autoconfig.h
> > > > > -+echo "configure: copying \"upnp/inc/upnpconfig.h\" to
> > \"\$srcdir/build/inc/upnpconfig.h\""
> > > > > -+cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
> > > > > -
> > > > > ---
> > > > > -1.9.1
> > > > > -
> > > > > diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb b/meta-
> > > > > multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> > > > > similarity index 66%
> > > > > rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
> > > > > rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> > > > > index a1988295a..61b209ab8 100644
> > > > > --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.21.bb
> > > > > +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> > > > > @@ -8,11 +8,13 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
> > > > >  LICENSE = "BSD"
> > > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
> > > > >
> > > > > -SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
> > > > > -           file://sepbuildfix.patch \
> > > > > -"
> > > > > +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.tar.gz "
> > > > >
> > > > > -SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
> > > > > -SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b"
> > > > > +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
> > > > > +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd69f049daba11d71bbb5d715336e00106cb4"
> > > > > +
> > > > > +S="${WORKDIR}/pupnp-release-${PV}"
> > > > >
> > > > >  inherit autotools
> > > > > +
> > > > > +EXTRA_OECONF += "--enable-reuseaddr"
> > > > > \ No newline at end of file
> > > > > --
> > > > > 2.11.0
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > > >
> > > >
> > >
> > >
> > 
> 
> 

