Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRQ-0005cL-LP
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:24 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1154438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=i+Frn5m2CZI5Q6RBySOooOxrNUQNSMPwtLy2wuuIgs4=;
	b=CqGWkPNlVPSG9G8TrkYgAjDZX+/7GUEGeQIGEGADikL9kOamCKI52OjCgNvz7IVYd4
	rX97dyHW56iP3FjcESRT4U/rlIkKYSFSoR/zYhOqqYElH2rKJ3JYtWF7Qr9ZvZIYOfPr
	321Rp7oupi68yYZAecLgAmeA7tpTLE+0wiv+yua9P27WiWRhOMyc70HbJ98EZc2rDqMT
	EpO4nV9oAPBQYWrVaTImLmY2zB6+u2YTODVoSgL9GS2fVaUUO7hmnnatBf/Rd9oVo35I
	TsXjAuDVnBaTG7X35yDZBFeSN/ibX0VgoZUBqmSNQY1QMYPbo9IAi6ACbCtQabchA//l
	njdw==
Received: by 10.14.203.73 with SMTP id e49mr20613906eeo.27.1346135174570;
	Mon, 27 Aug 2012 23:26:14 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u8sm58133021eel.11.2012.08.27.23.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:49 +0200
Message-Id: <1346135149-11256-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnJpcqQSGg3FK3KGPm3HCE7MzIxxGqG8yrnExl1hCQXpohc6RH5jDPRgQx/szeGdzTAY331
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 7/7] sox: add 14.4.0
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/sox/sox_14.4.0.bb           |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
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
1.7.7.6



