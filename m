Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjdv6-0003D0-I5
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:04 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2387421fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=J0w1GZsP0h34A9nJzM/BLTEivfEn89ane0U+4cobpo0=;
	b=UQxQttlcK/cKDQfv6Y/o7IQH9Z6lbNvHaUGsrszf/poB+kKkCiaggZAGQ+dlR90a/S
	dperFbEQC7ZPHUL/wWaWALhauX2owa2aLkGZq46YazLrn2WDk8VsFz+S72ly+cq8kfxc
	OqChN/vzWPPscSutxv7Y7TMGg0rW9n1JGiGAI=
Received: by 10.223.28.7 with SMTP id k7mr812694fac.70.1311195540171;
	Wed, 20 Jul 2011 13:59:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s10sm927020fah.46.2011.07.20.13.58.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:58:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:46 +0200
Message-Id: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] vala-dbus-binding-tool: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:04 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-dbus-binding-tool.inc                     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index d86e923..a59488d 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -11,6 +11,6 @@ export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
 SRC_URI = "http://downloads.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
 
-inherit autotools
+inherit autotools perlnative
 
 BBCLASSEXTEND = "native"
-- 
1.7.6



