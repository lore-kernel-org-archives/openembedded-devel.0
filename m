Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ot1mK-0006hE-H9
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 19:16:17 +0200
Received: by yxk30 with SMTP id 30so2077264yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=24sDU76LavlQ/1vmdEvo0eycV8132bMrisHt17nMR1M=;
	b=WwI8V4csCH7E15cS2nem6qOLy/PWPiSnV1DEEYma4jguLUK/X33GI/NKS68uEfFtoa
	rA7cntq17iL2Y8RJpYO69I0AKLe2Rog3dSNRJIAVxKfbafvXLLYEZ0fgAG/s/0L3DBNr
	9TigSvF1jF92mrH6jYiuA6IEYKaZtj/jdY1XU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FgkjI1Lp3dYtJXDh30nLsQmv9SwUb72Oaa7/cssxV6r1D80oPbjGGumLZgFNz27LHJ
	klDhiEWhRVpvovMeF+FRi8uF+ojVfLMx0z8PXXlBPkuzHhxOjhnvqi187tUcHTNK/7Lv
	8H3nq5qC+7akDSeIo9bhlE9Vyo0w5VupuoHf4=
Received: by 10.100.41.9 with SMTP id o9mr358014ano.240.1283879735209;
	Tue, 07 Sep 2010 10:15:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f22sm11771418anh.4.2010.09.07.10.15.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 10:15:34 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 12:05:44 -0500
Message-Id: <1283879144-9127-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sourceipk: make extra files inclusion optional
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
X-List-Received-Date: Tue, 07 Sep 2010 17:16:17 -0000

* Make the inclusion of the README and recipe files optional
  for source ipks.  For some packages the sources owner may not
  want these additional files added to their sources.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/sourceipk.bbclass |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 4957e4a..182785b 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -14,6 +14,9 @@
 #   - SRCIPK_PACKAGE_ARCH   = This variable allows specific recipies to
 #                             specify an architecture for the sourcetree
 #                             package is "all" is not appropriate
+#   - SRCIPK_INC_EXTRAFILES = When set to 1 this variable indicates that
+#                             the source ipk should contain extra files
+#                             such as the README file and recipe.
 #
 # The default installation directory for the sources is:
 #   /usr/src/${PN}-src
@@ -47,6 +50,9 @@ SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
 # Default PACKAGE_ARCH for sources is "all"
 SRCIPK_PACKAGE_ARCH ?= "all"
 
+# Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
+SRCIPK_INCLUDE_EXTRAFILES ?= "1"
+
 # Create a README file that describes the contents of the source ipk
 sourceipk_create_readme() {
     readme="$1/README.${PN}-src"
@@ -91,7 +97,6 @@ sourceipk_do_create_srcipk() {
             srcuri="OpenEmbedded"
         fi
         echo "Source: $srcuri" >> $control_file
-
         #Write the control tarball
         tar -C $tmp_dir/CONTROL --owner=0 --group=0 -czf $srcipk_dir/control.tar.gz .
 
@@ -101,8 +106,12 @@ sourceipk_do_create_srcipk() {
         # Copy sources for packaging
         mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
         cp -rLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
-        sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
-        cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
+
+        if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
+        then
+            sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
+            cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
+        fi
 
         #Write the data tarball
         tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
-- 
1.7.0.4



