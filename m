Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Szosp-0000eR-98
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:04:07 +0200
Received: by eaad12 with SMTP id d12so340446eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 05:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=iUWooRPTGTwjPhiMPZq4zDC2PEBwwIvhBf7zuKeHtH8=;
	b=cPb7TNZ/m8LeCz2+j4CEp7cVi5HA93HCzGR5gmHFpCJ1k2LqjRsQlLarmO/TokN2q8
	cAdcAbY+F6rGfumOVcFn16l4AEx0ecflzynQGBaVIPv/9e6A79gNWXrQLp6va3Hkm+Fj
	dWPPZftkFIuHGK6ecAb13Wv+x7MIT29EjINFN1svE8cpcLq9hhEpWRMlAK9tx49SLqAb
	9rYsAkQ7riS44+ZWW4ALJSVm2AipvtVbQ20Ilq6r0hT2fzPdecw5XiSEeHTJ5FFWgvrQ
	ynqcVxZtAdA/JSkxLhQYPaZNOjO7iGDfeW5UbMDc06fZleXJ47sQ9XN2YCFbGqdVxv4F
	OHtw==
Received: by 10.14.181.132 with SMTP id l4mr3170973eem.17.1344603137593;
	Fri, 10 Aug 2012 05:52:17 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 8sm11245801eeg.16.2012.08.10.05.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 05:52:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 14:52:12 +0200
Message-Id: <1344603132-9182-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkSdhNA/IYF0D2QQWN64XgBUrXHSjL7O6EN6MbfQ83y3hO3+I1EU7lrFe4VUt0avUCe2zvY
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH] sox: add 14.4.0
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
X-List-Received-Date: Fri, 10 Aug 2012 13:04:07 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/sox/sox_14.4.0.bb           |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
new file mode 100644
index 0000000..f7ec1ee
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION="SoX is the Swiss Army knife of sound processing tools. \
+It converts audio files among various standard audio file formats \
+and can apply different effects and filters to the audio data."
+HOMEPAGE = "http://sox.sourceforge.net"
+SECTION = "audio"
+
+DEPENDS = "libpng libav libsndfile1"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                  "
+PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
+PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz"
+SRC_URI[md5sum] = "b0c15cff7a4ba0ec17fdc74e6a1f9cf1"
+SRC_URI[sha256sum] = "3ee34b14dd267de378e8a117aae81ec4cae330772342e6a55bbf6520a0a88aa3"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.10



