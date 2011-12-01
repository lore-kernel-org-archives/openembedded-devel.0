Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rafaelignacio.zurita@gmail.com>) id 1RW7Ou-0000D8-Bi
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 15:14:12 +0100
Received: by ghrr13 with SMTP id r13so1836118ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cCRO2ABsf4k3Ua77kVex9di7OdB9grmXg6spRxsRaUc=;
	b=wjN8fP0LvT/MWxTqyBVJh+njRtp5nsARV/ueLyfK1NxY/wM63tMNiQM9GbSqQfHI0I
	+x4PiM3TtbDX5FQ5ozoAfDL1Lzb6HRS7Bcl6gLfDNZtRE8yru8ajrJwOcRze6hJGtXcR
	p64RFWeWkiNlt1JDSPt77RRmw/KzyQptzvYow=
Received: by 10.236.46.72 with SMTP id q48mr11827578yhb.80.1322748450677;
	Thu, 01 Dec 2011 06:07:30 -0800 (PST)
Received: from localhost.localdomain ([186.137.0.13])
	by mx.google.com with ESMTPS id l31sm6505006yhj.22.2011.12.01.06.07.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 06:07:30 -0800 (PST)
From: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2011 11:07:26 -0300
Message-Id: <1322748446-29453-1-git-send-email-rafaelignacio.zurita@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: kristoffer.ericson@gmail.com
Subject: [PATCH] directvnc: Add initial recipe with version 0.7.7
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
X-List-Received-Date: Thu, 01 Dec 2011 14:14:12 -0000

DirectVNC provides a very thin VNC client for unix framebuffer systems.

Signed-off-by: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
---
 recipes/directvnc/directvnc_0.7.7.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/directvnc/directvnc_0.7.7.bb

diff --git a/recipes/directvnc/directvnc_0.7.7.bb b/recipes/directvnc/directvnc_0.7.7.bb
new file mode 100644
index 0000000..9e9afa7
--- /dev/null
+++ b/recipes/directvnc/directvnc_0.7.7.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "DirectVNC provides a very thin VNC client for unix framebuffer systems."
+HOMEPAGE = "http://drinkmilk.github.com/directvnc/"
+SECTION = "utils"
+LICENSE = "GPLv2"
+DEPENDS_${PN} = "zlib libpng jpeg directfb"
+
+SRC_URI = "https://github.com/downloads/drinkmilk/directvnc/directvnc-${PV}.tar.gz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "e30f1a0e45b440443c044148fb62ad6e"
+SRC_URI[sha256sum] = "ac8c0a6b6aaf0702411e71dd3626c655287c903233b659389fc07113114c9de3"
-- 
1.7.0.4



