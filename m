Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Ra8Xf-00065N-7w
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 17:15:51 +0100
Received: by eekb15 with SMTP id b15so2613508eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 08:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NE0LSu7zF+LoH1Yu7my9OnujtlzbGV0AviUFes9in7M=;
	b=DNLo9ex9qkP/mdMRdfezpfuBXIvrmlcF3X/3JDfPi9ZCnQ2l6HUzMB9O3qJ7RCkQw0
	bIwCDE6LOfV94Fy1u7vn3+6lyeFf3d8JAijeuwgfYE9zJM+JTTzNnaJOhDQFWt0tU5YH
	cJHC3YoSyNC2fDKUgWtlvzAyVOEE8JGi0QmFo=
Received: by 10.213.25.201 with SMTP id a9mr3775547ebc.20.1323706136770;
	Mon, 12 Dec 2011 08:08:56 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id 65sm76841966eeg.8.2011.12.12.08.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 08:08:56 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 17:08:09 +0100
Message-Id: <1323706089-31836-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe] [PATCH v2] florence: Initial recipe added
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
X-List-Received-Date: Mon, 12 Dec 2011 16:15:51 -0000

Florence is a virtual keyboard used to input text with a touchscreen.

Tests:
* Run tested on Overo Gumstix with xfce-nm-image
* Build tested for Qemuarm

NOTICE:
If florence can't find its gconf settings,
you need to start florence with --config and save the configuration once.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-support/florence/florence_0.5.1.bb |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/florence/florence_0.5.1.bb

diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-oe/recipes-support/florence/florence_0.5.1.bb
new file mode 100644
index 0000000..1f1d7ef
--- /dev/null
+++ b/meta-oe/recipes-support/florence/florence_0.5.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
+HOMEPAGE = "http://florence.sourceforge.net/english.html"
+
+#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
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
+inherit gconf
+
+EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet"
-- 
1.7.5.4



