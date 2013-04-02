Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMuvH-0007TK-3P
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:42:23 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so31890ead.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PEnStep6R/T5KqYFeu2pnqYj31W4s/dU8mKxBXwFxXU=;
	b=gzus/8WL5NAHbwYA0fHPR85M4DBWqgtolPuXBRADvTObpUBbrl/lafsI7sM0HyB0iJ
	GKwlAfuftiIdrcMRBNtO9rwS9khTqUHOUGCn4CRcTp42L/YN7V+OcIRa5g4zR9P4pM5L
	eMQdpXuweIZqVteat844bUmgx88tDWxyJ/rsENhf1ifo/YXNWGSjge1AuhvgHgqeuKdz
	WVR6dirD9IvJRH2uK8VtzCEXeqWhLvZkAFsXJuwIuPWYB8t9E/GLmecZLbzxvjx/1ZLx
	PD4WThTbanO/cF4F1F2xGCOtQqek270AdWUi3hHeGQI5j8U8qY+fXs9O6sjlrjZUB3rn
	PLpQ==
X-Received: by 10.14.183.67 with SMTP id p43mr45440698eem.10.1364883913978;
	Mon, 01 Apr 2013 23:25:13 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A51.dip.t-dialin.net.
	[91.10.58.81])
	by mx.google.com with ESMTPS id s3sm458591eem.4.2013.04.01.23.25.12
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:25:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2013 08:24:55 +0200
Message-Id: <1364883895-24252-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V2 5/5] packagegroup-xfce-extended: add xfce4-closebutton-plugin
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
X-List-Received-Date: Tue, 02 Apr 2013 06:42:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index a771bc4..7ee65f6 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -41,6 +41,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-battery-plugin \
     xfce4-mount-plugin \
     xfce4-brightness-plugin \
+    xfce4-closebutton-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



