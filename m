Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RODqk-0007ZR-VT
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 20:30:20 +0100
Received: by faat2 with SMTP id t2so2105701faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 11:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XwK9cRkLmgOIJoeOF1rwXuG+7VSra0RmbiiBKajbWMA=;
	b=mIGMbyv9HWEQIKexTQyNnkDICcqtA8Anwhwoo2xidR00GI8jbAGqTPCmKtNfnBOft+
	Rbxps0djz/BD7pi7EN0fH9AE7w3is9PapX5JxF1WPD14fm7IVzm2dl6ONU6xL/z4bLaA
	YJI97Am/QU4dSnDLS7ZwqwTLvpSB+cwRKvrA8=
Received: by 10.223.87.211 with SMTP id x19mr6722329fal.8.1320866643244;
	Wed, 09 Nov 2011 11:24:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm7790179faf.14.2011.11.09.11.24.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 11:24:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 20:23:49 +0100
Message-Id: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCH][meta-oe] systemd: add postrm u-a calls
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
X-List-Received-Date: Wed, 09 Nov 2011 19:30:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 90862a3..d1d4306 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r5"
+PR = "r6"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -108,7 +108,6 @@ RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
 
 # TODO:
 # u-a for runlevel and telinit
-# u-a prerm
 
 pkg_postinst_systemd () {
 update-alternatives --install ${base_sbindir}/init init ${base_bindir}/systemd 300
@@ -117,3 +116,11 @@ update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/syste
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
 }
+
+pkg_postrm_systemd () {
+update-alternatives --remove init ${base_bindir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
-- 
1.7.8.rc1



