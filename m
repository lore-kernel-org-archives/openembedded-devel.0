Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pqr0m-0005PG-Cr
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 18:54:28 +0100
Received: by fxm8 with SMTP id 8so318778fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 09:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=V5nTi/goQ9eiwU0O9LcQwpFewyjAristAsDmIP103fo=;
	b=vtF2ZY3SMcIF9dMSNuW9kLm+++4ivPDoXFIalr1wPNCoBXqsBMBxh1v4RL7OZe8nPA
	3dcGDxB9H9SzVcTp018pN/dSyPCQldctzWOhQeZCyuT7AyJlIkZRwlqjjPsM7MTikky2
	u312WTZJaBK0Dynq/5XswGvS3RYZLlAZA9fuk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=tp90cOmL3pefUDicJ/gUIpNyzWzI0G6hyzz7W3IT+act3f+YV4HgPD/a2JMi+l9XHe
	jFTKS9/lqQkS7zUpEz5HBmIGff1PsAQcl+XZZGCI/OCyGtWH8qiFeOC9vKgJIy7wBKSD
	uUJwjEEeovkzSVfBkOpRTLMCFkhbem9kU2Cv0=
Received: by 10.223.72.202 with SMTP id n10mr1856155faj.74.1298137993405;
	Sat, 19 Feb 2011 09:53:13 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id b7sm1645386faa.42.2011.02.19.09.53.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 09:53:12 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kristoffer.ericson@gmail.com
Date: Sat, 19 Feb 2011 18:53:04 +0100
Message-Id: <1298137984-9839-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] jornada6xx/jornada7xx/mp900c: increase amount of used VTs.
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
X-List-Received-Date: Sat, 19 Feb 2011 17:54:28 -0000


Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 conf/machine/jornada6xx.conf |    2 ++
 conf/machine/jornada7xx.conf |    2 ++
 conf/machine/mp900c.conf     |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/conf/machine/jornada6xx.conf b/conf/machine/jornada6xx.conf
index 734cacd..0b32184 100644
--- a/conf/machine/jornada6xx.conf
+++ b/conf/machine/jornada6xx.conf
@@ -18,3 +18,5 @@ PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
 XSERVER = "xserver-kdrive-fbdev"
 
 PCMCIA_MANAGER = "pcmciautils"
+
+SYSVINIT_ENABLED_GETTYS = "1 2"
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index 5b46056..d444cb9 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -19,3 +19,5 @@ XSERVER = "xserver-kdrive-fbdev"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
+
+SYSVINIT_ENABLED_GETTYS = "1 2 3 4 5 6"
diff --git a/conf/machine/mp900c.conf b/conf/machine/mp900c.conf
index 38b70a2..7b597cf 100644
--- a/conf/machine/mp900c.conf
+++ b/conf/machine/mp900c.conf
@@ -10,3 +10,5 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-mobilepro900"
 PCMCIA_MANAGER = "pcmciautils"
 MACHINE_FEATURES = "kernel26 apm alsa pcmcia irda keyboard touchscreen screen"
 MACHINE_EXTRA_RDEPENDS = "kernel-modules"
+
+SYSVINIT_ENABLED_GETTYS = "1 2 3 4 5 6"
-- 
1.7.1



