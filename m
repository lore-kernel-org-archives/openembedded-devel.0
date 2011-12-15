Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9RB-0002u2-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:22 +0100
Received: by yenm12 with SMTP id m12so1369411yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=gvKHrwRL+qoUvN5vosAaDCRda4/3gnFN03rEPlVK4Dk=;
	b=ExBobe3buDjdtevfkI6updzjdm8OFqnq+2LsG0WpHDAGb+crUoTWcUgbnsmrvBCioy
	8VxspZfiln7n2gLkKpujRwAK0S4aSwLwj79HVfcceZzCHJ6woULNjt4dDlJm96GmROws
	V5IoNSVb8cuWQYToCTRnhn2tQkPoxRkN8ARho=
Received: by 10.236.129.140 with SMTP id h12mr4392119yhi.47.1323947902055;
	Thu, 15 Dec 2011 03:18:22 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:02 +0000
Message-Id: <ee3349b62721b50d965c78eeeab8969468d60934.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/5] setxkbmap: fix checksum
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:22 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
index 22df1f1..127b0f6 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -4,5 +4,5 @@ DEPENDS += " libxkbfile"
 PE = "1"
 PR = "r6"
 
-SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
-SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
+SRC_URI[md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
+SRC_URI[sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
-- 
1.7.2.5



