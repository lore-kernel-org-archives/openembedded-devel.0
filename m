Received: from mail-ye0-f178.google.com ([209.85.213.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Ewq-00033e-Hx
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 20:03:22 +0100
Received: by mail-ye0-f178.google.com with SMTP id q9so226265yen.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 10:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=vAwcXalj+ZR9mICegL7qlAZ/+amn0qjER5dTWPnylmI=;
	b=goNSiwlljthrr6hYjd/AQ3eCk1g4dAj+iLDmQbHYD7kza5UcNylqpbuD2uCgC9mAS9
	K31VDJ4fWWbjA+59pqBecvAftKWAeXfl5osITOcnlEjfrDXGLE1uuv1+oyedchNHnHHB
	UDxVZxOt2CECCWcwLoR5NJs4s2BvBqf3tF6yjV20BMKIMC2SQiFY8fzQrl2Fk+aUhVto
	bb1ywQGnHZGGIUoTks47bg9O8vXWOQ8eiWJYlRSXxFWoz/y5wt3e692WMY3ffz0dUiYa
	gKUN+dzd3UdnZuzYPRFqj2rnFT1zdxt5usM8Cr3gfghU1P5BkulpqcuUTgS53sufO77S
	4lQQ==
X-Received: by 10.236.134.163 with SMTP id s23mr38235351yhi.54.1361386028825; 
	Wed, 20 Feb 2013 10:47:08 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id u19sm73250523anj.5.2013.02.20.10.47.06
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 10:47:07 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 10:47:03 -0800
Message-Id: <1361386023-5046-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmP4hkFNHwZ6OYVZbPFIJqADOBi7VwSV23AX1W/I434HrZua2p92Rf+ftvr5gLge98hNGOx
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Wed, 20 Feb 2013 19:03:22 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This is a useful utility to manipulate the mac address of a device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../recipes-support/macchanger/macchanger_1.5.0.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb

diff --git a/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
new file mode 100644
index 0000000..21c8425
--- /dev/null
+++ b/meta-oe/recipes-support/macchanger/macchanger_1.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "macchanger"
+DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
+HOMEPAGE = "http://www.alobbs.com/macchanger"
+LICENSE  = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PR = "r2"
+
+SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
+SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
+
+FILES_${PN} = " \
+  ${bindir}/${PN} \
+  ${datadir}/${PN}/wireless.list \
+  ${datadir}/${PN}/OUI.list \
+"
+
+inherit autotools
\ No newline at end of file
-- 
1.7.9.5



