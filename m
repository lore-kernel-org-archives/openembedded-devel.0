Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Ra3fG-00087K-SS
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 12:03:24 +0100
Received: by bkbzt4 with SMTP id zt4so5059413bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 02:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cgCG1l+nLk5z7ShcRiWBO/FVkgu7/qyylFAfpy/ciA0=;
	b=K3tEloF/b8VXw4h3c+jzxkIaCkCXEmnGvt3Axr9eaDXLtkYaYy8rDl3KHUGJYBQkge
	5cyDnRxYuJMb0JGu4/hulxvcPN7RDrQbuLqP2YatPox139mY7AnpKCT41xOmcotz/7f5
	kCeRrfT+GiizEVar6ZXKbH5PCrVkNv90g6bd8=
Received: by 10.205.81.141 with SMTP id zy13mr9409234bkb.50.1323687388448;
	Mon, 12 Dec 2011 02:56:28 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id p13sm30782722bkd.4.2011.12.12.02.56.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 02:56:27 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 11:56:19 +0100
Message-Id: <1323687379-25490-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] florence: Initial recipe added
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
X-List-Received-Date: Mon, 12 Dec 2011 11:03:24 -0000

Florence is a virtual keyboard used to input text with a touchscreen.

Tests:
* Run tested on Overo Gumstix with xfce-nm-image
* Build tested for Qemuarm

Known issues:
* Florence cannot access the gconf settings?

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/florence/florence_0.5.1.bb |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/florence/florence_0.5.1.bb

diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-oe/recipes-support/florence/florence_0.5.1.bb
new file mode 100644
index 0000000..79f5742
--- /dev/null
+++ b/meta-oe/recipes-support/florence/florence_0.5.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
+HOMEPAGE = "http://florence.sourceforge.net/english.html"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo gettext-native intltool-native"
+
+
+SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
+SRC_URI[sha1sum] = "a3f1c29dd436150002ec14ce9a63de1d72bd1f91"
+
+
+inherit autotools
+
+
+EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet"
\ No newline at end of file
-- 
1.7.5.4



