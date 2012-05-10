Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SSS8Q-0008ML-P4
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2012 14:06:18 +0200
Received: by bkcjm2 with SMTP id jm2so1267146bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2012 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=FKM3hPbnkMHKBh4EStmkQUP4RazzNpvfVxAd5eaiBNs=;
	b=ZyIeL34jgWrXFN2yF7Q8l2yrSv/QBrOJleKBebRvoDu/TTRVS+il2O1Dt4O7fVceB5
	tt40igVOhS8+vZlbzxSvZMhEjtM8HixovJdzHhFXTmjHLBUq3wOsLY90pN+WGBlRscPG
	l7HSzIoNhYL+DUNHadNC/dGTXgwdoObR0hOkn4IPn6TRBNCnsB3ABZOPmyDkN0or9UvJ
	fBXv2QbS+lO3Cx2yyMtkCPixJBW3RUuWYDNw7idehJ8DaPiqUr5eZuDBvWsu29zj9DlM
	Q4tGIQYAO+QGRA02NnemFnSL6b2VpmCL4ZYd9/xeMXhuUai2Xno6FvGyP2u5EZPllAKI
	S83g==
Received: by 10.204.151.81 with SMTP id b17mr1997406bkw.52.1336650984400;
	Thu, 10 May 2012 04:56:24 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id
	fw10sm11364859bkc.11.2012.05.10.04.56.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 04:56:23 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2012 13:56:01 +0200
Message-Id: <1336650961-11681-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] libopus: adding libopus_0.9.10
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
X-List-Received-Date: Thu, 10 May 2012 12:06:18 -0000

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 .../recipes-multimedia/libopus/libopus_0.9.10.bb   |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
new file mode 100644
index 0000000..27d8a75
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Celt Audio Codec"
+DESCRIPTION = "The Opus codec is designed for interactive \
+speech and audio transmission over the Internet. It is \
+designed by the IETF Codec Working Group and incorporates \
+technology from Skype's SILK codec and Xiph.Org's CELT codec."
+HOMEPAGE = "http://www.opus-codec.org/"
+SECTION = "libs/multimedia"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d9f9b3714db6bbcfb6e42170d9c664d"
+DEPENDS = ""
+
+PR = "r0"
+
+SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "afbda2fd20dc08e6075db0f60297a137"
+SRC_URI[sha256sum] = "4e379a98ba95bbbfe9087ef10fdd05c8ac9060b6d695f587ea82a7b43a0df4fe"
+S = "${WORKDIR}/opus-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-fixed-point"
-- 
1.7.5.4



