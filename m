Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAzAZ-00004t-MA
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 08:44:19 +0100
Received: by wibhj13 with SMTP id hj13so1550101wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=sG4hds3l+sYZCdoN7BIu7QN2ULcUqGoI7Kz7+Qx4RrA=;
	b=gYfrz6G9sDDS0P82IEtZdxwo9czoJljPx4IjCQ2ioTyDXTuwX5vd413x91O3EMjxNN
	fDOvr+vW9V4V5tH/N+tdlfBNWu7r3LUYWnZEgDe8JxCGeGem/4z2GrAcq2XacSUSNIBl
	3GEIB7OXrx2X0R0A7O7UsbbGXpMylHkGJcIG++AM3Z+rYXSLv8TDrqaqUYHxiMHpkMbl
	6BC71bpfTfFgdNA2TBC9VLKgKEpdKW7w3AEf60OAcgKDDmObtltRfLR7vi4Z+Saz/fiR
	5/WbXW7LQcOvrPdkIt++xjXhySm2FduXIMclutMxL0Q66eP4N5M0TUbH1PplrZJwNIiS
	pCDg==
Received: by 10.216.136.145 with SMTP id w17mr6032038wei.98.1332488123797;
	Fri, 23 Mar 2012 00:35:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id fn2sm19663562wib.0.2012.03.23.00.35.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 00:35:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 08:35:20 +0100
Message-Id: <1332488120-28631-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce] thunar-volman: add eject to RDEPENDS
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
X-List-Received-Date: Fri, 23 Mar 2012 07:44:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ejecting USB-memory stick caused:
Error starting job: Failed to execute child process "eject" (No such file or directory)

run-tested with angstrom/meta-oe environment on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar-volman/thunar-volman_0.6.0.bb           |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
index c581d78..c7cc0ed 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
@@ -3,8 +3,11 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
+PR = "r1"
 
 inherit xfce
 
 SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305"
 SRC_URI[sha256sum] = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f"
+
+RDEPENDS_${PN} = "eject"
-- 
1.7.6.5



