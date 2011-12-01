Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rafaelignacio.zurita@gmail.com>) id 1RWAMn-0007d1-D9
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 18:24:14 +0100
Received: by yenr11 with SMTP id r11so1949862yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gXq5tUhhh+RoxIkIssqE5HVi4VfDrud2ixyF78zc13E=;
	b=fVtPkt+2kkyXrpeHnN6kZ2S76clVJ6CUT8wICuRZnqpxx7olTdJJ2o1LAlyYoyYHPs
	x1tf7j4R4Z6u8p0M6/om9RgY7XEl91uadvLwjRM1SHRTH4lebgim5xbe/mRFzjOC4Wy3
	XU3H7dOVejhHnOdNDAonF0P+j8pcDgIvvVV20=
Received: by 10.236.154.3 with SMTP id g3mr13853801yhk.119.1322759821029;
	Thu, 01 Dec 2011 09:17:01 -0800 (PST)
Received: from localhost.localdomain ([186.137.0.13])
	by mx.google.com with ESMTPS id u20sm6291976ank.9.2011.12.01.09.16.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 09:17:00 -0800 (PST)
From: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2011 14:16:56 -0300
Message-Id: <1322759816-16498-1-git-send-email-rafaelignacio.zurita@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH v2] directvnc: Add initial recipe with version 0.7.7
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
X-List-Received-Date: Thu, 01 Dec 2011 17:24:14 -0000

DirectVNC provides a very thin VNC client for unix framebuffer systems.

Signed-off-by: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com>
---
 recipes/directvnc/directvnc_0.7.7.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/directvnc/directvnc_0.7.7.bb

diff --git a/recipes/directvnc/directvnc_0.7.7.bb b/recipes/directvnc/directvnc_0.7.7.bb
new file mode 100644
index 0000000..1917320
--- /dev/null
+++ b/recipes/directvnc/directvnc_0.7.7.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "DirectVNC provides a very thin VNC client for unix framebuffer systems."
+HOMEPAGE = "http://drinkmilk.github.com/directvnc/"
+SECTION = "utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
+
+DEPENDS = "zlib libpng jpeg directfb"
+
+SRC_URI = "https://github.com/downloads/drinkmilk/directvnc/directvnc-${PV}.tar.gz"
+SRC_URI[md5sum] = "e30f1a0e45b440443c044148fb62ad6e"
+SRC_URI[sha256sum] = "ac8c0a6b6aaf0702411e71dd3626c655287c903233b659389fc07113114c9de3"
+
+inherit autotools
-- 
1.7.0.4



