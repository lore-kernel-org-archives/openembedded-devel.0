Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LuXrP-0008PJ-MG
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 22:07:51 +0200
Received: from localhost.localdomain (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n3GK33wo017167; Thu, 16 Apr 2009 16:03:03 -0400 (EDT)
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
To: openembedded-devel@openembedded.org
Date: Thu, 16 Apr 2009 16:03:03 -0400
Message-Id: <1239912183-25085-2-git-send-email-dhuggins@cs.cmu.edu>
X-Mailer: git-send-email 1.5.6.3
In-Reply-To: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=AWL,BAYES_50,
	RCVD_IN_DNSWL_MED,RDNS_NONE autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: [PATCH] fix do_install for MinGW gcc-canadian-sdk
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
X-List-Received-Date: Thu, 16 Apr 2009 20:08:05 -0000

When building a Canadian cross SDK for a MinGW host, installation of
gcc-canadian-sdk fails, because it is configured using a Windows path
as its ${prefix}.  Therefore it's not sufficient to use DESTDIR to
install it; this leads to it being installed in ${DESTDIR}C: which
is not where the rest of the recipe expects it.

This patch forces it to use the Unix ${prefix} variable, which has
no drive letter, for installation.  I'm not 100% certain this is the
right solution but it doesn't seem to break normal SDK builds.

---
 recipes/gcc/gcc-package-sdk.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index 0dc19c7..17d44a1 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -29,7 +29,7 @@ FILES_${PN}-doc = "\
     "
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install
+	oe_runmake 'DESTDIR=${D}' 'prefix=${prefix}' install
 
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-- 
1.5.6.3



