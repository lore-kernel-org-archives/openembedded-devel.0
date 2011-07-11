Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qg6nN-0002UV-Pq
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 05:04:29 +0200
Received: by gwb11 with SMTP id 11so1429206gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2011 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ds5EebzRrdqKxxajYSPbbzic6daW/kEsPbtY2GTCU1U=;
	b=b+Fx208/QK97i+3kZDaMF7qu8bBBM6FHSGw/f8eMUm0Hl1uadjlWeEOkzMPGLzMusd
	AioUY1J4TGgWJjMusjPJ2w9nv8E6iWmqeOOza72fwDIsCxUGxnEG+kp7DYMWoTqGH8nn
	lEYH56JZ7ckhk8mfSFHhnofkD5EmA8G+QhxkU=
Received: by 10.90.3.37 with SMTP id 37mr3564032agc.169.1310353232263;
	Sun, 10 Jul 2011 20:00:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id g23sm4056049anp.28.2011.07.10.20.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jul 2011 20:00:31 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2011 21:56:37 -0500
Message-Id: <1310352997-22504-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	Paul Menzel <paulepanter@users.sourceforge.net>, k-kooi@ti.com
Subject: [PATCH v2] angstrom: Use pulseaudio version 0.9.22 for armv7a architecture
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
X-List-Received-Date: Mon, 11 Jul 2011 03:04:30 -0000

This fixes all the issues noticed earlier with pulseaudio 0.9.15:
 * Pulseaudio keeping audio devices busy when run as per-user instance
 * Failure of pactl, pacmd etc to connect to the pulse server

The gcc 4.3.x angstrom is using in maintenance lacks the needed atomic ops to build pulseaudio 0.9.23
for armv7a so we use pulseaudio 0.9.22 which is less buggier than pulseaudio 0.9.15

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Following Paul's suggestions, changes since original patch:
* Moved setting of the PREFERRED_VERSION for pulseaudio from conf/distro/angstrom-2008.1.conf
to conf/distro/include/angstrom-2008-preferred-versions.inc

* prepended the patch title with "angstrom:"

Original patch:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033854.html

Paul's suggestions:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033872.html

Koen's comments on the lack of atomic ops in gcc 4.3.x:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033866.html

 .../include/angstrom-2008-preferred-versions.inc   |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index b5b524a..4833d35 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -45,6 +45,7 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
 PREFERRED_VERSION_pulseaudio 	= "0.9.15"
+PREFERRED_VERSION_pulseaudio_armv7a = "0.9.22"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
-- 
1.7.0.4



