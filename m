Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrcQX-0005X5-TJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 22:36:46 +0100
Received: by eaal12 with SMTP id l12so993841eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=b4vzVMSwFlfE0wvwRV7xz4WkDP3X0wVSzT9iAkP4FtU=;
	b=okxICmIR+8fWAj9mGxjKKvTSBtV8zsgSyZdNUyRn/XDOVZM68WkbroG6NvwzLqGawE
	PNyrYQQ5ReuusCT2EaamsKraKwOQuo1WbJbnOQcClA+KCK6dI3mlvJh/BGXV8/PydTfL
	xU8QRzNbcF2mFjLRsB0IwAfydZsYYsD58hiMk=
Received: by 10.213.2.145 with SMTP id 17mr2401601ebj.104.1327872533750;
	Sun, 29 Jan 2012 13:28:53 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id n17sm63740491eei.3.2012.01.29.13.28.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 13:28:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 22:30:57 +0100
Message-Id: <1327872658-3574-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce][v2 3/4] task-xfce-extended: add xfce4-genmon-plugin
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
X-List-Received-Date: Sun, 29 Jan 2012 21:36:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
index 122252f..2dbd9f0 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -3,6 +3,8 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+PR = "r1"
+
 inherit task
 
 # mandatory
@@ -30,6 +32,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-clipman-plugin \
     xfce4-diskperf-plugin \
     xfce4-netload-plugin \
+    xfce4-genmon-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



