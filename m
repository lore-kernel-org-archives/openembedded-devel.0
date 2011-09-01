Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9cT-00081O-At
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:55:57 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so879969fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xKWmQJAciTBIkBXkVyEkYKttIWhTHRuyvnKtMt9d9kQ=;
	b=iwUagKEhEG9RGrLOFLFkzQsbOeeUQukoZfyG5xTddxmHWQkgtn75jHaIQuM+vGkjHE
	46spGfumwfMfBRFIFh0NR9Q9hAweUywz00sGg41VSGRfqUL5gLV90mShPb1bceAWKiCy
	Pe4dcffzLjVukLXj/4nZSzi8xUhebp6bDhkd8=
Received: by 10.223.17.136 with SMTP id s8mr483124faa.148.1314892263798;
	Thu, 01 Sep 2011 08:51:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm129752fac.36.2011.09.01.08.51.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:51:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:50:53 +0200
Message-Id: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1314892207.git.Martin.Jansa@gmail.com>
References: <cover.1314892207.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] kbd: fix SRC_URI
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
X-List-Received-Date: Thu, 01 Sep 2011 15:55:57 -0000

* '/pub' is part of KERNELORG_MIRROR in oe-core already
* old OE had in bitbake.conf:KERNELORG_MIRROR = "http://kernel.org"
  and mirrors.bbclass:${KERNELORG_MIRROR}     http://www.kernel.org/pub

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/kbd/kbd_1.15.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/kbd/kbd_1.15.2.bb b/meta-oe/recipes-core/kbd/kbd_1.15.2.bb
index 5fdccad..36e68a0 100644
--- a/meta-oe/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta-oe/recipes-core/kbd/kbd_1.15.2.bb
@@ -7,7 +7,7 @@ inherit autotools gettext
 
 BBCLASSEXTEND = "native"
 
-SRC_URI="${KERNELORG_MIRROR}/pub/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
 SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
 
-- 
1.7.6.1



