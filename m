Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1Rrnrf-000262-Rq
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 10:49:31 +0100
Received: by werc1 with SMTP id c1so3197425wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 01:41:39 -0800 (PST)
Received: by 10.216.131.100 with SMTP id l78mr6844034wei.44.1327916499198;
	Mon, 30 Jan 2012 01:41:39 -0800 (PST)
Received: from bfg9000.internal.dresearch-fe.de
	(pd95cb146.dip0.t-ipconnect.de. [217.92.177.70])
	by mx.google.com with ESMTPS id d9sm28915173wiy.2.2012.01.30.01.41.36
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 01:41:38 -0800 (PST)
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 10:41:22 +0100
Message-Id: <1327916482-16069-1-git-send-email-fromm@dresearch-fe.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
Cc: Thilo Fromm <github@thilo-fromm.de>
Subject: [PATCH][meta-java] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Mon, 30 Jan 2012 09:49:31 -0000

    This patch works around a max shebang length issue
    in llvm's llvm-config.

    llvm-config is a perl script. meta-java configures
    the llvm sources to use OE's perl which might reside in
    a path longer than 127 chars. llvm's perl script
    will then have a shebang line longer than 127 characters.
    This will break the script.
    In linux, shebang interpreter paths are cut off after 127 bytes.

    meta-java's llvm recipe already wraps the perl script llvm-config
    with a small shell script. This patch adds an explicit perl
    interpreter call to this wrapping shell script.

Signed-off-by: Thilo Fromm <github@thilo-fromm.de>
---
 recipes-core/llvm/llvm-common.bb          |   12 ++++++++++++
 recipes-core/llvm/llvm-common/llvm-config |    2 +-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/recipes-core/llvm/llvm-common.bb b/recipes-core/llvm/llvm-common.bb
index 38ca1ee..3db4af0 100644
--- a/recipes-core/llvm/llvm-common.bb
+++ b/recipes-core/llvm/llvm-common.bb
@@ -4,8 +4,20 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
                    "
 
+# provide native perl binaries via PATH
+inherit perlnative
+DEPENDS += "perl-native"
+
 SRC_URI = "file://llvm-config"
 
+do_compile() {
+  cd ..
+  # This adds an explicit call to the interpreter in the wrapper script
+  #  so we don't run into shebang max size issues in the llvm-configX.X perl script
+  #  if the path to perl-native > 127 chars.
+  sed -i -e "s|@PATH_TO_PERL@|`which perl`|" llvm-config
+}
+
 do_install() {
   install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
   install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
diff --git a/recipes-core/llvm/llvm-common/llvm-config b/recipes-core/llvm/llvm-common/llvm-config
index a9a416d..08463e5 100644
--- a/recipes-core/llvm/llvm-common/llvm-config
+++ b/recipes-core/llvm/llvm-common/llvm-config
@@ -2,7 +2,7 @@
 # Wrapper script for real llvm-config. Simply calls
 
 if [ $WANT_LLVM_RELEASE ]; then
-	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
+	exec "@PATH_TO_PERL@" `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
 else
   echo "The variable WANT_LLVM_RELEASE is not defined and exported"
 	echo "by your build recipe. Go figure."
-- 
1.7.5.4



