Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzbcW-0006F0-E0
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 23:22:08 +0100
Received: by eekd41 with SMTP id d41so2044814eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 14:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.29.66 as permitted sender) client-ip=10.14.29.66; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.29.66 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.29.66])
	by 10.14.29.66 with SMTP id h42mr11382477eea.75.1329776030270 (num_hops
	= 1); Mon, 20 Feb 2012 14:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H/PREGxYJRke3QooFI3sidjYWwLvn5k7RMY2iTIxDYg=;
	b=FVERMn5slZb7fFEFJXsXxnXfHc3BKka+qjFhXwQ8GueyabRyWCyxCoWoddGhjZs40c
	qrwZHcfaMMsCGYYm9ZMT9b7mJQIhGl6qsL5rKdVj/T45SyCsdqWq3t8WM7SdMINdCAH8
	twKAEHxlHgxY4yUgBSYU9L6NvFefpksPXjXcY=
Received: by 10.14.29.66 with SMTP id h42mr9049476eea.75.1329776030195;
	Mon, 20 Feb 2012 14:13:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm82350471eeb.4.2012.02.20.14.13.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 14:13:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 23:13:40 +0100
Message-Id: <39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329775974.git.Martin.Jansa@gmail.com>
References: <cover.1329775974.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/2] polkit: enable and disable systemd/consolekit support explicitly
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
X-List-Received-Date: Mon, 20 Feb 2012 22:22:08 -0000

* people using sysvinit already have or can set something like
  task-core-boot.bb does VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
  to disable systemd explicitly (so it's not picked by shlib when it's
  available because other packages).
* and for the rest it will disable consolekit and enable systemd
  explititly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
index 3c43970..d649f61 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
@@ -1,3 +1,6 @@
-DEPENDS += "systemd"
+PRINC := "${@int(PRINC) + 3}"
 
-PRINC = "1"
+PACKAGECONFIG ??= "${@base_contains('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'consolekit', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
-- 
1.7.8.4



