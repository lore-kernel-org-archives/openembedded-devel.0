Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0364F6086B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2013 08:22:12 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id eg20so2941748lab.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2013 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NBR23K9P9CqPpA04jyjzq+x7lyQp+R2NL1h/izwMdyc=;
	b=RCloWgz79GVAuOvLmju7f9orcavxf+4k4XchEzirlv6BdmxMaqO1/PswVKTBQdp9mO
	RIXDHv4wffiwRKf/xI0IRTYqt/2QA6rEr8aSKyW83qxftnCuNEy74everQolSgbanV/D
	z9wKNPr3o85lBHSbZqKyX2jnXQl83So9250rUo5NAA4nXLNs/Vc51Pyi5B6iGu65GV+z
	5klxJ0RhtI89vEC8EJ5XmT992itagxyd6hthfmph0M2aqPmTN094es9t6xHw/8L9dhaX
	mdT+rMrGOKsyFeBxieM4l8oXLDjsMYQ9RukjI1aibM+MI+8Gk8edMWbKfRtYPnw3FEzp
	TebA==
X-Received: by 10.112.131.129 with SMTP id om1mr5383017lbb.45.1369297332617;
	Thu, 23 May 2013 01:22:12 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id zo6sm4299785lbb.9.2013.05.23.01.22.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 23 May 2013 01:22:11 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UfQmn-0001rY-Fy; Thu, 23 May 2013 11:22:09 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2013 11:22:07 +0300
Message-Id: <1369297327-5864-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe]] libmikmod: depend on texinfo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2013 08:22:13 -0000

With changed behavior of 'missing' in automake-1.13, libmikmod
build was failing when makeinfo was not present.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
index efef5d2..e6bdcbe 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 
-DEPENDS = "alsa-lib"
+DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \
-- 
1.7.10.4


