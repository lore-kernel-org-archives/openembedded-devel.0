Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxHD7-0001Kb-PK
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 14:42:33 +0200
Received: by bkcik5 with SMTP id ik5so200271bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=knYwN3DhVpT90DM7o6vbM1MK04Bog/3vnH+Nty8TaH4=;
	b=GNWUmqF3IVuDClcVm2ZP5iV8lam9sYLELXEk80SEHdrFFwEnrnhwn22aWEGq8bae4b
	2Y5acXL1duvWyArE/LdDY8qAobnv/DHYKubJIiJDzL7RYcmLpEoIPDVcVx6fz/eMgnrn
	v8nMdTPpB8sUYcOaP0Tu//0nPvSggaJzg3YRp/IwODK7MLncS/yoOWbBiefB0CXcYuPf
	dHHRKBmf+Xc8ZI8Ps1gT32N1V/16IBLHiDrOHW8/d+j+DWUv8sI/UIUeIqeUxKvAr+09
	eVM+BmJ7fZnh0SKAtUvfX7ry7wGyCADYPiIVNKiLxCd3d/PEAKNpZaQ+GYGHSDP1pr6S
	K/5w==
Received: by 10.205.137.8 with SMTP id im8mr534658bkc.135.1343997052912;
	Fri, 03 Aug 2012 05:30:52 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id t23sm4762427bks.4.2012.08.03.05.30.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 05:30:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2012 14:30:20 +0200
Message-Id: <1343997020-11559-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd] gdm: replace 'WantedBy=graphical.target' by 'Alias=display-manager.service'
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
X-List-Received-Date: Fri, 03 Aug 2012 12:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found at lxdm. Error message was there
| systemd[1]: Cannot add dependency job for unit display-manager.service ...

Inspired by [1]

[1] https://bbs.archlinux.org/viewtopic.php?pid=1131267

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    2 +-
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
index 72a56f9..adfc565 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
@@ -8,4 +8,4 @@ ExecStart=/usr/sbin/gdm -nodaemon
 StandardOutput=syslog
 
 [Install]
-WantedBy=graphical.target
+Alias=display-manager.service
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
index 7308346..963e3e8 100644
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.7.6.5



