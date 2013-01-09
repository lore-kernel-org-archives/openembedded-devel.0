Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TskH0-0008B3-LW
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 02:16:07 +0100
Received: by mail-ea0-f169.google.com with SMTP id a12so455429eaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ayBDRmignvQfvsUg0JoKnN/VHtoMMzdDgSCPOolFXJA=;
	b=BY3DUDAShYMrBRqEY2EVTIXR6XfbvOgjqDDkMK/bTlIVYz69ukAyK0z/rOvTryBX/0
	rrrVajlQOjB1KgRPKiosJDX6//TvS7U/TRPm8ht4fuod6U+UyDxw1vrt4ibi6N3AbPyN
	Y7HCEfdKDYCFK7d431jFzyBmbRWq1agmmYx1Y1t7LN2+gDgEMnWnqeaRjJIVjZhDoieF
	Eud2AfAiEHESwo3yeRniJH+dHQhdwIX+U4pB4qSm3CmcFAqwl0+1tuuF18ZmgkvOZZxj
	PiTrTGsIWeOCkHB6SwyQu0AZZe4T9oNkOQsRjmlqIUCcGbNd7f+Q500uj9dPEOt6qgvx
	N2SA==
X-Received: by 10.14.221.9 with SMTP id q9mr178937805eep.3.1357693255414;
	Tue, 08 Jan 2013 17:00:55 -0800 (PST)
Received: from localhost.localdomain (p5B0A0819.dip.t-dialin.net. [91.10.8.25])
	by mx.google.com with ESMTPS id q44sm138552893eep.5.2013.01.08.17.00.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 17:00:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 02:00:38 +0100
Message-Id: <1357693239-13210-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-multimedia 1/2] openal-soft: initial add 1.15.1
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
X-List-Received-Date: Wed, 09 Jan 2013 01:16:10 -0000
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



