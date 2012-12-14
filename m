Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TjaJN-000060-G4
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 19:48:41 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6224541ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lsshCpMnwBTTOflAbFty3u/rAREa8Id101t+DL+GEwk=;
	b=dfypgiJwm01ZIXhgQ5GFbmX/mNsoAAZWQC9uA115U3Zyb8DXs6SZURiLI2CZWH6dfh
	w6zw22zZW3ec9LVjZIXfduttHSBySOC/jLOw6tLyeufskihiGpYZYUNmkzdOL/uyMzc8
	rpX0rNU+A4b2YpkQbuOmIk8PyIASucXofAvLmfl2l+SGBfn5NH0Kks26U2mWqiwTzPpD
	/QuTxYHJkasaYmnQSVEPbtv58pHn4Cm6X8BJD+oKljqgrVGSZl9A2V4F2zMxEA2P6+iS
	7hlqkDqR9jaED3n1NCniMBPMXkq+NVobI5Ewbjb5i1dG6bEVOngjwfvquDEs1+xhiF8R
	BOeQ==
Received: by 10.50.236.104 with SMTP id ut8mr2564109igc.20.1355510044577;
	Fri, 14 Dec 2012 10:34:04 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id s3sm4536424igb.14.2012.12.14.10.34.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 10:34:03 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:33:41 -0500
Message-Id: <1355510023-17096-2-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH 1/3] libraw1394: add recipe
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
X-List-Received-Date: Fri, 14 Dec 2012 18:48:41 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb

diff --git a/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb
new file mode 100644
index 0000000..b0b4a53
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "base library for low-level IEEE 1394 accesses"
+HOMEPAGE = "https://ieee1394.wiki.kernel.org/index.php/Libraries#libraw1394"
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${P}.tar.gz"
+SRC_URI[md5sum] = "faf6b18a92075d80e45b603f9a659670"
+SRC_URI[sha256sum] = "f83268b3f5d37e8d42ae9881c099b55839b70ac0af71549be7ef6af2578e809a"
+
+inherit autotools
-- 
1.8.0.2



