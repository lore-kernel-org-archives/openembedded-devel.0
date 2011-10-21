Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFfl-0005Bz-Ea
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:02:09 +0200
Received: by ywf9 with SMTP id 9so1386804ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=KMs/VtpPR/OOeK7OksU+1AkUl8v0FskanEqLKBUoXX0=;
	b=ZIFtNfNNzkiSNnOYw7FZ800yr4ig4BMxJcTkB4XCOUZR4a68baP/3m0UH2Sy+GlG6L
	mjWzpHF0cR1cuDsrjX6NbbavOmZ5f7KIHVEBhM4DgzXuNXAqrIP+JWtKqfWI5vZjt9Or
	XFbxu4Q5THAcn9Fa6Sob15aJb5SbKt/OqrczU=
Received: by 10.150.135.19 with SMTP id i19mr12326315ybd.99.1319205374845;
	Fri, 21 Oct 2011 06:56:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24608561anh.8.2011.10.21.06.56.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:56:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 13:55:53 +0000
Message-Id: <2388171720d37651846be1edf389c68144fd1898.1319205291.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/5] systemd: add lock group using useradd.bbclass
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
X-List-Received-Date: Fri, 21 Oct 2011 14:02:09 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index f9e024b..89ded56 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,9 +14,9 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r1"
+PR = "r2"
 
-inherit pkgconfig autotools vala perlnative
+inherit useradd pkgconfig autotools vala perlnative
 
 SRCREV = "64685e0cea62b4937f0804e47ce2cb7929f58223"
 
@@ -59,6 +59,9 @@ do_install() {
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock"
+
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
@@ -113,12 +116,4 @@ update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl
 update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
-
-# can't do this offline, but we need the u-a bits above
-if [ "x$D" != "x" ]; then
-	echo "can't do addgroup offline" ; exit 1
-else
-	grep "^lock:" /etc/group > /dev/null || addgroup lock
-fi
 }
-
-- 
1.7.2.5



