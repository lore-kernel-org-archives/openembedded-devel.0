Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q4zqb-0004wl-B6
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 20:10:25 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so644107yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=krvB4GyT7udA/OdAkzLyEJ1IUGS4OVO7Dtx0gMJhYZI=;
	b=tzoR4kzaOpU5fUpl0yMkYsdyAgNZF2GBh6AIxEewFXckfojk/15XATKkWRoXLfWs7M
	34L67xBuT589NpGdAeDvwI7aJL23HrHAkTlu3/3HmhawpKTWCveDbpwOCC7QzcZ2SOix
	ZJ2P2XVmpII+mOSlCwElLx+O8X8FWJIMLc7r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=urf6kgXuJT6F4/lMqqeUW4wwkeKHBfgoiWEgMIWYCWuwpGzhMSM97S8M3SJ4hN8huS
	QRNXvQXWu+qrgNT0drqNJ6g+aNloG4WCq+I/wmvirguRncidrifbXQxa4Wp9JEi0vDdN
	foNVp4nPpow0hpxLw0PRhe5Obz7fknCBrNWSo=
Received: by 10.101.115.18 with SMTP id s18mr1125363anm.103.1301508508246;
	Wed, 30 Mar 2011 11:08:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x32sm301049ana.38.2011.03.30.11.08.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 11:08:27 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:08:08 -0500
Message-Id: <1301508491-3062-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/6] u-boot: Add PSP version for am387x-evm
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
X-List-Received-Date: Wed, 30 Mar 2011 18:10:25 -0000

* Add the TI PSP u-boot version for the am387x-evm machine type
* Make this version the default preference for ti814x
  SOC_FAMILY devices.
* Based on u-boot recipe from Arago contributed by Nageswari
  Srinivasan

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb

diff --git a/recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb b/recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb
new file mode 100644
index 0000000..d4a2afc
--- /dev/null
+++ b/recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb
@@ -0,0 +1,14 @@
+require u-boot-omap3.inc
+
+COMPATIBLE_MACHINE = "ti814x"
+
+DEFAULT_PREFERENCE_ti814x = "1"
+BRANCH = "master"
+
+# Use literal tags in SRCREV, when available, instead of commit IDs
+SRCREV = "v2010.06_TI814XPSP_04.01.00.03"
+
+UVER = "2010.06"
+PSPREL = "04.01.00.03"
+
+PR = "r1"
-- 
1.7.0.4



