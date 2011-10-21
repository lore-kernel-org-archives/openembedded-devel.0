Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFfp-0005CP-BP
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:02:13 +0200
Received: by gyc15 with SMTP id 15so3737938gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=djI7sRIkkw2TvXfhUiZ75gCL6pwmbXMuF4JJ5W7cln0=;
	b=C9tFWE4nh6R2Yhmr17DdZCtVL+UGIkJff5s8PMyQ38J66IZx16yV+S8CdCkmdFYoyQ
	Ax11IYcAn91oKansZIlilNxR5j6UIvxZHCAv6VQzTCxF1awIhffriDHrRaLS1yjVwIM+
	4858NU/GpX12QQfesDcKqK3D/n1L8o2iGJO58=
Received: by 10.150.160.1 with SMTP id i1mr9266895ybe.91.1319205379184;
	Fri, 21 Oct 2011 06:56:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24608561anh.8.2011.10.21.06.56.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:56:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 13:55:55 +0000
Message-Id: <009ed9f76dd5f8b17a89881366903f070b6e8a1b.1319205291.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/5] task-basic: add "serial-console" machine feature
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
X-List-Received-Date: Fri, 21 Oct 2011 14:02:15 -0000

The "serial-console" machine feature makes the task-basic recommends
systemd-serialgetty so serial tty works out of box.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/tasks/task-basic.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-basic.bb b/meta-oe/recipes-core/tasks/task-basic.bb
index 34aa7e1..d130313 100644
--- a/meta-oe/recipes-core/tasks/task-basic.bb
+++ b/meta-oe/recipes-core/tasks/task-basic.bb
@@ -47,6 +47,7 @@ RDEPENDS_${PN} = "\
 RRECOMMENDS_${PN} = "\
 	${MACHINE_EXTRA_RRECOMMENDS} \
 	${@base_contains("MACHINE_FEATURES", "usbhost", "usbutils", "", d)} \
+	${@base_contains("MACHINE_FEATURES", "serial-console", "systemd-serialgetty", "", d)} \
 	${@base_contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
 	${@base_contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
 	\
-- 
1.7.2.5



