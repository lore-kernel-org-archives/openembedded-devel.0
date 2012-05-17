Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUx60-0002Bb-I8
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 11:34:08 +0200
Received: by wgbdr1 with SMTP id dr1so1389084wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9aXDp9iWvdAoYyUuapfZP+uw+F6zD6sEhLgjHdMJJn8=;
	b=ymQQJ+jpGS/L8WyqMapaEJPji/EEB/PSrM6v5F9OrQUblt5KAXcRi1nuYHxWzb7h4T
	uWKESGU8OMChX7ERCXJLEnEh9r+RyoyInEg40c1j7JBeETyBoECnV0WMvg/DWMJwZzoJ
	61k8Dc/9/KXXPCR/radFdBiFLWEeBsklvHB2yw6c0sL0SUMEDmvFEyg+7Le8ajXIZZab
	L6RMpQtQtn9I++/Ns9ugQX7gzx8DLszFt3WxnDprwDwSabmX1YCAnd5Gey21Lj57Oept
	YPUENrbsHFOldQR78sJO4JrcRZ3naSp/J7OKWLMB2tos7sAiHH+DrMezcaPGdtHFBOKO
	vMsQ==
Received: by 10.180.97.66 with SMTP id dy2mr3734461wib.0.1337246646233;
	Thu, 17 May 2012 02:24:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g10sm47016638wiw.0.2012.05.17.02.24.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 02:24:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2012 11:23:59 +0200
Message-Id: <1337246639-5192-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] systemd: create /var/run/utmp
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
X-List-Received-Date: Thu, 17 May 2012 09:34:08 -0000

* it was created by volatiles before, but without sysvinit
  systemd-update-utmp-runlevel.service fails to start without this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index f4ca72a..943d955 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r27"
+PR = "r28"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -68,6 +68,10 @@ do_install() {
 	# create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
+	
+	# systemd-update-utmp-runlevel.service fails to start without this
+	install -d ${D}${localstatedir}/run
+	touch ${D}${localstatedir}/run/utmp
 }
 
 python populate_packages_prepend (){
-- 
1.7.8.6



