Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYU-0003jY-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:16 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id CFBA41B7A4; Wed, 19 Aug 2009 20:25:51 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:40 -0700
Message-Id: <1250738680-20274-9-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-8-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com>
	<1250738680-20274-8-git-send-email-clarson@mvista.com>
Subject: [PATCH] bitbake.conf: only pass --no-check-certificate if wget supports it.
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:20 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 9cb6039..b849a85 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -530,12 +530,13 @@ FETCHCMD_wget = "/usr/bin/env wget -t 5 --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
+__wget_nocheckcert := "${@['--no-check-certificate', '']['unrecognized option' in os.popen3("wget --no-check-certificate")[2].read()]}"
 FETCHCOMMAND = "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} ${URI}"
+FETCHCOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -t 5 --passive-ftp ${__wget_nocheckcert} -P ${DL_DIR} ${URI}"
 FETCHCOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
 FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
 RESUMECOMMAND = "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -c -t 5 --passive-ftp --no-check-certificate -P ${DL_DIR} ${URI}"
+RESUMECOMMAND_wget = "/usr/bin/env 'PATH=${PATH}' wget -c -t 5 --passive-ftp ${__wget_nocheckcert} -P ${DL_DIR} ${URI}"
 UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
-- 
1.6.0



