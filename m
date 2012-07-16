Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SqlrY-00030h-41
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 16:01:24 +0200
Received: by bkcik5 with SMTP id ik5so3526168bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VOvzfQHi741ZGIwondbyS+nK7Mw+Ud2NknnsQRSBEI0=;
	b=Twd6m0hHhodzXGXmuEp2Xa8A0Ec17vzdRe1XQe5crXVlC4wCvkp6Cj1p/k5hsoSEU9
	WzhYi5Vck5ot6KYFOgYLdudMJ+IvpFtjWWS24Blv7+moGQFbWrDrqH0OmtFAlGoj27ud
	vHYXIW3S9IncYg89MHz6yIUyhHy05aDvxU0/xFwiitXth2ASEhKf1GpWJCDRaq2SJ4r0
	F4Lzaz5vd4CAI54rzHdj+4R8eTvwkr/WP4j5tM4C4sMwaQ8ckQ8DaFiFMri7zW+LaRk/
	ANw3oJ6Aw0ZRXX4z6N3WE1HKqbmGbYWIAgKaE/RQ5CL6NPKvJDveacZKS5RiQHKzDVLM
	Yg8Q==
Received: by 10.204.154.85 with SMTP id n21mr4776298bkw.48.1342446605990;
	Mon, 16 Jul 2012 06:50:05 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id hs2sm8179247bkc.1.2012.07.16.06.50.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 06:50:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 15:49:38 +0200
Message-Id: <1342446578-8330-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342446578-8330-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342446578-8330-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, resend 2/2] task-xfce-extended: remove xfce4-icon-theme
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
X-List-Received-Date: Mon, 16 Jul 2012 14:01:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfce4-icon-theme is not required by default since xfce4-settings initially
works with gnome-icon-theme and gnome-icon-theme is pulled in by many other
recipes anyway.
To reduce rootfs size - especially after gtk-update-icon-cache -
xfce4-icon-theme is removed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
index 3c9fced..0c13a64 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r2"
+PR = "r3"
 
 inherit task
 
@@ -23,8 +23,6 @@ RRECOMMENDS_${PN} = " \
     xfwm4-theme-tyrex \
     xfwm4-theme-wallis \
     \
-    xfce4-icon-theme \
-    \
     xfce4-cpufreq-plugin \
     xfce4-cpugraph-plugin \
     xfce4-datetime-plugin \
-- 
1.7.6.5



