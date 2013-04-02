Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WU-0004vp-I7
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:47 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so451046eaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TFswSFYgQNUsNTp1jdEWncpK92VAbSHB+U2kyurPJs8=;
	b=IedkDYsjwVQzrrOA9iY3XIorc1y7IZYa5GGxbL4DYTsD6VORL1tPDDkhPPHvm9RVIP
	qIyCm2Fham4YkcGJixANUPC0b7PQ2jjJVgKRLB6J1LwhYARLobz6vXFr0Z3OQZbUE60H
	EYOqW3QuMcsXXeHRJRROcXbw1i/Z9hsVv8C39pzNXl6v9gw9tbUu2i0FCIwDTGSXiStZ
	WHP1+I/cVs70DhTNf496mv41s6EvxYQ4XcCcbrHhC7pZVHKRstAzemXpxvd0cGj9UwvS
	9YSq/6SMP9tE6TFujy/gjsePt70o0ZIc1A2N3BL+XXCKXTyFd26Ue64hVUtIBNJ6uE9y
	WxJw==
X-Received: by 10.15.23.193 with SMTP id h41mr53691474eeu.17.1364940036461;
	Tue, 02 Apr 2013 15:00:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:18 +0200
Message-Id: <1364940019-23226-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce,V3 4/5] xfce4-closebutton-plugin: initial add
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I do not have the environment and the time to create a tarball, so take sources
from my git repo.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../closebutton/xfce4-closebutton-plugin_git.bb    |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
new file mode 100644
index 0000000..879d1d6
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Plugin displaying close button for application currently active"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
+
+inherit xfce-panel-plugin gtk-icon-cache perlnative
+
+DEPENDS += "exo-native libwnck xfconf"
+
+PV = "0.1.0+gitr${SRCPV}"
+
+SRC_URI = "git://gitorious.org/xfce/xfce4-closebutton-plugin.git;protocol=git;branch=master"
+SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+	NOCONFIGURE=yes ./autogen.sh
+}
+
+FILES_${PN} += "${datadir}/xfce4/closebutton/themes"
-- 
1.7.4.4



