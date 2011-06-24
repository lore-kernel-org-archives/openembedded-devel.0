Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QaAsE-0007nY-QA
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 20:12:58 +0200
Received: by pwi1 with SMTP id 1so2108718pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 11:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ggvrvgS6kmAEeDOWPOtbCaudEZj1+acsBBgDELJ3fyw=;
	b=xFF5PPIS9aEcKIwg/G45FxtXOGOuZAw5/I2v6cmnT1uqi0y3AbFvtFq/rIRZ7ld1UN
	F1mrmCvxWhXatpWctKyrKtyvIPjm7P6x6HYDIbys0vhGqbd632BDbd9iSrAhOuJh6uQV
	JHSBc43IUbrD1MxJSm2C0pu21GMRHjIxqwRmw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=APjhpTQLf4q+qwaGp7WrwHF0o3vc3CiboNFHVYtOddy0Wbz4gPv62gzmdiijbUr1If
	5sDpfHEHVCF2S8fblAsq0LS/KhfX8HzqY/lEjTgsy/SuYRQVWnXkPb2v28ixFKaDM+pE
	7hRbDVULvHIvgRWkaXSZUVLuLGcY1eEKFwHh8=
Received: by 10.68.1.103 with SMTP id 7mr1933387pbl.81.1308938961145;
	Fri, 24 Jun 2011 11:09:21 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id b8sm2217515pbj.62.2011.06.24.11.09.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 11:09:19 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jun 2011 11:09:14 -0700
Message-Id: <1308938954-10349-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] initscripts: don't background volatile creation
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
X-List-Received-Date: Fri, 24 Jun 2011 18:12:59 -0000

From: Chris Larson <chris_larson@mentor.com>

This fix is courtesy Chris Hallinan. There is/can be assumptions made in
the volatiles file that they're processed in order (e.g. directory
created, then files within that directory), yet the script processes
them in parallel, backgrounding the operations. This is racy, and means
it's possible to end up with dependent files/dirs not created before the
bits that need them.

It's likely that this will have a performance impact, but I haven't
benchmarked it. Better that we behave correctly than quickly. We can
look back into improving the speed of this, without breaking
dependencies, in the future.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 .../initscripts-1.0/populate-volatile.sh           |   12 ++++++------
 recipes/initscripts/initscripts_1.0.bb             |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/populate-volatile.sh b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
index f0a45ea..d9ec1b7 100755
--- a/recipes/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
@@ -19,7 +19,7 @@ create_file() {
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-	  eval $EXEC &
+	  eval $EXEC
 	}
 }
 
@@ -34,7 +34,7 @@ mk_dir() {
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
-	  eval $EXEC &
+	  eval $EXEC
 	}
 }
 
@@ -46,7 +46,7 @@ link_file() {
 	[ -e "$2" ] && {
 	  echo "Cannot create link over existing -${TNAME}-." >&2
 	} || {
-	  eval $EXEC &
+	  eval $EXEC
 	}
 }
 
@@ -123,7 +123,7 @@ apply_cfgfile() {
       TSOURCE="$TLTARGET"
       [ -L "${TNAME}" ] || {
         [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-        link_file "${TSOURCE}" "${TNAME}" &
+        link_file "${TSOURCE}" "${TNAME}"
         }
       continue
       }
@@ -142,10 +142,10 @@ apply_cfgfile() {
 
     case "${TTYPE}" in
       "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-            create_file "${TNAME}" &
+            create_file "${TNAME}"
 	    ;;
       "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
-            mk_dir "${TNAME}" &
+            mk_dir "${TNAME}"
 	    # Add check to see if there's an entry in fstab to mount.
 	    ;;
       *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
index 87a0e99..adf8594 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 DEPENDS = "makedevs"
 RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPL"
-PR = "r128"
+PR = "r129"
 
 SRC_URI = "file://functions \
            file://halt \
-- 
1.7.5.4



