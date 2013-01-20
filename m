Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3MD-0003yE-CI
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:33 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so2417989eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZWdD5T/P9Vg9TzNzcoKRogkkBiLVEw4it4fwc2srrx4=;
	b=ng72BWXgoalQy475Sx/0ZKRj2FurcSh43Dv+zxBXgHyNgxqApFbQyDC5KPFph8L0J/
	xWiB6QXSOriHL7LCPlmtVvc40W6vUV4JZweE3WBfVcP9LB6RaECMm88AWZU8Zb/FLFfq
	NqD4JDnIx/rtMlGHd5vEuaz12e5je+p407jUwPyCiUiGZhQehX44gqGc+kdm28ZQ8viv
	Thc31Zm9/pYx+NPf04HZomkBK7aHub3rTtpp8/UfxpzUdsWCKt8541WLmWAdw3BrhoHa
	7D840ODnhlgH0gntSBlLQMPeuWt4JbBVs31jVYAPdkvZXBTbXOaHwwloe0HGlegYMpz4
	9LfQ==
X-Received: by 10.14.194.199 with SMTP id m47mr53332184een.11.1358719909910;
	Sun, 20 Jan 2013 14:11:49 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:49 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:29 +0100
Message-Id: <15a8b4d0bf0dad54a20c3fc59c2003bc113d97bd.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/5] linux-yocto_3.4: convert ktype/standard to explicit ktypes/standard/standard.scc
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
X-List-Received-Date: Sun, 20 Jan 2013 22:27:44 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc   | 2 +-
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc     | 2 +-
 recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc | 2 +-
 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc | 2 +-
 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc   | 2 +-
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
index bfab7f4..21096d0 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE akita
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include akita.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
index 05fc1c6..325c7c7 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE c7x0
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include c7x0.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
index 30b6fba..7283ad9 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE collie
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include collie.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
index b9fa8d6..31ad9df 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE poodle
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include poodle.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
index 0bee389..5b8e2c3 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE spitz
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include spitz.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
index c91ffef..b2e1324 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
@@ -2,6 +2,6 @@ define KMACHINE tosa
 define KTYPE standard
 define KARCH arm
 
-include ktypes/standard
+include ktypes/standard/standard.scc
 
 include tosa.scc
-- 
1.7.12.4



