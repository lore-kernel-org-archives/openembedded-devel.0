Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ss9nB-0002HZ-Nb
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:46:37 +0200
Received: by wibhm11 with SMTP id hm11so272232wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xBFw7APRQZT3AZDPlrX5kcHNczxNSSn5iOV+/yv7tzw=;
	b=whGqSXcn7YfN3rr0/zhB8dGn8Jpx9GJvUVVa5c63/Qp6y0qpMoL9S9KLDk1W9vtg6D
	7J/2keADszU8fC/RQT2sdz7dkN+S0DfZRFputj0EtnVNA6520YNwam0taCivtGS+6ZPb
	hiAUXiFTVP4gDpA+GioABfaSspM0ULjDHtS3qfGo93zxtK/XNIHY1f0SLukv8Z5wdWOG
	dMc1n2Bytk9W77RweaxpmKwngrnNR6vp/7b2Qx5zL50Mu2kYazUAp+rZYscQr9O4IK+K
	+lBhOWqfiZwR/MtulExG78bsz4wMDIiSjBM9NzNZ7B9nZfPz6Ct6DgcSwyNzA0UxWJwk
	qdZg==
Received: by 10.180.107.103 with SMTP id hb7mr12638332wib.3.1342776914955;
	Fri, 20 Jul 2012 02:35:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm43640671wib.2.2012.07.20.02.35.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 02:35:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 11:35:17 +0200
Message-Id: <1342776917-24116-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342776917-24116-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342776917-24116-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCH 2/2] systemd: include /etc/rpm/macros.systemd in PN-dev
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
X-List-Received-Date: Fri, 20 Jul 2012 09:46:37 -0000

* fixes:
  WARNING: QA Issue: systemd: Files/directories were installed but not shipped
    /etc/rpm
    /etc/rpm/macros.systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 4257660..a83b30a 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r2"
+PR = "r3"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -147,7 +147,7 @@ FILES_${PN} = " ${base_bindir}/* \
                "
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 
-- 
1.7.8.6



