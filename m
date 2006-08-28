Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHpeE-0006Eg-Fq for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 00:32:02 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 020A04014D2; Mon, 28 Aug 2006 15:10:17 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060828221018.020A04014D2@tinman.treke.net>
Date: Mon, 28 Aug 2006 15:10:17 -0700 (PDT)
Subject: [Bug 1370] New: zsafe-2.1.3.bb file
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
X-List-Received-Date: Mon, 28 Aug 2006 22:32:03 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1370

           Summary: zsafe-2.1.3.bb file
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: hgayosso@gmail.com
         QAContact: tinderbox-oe@gmx.net


It builds a binary version (i.e. not quicklaunch) of zsafe-2.1.3.
There is opie-zsafe but that is at level 1.x and the file formats between zsafe
1.x and 2.x are different.

It can NOT be installed along with opie-zsafe.

=============================================
DESCRIPTION = "Password manager"
SECTION     = "opie/applications"
PRIORITY    = "optional"
MAINTAINER  = "Carsten Schneider<zcarsten@gmx.net>"
LICENSE     = "GPL"
APPNAME     = "zsafe"
APPTYPE     = "binary"
APPDESKTOP  = "${WORKDIR}"
SRC_URI     = "http://z-soft.z-portal.info/zsafe/zsafe_2.1.3.tgz"
S           = "${WORKDIR}"

inherit opie

QMAKE_PROFILES = "zsafe.pro"

export OE_QMAKE_LINK="${CXX}"

#FILES bin/zsafe apps/Applications/zsafe.desktop pics/zsafe/zsafe.png

FILES_zsafe = "zsafe"

do_install() {
        install -d ${D}${palmtopdir}/pics/${APPNAME}/
        install -m 0644 ${WORKDIR}/pics/${APPNAME}/*.xpm
${D}${palmtopdir}/pics/${APPNAME}/
        install -m 0644 ${WORKDIR}/zsafe.png ${D}${palmtopdir}/pics/
}

=============================================


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


