Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc70-0006Vo-Sf
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:34 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=TPM0bGGRPe0upl9WHyFOwYZGAv/3GSTsWTQTBlGJlhY=;
	b=HwzAhhq5EMkEYmkLAtDMrPj4UGfy1KoxJxxfpOC1Vlmrdp7GURWz3YzFpRRaW5VllR
	/neXWQKx/7Jo9qWMZ6ZXox76c7/jJ8f6KwlCulyweFUsJI5lOHts366pJVUxTFLbUJIO
	DZlTSqdGhhqMjfC5KQyJRyLOWdH3zvPTEKpYMPpOBeAXmfTTgRavVbwJ4WJOdMZiI49K
	InqPWLryeubGlQt8Y+kIdt4NPCKL6z4jOg7/h8YQJ+lcfD/T5FNQoU6m3JAOw9H/KDK+
	+mHryiC3dtQdKF6bm7+BSoxz0R6sy6DCKzkje1d9jDv1kCLtYy9aM7zkEyLD9KBZfO59
	Eaag==
Received: by 10.14.127.6 with SMTP id c6mr71879eei.164.1342170802976;
	Fri, 13 Jul 2012 02:13:22 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e45sm23235929eeb.6.2012.07.13.02.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:06 +0200
Message-Id: <1342170730-14982-20-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlblAMYgJ7MYUw1X0X8ZKAXkQG9BmWTpG5bnZEG5+PKWHJ6JOBO1PYKSglp+rbejHuJOpqz
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 20/24] cheese: add 2.30.1
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:35 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
new file mode 100644
index 0000000..d6d61fd
--- /dev/null
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effects"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
+
+DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop eds-dbus"
+
+inherit gnome
+
+SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
+SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a"
+
+FILES_${PN} += "${datadir}/dbus-1"
+RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
+
-- 
1.7.10



