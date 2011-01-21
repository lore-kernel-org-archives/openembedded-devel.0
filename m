Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgCMA-0007x6-NI
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 09:28:30 +0100
Received: by pvd12 with SMTP id 12so279589pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=q3YzczxByl9XavjvDMm4d4s5UNilEjXDjiZ4LiOt2qg=;
	b=mEQqrvfMpIkMSGodDhzEWl7k58S2F3hrWlyzUppnkSzSJc5YDU3JqUcBhMK2lpz05u
	Z+1MhSsO8b9gVI6ebW+WdaTyLwJgP5TUuqmaZd0dw/bC5ayAsjoPwxVP2PuHc9iFOvCv
	u7PZjOeumUuDMnzkALvm8bCyWermPZAnt6WDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LlDK/DuSN6s7LWwaZPiCQwYtXqL4hdqZo19K7q3N5lPm4OqSA2YYXo2p7I5wgmyhcW
	mGs9DXXo1KHRy9n/PabtQcmrIwf8a0BLe0r2gSgb5WuiRxZ8h32N19V1cvXudD/sgiil
	2K8CydxZrL0TeRaBh6G/3f8ipDlxnenxyvW5g=
Received: by 10.142.186.14 with SMTP id j14mr306114wff.257.1295598464537;
	Fri, 21 Jan 2011 00:27:44 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x35sm12318284wfd.13.2011.01.21.00.27.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Jan 2011 00:27:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 00:27:35 -0800
Message-Id: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 1/2] slugos.conf: Define IMAGE_DEV_MANAGER to be udev
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
X-List-Received-Date: Fri, 21 Jan 2011 08:28:31 -0000

* Dont hardcode udev to RDEPENDS but use IMAGE_DEV_MANAGER

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/slugos.conf      |    1 +
 recipes/tasks/task-slugos.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index 853a58e..96c2f45 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -15,6 +15,7 @@ IPKG_VARIANT ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_opkg ?= "opkg-nogpg-nocurl-slugos"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg-nocurl-slugos"
 IMAGE_INITSCRIPTS ?= "initscripts-slugos"
+IMAGE_DEV_MANAGER = "udev"
 # Disable installing ldconfig
 USE_LDCONFIG = "0"
 require conf/distro/include/slugos.inc
diff --git a/recipes/tasks/task-slugos.bb b/recipes/tasks/task-slugos.bb
index 88475cd..ffaac67 100644
--- a/recipes/tasks/task-slugos.bb
+++ b/recipes/tasks/task-slugos.bb
@@ -132,7 +132,7 @@ RDEPENDS_${PN} += "\
 	kernel \
 	base-files base-passwd netbase \
         busybox initscripts-slugos slugos-init \
-        update-modules udev \
+        update-modules ${IMAGE_DEV_MANAGER}  \
 	module-init-tools modutils-initscripts \
 	libgcc \
 	beep \
-- 
1.7.2.3



