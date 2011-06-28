Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbZX6-0008D9-7h
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 16:44:57 +0200
Received: by yxe1 with SMTP id 1so114087yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=YZ/NUVzkTfN59IpAsc0Bql23S8kBhWOKiv9OF+hTvaE=;
	b=MpZCGFgeo9A1D9xfZ4vpzWPHYFkxScXoMkt71RCOBvWI9o+OKb+kc/Gw+y89b4zMXc
	K+TwnimwsYtVx0cevmaZKcOgkNPbyB7M4+fLFr/vB/xuGF1sgtVPFoCTK31Wg+cOE4gM
	smbswG7u8aAQ4l9T6CPEOOMEyAX5lxI96oTEY=
Received: by 10.150.160.3 with SMTP id i3mr7978840ybe.337.1309272073389;
	Tue, 28 Jun 2011 07:41:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g7sm70817yba.11.2011.06.28.07.41.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 07:41:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jun 2011 14:40:49 +0000
Message-Id: <46a02ef00acd5a685cb89e747f98e6b403b9c087.1309272010.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309272010.git.otavio@ossystems.com.br>
References: <cover.1309272010.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309272010.git.otavio@ossystems.com.br>
References: <cover.1309272010.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] task-x11: set all packages PACKAGE_ARCH to MACHINE_ARCH
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
X-List-Received-Date: Tue, 28 Jun 2011 14:44:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/tasks/task-x11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11.bb b/meta-oe/recipes-core/tasks/task-x11.bb
index 66af8bd..0a48165 100644
--- a/meta-oe/recipes-core/tasks/task-x11.bb
+++ b/meta-oe/recipes-core/tasks/task-x11.bb
@@ -26,7 +26,7 @@ XSERVER_COMMON ?= "xserver-kdrive-common"
 XSERVER_COMMON_shr = "xserver-common"
 
 # This is also the reason why we have to make this package machine specific :/
-PACKAGE_ARCH_${PN}-server = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN}-server = "\
   ${XSERVER} \
-- 
1.7.2.5



