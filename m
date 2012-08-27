Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T5v11-0002WF-OD
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 10:49:47 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so1161743bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=DhyphHBXkJSHsjESfi1sdOKui1moDhIZAUZWSLDzQoE=;
	b=CRlY4vExmS+pptmFfTs7pKhS5thxUPmiMVDYt6bj2dnGYSMMCdFc/pZEAqcL32yflT
	2vrGvtqqeHtbZPPorYGELQLYkWkH2BJ2QKZdIwAzY9JrIgb7S6rnmPFYQqHZ7hnMCjC9
	+edb9+fkr6RTCowgAUnC94BfHCx/Al/ba+y+d557mvrbsxWNU8v+ljb3eOrXNFH57BOy
	6Z3MWLJPSruRkiCyu/cMMMZkL19v5osIxzmbl1NqU8KmL//zSCpW4ZUKrCGOSjBaqA3L
	23IZssWKRifmDT6dO/LHEdirZ4UQis5ORv0v+pPASykOWYZptaIiO9/91md5NNDyByss
	x88Q==
Received: by 10.204.4.130 with SMTP id 2mr3499819bkr.37.1346056658829;
	Mon, 27 Aug 2012 01:37:38 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id m9sm9940391bkm.10.2012.08.27.01.37.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 01:37:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2012 10:36:51 +0200
Message-Id: <1346056611-31432-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1346056611-31432-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346056611-31432-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 2/2] libxfce4ui: fix xfwm4 crash (no window borders) on first start
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
X-List-Received-Date: Mon, 27 Aug 2012 08:49:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-private-xfce4-keyboard-shortcuts.xml-fix.patch |   31 ++++++++++++++++++++
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb    |    3 ++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch b/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
new file mode 100644
index 0000000..b8c9178
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
@@ -0,0 +1,31 @@
+From 708e59caaf1c0c271a96a4d1fe46b122aff45e34 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 27 Aug 2012 09:16:29 +0200
+Subject: [PATCH] libxfce4kbd-private/xfce4-keyboard-shortcuts.xml: fix xfwm4
+ crash on first start
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libxfce4kbd-private/xfce4-keyboard-shortcuts.xml |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml b/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
+index 723a10d..e6502f3 100644
+--- a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
++++ b/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
+@@ -66,4 +66,8 @@
+       <property name="&lt;Control&gt;F12" type="string" value="workspace_12_key"/>
+     </property>
+   </property>
++  <property name="providers" type="array">
++    <value type="string" value="commands"/>
++    <value type="string" value="xfwm4"/>
++  </property>
+ </channel>
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
index ae9dddf..e2bc81e 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
@@ -3,9 +3,12 @@ SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf"
+PR = "r1"
 
 inherit xfce
 
+SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
+
 FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
 
 SRC_URI[md5sum] = "30bd432dd0f19305e846a122d4c7c6fe"
-- 
1.7.6.5



