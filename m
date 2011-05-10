Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoKA-0007DL-Oi
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:54:10 +0200
Received: by gxk3 with SMTP id 3so1570064gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=zFsO/OMyBqr06aKyV5FdGQZP200XWJEksM5A8ULiPYg=;
	b=hAvnTzJxuK8ckRq7qnNVsT94lrCDhr9cJtk9fOWnKpICTQPg6eKoSzGCmwaDC2bhYD
	5jIlg6mv3zE90+sjgQnqT1z1RHprwklFdArlorCqGcqIdLZzuSaYbLjZXU/1xlnKPHCq
	RPMtEvFFM3iQO3+18Np8au6Vv7aOllPJOlZzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pDvTJEv+OvwyguindVWRj9HYsAyf6HSwl5xHbZl2chPBlqkDz/FJyC2ZnmD4ZrEbT9
	Q0lv1vAVaqI2rvEUiEzi76sZp7bdIylcuUB5VLMPn1JPgcHTl+UUAIGqmpLQR7keZ7Rj
	wbn/M6L45KXvxU31+Tdctu3n+RUejNqFAOUKg=
Received: by 10.236.176.131 with SMTP id b3mr2882114yhm.29.1305039083953;
	Tue, 10 May 2011 07:51:23 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l73sm3147845yhn.98.2011.05.10.07.51.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:51:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:04 +0000
Message-Id: <1305039065-1326-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
References: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 3/4] qmake_base.bbclass: use using parallel staging dirs
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
X-List-Received-Date: Tue, 10 May 2011 14:54:10 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/qmake_base.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/qmake_base.bbclass b/meta-oe/classes/qmake_base.bbclass
index 654c7c8..aa8c05b 100644
--- a/meta-oe/classes/qmake_base.bbclass
+++ b/meta-oe/classes/qmake_base.bbclass
@@ -38,11 +38,11 @@ do_generate_qt_config_file() {
 	export QT_CONF_PATH=${WORKDIR}/qt.conf
 	cat > ${WORKDIR}/qt.conf <<EOF
 [Paths]
-Prefix = ${STAGING_DIR}
-Binaries = ${BUILD_SYS}${bindir_native}
-Headers = ${MACHINE}${prefix}/include/qt4
-Plugins = ${MACHINE}${prefix}/lib/qt4/plugins/
-Mkspecs = ${MACHINE}${prefix}/share/qt4/mkspecs/
+Prefix =
+Binaries = ${STAGING_BINDIR_NATIVE}
+Headers = ${STAGING_INCDIR}/qt4
+Plugins = ${STAGING_LIBDIR}/qt4/plugins/
+Mkspecs = ${STAGING_DATADIR}/qt4/mkspecs/
 EOF
 }
 
-- 
1.7.2.5



