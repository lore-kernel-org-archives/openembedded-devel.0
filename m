Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fZK-0004dK-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:46:53 +0200
Received: by mail-pw0-f47.google.com with SMTP id 1so39052pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=srai+szyhPRR0Si87G3+MBubb5LsQvjDCRBBN0dLvFw=;
	b=tcEyuId/QyyE+umqEk5J9cq4WNHsLQkWxwZS4axnYu0agqWv6kNO0lQGtU4gEuWeo8
	VighuiJ3WQ5leZ7A/o9voO2jgBnF7OcVxZ+iOxu4tJatYF2ZQ96M5Jajcf84DR5L1jPG
	xxEWOQT/QEtrfpk4jMkiV5Gd7JKQuy07LfHhA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mNMxX4+dcNalIC9E6GaIiDtXUHYqw+69Zvibv+nlk5oNzMyanEE5Z+/71VYIzb5Uqm
	fMbnCPPjBejWO3ApJIzEv+m0fHajk/+zLqYDar3nifRYeZZ0f87eVeBcES5eyfjTaX/P
	EUGFRfWI0pc+v4uqxJ9TcKZgcEXa1qsYf0bW0=
Received: by 10.114.110.16 with SMTP id i16mr50656wac.208.1286415990548;
	Wed, 06 Oct 2010 18:46:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm2413207waj.10.2010.10.06.18.46.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 18:46:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 18:46:09 -0700
Message-Id: <1286415971-9960-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, V2 4/6] cross.bbclass, staging.bbclass, utils.bbclass: Make sure that .la munging is not done for libtool > 2.4
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
X-List-Received-Date: Thu, 07 Oct 2010 01:46:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass   |    7 +++----
 classes/staging.bbclass |   19 ++++++++++---------
 classes/utils.bbclass   |    2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index d3b27e6..1a6d906 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -74,8 +74,7 @@ sysroot_stage_all() {
 }
 
 #
-# Cross .la files have more path issues we have to correct
-SYSROOTEXTRALIBDIRSED = '-e "/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g" \
-                         -e "/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g" \
-'
+# Cross .la files have more path issues we have to correct only for libtool < 2.4
+SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
 
+SYSROOTEXTRALIBDIRSED = "${@["${SYSROOTEXTRALIBDIRSED_OLD}",""][("${LIBTOOL_HAS_SYSROOT}" == "yes")]}"
diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index 303f74c..3f4ff8c 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -42,20 +42,21 @@ SYSROOTEXTRALIBDIRSED ?= ""
 sysroot_stage_libdir() {
 	src="$1"
 	dest="$2"
-
-	olddir=`pwd`
-	cd $src
-	las=$(find . -name \*.la -type f)
-	cd $olddir
-	echo "Found la files: $las"		 
-	for i in $las
-	do
+	if [ "${LIBTOOL_HAS_SYSROOT}" = "no" ]; then
+	    olddir=`pwd`
+	    cd $src
+	    las=$(find . -name \*.la -type f)
+	    cd $olddir
+	    echo "Found la files: $las" 
+	    for i in $las
+	    do
 		sed -e 's/^installed=yes$/installed=no/' \
 		    -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),${STAGING_LIBDIR}/\1,g' \
 		    -e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${STAGING_LIBDIR},g" \
 		    ${SYSROOTEXTRALIBDIRSED} \
 		    -i $src/$i
-	done
+	    done
+	fi
 	sysroot_stage_dir $src $dest
 }
 
diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 61f3731..f7d6996 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -369,7 +369,7 @@ oe_libinstall() {
 		__runcmd install -m 0644 $dota $destpath/
 	fi
 	if [ -f "$dotlai" -a -n "$libtool" ]; then
-		if test -n "$staging_install"
+		if [ -n "$staging_install" -a "${LIBTOOL_HAS_SYSROOT}" = "no" ]
 		then
 			# stop libtool using the final directory name for libraries
 			# in staging:
-- 
1.7.1



