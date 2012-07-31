Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnf-0001Cv-1F
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:11 +0200
Received: by yenl13 with SMTP id l13so5795530yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=LcaEmMtHUut/zc+J3m/01wStW7CGTEuN4OCzhIIX11E=;
	b=jlCIi960PmxLbqW6h0LASEr2A6RW0VLH4uGk+owpQAWM8bRSTuvlqSbaDV0NmOzp+z
	jp15CWafY+3e6RtvliLBmYS125GdpI6q/ajc5fuhawh4Pfeiw0DwXwsIXqHK0Q3VgTCR
	WkoTQkwaTEVAW7aFaDRhYXn0cZiWLL4MYgr/kNXw+4J3dYED80j7d0fukihT616GWTxo
	JJPUcrLIM1bbSFkjfY35xrIe6vgXNsR80T3iFUewUZbgAtXWlLS6SOq6XNW0Ti8Xytm7
	t60OD3R24auRK30ZNMfeE/7x+fsRjaI2DxoAYuOWZ1E7WMYhCAtun0cFrUAT/QmZwYVm
	BZCg==
Received: by 10.66.81.232 with SMTP id d8mr34266677pay.66.1343760992958;
	Tue, 31 Jul 2012 11:56:32 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.31
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:15 -0700
Message-Id: <1343760977-3290-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 5/7] testlab.bbclass: Delete
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:11 -0000

This functionality is now provided by buildhistory as well.
so lets remove it in favor of that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/testlab.bbclass |  114 ---------------------------------------
 1 files changed, 0 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/classes/testlab.bbclass

diff --git a/meta-oe/classes/testlab.bbclass b/meta-oe/classes/testlab.bbclass
deleted file mode 100644
index c097e9e..0000000
--- a/meta-oe/classes/testlab.bbclass
+++ /dev/null
@@ -1,114 +0,0 @@
-#
-# Performs various tests and analysises on images
-#
-# Copyright (C) 2007, 2008 Koen Kooi <koen@openembedded.org> 
-
-# The current features are:
-# 1) dump a list of installed packages
-# 2) dump a list of sizes of installed packages
-# 3) dependency graphs of installed packages
-
-# See 
-#  * http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again
-#  * http://dominion.thruhere.net/koen/cms/package-relations-inside-images
-#  for use cases
-
-# TODO: 
-# * log information to a server for safekeeping
-# * use git notes to record this info into the scm
-# * add test suite to run on the target device 
-
-
-# Needs 'dot', 'opkg-cl'
-
-do_testlab() {
-if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" ] ; then
-
-	IPKG_TMP_DIR="${IMAGE_ROOTFS}-tmp"
-	IPKG_ARGS="-f ${STAGING_ETCDIR_NATIVE}/opkg.conf -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR}"
-
-	TESTLAB_DIR="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-testlab"
-        mkdir -p ${TESTLAB_DIR}/
-        mkdir -p ${IPKG_TMP_DIR}/
-	ls -laR ${IMAGE_ROOTFS} > ${TESTLAB_DIR}/files-in-image.txt 	
-     
-	echo > ${TESTLAB_DIR}/installed-packages.txt
-	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
-
-	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
-		name=`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"}'`
-		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
-		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'`
-		echo $name >>${TESTLAB_DIR}/installed-packages.txt
-
-    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do 
-        		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
-    		done
-    		
-		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Recom) ; do
-        		echo "$pkg OPP $recommends [style=dotted];" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Recom" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
-    		done
-	done
-
-	echo "}" >>  ${TESTLAB_DIR}/depends.dot
-	rm -rf ${IPKG_TMP_DIR}
-	
-	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TESTLAB_DIR}/depends-nokernel.dot
-	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
-	grep -v update_ ${TESTLAB_DIR}/depends-nokernel-nolibc.dot > ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot
-        grep -v kernel_module ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot > ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot
-
-	#dot has some library troubles when run under fakeroot, uncomment at your own risk
-	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies.png  ${TESTLAB_DIR}/depends.dot
-	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc.png ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
-	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot
-	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate-nomodules.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot
-
-	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do 
-     		du -k $(find ${DEPLOY_DIR_IPK} -name "$file") | head -n1
-	done | grep "\.ipk" | sed -e s:${DEPLOY_DIR_IPK}::g | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${TESTLAB_DIR}/installed-package-sizes.txt
-
-	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do
-		echo "`find ${DEPLOY_DIR_IPK} -name "$file" | xargs opkg-list-fields | grep ^License | sed -e 's/^.*:[ \t]*//g'`" '=' $(echo $file | awk -F_ '{print $1}')
-	done | awk -F= '{printf("%50s:%s\n", $1, $2)}' > ${TESTLAB_DIR}/installed-package-licenses.txt
-	# Log results to a git controlled directory structure than can be pushed to a remote location
-	if [ "${TESTLABLOG}" = "remote" ] && [ -n "${TESTLABREMOTEDIR}" ] ; then
-		TESTLABLOGDIR="${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
-		mkdir -p ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}
-		cp ${TESTLAB_DIR}/*package* ${TESTLAB_DIR}/depends.dot ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}
-		# force change to record builds where the testlab contents didn't change, but other things (e.g. git rev) did
-		echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}/build-id
-		echo "${@testlab_get_layers(bb, d)}" >> ${TESTLABREMOTEDIR}/${TESTLABLOGDIR}/build-id
-		# This runs inside fakeroot, so the git author is listed as root (or whatever root configured it to be) :(
-		( cd ${TESTLABREMOTEDIR}/
-		  git add ${TESTLABLOGDIR}/*
-		  git commit ${TESTLABLOGDIR}/ -m "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION} using branch ${METADATA_BRANCH} and revision ${METADATA_REVISION}" --author "testlab <testlab@${DISTRO}>" || true)
-	fi
-fi
-}
-
-IMAGE_POSTPROCESS_COMMAND += "  do_testlab ;"
-
-def testlab_get_layers(bb, d):
-	layers = (bb.data.getVar("BBLAYERS", d, 1) or "").split()
-	layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
-		base_get_metadata_git_branch(i, None).strip().strip('()'), \
-		base_get_metadata_git_revision(i, None)) \
-			for i in layers]
-	i = len(layers_branch_rev)-1
-	p1 = layers_branch_rev[i].find("=")
-	s1= layers_branch_rev[i][p1:]
-	while i > 0:
-		p2 = layers_branch_rev[i-1].find("=")
-		s2= layers_branch_rev[i-1][p2:]
-		if s1 == s2:
-			layers_branch_rev[i-1] = layers_branch_rev[i-1][0:p2]
-			i -= 1
-		else:
-			i -= 1
-			p1 = layers_branch_rev[i].find("=")
-			s1= layers_branch_rev[i][p1:]
-
-	layertext = "Configured Openembedded layers:\n%s\n" % '\n'.join(layers_branch_rev)
-	return layertext
-
-- 
1.7.5.4



