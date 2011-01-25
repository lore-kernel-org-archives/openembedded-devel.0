Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMm-00058c-Oo
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:27:01 +0100
Received: by mail-px0-f175.google.com with SMTP id 17so939967pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=x0Lc8adNanj5w55wO1tl0e9oJnAe+hxARbgtaqtKnR8=;
	b=MzBBOt3drdzgJyOAGDpmZftOtliTpHR5pzOUL52tDtWIQ2zlZSD3p83rFJHJNXe7lQ
	GUiyQGV0InrZNf/z9L6vroH30ckOl2aUmiWPWRKv3HFsg72Q1T0QSodJZQ5L0F+URcjt
	x+YC3vV5ZSCV47rukQtIpotC/wDIFN19XQyCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ITYhSWFV0uSns35sTxjwOeM7Ei3xDQfev/O91mDyqrklFAK2v1mkoUIexf1OZ66Us7
	/ppAUaUnmgPyRkQzxpP/FGz+D9fsQKKz2HnRx5imVXDEqaxuAriZnNSEybDYb8DYuVsS
	aTE9sz/+P81Fe1AbGzV4gBHzY1/lIAWfjG/nM=
Received: by 10.142.188.2 with SMTP id l2mr4802030wff.4.1295936776641;
	Mon, 24 Jan 2011 22:26:16 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.26.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:26:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:43 -0800
Message-Id: <1295936745-718-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 7/9] angstrom/personal-feed.sh, angstrom/sort.sh: Replace ipkg-make-index with opkg-make-index
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
X-List-Received-Date: Tue, 25 Jan 2011 06:27:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/angstrom/personal-feed.sh |    2 +-
 contrib/angstrom/sort.sh          |   10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/angstrom/personal-feed.sh b/contrib/angstrom/personal-feed.sh
index 1951c27..2896ec6 100644
--- a/contrib/angstrom/personal-feed.sh
+++ b/contrib/angstrom/personal-feed.sh
@@ -45,7 +45,7 @@ echo "Starting rsync..."
 rsync -vz --partial --copy-links --progress --files-from=files-trans upload-queue/ personal-feed/
 
 echo "Generating index for your personal feed..."
-( cd personal-feed ; PATH=$PATH:$(find ../../../sysroots/$(uname -m)* -name "ipkg-make-index" | sed s:/ipkg-make-index::g) ipkg-make-index -p Packages -m . >& /dev/null )
+( cd personal-feed ; PATH=$PATH:$(find ../../../sysroots/$(uname -m)* -name "opkg-make-index" | sed s:/opkg-make-index::g) opkg-make-index -p Packages -m . >& /dev/null )
 
 
 # Clean up temporary files
diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index e879d8c..893d928 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -164,7 +164,7 @@ for i in ../* ; do
   if [ -d $i ]; then
       cd $i
       echo -n "building index for $i:" |sed s:\.\./::
-      ${ipkg_tools_path}/ipkg-make-index -m -p Packages -l Packages.filelist  -L ../locales  . >& /tmp/index-log
+      ${ipkg_tools_path}/opkg-make-index -m -p Packages -l Packages.filelist  -L ../locales  . >& /tmp/index-log
       echo " DONE"
   fi
 done
@@ -175,7 +175,7 @@ echo -n "building index for locales:"
 for i in ../* ; do
   if [ -d $i ]; then
    echo -n " $i" |sed s:\.\./::
-   ${ipkg_tools_path}/ipkg-make-index -m -p Packages -l Packages.filelist . >& /dev/null;
+   ${ipkg_tools_path}/opkg-make-index -m -p Packages -l Packages.filelist . >& /dev/null;
    cd $i
   fi
  done
@@ -189,7 +189,7 @@ for i in ./* ; do
   if [ -d $i ]; then
      cd $i
      echo -n "building index for machine $i:"
-     ${ipkg_tools_path}/ipkg-make-index -m -p Packages -l Packages.filelist . >& /dev/null
+     ${ipkg_tools_path}/opkg-make-index -m -p Packages -l Packages.filelist . >& /dev/null
      echo " DONE"
      cd ../
   fi
@@ -200,10 +200,10 @@ cd ${BPWD}
 
 echo "Processing 'all' feed"
 for i in `find . -name  "*.ipk"| grep _all` ; do mkdir -p ../all/ || true ;mv $i ../all/ ; done
- (mkdir -p ../all ; cd ../all && ${ipkg_tools_path}/ipkg-make-index -p Packages -m . >& /dev/null ; touch Packages.sig )
+ (mkdir -p ../all ; cd ../all && ${ipkg_tools_path}/opkg-make-index -p Packages -m . >& /dev/null ; touch Packages.sig )
 
 mkdir -p ../sdk ; mv *sdk.ipk ../sdk/ || true
- (mkdir -p ../sdk ; cd ../sdk && ${ipkg_tools_path}/ipkg-make-index -p Packages -m . >& /dev/null ; touch Packages.sig )
+ (mkdir -p ../sdk ; cd ../sdk && ${ipkg_tools_path}/opkg-make-index -p Packages -m . >& /dev/null ; touch Packages.sig )
 
 for arch in 486sx armv4t armv4 armv5teb armv5te armv6-novfp armv6 armv7a-vfp armv7a avr32 bfin geode i486 i586 i686 iwmmxt mips mipsel powerpc ppc405 ppc440e ppc603e ppce300c2 ppce300c3 ppce500v2 ppce500 ppce600 sh4 sparc x86_64 x86; do
 	do_sort
-- 
1.7.0.4



