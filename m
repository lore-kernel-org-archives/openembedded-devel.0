Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4025B60720
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:56:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 144so14419349pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6kc+z6MIfsnQhIHUaIUtZNNyID2/dzNZAon4T8mMgso=;
	b=rP6XqMOFd1b/zDuINnHQqtNAOf1A3Be9BSmXQ53P1j+aBQpjO+qqZ5UE8zS84+PaWR
	utp0HVWb75DiU/dJXpLnAQDhxwgo5MAnj7L79BVCUwlXr3JI85d5dyldM6rr3XG6NqkW
	f34xsnqZYHZ1b1wU9vNnF0P8WrmjJDny5O0QR7gLp1k4PWaBWL7irxQQ2ujuuCTYXo03
	ot7ANjOu6bb8IIW9hoqzCUe6vQgLdbozFmTwlgMT8uZiy4tdpVcvemjXSaGU7rTI9fTH
	ZKeouuhNU+7wRmHPqfPrWurAQpdBKiax/7X9CjZbIGjT82kFze8to92w5GM/w3S+M+Nb
	EXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6kc+z6MIfsnQhIHUaIUtZNNyID2/dzNZAon4T8mMgso=;
	b=goeIv1XUCrXBBnEjEqDlAv7Cj6E2pzP6bse2o02kCLk0tm1k1qTb9P5O1RnsLaQLgF
	vQxCIex0Qe//TkgVisf45Id1F5MH3DP9CRBigTHL/lCHDsoyF6GoHJzOSbP5j/Vw3zrK
	Csw8532XTfGeqAltMoC6DQkKipmadrd7NtAVlWvgL/kdAJqUKgbmtUmBJHVUACGJrYp9
	to/KeP7BaCyjwfdrs4we2X8VnSXu/h9virxG1ntKraR342qUKZCbyPHXu2+1BXYDNdxx
	lrozV3n8xzK1/F/ZxgEISDPAignfkjkpFHIa0kl9EXX8pDMQ5LQdC7ZyPzkFk9ZKYTmT
	W9RQ==
X-Gm-Message-State: AKaTC00+HSs/A18c4cSRKyuF/fqqHJWoFlH4mcmd2YibH3Y1KI5fvYqRO4eB0RdICJu3NA==
X-Received: by 10.99.226.83 with SMTP id y19mr84799042pgj.147.1480737394870;
	Fri, 02 Dec 2016 19:56:34 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o126sm10838412pga.34.2016.12.02.19.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:56:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:56:28 -0800
Message-Id: <20161203035629.29119-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-networking][PATCH 1/2] igmpproxy: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Dec 2016 03:56:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
new file mode 100644
index 0000000..c3d2f1a
--- /dev/null
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "simple dynamic multicast routing daemon that only uses IGMP signalling"
+HOMEPAGE = "http://sourceforge.net/projects/igmpproxy/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e995e2799bb0d27d63069b97f805420"
+
+SRC_URI = "http://sourceforge.net/projects/igmpproxy/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "c56f41ec195bc1fe016369bf74efc5a1"
+SRC_URI[sha256sum] = "ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae"
+
+inherit autotools pkgconfig
-- 
2.10.2


