Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS64-0005cR-Fg
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ceVDC2/PZv82ucEUe+yIdOdXkjG6D7457vypsrV2pxI=;
	b=MMdkwT8oWhyOG1Lm3AMINFskh3+AAod80ltOjsF09c2W4WuEELAPONwOS5sEbY3rUF
	Wv8HF13QsyqXkAXAza14CfGRcWlRmZEXKJOvsrbQE1FSFQTrWIhoHH4hlT9mm9XZGU5O
	hq/q52At0qEGt6BwVa6BJlvDBs8KVxjCJD4p8EpPCQRsotCRyUWmW+0+5MQq3n1+0x3r
	Sbs+OdP9XZU42sh9EgLAvJ9cJfwxIy5cOHcADmEiJv7SRwNv/J1rD3LKkTY0lExbLiji
	HELca3K7y9YcYZ4+Cw91nNXpw36P1kb+ts/UB18Q09ZCcckpo40P5EwjnJeXOi0UWCNR
	RIAw==
Received: by 10.14.221.5 with SMTP id q5mr61747617eep.33.1354048524331;
	Tue, 27 Nov 2012 12:35:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm42296999eep.16.2012.11.27.12.35.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:49 +0100
Message-Id: <e89708a2105e78b9f14a2186e798adf0ee43cca3.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/21] e-wm: add work around for illume2 issues from r78978
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 615e0f2..3faa387 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r7"
+PR = "r8"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -46,6 +46,13 @@ do_install_append() {
     install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
     for I in `find ${D}/${libdir}/enlightenment -name "*.a" -print`; do rm -f $I; done
     for I in `find ${D}/${libdir}/enlightenment -name "*.la" -print`; do rm -f $I; done
+
+    # work around for issue caused in r78978, more infor in:
+    # http://sourceforge.net/mailarchive/forum.php?thread_name=20121118194904.GA3438%40jama.jama.net&forum_name=enlightenment-devel
+    mv ${D}/${libdir}/enlightenment/modules/policies ${D}/${libdir}/enlightenment/modules/illume2/ \
+      || echo "illume2 policies are in correct place now"
+    mv ${D}/${libdir}/enlightenment/modules/keyboards ${D}/${libdir}/enlightenment/modules/illume2/ \
+      || echo "illume2 keyboards are in correct place now"
 }
 
 RDEPENDS_${PN} += "\
-- 
1.8.0



