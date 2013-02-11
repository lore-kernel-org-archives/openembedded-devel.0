Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Rl-0000Jd-LH
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 00:06:05 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so3565142eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=tH7nxRa9+ztceMUjlhRXkzSO80ecI9iwumlVUb9iwJc=;
	b=s6SxVh6h9va5JiA35QFIVA04tr90Sqrvngxtq3AMtSBj2tuduB6cqnKU5ORaQgWqoS
	IYFYqUgtYVgILVoM1cMbOR8UNv4RMdoY1tznM8YVmqZDlp0ERgHyLYlinjRHxloRZGr/
	C+dd151PMqVocjR1Y1kgB3CoVjd0WaOii+1sb98WkINlq8zMRSmCQI7vs141AafSKapX
	gRS66SEBdrReDkmYxMLpx1yhqVJ8RQM/IaWWnm1YByYoX1hvJGxUk6Kxq2glQrLBHx/a
	So1KMZie4CvcMg9xTLcHkBacxIlyUYmKn4zCxtqky0xxQoCng7SuIv8iFhM/Qhh3u4wA
	6jHQ==
X-Received: by 10.14.225.72 with SMTP id y48mr17148570eep.45.1360623003384;
	Mon, 11 Feb 2013 14:50:03 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id l8sm30910395een.10.2013.02.11.14.50.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:50:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:49:39 +0100
Message-Id: <1360622979-16426-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 3/3] font-update-common: remove
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
X-List-Received-Date: Mon, 11 Feb 2013 23:06:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../font-update-common/update-fonts                |    4 ----
 .../font-update-common/font-update-common_0.1.bb   |   18 ------------------
 2 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts
 delete mode 100644 meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb

diff --git a/meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts b/meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts
deleted file mode 100644
index 19e3157..0000000
--- a/meta-oe/recipes-graphics/font-update-common/font-update-common/update-fonts
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-#Author: Rolf Leggewie
-
-run-parts /etc/update-fonts-common.d/
diff --git a/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb b/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb
deleted file mode 100644
index 1e18cad..0000000
--- a/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Scripts to be called when fonts are installed or removed \
-to make them known to the WM, whether X11 or Opie"
-AUTHOR = "Rolf Leggewie <oe-devel@rolf.leggewie.biz"
-
-PR = "r1"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-SRC_URI = "file://update-fonts"
-
-do_install() {
-        install -d ${D}${bindir}
-        install -d ${D}${sysconfdir}/update-fonts-common.d/
-        install -m 0755 ${WORKDIR}/update-fonts ${D}${bindir}
-}
-
-inherit allarch
-- 
1.7.4.4



