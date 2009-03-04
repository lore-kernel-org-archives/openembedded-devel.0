Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letas-0005dR-F3
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:14 +0100
Received: (qmail 28522 invoked by uid 813007); 4 Mar 2009 15:54:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:20 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQD-0001FY-4U; Wed, 04 Mar 2009 16:54:13 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:14 +0100
Message-Id: <1236182004-4523-60-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Rob Bradford <rob@openedhand.com>
Subject: [PATCH 59/70] package_rpm.bbclass: Don't use the system wide RPM macros. (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:15 -0000

From: Rob Bradford <rob@openedhand.com>

This fixes the build on Fedora 10 where the RPM system macros obliterate
the value of BuildRoot that is set in the spec file.
---
 classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 32e5f82..f6cb2c6 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -136,7 +136,7 @@ python write_specfile() {
 rpm_prep() {
 	if [ ! -e ${WORKDIR}/rpmrc ]; then
 		mkdir -p ${RPMBUILDPATH}/{SPECS,RPMS/{i386,i586,i686,noarch,ppc,mips,mipsel,arm},SRPMS,SOURCES,BUILD}
-		echo 'macrofiles:/usr/lib/rpm/macros:${WORKDIR}/macros' > ${WORKDIR}/rpmrc
+		echo 'macrofiles:${STAGING_DIR_NATIVE}/usr/lib/rpm/macros:${WORKDIR}/macros' > ${WORKDIR}/rpmrc
 		echo '%_topdir ${RPMBUILDPATH}' > ${WORKDIR}/macros
 		echo '%_repackage_dir ${WORKDIR}' >> ${WORKDIR}/macros
 	fi
-- 
1.6.1.3





