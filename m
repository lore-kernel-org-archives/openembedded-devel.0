Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3MF-0003yR-UX
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:33 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so2538215eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=eebGKQg+Gu8RFD5H/NZLDsIk8/KF0O0gSi4F2NiVElY=;
	b=Tl6R7CONrUI5vMs6k7M4smkIidrh4JR91nirJztQNeXAati8tYGnI1yk+gJvtesLD0
	wxVKfFNNcPRdXl10ySCggPdZ/nNhmDnIv6khHkf72to13loVzJV3nObl55UN/+JIfE3i
	WPO/CSVHcqb5jexO7qPUVlfSrn88AcFoHCJ4RucItbzXhcFfS1r4hmaFmUxheKFgP+Jh
	Bv0NXjXZO6PlmYO1BthLON43bUTUMbUTTkfo72RV5PSzNJA3gXugiVydMxBP9El5tj65
	24Kyl46pcYnmG98dj0vuIUxZOKZj/2tv4ZOwmgdGyyzggMTtRgcdsZ/7S1PDS4f6YyKQ
	D2rA==
X-Received: by 10.14.221.9 with SMTP id q9mr53488366eep.3.1358719912471;
	Sun, 20 Jan 2013 14:11:52 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:51 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:30 +0100
Message-Id: <4f361da0244066ce479b6e7f6db4375dc9983f18.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/5] linux-kexecboot_3.2: convert ktype/tiny to explicit ktypes/tiny/tiny.scc
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
 .../linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc           | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc  | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc         | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc         | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc           | 2 +-
 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc
index 5db1834..918de3e 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE akita
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware akita-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc
index 3a55040..2f20731 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE c7x0
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware c7x0-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc
index 3142aca..14027f1 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE collie
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware collie-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc
index 9f475e1..995f057 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE poodle
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware poodle-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc
index 803e176..588e066 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE spitz
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware spitz-kexecboot.cfg
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc
index d74ac0d..95044f8 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc
@@ -2,6 +2,6 @@ define KMACHINE tosa
 define KTYPE tiny
 define KARCH arm
 
-include ktypes/tiny
+include ktypes/tiny/tiny.scc
 
 kconf hardware tosa-kexecboot.cfg
-- 
1.7.12.4



