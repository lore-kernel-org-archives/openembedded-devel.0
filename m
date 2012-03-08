Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iFQ-0003v2-0R
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:39:32 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so193839eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9qo9LJ7BdkAQ7bQ7pmVp4m3BDe2m92ejPBpqFTOg7dY=;
	b=aVmLIHV31ksyPWGk38p9XiDsX+EZcwJSxe3MUSLprg15vSSbygFhywD1GQEOJ0/D+p
	Xm0iggQ5fmFBlYrvnQDygZ/0YzaM8/zqOvHs5UIyjmovUD89sBH/DzhYC/Ur8YWVwijk
	XxgWfJZb2w74vPz4SaFPxi908KkpOwRHw4ASpN+LZFBK+vK19gYB0ve9CGZ4tB4+QOJf
	8c7orec9DpudxaRkCgryvVY5h1ttIh9rYu5KstEye3C2dmxRp0vVA1uBmAF3KBibpeaC
	cyZn7nUVTPHxQuDeZIFTcpEcy8BXeS735FrFi2+e5vGkvVYHK32aFYlsxWWdhK9Z16wS
	TuKg==
Received: by 10.213.110.17 with SMTP id l17mr1425880ebp.112.1331231454824;
	Thu, 08 Mar 2012 10:30:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm8842632eem.11.2012.03.08.10.30.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:07 +0100
Message-Id: <11323dc94b0486ac2c94224e581f015f4a36b7c0.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
References: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 6/7] lcms: add tiff to DEPENDS
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
X-List-Received-Date: Thu, 08 Mar 2012 18:39:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lcms/lcms_1.17.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_1.17.bb b/meta-oe/recipes-support/lcms/lcms_1.17.bb
index efa6402..156bc31 100644
--- a/meta-oe/recipes-support/lcms/lcms_1.17.bb
+++ b/meta-oe/recipes-support/lcms/lcms_1.17.bb
@@ -3,8 +3,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=156745cad721a8783cb847e82b79f586"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms-${PV}.tar.gz"
+DEPENDS = "tiff"
 
-PR = "r3"
+PR = "r4"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.8.5



