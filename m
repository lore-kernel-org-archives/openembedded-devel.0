Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1R8B1c-0005aM-25
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 15:15:12 +0200
Received: by yia27 with SMTP id 27so5322214yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Wu0a1uJtH/gEdrPnjN7uwFlPD57FQ7TZDIhYvkSR/no=;
	b=A9nYTfpBhDEI03nOX4FWvtJniMjz2rUFxzRSJdRqCTboVZ1/geVexa/7fGWzWWdnzg
	3ZdWQ08PLotXjqnzyKkuxWdZA78l+iW3OhTwm7ri/q6w6M9U0YWzJkqMT8timN/TOsxI
	M7thewn8p5CcQwMAH0puOVtfvSByBDTD+aukE=
Received: by 10.150.7.21 with SMTP id 21mr1129825ybg.444.1317042586574;
	Mon, 26 Sep 2011 06:09:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id u4sm32809659ane.21.2011.09.26.06.09.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 06:09:45 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 16:07:34 +0300
Message-Id: <1317042454-30164-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCHv2] iw: build version 0.9.22 from git sources
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
X-List-Received-Date: Mon, 26 Sep 2011 13:15:12 -0000

Builds a new version which adds wowlan support from public git source

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/iw/iw_git.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iw/iw_git.bb

diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
new file mode 100644
index 0000000..e4d0cd5
--- /dev/null
+++ b/recipes/iw/iw_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "BSD"
+
+SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
+PR = "r0"
+PV = "0.9.22"
+PR_append = "+gitr${SRCPV}"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = " \
+	git://git.sipsolutions.net/iw.git;protocol=git \
+	"
+CFLAGS += "-DCONFIG_LIBNL20"
+
+S = "${WORKDIR}/git/"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.0.4



