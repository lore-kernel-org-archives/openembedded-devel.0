Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8d9H-0008IN-Qv
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:12:31 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL00LJCP6JD7W9@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 13:11:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 80D9914AF64; Wed,
	20 Oct 2010 14:11:06 -0400 (EDT)
Date: Wed, 20 Oct 2010 14:11:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020181106.GM11514@denix.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFABDF@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F080310FFABDF@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:12:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 15, 2010 at 10:16:43AM -0500, Maupin, Chase wrote:
> ping
> > -----Original Message-----
> > From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> > Sent: Monday, October 11, 2010 10:58 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: [PATCHv2] recipe licenses: update recipe LICENSE fields
> >
> > * While verifying the licensing for the packages I am building
> >   into my file system I found that for some packages the
> >   LICENSE value set in the recipe was either incorrect or
> >   generic and not detailed enough.  This patch is my attempt
> >   to update the LICENSE fields for these packages to match
> >   the actual versions of the licenses in the sources.
> >
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Chase,

I keep forgetting to ask you to split this patch into individual pieces. I 
understand it would be a lot of them, but it would be easier to push some/most 
of them, while still waiting on few questionable ones...

-- 
Denys


> >
> > ---
> > Added in version 2:
> > * Checked sources and updated GPLv2 packages to GPLv2+ if the
> >   "or later" clause was found in the sources.
> > * Changed the separator for packages licensed under multiple
> >   licenses to "|" instead of "/"
> > ---
> >  recipes/autoconf/autoconf.inc                      |    2 +-
> >  recipes/autoconf/autoconf213_2.13.bb               |    1 +
> >  recipes/autoconf/autoconf_2.61.bb                  |    2 ++
> >  recipes/bison/bison.inc                            |    2 +-
> >  recipes/dbus/dbus-c++_git.bb                       |    2 +-
> >  recipes/dbus/dbus-daemon-proxy_git.bb              |    2 +-
> >  recipes/dbus/dbus-glib.inc                         |    2 +-
> >  recipes/dbus/dbus.inc                              |    2 +-
> >  .../desktop-file-utils-native_0.14.bb              |    2 +-
> >  .../desktop-file-utils/desktop-file-utils_0.15.bb  |    2 +-
> >  .../desktop-file-utils/desktop-file-utils_0.16.bb  |    2 +-
> >  .../desktop-file-utils/desktop-file-utils_0.3.bb   |    2 +-
> >  .../desktop-file-utils/desktop-file-utils_0.6.bb   |    2 +-
> >  recipes/e2fsprogs/e2fsprogs.inc                    |    2 +-
> >  recipes/genext2fs/genext2fs.inc                    |    2 +-
> >  recipes/git/git.inc                                |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.22.4.bb                |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.23.6.bb                |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.24.0.bb                |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.24.1.bb                |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.6.4.bb                 |    2 +-
> >  recipes/glib-2.0/glib-2.0_2.8.6.bb                 |    2 +-
> >  recipes/glib-2.0/glib.inc                          |    2 +-
> >  recipes/iperf/iperf.inc                            |    2 +-
> >  recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb    |    2 +-
> >  recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |    2 +-
> >  recipes/iptables/iptables.inc                      |    2 +-
> >  recipes/libtool/libtool.inc                        |    2 +-
> >  recipes/linux-libc-headers/linux-libc-headers.inc  |    2 +-
> >  recipes/pkgconfig/pkgconfig.inc                    |    2 +-
> >  recipes/psplash/psplash.inc                        |    2 +-
> >  recipes/quilt/quilt.inc                            |    2 +-
> >  recipes/thttpd/thttpd_2.25b.bb                     |    2 +-
> >  recipes/tinylogin/tinylogin_1.4.bb                 |    2 +-
> >  recipes/unifdef/unifdef-native_2.6.18+git.bb       |    2 +-
> >  recipes/update-rc.d/update-rc.d_0.7.bb             |    2 +-
> >  recipes/x-load/signgp.bb                           |    2 +-
> >  recipes/x-load/x-load.inc                          |    2 +-
> >  recipes/xorg-lib/xorg-headers-native.bb            |    2 ++
> >  39 files changed, 41 insertions(+), 36 deletions(-)
> >
> > diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
> > index 35b0289..70e24a0 100644
> > --- a/recipes/autoconf/autoconf.inc
> > +++ b/recipes/autoconf/autoconf.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "A package of M4 macros to produce scripts to \
> >  automatically configure sourcecode."
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv3+exception"
> >  HOMEPAGE = "http://www.gnu.org/software/autoconf/"
> >  SECTION = "devel"
> >  DEPENDS += "m4-native"
> > diff --git a/recipes/autoconf/autoconf213_2.13.bb
> > b/recipes/autoconf/autoconf213_2.13.bb
> > index d060bbd..cd55073 100644
> > --- a/recipes/autoconf/autoconf213_2.13.bb
> > +++ b/recipes/autoconf/autoconf213_2.13.bb
> > @@ -1,4 +1,5 @@
> >  require autoconf.inc
> > +LICENSE = "GPLv2+"
> >  SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
> >  EXTRA_OECONF = "--program-transform-name=s/\$/2.13/"
> >  EXTRA_OEMAKE = 'acdatadir="${datadir}/autoconf-${PV}"
> > infodir="${datadir}/autoconf-${PV}/info"'
> > diff --git a/recipes/autoconf/autoconf_2.61.bb
> > b/recipes/autoconf/autoconf_2.61.bb
> > index 9542e21..4588608 100644
> > --- a/recipes/autoconf/autoconf_2.61.bb
> > +++ b/recipes/autoconf/autoconf_2.61.bb
> > @@ -1,5 +1,7 @@
> >  require autoconf.inc
> >
> > +LICENSE = "GPLv2+"
> > +
> >  PR = "${INC_PR}.1"
> >
> >  SRC_URI += "file://autoreconf-include.patch \
> > diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
> > index 3441bcf..023895e 100644
> > --- a/recipes/bison/bison.inc
> > +++ b/recipes/bison/bison.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "GNU Project parser generator (yacc replacement)."
> >  HOMEPAGE = "http://www.gnu.org/software/bison/"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  SECTION = "devel"
> >  PRIORITY = "optional"
> >  DEPENDS = "virtual/libintl flex-native"
> > diff --git a/recipes/dbus/dbus-c++_git.bb b/recipes/dbus/dbus-c++_git.bb
> > index 7d9db3e..6459823 100644
> > --- a/recipes/dbus/dbus-c++_git.bb
> > +++ b/recipes/dbus/dbus-c++_git.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION = "C++ bindings for dbus"
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2.1+"
> >  SECTION = "libs"
> >  DEPENDS = "dbus dbus-c++-native expat"
> >  SRCREV = "530a887913d3b0dd7091eabb8eef8e3c279e3bb8"
> > diff --git a/recipes/dbus/dbus-daemon-proxy_git.bb b/recipes/dbus/dbus-
> > daemon-proxy_git.bb
> > index 16cc34f..32ed7db 100644
> > --- a/recipes/dbus/dbus-daemon-proxy_git.bb
> > +++ b/recipes/dbus/dbus-daemon-proxy_git.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION = "dbus forwarding daemon"
> > -LICENSE = "GPL"
> > +LICENSE = "LGPLv2.1+"
> >  DEPENDS = "dbus dbus-glib"
> >  SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
> >  PV = "0.0.0+gitr${SRCPV}"
> > diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
> > index 4db734b..c1c1813 100644
> > --- a/recipes/dbus/dbus-glib.inc
> > +++ b/recipes/dbus/dbus-glib.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "GLib bindings for the dbus message bus system"
> >  HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
> >  SECTION = "libs"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+ AFLv2.1"
> >
> >  DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
> >  DEPENDS_virtclass-native = "expat-native glib-2.0-native dbus-native"
> > diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> > index 55a156d..73fc426 100644
> > --- a/recipes/dbus/dbus.inc
> > +++ b/recipes/dbus/dbus.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "A message bus system for inter-process communication"
> >  HOMEPAGE = "http://dbus.freedesktop.org"
> >  SECTION = "base"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+ AFLv2.1"
> >  DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> >
> >  INC_PR = "r19"
> > diff --git a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> > b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> > index fa7a633..1da30b1 100644
> > --- a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> > +++ b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/utils"
> >  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
> >  DESCRIPTION = "command line utilities to work with *.desktop files"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >
> >  DEPENDS = "glib-2.0-native"
> >
> > diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> > b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> > index 89919b8..6c1e9f7 100644
> > --- a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> > +++ b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/utils"
> >  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
> >  DESCRIPTION = "command line utilities to work with *.desktop files"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >
> >  DEPENDS = "glib-2.0"
> >
> > diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> > b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> > index 0d2ab9a..9a2ffc3 100644
> > --- a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> > +++ b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/utils"
> >  HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
> >  DESCRIPTION = "command line utilities to work with *.desktop files"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >
> >  DEPENDS = "glib-2.0"
> >
> > diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> > b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> > index 4bd0295..48ac169 100644
> > --- a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> > +++ b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/utils"
> >  HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
> >  DESCRIPTION = "command line utilities to work with *.desktop files"
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPLv2+"
> >  DEPENDS = "popt glib-2.0"
> >
> >  SRC_URI = "http://freedesktop.org/software/desktop-file-
> > utils/releases/desktop-file-utils-${PV}.tar.gz \
> > diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> > b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> > index 2a1eaf2..0e5c8e8 100644
> > --- a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> > +++ b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/utils"
> >  HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
> >  DESCRIPTION = "command line utilities to work with *.desktop files"
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPLv2+"
> >  DEPENDS = "popt glib-2.0 gnome-vfs"
> >
> >  SRC_URI = "http://freedesktop.org/software/desktop-file-
> > utils/releases/desktop-file-utils-${PV}.tar.gz"
> > diff --git a/recipes/e2fsprogs/e2fsprogs.inc
> > b/recipes/e2fsprogs/e2fsprogs.inc
> > index 37d3b6d..7697440 100644
> > --- a/recipes/e2fsprogs/e2fsprogs.inc
> > +++ b/recipes/e2fsprogs/e2fsprogs.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "EXT2 Filesystem Utilities"
> >  HOMEPAGE = "http://e2fsprogs.sf.net"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+|LGPLv2+|NewBSD|MIT"
> >  SECTION = "base"
> >  DEPENDS = "gettext-native util-linux-ng"
> >  DEPENDS_virtclass-native = "gettext-native util-linux-ng-native"
> > diff --git a/recipes/genext2fs/genext2fs.inc
> > b/recipes/genext2fs/genext2fs.inc
> > index c2984bc..503c74f 100644
> > --- a/recipes/genext2fs/genext2fs.inc
> > +++ b/recipes/genext2fs/genext2fs.inc
> > @@ -1,4 +1,4 @@
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2"
> >  DESCRIPTION = "A tool to generate an ext2 filesystem \
> >  as a normal (non-root) user."
> >  SECTION = "console/utils"
> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> > index bbbd7e9..003d7fa 100644
> > --- a/recipes/git/git.inc
> > +++ b/recipes/git/git.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "The git revision control system used by the Linux kernel
> > developers"
> >  SECTION = "console/utils"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2"
> >
> >  SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-
> > ${PV}.tar.bz2;name=src"
> >
> > diff --git a/recipes/glib-2.0/glib-2.0_2.22.4.bb b/recipes/glib-2.0/glib-
> > 2.0_2.22.4.bb
> > index 05a1342..ddaf4d2 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.22.4.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.22.4.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS = "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl"
> > diff --git a/recipes/glib-2.0/glib-2.0_2.23.6.bb b/recipes/glib-2.0/glib-
> > 2.0_2.23.6.bb
> > index 51a2153..b2c900f 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.23.6.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.23.6.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS = "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl zlib"
> > diff --git a/recipes/glib-2.0/glib-2.0_2.24.0.bb b/recipes/glib-2.0/glib-
> > 2.0_2.24.0.bb
> > index 3a90dc6..b0755a4 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.24.0.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.24.0.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS = "glib-2.0-native gtk-doc zlib"
> > diff --git a/recipes/glib-2.0/glib-2.0_2.24.1.bb b/recipes/glib-2.0/glib-
> > 2.0_2.24.1.bb
> > index 3bc11de..79cb9b9 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.24.1.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.24.1.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS = "gtk-doc zlib"
> > diff --git a/recipes/glib-2.0/glib-2.0_2.6.4.bb b/recipes/glib-2.0/glib-
> > 2.0_2.6.4.bb
> > index 1a483f4..ca3c133 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.6.4.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.6.4.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS += "glib-2.0-native gtk-doc"
> > diff --git a/recipes/glib-2.0/glib-2.0_2.8.6.bb b/recipes/glib-2.0/glib-
> > 2.0_2.8.6.bb
> > index f025046..f03072a 100644
> > --- a/recipes/glib-2.0/glib-2.0_2.8.6.bb
> > +++ b/recipes/glib-2.0/glib-2.0_2.8.6.bb
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2+"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS += "glib-2.0-native gtk-doc"
> > diff --git a/recipes/glib-2.0/glib.inc b/recipes/glib-2.0/glib.inc
> > index 5cc697f..52c2f89 100644
> > --- a/recipes/glib-2.0/glib.inc
> > +++ b/recipes/glib-2.0/glib.inc
> > @@ -3,7 +3,7 @@ which provides many useful data types, macros, \
> >  type conversions, string utilities, file utilities, a main \
> >  loop abstraction, and so on. It works on many \
> >  UNIX-like platforms, Windows, OS/2 and BeOS."
> > -LICENSE = "LGPL"
> > +LICENSE = "LGPLv2"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS += "glib-2.0-native gtk-doc"
> > diff --git a/recipes/iperf/iperf.inc b/recipes/iperf/iperf.inc
> > index 138ba29..c9aea29 100644
> > --- a/recipes/iperf/iperf.inc
> > +++ b/recipes/iperf/iperf.inc
> > @@ -1,7 +1,7 @@
> >  SECTION = "console/network"
> >  DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing
> > the tuning of various parameters and UDP characteristics"
> >  HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
> > -LICENSE = "BSD"
> > +LICENSE = "NewBSD"
> >  INC_PR = "r1"
> >
> >  inherit autotools
> > diff --git a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> > b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> > index 6687129..6a80d01 100644
> > --- a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> > +++ b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
> > @@ -1,6 +1,6 @@
> >  SECTION = "base"
> >  DESCRIPTION = "Itsy Package Manager utilities link script"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  CONFLICTS = "ipkg-utils"
> >  SRCDATE = "20050930"
> >  PR = "r4"
> > diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> > b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> > index d22fd26..26584e9 100644
> > --- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> > +++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Itsy Package Manager utilities"
> >  SECTION = "base"
> >  PRIORITY = "optional"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  CONFLICTS = "ipkg-link"
> >  RDEPENDS_${PN} = "python"
> >  SRCDATE = "20050930"
> > diff --git a/recipes/iptables/iptables.inc b/recipes/iptables/iptables.inc
> > index db2b6f0..5f948f3 100644
> > --- a/recipes/iptables/iptables.inc
> > +++ b/recipes/iptables/iptables.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "iptables network filtering tools"
> >  HOMEPAGE = "http://www.netfilter.org/"
> >  SECTION = "console/utils"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >
> >  SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-
> > ${PV}.tar.bz2;name=iptables-${PV}"
> >  S = "${WORKDIR}/iptables-${PV}"
> > diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
> > index 838f029..518b0b2 100644
> > --- a/recipes/libtool/libtool.inc
> > +++ b/recipes/libtool/libtool.inc
> > @@ -3,7 +3,7 @@ This is GNU libtool, a generic library support script.
> > Libtool hides \
> >  the complexity of generating special library types (such as shared \
> >  libraries) behind a consistent interface."
> >  HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  SECTION = "devel"
> >
> >  INC_PR = "r25"
> > diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc
> > b/recipes/linux-libc-headers/linux-libc-headers.inc
> > index 642e369..0b27e46 100644
> > --- a/recipes/linux-libc-headers/linux-libc-headers.inc
> > +++ b/recipes/linux-libc-headers/linux-libc-headers.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's
> > use."
> >  SECTION = "devel"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2"
> >  NATIVE_INSTALL_WORKS = "1"
> >  BBCLASSEXTEND = "native"
> >
> > diff --git a/recipes/pkgconfig/pkgconfig.inc
> > b/recipes/pkgconfig/pkgconfig.inc
> > index acbda40..4edad6a 100644
> > --- a/recipes/pkgconfig/pkgconfig.inc
> > +++ b/recipes/pkgconfig/pkgconfig.inc
> > @@ -4,7 +4,7 @@ compile/link flags that works with automake and autoconf.
> > \
> >  It replaces the ubiquitous *-config scripts you may have \
> >  seen with a single tool."
> >  HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  INC_PR = "r8"
> >
> >  SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-
> > ${PV}.tar.gz \
> > diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
> > index efd6a0c..fe446ed 100644
> > --- a/recipes/psplash/psplash.inc
> > +++ b/recipes/psplash/psplash.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
> >  HOMEPAGE = "http://projects.o-hand.com/psplash"
> >  SECTION = "base"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  RDEPENDS_${PN} = "initscripts"
> >  PROVIDES = "virtual/psplash"
> >  RPROVIDES_${PN} = "virtual-psplash"
> > diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
> > index 7fd9eac..329c3b5 100644
> > --- a/recipes/quilt/quilt.inc
> > +++ b/recipes/quilt/quilt.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Tool to work with series of patches."
> >  HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
> >  SECTION = "devel"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  INC_PR = "r7"
> >
> >  SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-
> > ${PV}.tar.gz \
> > diff --git a/recipes/thttpd/thttpd_2.25b.bb
> > b/recipes/thttpd/thttpd_2.25b.bb
> > index 85c7f70..bf03525 100644
> > --- a/recipes/thttpd/thttpd_2.25b.bb
> > +++ b/recipes/thttpd/thttpd_2.25b.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server."
> > -LICENSE = "BSD"
> > +LICENSE = "FreeBSD"
> >  HOMEPAGE = "http://www.acme.com/software/thttpd/"
> >  PR ="r8"
> >
> > diff --git a/recipes/tinylogin/tinylogin_1.4.bb
> > b/recipes/tinylogin/tinylogin_1.4.bb
> > index 40171ff..47c1190 100644
> > --- a/recipes/tinylogin/tinylogin_1.4.bb
> > +++ b/recipes/tinylogin/tinylogin_1.4.bb
> > @@ -4,7 +4,7 @@ changing passwords, and otherwise maintaining users \
> >  and groups on an embedded system."
> >  HOMEPAGE = "http://tinylogin.busybox.net/"
> >  SECTION = "base"
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPLv2+|NewBSD"
> >  PR = "r7"
> >
> >  #SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-
> > ${PV}.tar.bz2 \
> > diff --git a/recipes/unifdef/unifdef-native_2.6.18+git.bb
> > b/recipes/unifdef/unifdef-native_2.6.18+git.bb
> > index ae3eb4f..56880a8 100644
> > --- a/recipes/unifdef/unifdef-native_2.6.18+git.bb
> > +++ b/recipes/unifdef/unifdef-native_2.6.18+git.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Kernel header preprocessor"
> >  SECTION = "devel"
> > -LICENSE = "GPL"
> > +LICENSE = "FreeBSD"
> >
> >  SRC_URI = "file://unifdef.c"
> >
> > diff --git a/recipes/update-rc.d/update-rc.d_0.7.bb b/recipes/update-
> > rc.d/update-rc.d_0.7.bb
> > index d2d22ab..b36b8ca 100644
> > --- a/recipes/update-rc.d/update-rc.d_0.7.bb
> > +++ b/recipes/update-rc.d/update-rc.d_0.7.bb
> > @@ -1,7 +1,7 @@
> >  SECTION = "base"
> >  PRIORITY = "standard"
> >  DESCRIPTION = "Manage symlinks in /etc/rcN.d"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >  S = "${WORKDIR}/update-rc.d"
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  PR = "r1"
> > diff --git a/recipes/x-load/signgp.bb b/recipes/x-load/signgp.bb
> > index 8ee36b5..8eea85c 100644
> > --- a/recipes/x-load/signgp.bb
> > +++ b/recipes/x-load/signgp.bb
> > @@ -1,4 +1,4 @@
> > -LICENSE = "BSD"
> > +LICENSE = "NewBSD"
> >  DESCRIPTION = "Tool to sign omap3 x-loader images"
> >
> >  PR = "r4"
> > diff --git a/recipes/x-load/x-load.inc b/recipes/x-load/x-load.inc
> > index 0699c01..c7d0851 100644
> > --- a/recipes/x-load/x-load.inc
> > +++ b/recipes/x-load/x-load.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "x-load bootloader loader"
> >  SECTION = "bootloaders"
> >  PRIORITY = "optional"
> > -LICENSE = "GPL"
> > +LICENSE = "GPLv2+"
> >
> >  DEPENDS = "signgp-native"
> >
> > diff --git a/recipes/xorg-lib/xorg-headers-native.bb b/recipes/xorg-
> > lib/xorg-headers-native.bb
> > index e303c18..ce90fc0 100644
> > --- a/recipes/xorg-lib/xorg-headers-native.bb
> > +++ b/recipes/xorg-lib/xorg-headers-native.bb
> > @@ -1,3 +1,5 @@
> > +LICENSE = "MIT"
> > +
> >  PR = "r2"
> >
> >  SRC_URI = "file://X11"
> > --
> > 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


