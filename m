Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CY-0003B6-QP
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:44 +0200
Received: by pwj1 with SMTP id 1so1296945pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=li9dj6FvC0GLDTpYFyiuLBmIXNMuQ/HmtMTrkQY4qVc=;
	b=eb/8hJeuoWU3OcJdJZt6laMnMnwp+s291bbhctiaIxCl2WZDLaGh30/4+cffflG8Nj
	Ub8H4YyYUOchzepI/TD6GQELjeeJJMdTrT/wToOHkQKMq4H9n3BcT4/zz6187CG1MQKQ
	eYSNAZVkY6D7C/9qlSUfsA0a1Dn/A2hJFPkzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r0wRn/PxKRxGGYrIx6Jx8+s1Z+Lmc/gbFY0MWt49iJC880tS50/nmKyigujnn4wyIO
	x9E3mkXGs+4vQnvJuzAf0LfeC+6PBvfvYC7TKzB3NA1A27d74zIw9XM8TT12X9xwB0cI
	G8FIDq3+aNJapD2ag1dT2orC3rZDSnXmz2Mfg=
Received: by 10.142.230.4 with SMTP id c4mr9871767wfh.53.1286264661022;
	Tue, 05 Oct 2010 00:44:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:44:01 -0700
Message-Id: <1286264643-6352-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/6] cross.bbclass, staging.bbclass, utils.bbclass: With sysroot support in libtool, its not needed to edit .la files
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass   |    7 -------
 classes/staging.bbclass |   15 ---------------
 classes/utils.bbclass   |   13 +------------
 3 files changed, 1 insertions(+), 34 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index d3b27e6..e802cfe 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -72,10 +72,3 @@ sysroot_stage_all() {
 		sysroot_stage_libdir ${SYSROOT_DESTDIR}${target_libdir} ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}
 	fi
 }
-
-#
-# Cross .la files have more path issues we have to correct
-SYSROOTEXTRALIBDIRSED = '-e "/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g" \
-                         -e "/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g" \
-'
-
diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index 303f74c..14bb1f8 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -38,24 +38,9 @@ sysroot_stage_dir() {
 	fi
 }
 
-SYSROOTEXTRALIBDIRSED ?= ""
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
-		sed -e 's/^installed=yes$/installed=no/' \
-		    -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),${STAGING_LIBDIR}/\1,g' \
-		    -e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${STAGING_LIBDIR},g" \
-		    ${SYSROOTEXTRALIBDIRSED} \
-		    -i $src/$i
-	done
 	sysroot_stage_dir $src $dest
 }
 
diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 61f3731..9050d30 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -369,18 +369,7 @@ oe_libinstall() {
 		__runcmd install -m 0644 $dota $destpath/
 	fi
 	if [ -f "$dotlai" -a -n "$libtool" ]; then
-		if test -n "$staging_install"
-		then
-			# stop libtool using the final directory name for libraries
-			# in staging:
-			__runcmd rm -f $destpath/$libname.la
-			__runcmd sed -e 's/^installed=yes$/installed=no/' \
-				     -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),${STAGING_LIBDIR}/\1,g' \
-				     -e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${STAGING_LIBDIR},g" \
-				     $dotlai >$destpath/$libname.la
-		else
-			__runcmd install -m 0644 $dotlai $destpath/$libname.la
-		fi
+		__runcmd install -m 0644 $dotlai $destpath/$libname.la
 	fi
 
 	for name in $library_names; do
-- 
1.7.1



