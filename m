Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhFsh-0003fC-6K
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 08:58:43 +0200
Received: by iym10 with SMTP id 10so6358492iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S0j2hkB81bNMEHJLgzp3pK65YotESfCfY9BQTlBWtVg=;
	b=uIs/RKEhYA0g72kxSqKLD7bwAy4hwmgmH9ROhURW5y40sL4YCjX9AjwRSY8mTS6Ap8
	iHPqTXu3CRByenSSv5LPu3EP5DpTsg6s7C9LjIbg7xvC4W8M49j/C7Q61be9xYHYlpV+
	eF4Ts9rL1EQxkr+TJX+k+KVgi7hmBxfAJFkeg=
Received: by 10.42.39.18 with SMTP id f18mr2203614ice.281.1310626483479;
	Wed, 13 Jul 2011 23:54:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm2623274icb.15.2011.07.13.23.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 23:54:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2011 23:54:38 -0700
Message-Id: <1310626478-31452-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] classes/testlab: Enhance to dump license information
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
X-List-Received-Date: Thu, 14 Jul 2011 06:58:43 -0000

It will now additionally create a new file which will
contain list of licenses of installed packages in a given
image.

The fix to get the package name is there because the packages
which contains epoch PE in the version string were not
being constructed correctly since opkg-cl would dump
'epoch:version' for Version string but the real ipk
did not have 'epoch' in its name. e.g.

for armv5te/libopkg0_0.1.8+svnr609-r2_armv5te.ipk

Package: libopkg0
Version: 1:0.1.8+svnr609-r2

as you can see version contained in ipk is not
containing the 'epoch'

so we have to eliminate 'epoch' from version we get from
opkg-cl to for the installed ipk name correctly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/testlab.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/testlab.bbclass b/meta-oe/classes/testlab.bbclass
index cd59782..fd37242 100644
--- a/meta-oe/classes/testlab.bbclass
+++ b/meta-oe/classes/testlab.bbclass
@@ -36,7 +36,10 @@ if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full"
 	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
 
 	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
-		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
+		name=`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"}'`
+		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
+		name=$name`opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'`
+		echo $name >>${TESTLAB_DIR}/installed-packages.txt
 
     		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do 
         		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
@@ -65,6 +68,9 @@ if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full"
      		du -k $(find ${DEPLOY_DIR_IPK} -name "$file") | head -n1
 	done | grep "\.ipk" | sed -e s:${DEPLOY_DIR_IPK}::g | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${TESTLAB_DIR}/installed-package-sizes.txt
 
+	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do
+		echo "`find ${DEPLOY_DIR_IPK} -name "$file" | xargs opkg-list-fields | grep ^License | sed -e 's/^.*:[ \t]*//g'`" '=' $file
+	done | awk -F= '{printf("%50s:%s\n", $1, $2)}' > ${TESTLAB_DIR}/installed-package-licenses.txt
 	# Log results to a git controlled directory structure than can be pushed to a remote location
 	if [ "${TESTLABLOG}" = "remote" ] && [ -n "${TESTLABREMOTEDIR}" ] ; then
 		TESTLABLOGDIR="${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
-- 
1.7.4.1



