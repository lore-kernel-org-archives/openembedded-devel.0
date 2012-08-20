Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T3VIU-0008PN-5d
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 18:57:50 +0200
Received: by bkcik5 with SMTP id ik5so3067326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 09:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=lQTQ1g/iohDVql5LbBgQfX/L5KPVnihDMZO1ATmb9RQ=;
	b=DHqE/TK7zN5ENki/0YssbFrBdeM/L8KBCfnMyV9cKjnHDUJ+QEv+Z8kgXXvSAe23Wr
	C+dP8T43oX7K0VSRk/5CAwQxvHWY9deYD9DoOt8udGPOufbXTe354XVDmOWAs+jg1D8R
	XQRaVpN0VDXWT/GpATQorktZJzQ1nsRv9VSv+ChFdMstpOCqzm4nvpJ9KeZ46zJGCl3Y
	Hn6RRAmlzfKaq/XVUo9ybc2pxf/nCPinrOydFaQ/JUMBPVcv23ZB8OZRYkGHBDSifOlc
	8/sFBZnBAg1z8TwzhuxlgNGpd8D7B/hgnpomvDB7JusuhDJEgpqaoMTQBRjFAO94XKfJ
	pFXQ==
Received: by 10.205.119.210 with SMTP id fv18mr4542610bkc.10.1345481147651;
	Mon, 20 Aug 2012 09:45:47 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id m9sm6509817bkm.10.2012.08.20.09.45.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 09:45:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 18:45:06 +0200
Message-Id: <1345481106-17503-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd, v2] systemd-compat-units: ensure /tmp is mounted when starting run-postinsts
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
X-List-Received-Date: Mon, 20 Aug 2012 16:57:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/tmp is required for postinst:
Aug 20 16:59:33 overo S98run-postinsts[68]: * opkg_prep_intercepts: Failed to make temp dir /tmp/opkg-07xOYO/opkg-intercept-wfVgAQ: No such file or directory.
Aug 20 16:59:33 overo S98run-postinsts[68]: * rm_r: Failed to open dir /tmp/opkg-07xOYO: No such file or directory.

This bug left postints unfinished e.g. pango-module-* [1].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-August/041096.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |    2 +-
 .../systemd-compat-units/run-postinsts.service     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
index aefd6a7..6b6b4dd 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r17"
+PR = "r18"
 
 inherit allarch
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 879a251..da6fe76 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -2,7 +2,7 @@
 Description=Run pending postinsts
 DefaultDependencies=no
 ConditionPathExists=|/etc/rcS.d/S98run-postinsts
-After=remount-rootfs.service
+After=remount-rootfs.service tmp.mount
 Before=sysinit.target
 
 [Service]
-- 
1.7.6.5



