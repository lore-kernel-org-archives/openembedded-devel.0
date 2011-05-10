Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1QJvI9-0004YP-NM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 00:20:33 +0200
Received: by yxn22 with SMTP id 22so2530973yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=d8K77LrtP4dc/vHzhbXz5LKIxgKBrJl3LQMitMhSzzU=;
	b=GZIuPED3KjEjsGPPRrGJ1MZ6ZLDdOTSfNad+TRjPUxLnIBKl3J4ajIqt28oTW0ojTP
	bkgJ/0G1rZAAf3mCLrG/9ApftW1XmjNO1tGDjx0HMXqU/ybAtGnSvJYpZ4LRI6nAgssH
	H3rhm9A9YB5edWZyR2TLWyJBvPTjX+ronvcpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rzNGqtzHH0kjP+1otdAWRX9+aOHAztb3zr8IwI4TiuwjSX12gUd6K5w4h6vf3Uf/c+
	1zeKxJ+KiDyb39AUh4cvFncFe5ShqA8JL12BgmKwt1GNQKmGl/S0lTtZyEw70bQ3OPOa
	e4GmuDOgw/E7v33Ws5OQHK+uR0ddp4qGWlFco=
Received: by 10.236.197.6 with SMTP id s6mr10027727yhn.232.1305065866906;
	Tue, 10 May 2011 15:17:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p51sm3367798yhm.52.2011.05.10.15.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 15:17:45 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 17:17:42 -0500
Message-Id: <1305065862-22878-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] pcsc-lite: make configuration file a separate package
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
X-List-Received-Date: Tue, 10 May 2011 22:20:33 -0000

* Move the reader.conf file to be part of a separate package
  so that it is not installed by default.
* This is done because individual readers that implements an
  IFDHandler library need to be able to install their reader.conf
  file in the /etc/reader.conf.d directory.  Without this change
  those packages will conflict with the reader.conf file installed
  by the pcsc-lite package:
    * NOTE: the reader.conf file in the package is a commented out
            template file, not an actual working configuration
            file.
* Using this change IFDHandler packages can use RCONFLICT with
  the pcsc-lite-collateral package to let users know that these
  packages cannot co-exist.
* Mark the configuration file an such so that when the package is
  updated the user's changes are not lost.
* Bump the PR.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/pcsc-lite/pcsc-lite_1.5.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
index b4af08d..88401b6 100644
--- a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
+++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
@@ -5,6 +5,8 @@ LICENSE = "BSD"
 DEPENDS = "hal"
 RDEPENDS_${PN} = "hal"
 
+PR = "r1"
+
 SRC_URI = "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-${PV}.tar.bz2 \
            file://pcscd.init "
 
@@ -26,8 +28,11 @@ do_install() {
 }
 
 PACKAGES =+ "libpcsclite"
+PACKAGES =+ "${PN}-collateral"
 
 FILES_libpcsclite = "${libdir}/libpcsclite.so.*"
+FILES_${PN}-collateral = "${sysconfdir}/reader.conf.d/*"
+CONFFILES_${PN}-collateral = "${sysconfdir}/reader.conf.d/*"
 
 SRC_URI[md5sum] = "d7d466621bec39354351f09349f6374c"
 SRC_URI[sha256sum] = "a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e"
-- 
1.7.0.4



