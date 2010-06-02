Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujJ-00031V-Ku
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:09 +0200
Received: by mail-pz0-f193.google.com with SMTP id 31so3241572pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9aaT96+cy7nTYy1ohj9v5KOMpj7bT8thH7+PJdTz/k8=;
	b=vSCW4z3qin7nEM8wUlCZ4zu4C1K93n0VqXpF9jp1jyDFp4HqaTdjFnmX76olUMEeXX
	sPikY6t+6HpNqIRNXKz5pF/rvraSuPxnKDjWQ1dZ0h4szEWyjJV8Xa45L4LQmMlQ+aza
	g4qmLXcBtgdLzUpDYmfytyATyKgWKWqJUlY28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UsD1HH9XNrY/X6aMugZdEyl/FM7MUx3G0K8bg0baZb1WavVFS/fygv9mBoChe8spfL
	lt3AEDiYiT9nHDkP8RscaWMfuoTt8viMMHViF6hrBM1rAOD4UZ+CYCB5tggHLLvFbd5+
	LaJBXx7eDcXoGJX4k2qDuqzPWjDeX2zrhNeg4=
Received: by 10.143.26.28 with SMTP id d28mr5446696wfj.103.1275510948443;
	Wed, 02 Jun 2010 13:35:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:53 -0700
Message-Id: <1275510896-30845-14-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 13/16] ncurses: Add -fforward-propagate on arm.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:40:09 -0000

* Needed on -O1 compile. Generally we use -Os where
  this option is already enabled. But we enable is anyway
  so it gets picked at -O1 too which we use with DEBUG builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/ncurses/ncurses.inc    |   11 ++++++-----
 recipes/ncurses/ncurses_5.4.bb |    2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes/ncurses/ncurses.inc b/recipes/ncurses/ncurses.inc
index bfecfff..337d670 100644
--- a/recipes/ncurses/ncurses.inc
+++ b/recipes/ncurses/ncurses.inc
@@ -30,6 +30,12 @@ export BUILD_CCFLAGS = "-I${S}/ncurses -I${S}/include ${BUILD_CFLAGS}"
 export BUILD_LDFLAGS = ""
 export EXTRA_OEMAKE = '"BUILD_LDFLAGS=" "BUILD_CCFLAGS=${BUILD_CCFLAGS}"'
 
+# Below option is added to overcome the GCC bug on ARM
+# see http://gcc.gnu.org/PR42981 for further details.
+# We could potentially take it off when its fixed in gcc 4.5
+
+CFLAGS_append_arm = " -fforward-propagate "
+
 # This is necessary so that the "tic" command executed during the install can
 # link with the correct libary in staging.
 export LD_LIBRARY_PATH = "${STAGING_LIBDIR_NATIVE}"
@@ -70,16 +76,12 @@ do_install() {
 		mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
 	fi
 }
-		
-		
 pkg_postinst_ncurses-tools () {
 	if [ "${PN}" = "ncurses" ]; then
 		update-alternatives --install ${bindir}/clear clear clear.${PN} 100
 		update-alternatives --install ${bindir}/reset reset reset.${PN} 100
 	fi
 }
-				
-			
 pkg_prerm_ncurses-tools () {
 	if [ "${PN}" = "ncurses" ]; then
 		update-alternatives --remove clear clear.${PN}
@@ -110,7 +112,6 @@ FILES_${PN}-tools = "\
 FILES_${PN}-terminfo = "\
   ${datadir}/terminfo \
 "
-  
 RSUGGESTS_${PN} = "ncurses-terminfo"
 RPROVIDES_${PN} = "libncurses5"
 RCONFLICTS_${PN} = "libncurses5"
diff --git a/recipes/ncurses/ncurses_5.4.bb b/recipes/ncurses/ncurses_5.4.bb
index a6aed6d..8c0f62c 100644
--- a/recipes/ncurses/ncurses_5.4.bb
+++ b/recipes/ncurses/ncurses_5.4.bb
@@ -1,4 +1,4 @@
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz \
            file://makefile_tweak.patch \
-- 
1.7.0.4



