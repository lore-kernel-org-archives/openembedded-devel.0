Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVoG2-0002Zc-9v for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 13:52:50 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C260F401C8B; Fri,  6 Oct 2006 04:21:19 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061006112119.C260F401C8B@tinman.treke.net>
Date: Fri,  6 Oct 2006 04:21:19 -0700 (PDT)
Subject: [Bug 1458] New: pkg_postinst_ipkg() does not work with /bin/dash
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
X-List-Received-Date: Fri, 06 Oct 2006 11:52:50 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1458

           Summary: pkg_postinst_ipkg() does not work with /bin/dash
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: di@fh-wedel.de
         QAContact: tinderbox-oe@gmx.net


Consider the following code:

echo -e "#!/bin/sh 
ipkg-cl configure
" > ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d/S${IPKG_INIT_POSITION}configure

This fails if /bin/sh points to /bin/dash, because obviously /bin/dash has its
own, builtin echo. I suggest either to remove the -e, it is not used anyway, or
use /bin/echo or \echo instead. This is a principal issue, we should not always
rely on having a particular version of /bin/sh offering whatever non-standard
facilities.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


