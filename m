Received: from mail-ye0-f171.google.com ([209.85.213.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlMnV-0005eU-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 17:47:09 +0100
Received: by mail-ye0-f171.google.com with SMTP id m8so494841yen.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 08:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=v46zGIlqAYWrDoDlQxij6DxIRrQ6NdQ8ZqTJ86eKhDU=;
	b=ewN6QTf3IW4sTiuxS0kXERlYm9aSNOEJNzclBonJusn9G3TNLqbI7EdLLmKkPyx/Y1
	ZIFnE/3oOdn4QjWtxhKkqrTXoUcdAJOvDCrD1M/z9N6KPNaDj5HUfYBfMF6Y2xCRzxaa
	WDnqCOCufGfNkbI6P9iQtd3Oax86guamcdCHk3j+Ls9A6KO0kyLuc402UZJJbf0k4Zk3
	9aI+v9qBRsS7PC5BeDgpw9LIxGx8EHWxkiAf2sqFjY75mHIpH4Vo5A9mAAPhGMi9RoDB
	Z1s/mMENHDDRZxDsHCqX2gelBYLjV+3gml/mgbIBWIv9jYKl0LgqfuCW1ZaRum5gH2j2
	1OXw==
X-Received: by 10.236.141.134 with SMTP id g6mr4862268yhj.96.1355934746110;
	Wed, 19 Dec 2012 08:32:26 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.170])
	by mx.google.com with ESMTPS id v9sm4593775anm.22.2012.12.19.08.32.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 08:32:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2012 14:32:11 -0200
Message-Id: <1355934731-32281-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
References: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 3/3] openmotif: Disable printing support
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
X-List-Received-Date: Wed, 19 Dec 2012 16:47:10 -0000

Change-Id: Ibf0a4e3d6f1fd32b712a42053dbd97bbd06a16fc
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index e7a0220..23142ee 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -1,11 +1,11 @@
 SECTION = "libs"
 DESCRIPTION = "OSM/Motif implementation."
 LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxp libxft"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxft"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc1
 
 inherit autotools
 
+EXTRA_OECONF = "--disable-printing"
+
 PACKAGES += "${PN}-bin"
 
 FILES_${PN}-bin = "${bindir}"
-- 
1.7.2.5



