Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tt5Xe-0004vv-Ir
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 00:58:44 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so1137617eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ayBDRmignvQfvsUg0JoKnN/VHtoMMzdDgSCPOolFXJA=;
	b=zwZFw+v974Xf6rMl+vIcJSNafflTlyHYpQOTu6vr+PydHilboqWu0518FNoB4mu0gl
	QfS/+nysMpNAcD7Xn31txaCJywNK7mAOJoFZaSyhPa/+sx30foOeFAC5jFoe65+ohCvo
	M1ZmHjEYp5d6oqcOqpFiR5ClpAEbL8ufdrNGkO+5xQaxGg++tsjQuV67kyZy/35X9mRO
	DoneHBD+n7gvPkrFfobnulKAdg/kM8Ni41MKZJTax9oBdQkNepCy7ef9wwwCAM0QnA9U
	wjThPnecWfh37IC0f2AFlwK16W1rFFOhOub7fPr/jTJjGDDjTqPc5js7fB+aKBq+9/M3
	8Mxw==
X-Received: by 10.14.204.70 with SMTP id g46mr160918495eeo.15.1357775010044;
	Wed, 09 Jan 2013 15:43:30 -0800 (PST)
Received: from localhost.localdomain (p5B0A280F.dip.t-dialin.net.
	[91.10.40.15])
	by mx.google.com with ESMTPS id e2sm144302197eeo.8.2013.01.09.15.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 15:43:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 00:43:13 +0100
Message-Id: <1357774995-1104-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-multimedia/meta-oe/meta-systemd 1/3] openal-soft: initial add 1.15.1
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
X-List-Received-Date: Wed, 09 Jan 2013 23:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openal/openal-soft_1.15.1.bb                   |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
new file mode 100644
index 0000000..81de6e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "OpenAL is a cross-platform 3D audio API"
+HOMEPAGE = "http://kcat.strangesoft.net/openal.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=facc3a8f452930083bbb95d82b989c35"
+
+inherit cmake
+
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+          "
+
+SRC_URI = "http://kcat.strangesoft.net/openal-releases/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
+SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
+
+EXTRA_OECMAKE = "-DALSA=${@base_contains('DISTRO_FEATURES', 'alsa', 'TRUE', 'FALSE', d)} \
+                 -DPULSEAUDIO=${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'TRUE', 'FALSE', d)} \
+                "
+
+FILES_${PN} += "${datadir}/openal"
-- 
1.7.4.4



