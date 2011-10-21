Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5xz-00056h-KY
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 05:40:19 +0200
Received: by gyc15 with SMTP id 15so3365232gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=1mypsmmeKnxCorNt7S+ziB/eCGvIZwC6K9tYe9WyCTo=;
	b=FWSNN+8UcZdZHwH4a4i3f/ukzzOK0w8RVI+ZzEwOXsOjULNtP413R10d7ZqVm4ZnWP
	BULqUP2pJI02+FsIrC7hB0c6D6uKzgB2qvIvSXRz8mEAGI6V0sQ9LS2qZiX1ycAW7id/
	fEBddB72qJHB/MNB29Afb+MBy6yhhJHB7W5j0=
Received: by 10.151.43.17 with SMTP id v17mr12299020ybj.79.1319168066502;
	Thu, 20 Oct 2011 20:34:26 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t7sm31947517anh.15.2011.10.20.20.34.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:34:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:34:12 +0000
Message-Id: <1d63385213ee2d6741906cf2e61ccfb6fee58270.1319168013.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/4] systemd: do not recommend systemd-serialgetty
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
X-List-Received-Date: Fri, 21 Oct 2011 03:40:19 -0000

The service ought to be add if need. Not by default on all images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 4a640e7..1c032ec 100644
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



