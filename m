Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MGxZz-0000ZI-JD
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 18:01:45 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id 496FB1AEBF; Wed, 17 Jun 2009 08:51:10 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 08:51:09 -0700
Message-Id: <1245253869-15046-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] bitbake.conf: only use wget --no-check-certificate if the user's wget supports it.
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
X-List-Received-Date: Wed, 17 Jun 2009 16:02:24 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 077e8e1..fc1f550 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -523,18 +523,19 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
 #     into your local.conf
 
+__wget_nocheck = "${@['--no-check-certificate', ''][bool(os.popen3('wget --no-check-certificate')[2].read())]}"
 FETCHCMD_svn = "/usr/bin/env svn"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 5 --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 5 ${__wget_nocheck}"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
 FETCHCOMMAND = "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} ${URI}"
+FETCHCOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -t 5 --passive-ftp ${__wget_nocheck} -P ${DL_DIR} ${URI}"
 FETCHCOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
 FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
 RESUMECOMMAND = "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -c -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} ${URI}"
+RESUMECOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -c -t 5 --passive-ftp ${__wget_nocheck} -P ${DL_DIR} ${URI}"
 UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
-- 
1.6.0



