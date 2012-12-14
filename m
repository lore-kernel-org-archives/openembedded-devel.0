Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TjaJS-00006R-1x
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 19:48:46 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6224645ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=f8m0VMBhygAIm0QWeMlpRbMJprWWcMzmHpco9/ElvfY=;
	b=Pqa1eVFTW3j9VBAX4iznLqbs/NHSt7Br1K3+UQs9HBFfN6vD5+Rsejr78mnaMhHzJp
	wXqnHaIeZ7ZZAn5a8YhHfRcL1/25nTvNdf3FBRIOYRAbhiOIapfoSdl2jPDIfV7CSWUb
	sLHaw1XzJqVZrcCCZIzBn6SQYFWXgtngVjvA1tEJRxl/d+/7pMdwDo5ifcDwuOdonYBZ
	v5QgknvQhGuieCHoAmuBM5zEdpX++u0skz8KGY8QX5GpKbrvHUE0i8EUmsB5xFcc0787
	WAer9y77wzFefR+//pL7Rg8oIj6ZioTFx2lxxOVKVTTVrUWIeZ9ssYwrpezyL0P3QgOx
	8MVw==
Received: by 10.50.157.162 with SMTP id wn2mr2602355igb.27.1355510048726;
	Fri, 14 Dec 2012 10:34:08 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id s3sm4536424igb.14.2012.12.14.10.34.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 10:34:08 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:33:43 -0500
Message-Id: <1355510023-17096-4-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
References: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH 3/3] coriander: add recipe
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
X-List-Received-Date: Fri, 14 Dec 2012 18:48:46 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 meta-oe/recipes-multimedia/coriander/coriander_2.0.1.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 meta-oe/recipes-multimedia/coriander/coriander_2.0.1.bb

diff --git a/meta-oe/recipes-multimedia/coriander/coriander_2.0.1.bb b/meta-oe/recipes-multimedia/coriander/coriander_2.0.1.bb
new file mode 100755
index 0000000..fe46a1f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/coriander/coriander_2.0.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Control and capture GUI for IIDC compliant cameras"
+HOMEPAGE = "http://damien.douxchamps.net/ieee1394/coriander/"
+SECTION = "applications"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/coriander-2/${PV}/${P}.tar.gz"
+SRC_URI[md5sum] = "2bffa79925bda182c5c3c975e5b81a63"
+SRC_URI[sha256sum] = "a597411a03e48407922a539b503877cb056bf57bb9551a5b569ee4e29fbbd050"
+
+inherit autotools
-- 
1.8.0.2



