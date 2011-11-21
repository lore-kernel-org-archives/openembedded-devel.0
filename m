Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSQYF-0005Ae-J5
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 10:52:35 +0100
Received: by faat2 with SMTP id t2so5781083faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Zr5SCMJ/rZh3/oDN+Zu77lbf+aY5q8BvZF56N/XMtlI=;
	b=pizMfNrDAC4Aryt6xxmHDba/DDOhakB95Fd/0R9bsA4mgezr2l2mrYchTtyYCkRu10
	b+7wceUruZrfeHqvNnKm2O/DgaNJvbmOdEl6w3xMlxMGEMXtpREFU+d6O/KmShT55+ul
	E/ROhjpROOfy4J7ihTole4KrY/f77a+SqMUGo=
Received: by 10.152.113.167 with SMTP id iz7mr8420812lab.15.1321868766139;
	Mon, 21 Nov 2011 01:46:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id pc8sm8968634lab.8.2011.11.21.01.46.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 01:46:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2011 10:45:30 +0100
Message-Id: <1321868730-28312-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <jad5sh$iv7$1@dough.gmane.org>
References: <jad5sh$iv7$1@dough.gmane.org>
Subject: [meta-oe v2] systemd: add prerm u-a calls
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
X-List-Received-Date: Mon, 21 Nov 2011 09:52:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 7b0771a..228e0e4 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
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
+pkg_prerm_systemd () {
+update-alternatives --remove init ${base_bindir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
-- 
1.7.8.rc3



