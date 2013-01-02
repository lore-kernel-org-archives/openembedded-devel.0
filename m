Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI3-0000Yd-9g
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:36 +0100
Received: by mail-ee0-f44.google.com with SMTP id b47so6860929eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Yu8RESvRrxZTh0Itv7JnPVUSsGXodQaCaB6Gs5e5cA4=;
	b=HPuSHwO0l/0FI62E1YOQMLoytFdmB/HkoK5p8yj7L5ff14nqq5+CnWSLDR+pOCFsp3
	gCWlcPB8wUHe/mjiEtKSh2tCK9SY2GBdHg7FI8RDzFxL1FIzs1xdE6/8u4eBTY0NEQuI
	n+3udoEPHZeXTHvF4hJnT2iDnQwzY060zKksQN7Cuc0L34+aDf+2CMGfq+KSe6RR1ais
	iPKXzsstzrhHRvMebMMgoxtvSfwQh9ew0flR88pBBNOcc4hdZPt6dSxGyT3vxks8C0wk
	AxmOoo9xtKmJIdlLThnr6MbWVsUm+pr6NKI4P0nx6a/s9x2C67QB1lNL+CJ/tUrHa7cV
	W/tQ==
X-Received: by 10.14.3.195 with SMTP id 43mr125830349eeh.36.1357139793123;
	Wed, 02 Jan 2013 07:16:33 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:09 +0100
Message-Id: <1357139774-4364-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 05/10] packagegroup-xfce-base: xfce-terminal -> xfce4-terminal
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-base.bb        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index e42ea3c..3d8b062 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -33,7 +33,7 @@ RDEPENDS_${PN} = " \
     xfce4-settings \
     \
     xfce4-notifyd \
-    xfce-terminal \
+    xfce4-terminal \
     thunar \
     thunar-volman \
 "
-- 
1.7.4.4



