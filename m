Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOP-0007E5-1K
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:21 +0100
Received: by mail-gw0-f47.google.com with SMTP id 18so96740gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=rszztLN9hSRw8sKM8E/O08JrQxK6pIvOJ84Ci08Dr5k=;
	b=yHF/bkA9iyezLzZJadH1jh7PYKFJwTlXC09qz8qgje0md3tgMzgI8ooHEyY4yimgUu
	ZfwopGP7SKUcYdHO2in8HftT/Xg4msf7fEcBh3YQS8amfm4b4X2zMZwebwzo2sQ0+dS8
	JDuojdimVY2NbobSfA+b2Gvf9b7bkaoUVTeqg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=E6je35i9+YUWBt95MA+z3tWpAdYrAA+dl5EsjAsTljnJhSvAnBp/Xw2w6JNEiRjbqh
	KPIerCPUgmm/oOvG9cVVhMnnqdc6Ek+UFZVdvyB9WksrdylYqDlRhjhDUmuzGw8dVeQ9
	y43MhyJnJr3D5svlVedADjvRQZpinULA3cOY4=
Received: by 10.151.77.13 with SMTP id e13mr1383025ybl.426.1298051049295;
	Fri, 18 Feb 2011 09:44:09 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:24 +0000
Message-Id: <1298051011-10445-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/16] qt4-tools-sdk: use host include headers for dbus
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/qt4/qt4-tools-sdk.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt4-tools-sdk.inc b/recipes/qt4/qt4-tools-sdk.inc
index ad896e4..bd70046 100644
--- a/recipes/qt4/qt4-tools-sdk.inc
+++ b/recipes/qt4/qt4-tools-sdk.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "LGPLv2.1 GPLv3"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG =. "qt-${PV}:"
 inherit sdk
@@ -32,9 +32,9 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release -fast -static \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
-                -I${STAGING_DIR_NATIVE}/usr/include \
-                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
+                -I${STAGING_DIR}/${HOST_SYS}${target_includedir} \
+                -I${STAGING_DIR}/${HOST_SYS}${target_includedir}/dbus-1.0 \
+                -I${STAGING_DIR}/${HOST_SYS}${target_libdir}/dbus-1.0/include"
 
 # yank default -e, otherwise we get the following error:
 # moc_qbuffer.cpp: No such file or directory
-- 
1.7.2.3



