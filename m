Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoq-0006aY-QK
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:42:10 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sPKpZpPGOjcBpfcfsyqhz9l6ymt2K4gldLh9K6BYH8A=;
	b=ackqjeXJsutfLcUvdZ/W0qiDtEfJyKzRa3CKETD0uGlMMaXVT+E54dyjbOru8zAou3
	ulLrtGThYliU2qAPlxuXwbKRoBGqaWQwqcXo2a+FXK3XaZV2KcAfp/KfGBQhsuR6yS1E
	8uiJw2EprN4tdaR04C/8H5oehhZbHabL5vCtY=
Received: by 10.223.77.71 with SMTP id f7mr27468076fak.33.1318894582050;
	Mon, 17 Oct 2011 16:36:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b16sm199533fao.7.2011.10.17.16.36.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:26 +0200
Message-Id: <e5e2e10689c13de55ba1bf26cfafce177154d9c0.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 07/10] abiword: add SRC_URI checksums
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
X-List-Received-Date: Mon, 17 Oct 2011 23:42:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
index 86c55f0..c469369 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
@@ -8,6 +8,8 @@ RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 
 SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
+SRC_URI[md5sum] = "bbc9c124f8072875129bd67092f0fa0b"
+SRC_URI[sha256sum] = "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6c4bde820b58c598b3f"
 
 #want 2.x from 2.x.y for the installation directory
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-- 
1.7.7



