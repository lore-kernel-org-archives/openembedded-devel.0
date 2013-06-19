Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6B66AD8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:08 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so3438339eaj.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GiGymCor8qd59yy6967tUPd/xDKglb75jo/YYe0r4W4=;
	b=EMGzwjjiFj8Pm9CdzjvNpfQhuG0SOV7KCHT752xClOd0+rowgX8e3Bbjb5OasQckk6
	FbChQxKWKh7jPEm1K0nBMsogCpqiukK1MnAAMdH44fIhzC6hOlMim7AASb8NXfU4jPoQ
	+LMyIM4lza6tgTgzgJ9h73seWVvqPfsxfd/pDrNIIsGzG9LQOhw2SGqAt8Z6XqAlBxk0
	OZW2+4xv1W9oBFWPVSHOrytaPIwwOFpVc+LLwzF8ZpZ7x0vFPM2oiEwvXZx6SxH5pn8y
	cDfoJ1CsV4lDfI7+bKjNWtLZfbwB6G1K7qqD8e6XwGwUAdLoQpOiVhtb82nHLFS3wyZc
	1HhA==
X-Received: by 10.14.176.199 with SMTP id b47mr3591014eem.117.1371663008922;
	Wed, 19 Jun 2013 10:30:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.30.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:26 +0200
Message-Id: <1371662967-31734-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 19/20] xfwm4: don't turn into unusablity after setting system time backwards
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 17:30:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-display-events-when-time-is-set-backward.patch |   33 ++++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb       |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
new file mode 100644
index 0000000..08fd76b
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
@@ -0,0 +1,33 @@
+From e87977696f03b0c9f72884f8e3e3ec3248dfd80a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 18 Jun 2013 12:46:42 +0200
+Subject: [PATCH] don't block display events when time is set backwards
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=10184
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/display.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/display.c b/src/display.c
+index 00318d5..651bc7a 100644
+--- a/src/display.c
++++ b/src/display.c
+@@ -733,7 +733,7 @@ myDisplayUpdateCurrentTime (DisplayInfo *display, XEvent *ev)
+             break;
+     }
+ 
+-    if ((timestamp != (guint32) CurrentTime) && TIMESTAMP_IS_BEFORE(display->current_time, timestamp))
++    if ((timestamp != (guint32) CurrentTime) /*&& TIMESTAMP_IS_BEFORE(display->current_time, timestamp)*/)
+     {
+         display->current_time = timestamp;
+     }
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
index 687339b..86ac20e 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
@@ -8,6 +8,7 @@ inherit xfce update-alternatives
 
 SRC_URI[md5sum] = "10de50c79ed944cbb9c87741062c2a76"
 SRC_URI[sha256sum] = "380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740"
+SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
1.7.4.4


