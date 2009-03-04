Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTm-0005OX-Gr
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:09 +0100
Received: (qmail 26589 invoked by uid 813007); 4 Mar 2009 15:53:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:42 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPa-0001DA-Io; Wed, 04 Mar 2009 16:53:34 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:27 +0100
Message-Id: <1236182004-4523-13-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 12/70] Drop pointless rpm_core class. (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:54 -0000

From: Richard Purdie <richard@openedhand.com>

---
 classes/rpm_core.bbclass |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)
 delete mode 100644 classes/rpm_core.bbclass

diff --git a/classes/rpm_core.bbclass b/classes/rpm_core.bbclass
deleted file mode 100644
index f28abbb..0000000
--- a/classes/rpm_core.bbclass
+++ /dev/null
@@ -1,16 +0,0 @@
-RPMBUILDPATH="${WORKDIR}/rpm"
-
-RPMOPTS="--rcfile=${WORKDIR}/rpmrc"
-RPMOPTS="--rcfile=${WORKDIR}/rpmrc --target ${TARGET_SYS}"
-RPM="rpm ${RPMOPTS}"
-RPMBUILD="rpmbuild --buildroot ${D} --short-circuit ${RPMOPTS}"
-
-rpm_core_do_preprpm() {
-	mkdir -p ${RPMBUILDPATH}/{SPECS,RPMS/{i386,i586,i686,noarch,ppc,mips,mipsel,arm},SRPMS,SOURCES,BUILD}
-	echo 'macrofiles:/usr/lib/rpm/macros:${WORKDIR}/macros' > ${WORKDIR}/rpmrc
-	echo '%_topdir ${RPMBUILDPATH}' > ${WORKDIR}/macros
-	echo '%_repackage_dir ${WORKDIR}' >> ${WORKDIR}/macros
-}
-
-EXPORT_FUNCTIONS do_preprpm
-addtask preprpm before do_fetch
-- 
1.6.1.3





