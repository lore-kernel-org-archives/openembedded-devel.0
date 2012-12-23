Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkrY-0001yI-Eb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:41:28 +0100
Received: by mail-ee0-f43.google.com with SMTP id e49so3235759eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=YCpCy4YZH8VhfJyYCMaDLTI1tNdDBF24vB3893K6SoE=;
	b=lc28ZhXJnGn+71jtwnaxlBYiiXyyf4Sk4ZbPx1cOtfqCyQq/UtE6h6uIsI3OaoeatN
	Ht+4SWP9nM25c3PN+EHj0CN24uRrWUsCRfO6GI62djrH3ZLTKCv966Z0hZRxX3KTXijh
	xn73ahPvqE1vRIv2KrLhyRhzyI7+9g4995gWPQmrLwCK4cER4fkJ2pYFWwLCm5ZrT4Y+
	4Syq5TkKGX0Yz7ISZjpjJV5iaDaEsmSiFDstWrSIxjy88Ph8wXWE6pzLMXar97GNbUvF
	55ppUvkL1+fxj4DhGsZi5AVl2KHgbn3SuIkGlrGQqjQz6J8FR7+GqpDzb1piBBx4ru8/
	6w6Q==
X-Received: by 10.14.221.65 with SMTP id q41mr47759445eep.30.1356265576141;
	Sun, 23 Dec 2012 04:26:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm34570559eep.1.2012.12.23.04.26.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:26:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:54 +0100
Message-Id: <e5f7cfd9b5d2cab42111e46b5ae33bcc1d5a9af3.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 29/30] pavucontrol: upgrade to 1.0
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
X-List-Received-Date: Sun, 23 Dec 2012 12:41:43 -0000

* also fixes build without lynx:
| make[2]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/pavucontrol/0.9.10+git-r1/git/doc'
| make[2]: *** No rule to make target `README', needed by `all-am'.  Stop.
| make[2]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/pavucontrol/0.9.10+git-r1/git/doc'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/pulseaudio/pavucontrol_1.0.bb    | 13 +++++++++++++
 .../recipes-multimedia/pulseaudio/pavucontrol_git.bb    | 17 -----------------
 2 files changed, 13 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_git.bb

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
new file mode 100644
index 0000000..b648351
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_1.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "intltool gtkmm libcanberra pulseaudio"
+
+inherit gnome
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "0ab6b13542af9b4417438527d2524316"
+SRC_URI[sha256sum] = "3dbe2865b6e3a195a8951967d9234f62cd254c30b08bdea1ecf8997b58f68cde"
+
+EXTRA_OECONF = " --disable-gtk3 --disable-lynx "
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_git.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_git.bb
deleted file mode 100644
index 0975e9b..0000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "ulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "intltool gtkmm libcanberra pulseaudio"
-
-inherit gnome
-
-PV = "0.9.10+git"
-
-SRCREV = "50efee1180a785f297ce6dc38b349ee7e28c8129"
-SRC_URI = "git://anongit.freedesktop.org/pulseaudio/pavucontrol;protocol=git"
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = " --disable-gtk3 "
-
-
-- 
1.8.0.2



