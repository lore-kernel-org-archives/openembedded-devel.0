Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFfm-0005C8-U9
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:02:11 +0200
Received: by yxj20 with SMTP id 20so1528373yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=y8onnkI0uBc/9KChzfd1JGw0tDvSThQCzPDXgFa1pSw=;
	b=vvHHsRQTpwEaGbQu1B3nTfYjIlPdTNSLi6jhLFuWUaW/EyukoR8Nm5wkyRhhHUbwWJ
	PKIidBrwdHvOklxR3f4LXrInPbVCqakGICbjyc6u1KySAwsPm5b8tTZb1qehGpY3RsoV
	nwUAvCcxQS6OacbbEh4He0IEX5Ay/21H+OsFY=
Received: by 10.100.237.8 with SMTP id k8mr3286850anh.64.1319205377121;
	Fri, 21 Oct 2011 06:56:17 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24608561anh.8.2011.10.21.06.56.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:56:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 13:55:54 +0000
Message-Id: <0f0cc7418ea3571e47db19323df05e0a6e14ad62.1319205291.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/5] systemd: do not recommend systemd-serialgetty
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
X-List-Received-Date: Fri, 21 Oct 2011 14:02:11 -0000

The service ought to be add if need. Not by default on all images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 89ded56..9d55a0d 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r2"
+PR = "r3"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -98,7 +98,6 @@ RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 # And pull in the kernel modules mentioned in INSTALL
 # swapon -p is also not supported by busybox
 RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
-                      systemd-serialgetty \
                       util-linux-agetty \
                       util-linux-swaponoff \
                       util-linux-fsck e2fsprogs-e2fsck \
-- 
1.7.2.5



