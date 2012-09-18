Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym4-0001n9-NI
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:40 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uLKINxN/4q5Lt9qP9CgT2D6K7tYTEnJGJpWbrC26myo=;
	b=VlWth3yOZhdsDX5hkODSkDmt+qGXOrsrXgXxCCY5LrQ9Jj6HtKfNkAI/QJb0edIGIJ
	H+zEptKYNtg47MgwO04olu+iv7WLLsx1RTxUma5HznJ89V/eaG/QO5KAUtA6DggRZ8RX
	qEMcAcvxHUVczlfQVdY4vI31vDzmlsCPeX6mOdjMIs2X0mclcQxlKC0rNoVwxk2Fc/U1
	WXCYA7Rg65blmTTjEUdBPQeAsEmJvJruvysLuSjNu1fx8eAwxxQPxWpHNIEjSFfdH7Rs
	Aw2/TY73ZHHHXVNto4WyLspPAN4yJeK7YR64kC38vtvuqCJio+a+TMmurmWaJM99h1BI
	9s0w==
Received: by 10.204.129.208 with SMTP id p16mr124857bks.129.1347977702779;
	Tue, 18 Sep 2012 07:15:02 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:14 +0200
Message-Id: <1347977601-28665-34-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 33/40] packagegroup-xfce-extended: add xfce4-fsguard-plugin and xfce4-battery-plugin
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index fcc716a..ea4bd1e 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -37,6 +37,8 @@ RRECOMMENDS_${PN} = " \
     xfce4-time-out-plugin \
     xfce4-embed-plugin \
     xfce4-weather-plugin \
+    xfce4-fsguard-plugin \
+    xfce4-battery-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.6.5



