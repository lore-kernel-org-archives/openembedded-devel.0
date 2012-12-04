Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7n-0002oS-70
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:45 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=J5/O/f/6zFZEsUV633B3k0v6bgtkDYRmop03kDLzq+Y=;
	b=gda9EjjgYs8ioVwwcoD3X/rXE+P/ItM4CwEZ6hPeygLJGle8i1DFLLzguirifFb2ni
	KACDQBNvej5dWs3Lf2S4UoRwnZHO+qwTAc4+aAx902EVTOmt/HPZA9VTxCSDWJ/axOE0
	1fa5SwfWun+n6G8gARiIOUp3/vl3agccRm8pUSLZYz9xOd9kefaMvvqCQ/0YHcPOxtKv
	wjHKvlIu7F4Ll+6BdmVD0dwRS+w5hLkKkZDaZnWDt5MGbm8jmn3Lrd4DNjkMmmtwh+tX
	TiFVf09o9D3Tmr0sAdQU96uKo9JVW+2ZeY+VizrIeIO3GhuVANcmckoxL6kZHqO2Mbhj
	ErRw==
Received: by 10.14.2.196 with SMTP id 44mr42899591eef.25.1354586783630;
	Mon, 03 Dec 2012 18:06:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25528082eek.0.2012.12.03.18.06.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:22 +0100
Message-Id: <b6ffdcba7d87a2dff6b70a2b0c3f4cc14ca06264.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 49/58] xf86-input-void: fix SRC_URI checksums
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
X-List-Received-Date: Tue, 04 Dec 2012 02:39:33 -0000

* does someone have old xf86-input-void-1.4.0.tar.bz2 with old checksums to compare them?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
index ccd27f1..89c7806 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -4,5 +4,5 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
 
-SRC_URI[md5sum] = "3056bc7c57db8c5d56039648c0530c45"
-SRC_URI[sha256sum] = "aba69784ac83f5951af3e164312adb4b8b1c91a8f79ab35dc5165c534e14c674"
+SRC_URI[md5sum] = "93821f21e807260b05431c62437a8b32"
+SRC_URI[sha256sum] = "2ab95865252c64cc88050fa0089a74e063c357b71907bf9be7886047c4987505"
-- 
1.8.0



