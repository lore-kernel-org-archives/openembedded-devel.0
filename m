Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVqOV-000614-AG for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 16:09:43 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4F9C1401C8B; Fri,  6 Oct 2006 06:38:11 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061006133811.4F9C1401C8B@tinman.treke.net>
Date: Fri,  6 Oct 2006 06:38:11 -0700 (PDT)
Subject: [Bug 1312] Build of libvncserver failed
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
X-List-Received-Date: Fri, 06 Oct 2006 14:09:43 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1312


gfellerpatrik@gmx.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |NEW




------- Comment #12 from gfellerpatrik@gmx.net  2006-10-06 06:38 -------
As discussed on #oe a while ago I'ld like to maintain libvncserver, but due to
various reasaons libvncserver.a only; I do not have the knowledg, nor
environment to take care about x11vnc & the sdl viewer.

Therefore I propose to create separate .bb's for each of those components, each
with a maintainer.

... below the .bb to stage libvncserver.a (the one I would maintain):

***
DESCRIPTION = "library for easy implementation of a RDP/VNC server"
LICENSE     = "GPLv2"
HOMEPAGE    = "http://sourceforge.net/projects/libvncserver/"
AUTHOR      = "Johannes Schindelin <dscho@users.sourceforge.net"
MAINTAINER  = "Patrik Gfeller <gfellerpatrik@gmx.net>"

SECTION  = "libs"
PRIORITY = "optional"
DEPENDS  = "zlib jpeg"

PR = "r1"
SRC_URI =
"${SOURCEFORGE_MIRROR}/libvncserver/LibVNCServer-${PV}.tar.gz;md5sum=17a18e398af6c1730f72068022a152aa"

S = "${WORKDIR}/LibVNCServer-${PV}"

EXTRA_OEMAKE_append=" SUBDIRS='libvncserver examples'"
#                         => create libvncserver.a only (as I can not maintain
the others)
inherit autotools

do_stage () {
# copy headerfiles
        install -d ${STAGING_INCDIR}/rfb
# set permissions
        install -m 0644 ${WORKDIR}/LibVNCServer-${PV}/rfb/rfb.h       \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/rfbproto.h  \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/rfbint.h    \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/rfbconfig.h \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/rfbclient.h \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/rfbregion.h \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/keysym.h    \
                        ${WORKDIR}/LibVNCServer-${PV}/rfb/default8x16.h
${STAGING_INCDIR}/rfb
# install/stage static libs
        oe_libinstall -C libvncserver -a libvncserver ${STAGING_LIBDIR}/
}

do_install() {
}

do_package() {
}


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


