Received: from [209.85.217.220] (helo=mail-gx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1N4NOC-00077G-9e
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 00:29:47 +0100
Received: by gxk20 with SMTP id 20so5751373gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2009 16:28:34 -0700 (PDT)
Received: by 10.150.28.4 with SMTP id b4mr5778138ybb.124.1257031713917;
	Sat, 31 Oct 2009 16:28:33 -0700 (PDT)
Received: from localhost.localdomain ([189.115.166.231])
	by mx.google.com with ESMTPS id 4sm1586126ywd.44.2009.10.31.16.28.31
	(version=SSLv3 cipher=RC4-MD5); Sat, 31 Oct 2009 16:28:32 -0700 (PDT)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Oct 2009 20:22:40 -0300
Message-Id: <1257031360-22569-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] eject-2.1.5: adding HOMEPAGE and fixing SRC_URI
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
X-List-Received-Date: Sat, 31 Oct 2009 23:29:47 -0000

From: Ricardo Salveti <ricardo.salveti@openbossa.org>

As geocities is now down, changing the SRC_URI to point to OE
mirror.

Signed-off-by: Ricardo Salveti <ricardo.salveti@openbossa.org>
---
 conf/checksums.ini           |    2 +-
 recipes/eject/eject_2.1.5.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e41bd93..5ca25c7 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5826,7 +5826,7 @@ sha256=9ec176847b1e01cd2083cd578e804fda2c619d0f465cd752ec11b38099f75f7f
 md5=d0f3b1adca33a68867bf50f000060cd6
 sha256=a0d03208e335610defc3049d8dd03f4ec7fcf477f44c4897b3f68adc478237ee
 
-[http://rogers.com/eject-2.1.5.tar.gz]
+[http://sources.openembedded.org/eject-2.1.5.tar.gz]
 md5=b96a6d4263122f1711db12701d79f738
 sha256=ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55
 
diff --git a/recipes/eject/eject_2.1.5.bb b/recipes/eject/eject_2.1.5.bb
index 6d53aee..f90f8e6 100644
--- a/recipes/eject/eject_2.1.5.bb
+++ b/recipes/eject/eject_2.1.5.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Eject allows removable media (typically a CD-ROM, floppy disk, tape, or JAZ or ZIP disk) to be ejected under software control."
+HOMEPAGE = "http://eject.sourceforge.net/"
 LICENSE = "GPLv2"
 
 inherit autotools gettext
 
-SRC_URI = "http://ca.geocities.com/jefftranter@rogers.com/eject-${PV}.tar.gz"
+SRC_URI = "http://sources.openembedded.org/eject-2.1.5.tar.gz"
 
 S = "${WORKDIR}/${PN}"
 
-- 
1.6.5



