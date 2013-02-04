Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2ADK-00043Y-Sc
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 01:47:15 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so3074337eei.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 16:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ZXMw25mEQBnVV8dbWfzDiVCNIPDZUqy6L8M1UZSYciM=;
	b=YXWKsrHdBcb2wqwwtAzIlPVqOwfzLSiqCzUbCBrDSBOu4J2xBVx8vDyKINJCuRaVEo
	6Z6KA1yA60L692JW5ADGWbnXYJAItnWpL5pYgI+c+Y1waoI0e6bhTYcz+tgXEBY/O49i
	rpqoLsxeHOEft9FAF6y4t8iQg+xiYv1r9T/nGh4ZXBIL5JH4ZIHFK2ttP7j4K+dPKtVz
	IkUDOI3S3gsKLODVvvCIxqE74XdPT0TNOUzAeLTq7DoZVZZ2NtNSP58LirYSZFAENTjs
	1feX1qqcNSaSJjbdF3HWFsNLp01I6Q0vnua6pgeqckd/Eu2j+lV+Sof+76xCuTuBK9mx
	ruIw==
X-Received: by 10.14.202.197 with SMTP id d45mr19286376eeo.1.1359937887726;
	Sun, 03 Feb 2013 16:31:27 -0800 (PST)
Received: from localhost.localdomain (p5B0A0847.dip.t-dialin.net. [91.10.8.71])
	by mx.google.com with ESMTPS id j46sm21263378eeo.3.2013.02.03.16.31.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 16:31:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 01:31:11 +0100
Message-Id: <1359937872-26028-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 3/4] packagegroup-xfce-extended: add xfce4-brightness-plugin
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
X-List-Received-Date: Mon, 04 Feb 2013 00:47:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index d4f91fd..a771bc4 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -40,6 +40,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-fsguard-plugin \
     xfce4-battery-plugin \
     xfce4-mount-plugin \
+    xfce4-brightness-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



