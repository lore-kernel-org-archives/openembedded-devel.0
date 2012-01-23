Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFn4-0006fE-3z
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:14 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RMik0u/6vuMaYm0ExAqg8P/fCjsS3bN/NpaY/+gpMME=;
	b=DckO2NrmXXkmgiNHOkCX5wnhy6/UdxuaVrjShzPXYN1gn3mPJCg6vvjlm7rQW7SIsv
	if6nHRmfFBMOV1NI3YLia84vD77b9SdwhRQwCS70BRECKLMH0NSFFWXGvDLIwuiQaPMI
	E18+zNR06bNqhTHyIuf8f7sgjefQ5TQDw6gWI=
Received: by 10.213.2.82 with SMTP id 18mr1398115ebi.43.1327308872442;
	Mon, 23 Jan 2012 00:54:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm51246971eef.8.2012.01.23.00.54.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:54:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:17 +0100
Message-Id: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 1/8] libxaw: bump PR to disable xmlto
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:14 -0000

* meta-oe now provides xmlto-native
  http://git.openembedded.org/meta-openembedded/commit/?id=ab8f876ca8fa223c183e3db2029cce88f3435a27
  but not the stylesheets for buildhosts without them it's unusable and fails, because xorg macros
  autodetecting xmlto available, see:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/037066.html
  after adding xmlto-native and stylesheets-native to DEPENDS we can enable it again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
index 1b8b5da..ea4f38b 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
@@ -5,7 +5,7 @@ DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp pr
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1beacbc336a5a256bb28dbfcf01c2be"
 
 PE = "1"
-PR = "r11"
+PR = "r12"
 
 SRC_URI[md5sum] = "ccc57478c41b7a75b9702241b889b1d4"
 SRC_URI[sha256sum] = "a83977546b78e24ac5dca86affc10b6404a87c16272405b05386feca1a2db037"
-- 
1.7.8.4



