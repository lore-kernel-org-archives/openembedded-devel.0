Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsESs-0000ro-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:10 +0100
Received: by gyg13 with SMTP id 13so1297708gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=4NBYCSEmtBG7zQeHLuZy7/m7fz1RX3JPLb0xZKOXAKA=;
	b=UT2s3XiZcmHjdmsZNQUBYYTByhw1ats9/CEfyUKlNijgHAg0OfkSFxAZuzUJqptpVY
	LCVIKpZIzGSpotM05XFjYgsi0xYd1riywbv2hc3movpmfH82j2s3zgykVMioShJr8OAn
	fX1N3SmpzE+M3sgUSilR1b5cYJEvrB7sQLw4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=MM+Y5LluzcwDEnnQ0IFMQxI6i/mPIJxeL6VhHSzmP3fp8V3HSnxCauvfiGUxUDDSd+
	TAVwQC/pMZLAnRz4RoC3LeXgEe7yqTV8YEfQO0O0BRIvzC4f7UDKwK7lBlsLzupYDRBC
	WcEUyb9ICmQKIuHSAdT5CDsLpUOmUrxALYKIg=
Received: by 10.236.182.2 with SMTP id n2mr2154272yhm.17.1298466466457;
	Wed, 23 Feb 2011 05:07:46 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:07:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:12 +0000
Message-Id: <1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/14] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:10 -0000

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



