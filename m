Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWwNO-0003W5-B0 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 16:45:06 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 158B3406552; Mon,  9 Oct 2006 07:12:48 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009141248.158B3406552@tinman.treke.net>
Date: Mon,  9 Oct 2006 07:12:48 -0700 (PDT)
Subject: [Bug 1421] Compilation of glibc-2.4 fails (and therefore gpe-plucker)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 14:45:06 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1421





------- Comment #2 from bugs.openembedded.org@rolf.leggewie.biz  2006-10-09 07:12 -------
zecke requested I include my local.conf.  So here it is.  I think it is quite
unspectactular.

$ grep -v '^$' conf/local.conf|grep -v '#'
DL_DIR = "${PATH2OE}/sources"
BBFILES := "${PATH2OE}/org.openembedded.dev/packages/*/*.bb"
BBFILES += "${PATH2OE}/mystuff/*/*.bb"
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-qpe"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
TMPDIR = "${PATH2OE}/tmp"
MACHINE = "collie"
DISTRO = "openzaurus-unstable"
IMAGE_FSTYPES = "jffs2 tar"
BBDEBUG = "yes"
PARALLEL_MAKE = "-j 3"
BBINCLUDELOGS = "yes"
CVS_TARBALL_STASH = "http://www.oesources.org/source/current/"
export GNU_MIRROR = "ftp://ftp.cs.tu-berlin.de/pub/gnu"
export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
export SOURCEFORGE_MIRROR = "http://heanet.dl.sourceforge.net/sourceforge"
export GPE_MIRROR = "http://gpe.handhelds.org/pub/projects/gpe/source"
export XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
export GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
TINDER_LOG        = "${TMPDIR}/tinder.log"
TINDER_REPORT     = "1"
TINDER_TREE       = "OpenEmbeddedBuilds"
TINDER_HOST       = "ewi546.ewi.utwente.nl"
TINDER_URL        = "/tinderbox"
TINDER_CLOBBER    = "0"
TINDER_BRANCH     = "org.openembedded.dev"
TINDER_MACHINE    = "OZ-3.5.4.1-collie-Laibsch"
SRC_DIST_LOCAL = "copy"
INHERIT += "src_distribute_local"


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


