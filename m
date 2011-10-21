Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5xv-000568-Ey
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 05:40:15 +0200
Received: by ywf9 with SMTP id 9so1013458ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9bPw/ZrnNxOdoFWv8WFjaN8l3m9OdfcaqRhVmucbEfc=;
	b=nM9PFURFLYImzeNlKD9on+13X31CCKVvZlSJ39A1jNJ8R8kkfeDq8dZKdeN1njUDy7
	AgD25YVzjtODyQuRaYx1h96mLBtzZfNm+LanUJkx1zlMPaSQliDiWlBUGua2tBljiHq8
	gy+qpisRx9CVL+RvY4UIZBw9G2VTM5+oxk0do=
Received: by 10.151.59.20 with SMTP id m20mr4359643ybk.39.1319168062456;
	Thu, 20 Oct 2011 20:34:22 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t7sm31947517anh.15.2011.10.20.20.34.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:34:21 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:34:10 +0000
Message-Id: <f8bb508b661653c11221ac4b6a8ec080d2527569.1319168013.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319168013.git.otavio@ossystems.com.br>
References: <cover.1319168013.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/4] systemd: add systemd-initramfs
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
X-List-Received-Date: Fri, 21 Oct 2011 03:40:15 -0000

Includes a /init that points to ${base_sbin}/init that is called so to
avoid having to include post rootfs commands for it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 8faedd0..9df3b53 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r0"
+PR = "r1"
 
 inherit pkgconfig autotools vala perlnative
 
@@ -52,9 +52,15 @@ do_install() {
 	autotools_do_install
 	# provided by a seperate recipe
 	rm ${D}${base_libdir}/systemd/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${base_sbindir}/init ${D}/init
 }
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
 
-- 
1.7.2.5



