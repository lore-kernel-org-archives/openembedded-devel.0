Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW0M-0002rv-DD
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:31 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2074894gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=lKAWV8U0HGKln4QbSE/29eth+4EkaXgHGqwbb+lxpyk=;
	b=Sv5Q9D/9WY5wSCS5Ew/MOLUWFogIF6Fhg+5kkdtgksguISA+uIEJhX7LRNHDHwgGvk
	uV68SCh/AM7O5laiicg0ZfWIPtVBPW1h0QOM4JYNLHqkWEWGCcKT4wvP6R0VdTYeDsKF
	Sil90rDHiHwyS8/mkFyVl7hdAD6zVlqYTfnzo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=UKv7tO99gQpbAdlM5jdFDwldDbPslItQ1/uGJBk3hNA1ohliN9qg5yg4GyUvTp17z6
	28BXtA3+50RXO8Ci9TQJMUFO1OJCFI08jG3gBq1V1k9Ylm5vpZe+SK7XueeCnxS7VbMo
	oAgvLo3OD9LphpnV4WFFz3HxFOeX4gTNoSR7Y=
Received: by 10.150.183.10 with SMTP id g10mr6003197ybf.61.1304968667872;
	Mon, 09 May 2011 12:17:47 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:57 +0000
Message-Id: <1304968617-4949-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 12/12] qmake_base.bbclass: sync with oe-core class
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
X-List-Received-Date: Mon, 09 May 2011 19:20:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/qmake_base.bbclass |   26 ++++++++++++++++++++------
 1 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/qmake_base.bbclass b/meta-oe/classes/qmake_base.bbclass
index 577c0fa..654c7c8 100644
--- a/meta-oe/classes/qmake_base.bbclass
+++ b/meta-oe/classes/qmake_base.bbclass
@@ -1,6 +1,6 @@
 
 OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
-QMAKESPEC = "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
+QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
 
 # We override this completely to eliminate the -e normally passed in
 EXTRA_OEMAKE = ' MAKEFLAGS= '
@@ -34,6 +34,20 @@ oe_qmake_mkspecs () {
     done
 }
 
+do_generate_qt_config_file() {
+	export QT_CONF_PATH=${WORKDIR}/qt.conf
+	cat > ${WORKDIR}/qt.conf <<EOF
+[Paths]
+Prefix = ${STAGING_DIR}
+Binaries = ${BUILD_SYS}${bindir_native}
+Headers = ${MACHINE}${prefix}/include/qt4
+Plugins = ${MACHINE}${prefix}/lib/qt4/plugins/
+Mkspecs = ${MACHINE}${prefix}/share/qt4/mkspecs/
+EOF
+}
+
+addtask generate_qt_config_file after do_patch before do_configure
+
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
 	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
@@ -42,7 +56,7 @@ qmake_base_do_configure() {
 		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
 		;;
 	*)
-		oenote Searching for qmake spec file
+		bbnote Searching for qmake spec file
 		paths="${QMAKE_MKSPEC_PATH}/qws/${TARGET_OS}-${TARGET_ARCH}-g++"
 		paths="${QMAKE_MKSPEC_PATH}/${TARGET_OS}-g++ $paths"
 
@@ -58,7 +72,7 @@ qmake_base_do_configure() {
 		;;
 	esac
 
-	oenote "using qmake spec in ${QMAKESPEC}, using profiles '${QMAKE_PROFILES}'"
+	bbnote "using qmake spec in ${QMAKESPEC}, using profiles '${QMAKE_PROFILES}'"
 
 	if [ -z "${QMAKE_PROFILES}" ]; then 
 		PROFILES="`ls *.pro`"
@@ -73,15 +87,15 @@ qmake_base_do_configure() {
 	if [ ! -z "${EXTRA_QMAKEVARS_POST}" ]; then
 		AFTER="-after"
 		QMAKE_VARSUBST_POST="${EXTRA_QMAKEVARS_POST}"
-		oenote "qmake postvar substitution: ${EXTRA_QMAKEVARS_POST}"
+		bbnote "qmake postvar substitution: ${EXTRA_QMAKEVARS_POST}"
 	fi
 
 	if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
 		QMAKE_VARSUBST_PRE="${EXTRA_QMAKEVARS_PRE}"
-		oenote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
+		bbnote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
 	fi
 
-#oenote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
+#bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
 	unset QMAKESPEC || true
 	${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling ${OE_QMAKE_QMAKE} on $PROFILES"
 }
-- 
1.7.2.5



