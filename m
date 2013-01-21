Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxEDl-00076q-8Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 11:03:18 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so3533477wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 01:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3FMrvBATp4gdguqL5AYi4TgG2iTsyD1npyGWuoadrGs=;
	b=N+VNbmyHs94zjMDncqlW2sVVei6FbUePaa6mm/RixEqK5hHxSxrpFhFvtF0+XoBhdS
	BnB0/I4TzXjX+yIoJgqfytdifX29JZXkdmUbo/0ddrTw4ccgoQyPYIDv1TIHOL9ihQAr
	5aQuOuzYQ4vEWbXm/2l2eKS6pljEmVTdQPkI7oMNvv2NUpSKtF2RVn1MbAiMYyZuldv5
	2h6zchhQauWGk1Og2qCpvvq72SF0ediYeDi3BlrGBLRF/4If77KVI9bP8AIXm1NKbg58
	FT6Q4XUePvGTo71CV7Ntauz7l6CD2np+hXvkHN+YNHFlpVrLz4m0mWivkd1p8pDM4PXd
	iSEQ==
X-Received: by 10.180.82.170 with SMTP id j10mr14276800wiy.2.1358761668618;
	Mon, 21 Jan 2013 01:47:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm17821654wia.10.2013.01.21.01.47.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 01:47:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 10:47:48 +0100
Message-Id: <1358761668-1064-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-systemd] systemd: remove dbus-systemd from RDEPENDS
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
X-List-Received-Date: Mon, 21 Jan 2013 10:03:19 -0000

* dbus-systemd package was removed in oe-core and it's part of PN
  with systemd in DISTRO_FEATURES
* fixes parsing after first part of meta-systemd merge to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 5722d35..f2e168e 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -185,7 +185,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd ${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
 
-RDEPENDS_${PN} += "dbus-systemd udev-systemd"
+RDEPENDS_${PN} += "udev-systemd"
 
 # kbd -> loadkeys,setfont
 # systemd calls 'modprobe -sab --', which busybox doesn't support due to lack 
-- 
1.8.1.1



