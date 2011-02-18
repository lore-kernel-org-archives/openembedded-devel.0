Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUP2-0007Fw-Ut
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:46:01 +0100
Received: by yxa15 with SMTP id 15so353460yxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=4NBYCSEmtBG7zQeHLuZy7/m7fz1RX3JPLb0xZKOXAKA=;
	b=vVqp3VmzNYVsn5SUiX9lnYX+lJjEVa+DxfajoW+sBRDq3kZRetM5hOMB6yZAuByu6a
	aTnhk7xyZBKabSDDMmRIB14HGZ1dqV/z9NL8jR1KC1aSKutOp9eczPsSR22/zRJi6eEl
	2bYGtw5JrwakV4C15r8OMd/dWnfk0mpwurOk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=E9nVavgxj7Jlcur7cLVOPUb874muWmcPLIPHOlqldTmtr3Mrgtu7ElJT98flcqPqRV
	o8URGm97uG2x8uakrzwTp0oV9/6xLtW+19wC8cE203rSHOhpTakhVATnwQWqvayr0Qp7
	T3uj3RLvdggbibAJumogS/X2U6jWiisSBZDQA=
Received: by 10.236.110.133 with SMTP id u5mr1867318yhg.26.1298051051643;
	Fri, 18 Feb 2011 09:44:11 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:25 +0000
Message-Id: <1298051011-10445-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/16] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Fri, 18 Feb 2011 17:46:01 -0000

This writes a qt.conf inside WORKDIR to properly configure projects
based on CMake. This is required since qmake variables (returned by
-query command) are fixed into the binary and can only be changed
using a qt.conf file.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake_base.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/classes/qmake_base.bbclass b/classes/qmake_base.bbclass
index cf905a7..cc3297c 100644
--- a/classes/qmake_base.bbclass
+++ b/classes/qmake_base.bbclass
@@ -34,6 +34,20 @@ oe_qmake_mkspecs () {
     done
 }
 
+do_generate_qt_config_file() {
+	export QT_CONF_PATH=${WORKDIR}/qt.conf
+	cat > ${WORKDIR}/qt.conf <<EOF
+[Paths]
+Prefix = ${STAGING_DIR}
+Binaries = ${BUILD_SYS}${bindir_native}
+Headers = ${BASEPKG_HOST_SYS}${layout_prefix}/include/qt4
+Plugins = ${BASEPKG_HOST_SYS}${layout_prefix}/lib/qt4/plugins/
+Mkspecs = ${BASEPKG_HOST_SYS}${layout_prefix}/share/qt4/mkspecs/
+EOF
+}
+
+addtask generate_qt_config_file after do_patch before do_configure
+
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
 	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++|*linux-gnuspe-oe-g++|*linux-uclibcspe-oe-g++)
-- 
1.7.2.3



