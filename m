Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UUWbo-0008S1-MO
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 08:21:44 +0200
Received: by mail-ee0-f42.google.com with SMTP id e52so71987eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 23:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=r5CkoQCaJD384Fb4jpRxmytyLneMSIT0Wo7We/+zHqU=;
	b=JMNjSuocWvtk+rb8FPpQzSoqaVB71BAYsiVAgIBDM2n6RH9XdT6GE1VSK2BG+67FnO
	Xv7HM1ss2PCNPIoCt2gNMDuRmkt7mlERZB55xPKgU3Kpnq79YOKmSxbYOx9zVLR3HuKB
	1QgF6bmCdmjUuq4+WpwjYMIVXRcMY4/b3jVsSDYojUkZLsomzkb4zX3wCG1LXyu06ttY
	tIVHsT85xq83XG1AbzZZ9OKVGakWMEfu/HoukeSSrNGz5tTjmbm6emEz6jBiwKlXIXh9
	UeG53FJApKxr/i9WkBlkwjRJEWHaI8fWf2teHL2rc++taBlVPFIj7iOPbpiOseNivzkV
	WQrw==
X-Received: by 10.14.109.131 with SMTP id s3mr3232234eeg.26.1366697044717;
	Mon, 22 Apr 2013 23:04:04 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0864.dip0.t-ipconnect.de.
	[91.10.8.100])
	by mx.google.com with ESMTPS id k43sm17419186een.2.2013.04.22.23.04.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 23:04:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 08:03:53 +0200
Message-Id: <1366697033-1109-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce] xfce4-xkb-plugin: Update to latest git
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
X-List-Received-Date: Tue, 23 Apr 2013 06:21:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In 7b35cdc554ee3f42f9619996604d4674126711c1 xfce4-settings was updated to
development-release 4.11.0. Reason for this was handling of keyboard layout
by xfce4-settings.
With this patch xfce4-xkb-plugin synchronizes with xfce4-settings, shares
settings and uses dialogs from xfce4-settings. These changes were not yet
released because they depend on development-release of xfce4-settings.
Next stable release of xfce4-settings will be with xfce 4.12 with release date
unknown [1].

[1] http://wiki.xfce.org/releng/4.12/roadmap#roadmapplanned_features

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...b-plugin_0.5.4.3.bb => xfce4-xkb-plugin_git.bb} |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.5.4.3.bb => xfce4-xkb-plugin_git.bb} (51%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
similarity index 51%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
index 8ec7fd2..a1f1a2f 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_git.bb
@@ -6,9 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "libxklavier libwnck librsvg"
+DEPENDS += "libxklavier libwnck librsvg garcon"
 
-SRC_URI[md5sum] = "b31144bd50875ec73f0b3101456c97fd"
-SRC_URI[sha256sum] = "ca4801bb2edfe04eeceb71879b3cf79a0674e8311c39117efdb9d3521307396d"
+PV = "0.5.4.3+gitr${SRCPV}"
+
+SRC_URI = "git://git.xfce.org/panel-plugins/xfce4-xkb-plugin;protocol=git;branch=master"
+SRCREV = "b98b82d8522842e38a6355f9144f8348a6ab2aeb"
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    NOCONFIGURE=yes ./autogen.sh
+}
 
 FILES_${PN} += "${datadir}/xfce4/xkb"
+
+RDEPENDS_${PN} = "xfce4-settings"
-- 
1.7.4.4



