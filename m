Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rrq6i-00023x-NY
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 13:13:12 +0100
Received: by eekd41 with SMTP id d41so1140943eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 04:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lJmwFZeC9A9oNg78bTyDf6Dblo1T/U3kqkx8zPPccUc=;
	b=OZRQdDAJ9ovd0+OGfPTZ16XRDdntZwzg+HR6Otk/I6Ds2iQsjl48QkZypmx9djUGrJ
	La+bvIuwlP0LncYshlr5k7FwPGdZnfhKReqdtw6zJ7i32J9onWXSpiZ0VQgKyh1mvZgD
	JQckjrvX8sxDIaDFi/icafOaOROhE3C/XogVw=
Received: by 10.14.4.143 with SMTP id 15mr5363541eej.104.1327925120255;
	Mon, 30 Jan 2012 04:05:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm71782867eeb.11.2012.01.30.04.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 04:05:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 13:05:07 +0100
Message-Id: <1327925107-28946-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] libsdl-ttf: fix LICENSE metadata and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 30 Jan 2012 12:13:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index 61b7521..ce4e316 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "Simple DirectMedia Layer truetype font library."
 SECTION = "libs"
 DEPENDS = "virtual/libsdl freetype"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+
 PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
-- 
1.7.8.4



