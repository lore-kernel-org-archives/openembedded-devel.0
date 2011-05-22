Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QO4IF-0007H2-TT
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 10:45:48 +0200
Received: by gyf1 with SMTP id 1so1884286gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 May 2011 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PJfe7bD3mX6azAwgCrGAZzHFEfrpa6UdUFy2umQwRXI=;
	b=hj50Gstk4AbTp4+eWasZschYRjTZRHRP5/yLOa5BltouQINS/dy3PLob1MBb7dtDaW
	U+Z1Tm9HwT9o9MPaE9b9GaHh271fSGS9EhA2PIQL3eIij4l1cumk32SkqkMTGd53Suxw
	LRsIMwlvzg7Fp5ZBsUuxwM6Tm9b+A+LKMAjXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qdnjcc0MZ8QVXTLkVp0c2X04LAPed2cz1eauFo+LMoR/WUZPS86jpgpcISh1dPuY5D
	gJRyoBqs6D0sxuqKbqjP/45jMSfQ6FJpSLO10MleJPKrd64DIkkubUOGi4lMqvtiLwUi
	PAquweXX5TfQgH5SmYgQCKx5iaPu8avaQ+vpw=
Received: by 10.151.105.10 with SMTP id h10mr1625397ybm.316.1306053755986;
	Sun, 22 May 2011 01:42:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q24sm825867yba.28.2011.05.22.01.42.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2011 01:42:34 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 11:39:01 +0300
Message-Id: <1306053541-25460-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Subject: [PATCH] tzcdode-native: modify to use the latest version
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
X-List-Received-Date: Sun, 22 May 2011 08:45:48 -0000

tzcode-native_2011b is not available anymore for download

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/tzcode/tzcode-native_2011b.bb |   16 ----------------
 recipes/tzcode/tzcode-native_2011g.bb |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)
 delete mode 100644 recipes/tzcode/tzcode-native_2011b.bb
 create mode 100644 recipes/tzcode/tzcode-native_2011g.bb

diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011b.bb
deleted file mode 100644
index 30996d9..0000000
--- a/recipes/tzcode/tzcode-native_2011b.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tzcode-native.inc
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011b"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
-SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
-SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
-SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
diff --git a/recipes/tzcode/tzcode-native_2011g.bb b/recipes/tzcode/tzcode-native_2011g.bb
new file mode 100644
index 0000000..65d8cec
--- /dev/null
+++ b/recipes/tzcode/tzcode-native_2011g.bb
@@ -0,0 +1,17 @@
+require tzcode-native.inc
+
+# Note that elsie.nci.nih.gov removes old versions when new is coming out
+# So if this doesn't build for you because of missing source file, just
+# bump it to the latest available version, removing old one
+# Also, tzdata (and it is needed to build tzcode) version can differ from
+# tzcode version, thus this variable
+
+TZDATA_PV = "2011g"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+
-- 
1.7.0.4



