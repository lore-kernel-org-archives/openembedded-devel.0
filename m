Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TECLZ-0004qz-9d
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Sep 2012 06:57:13 +0200
Received: by pbcwy7 with SMTP id wy7so1474662pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ImW3t6vdviPIZaVrWsulX91n5RQraa0+OjtJJ/B+Ozs=;
	b=J38UiAbFmPd1HHvxpLz29uLamoEbxp6ZQLXO38PD7a8QHfEuJRy4qM2NXZA1U4lHi8
	DIcwT2+JMzJvZJdqVx2YxDX/1VTnZwY74QzEIJ5yKLRMrP0yeBm77/GhggePOhx9aJDg
	JQSRJZXqbCjLeEktAtUcgActUMWMJht8dmMborTzXoo8Mnc8gk2s/81IW4hHQLnHAwEo
	GefS3EgH3jtPUw+hfnHp86x7XotXs8cQ7lEOH5ZP5SdVS6/w9Shxr6WOcBUijjYPjMSa
	4dVo99PkquvjTsLRZdjkLas6kseqW5g7/bf8V6qXsiL9EGF81w9vyQqCzyvSQPB3ipfw
	QBeg==
Received: by 10.66.81.66 with SMTP id y2mr3872036pax.62.1348029871863;
	Tue, 18 Sep 2012 21:44:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id bn5sm455788pab.12.2012.09.18.21.44.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 21:44:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 21:43:19 -0700
Message-Id: <1348029799-31922-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] sg3-utils: Correct typo in checksums
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
X-List-Received-Date: Wed, 19 Sep 2012 04:57:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/sg3-utils/sg3-utils_1.31.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
index 5fa0765..8b0b76a 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1cc481c050dc92e12db9c8145043d5dc"
 PR = "r1"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
-RC_URI[md5sum] = "9431e1944cde829a24dedf027e1364b5"
+SRC_URI[md5sum] = "9431e1944cde829a24dedf027e1364b5"
 SRC_URI[sha256sum] = "d84b38b61f0ca3941eb1c48a5858f93d1d1b70a623e579f5ecce2440e18410a4"
 
 inherit autotools
-- 
1.7.9.5



