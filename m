Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLg-00027y-65
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:29 +0200
Received: by mail-wi0-f171.google.com with SMTP id hm14so1272860wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rO5bOkl0g0H9NAM0xRbXYOM+RwKgXEY5ussknLNzAe0=;
	b=ZaLuCR7yApKEcWquMUg1/jyqxtTfdgk5IBfKP2PPis70FqP3zxNQDq217zrpIuhFx0
	JEfpbThqz6j2OdgwgS4rNcZJ94Wf7iFJ1D7v/0mW5jt/58ocMPreRgxhkWf5gEr7En7K
	sz2TZ/wbNNU7cUCJ1KJ81BUEwGVwrjcUVzwKbp7rbSdHflbmB55cOAnhGxTlrWT69LYc
	PrC/B9+UiNeM8Ji/SeCDX5F/q6MQefcauQwJdp8gUKuCuJvIBdDYdWIc4r09UUpK7b/L
	Cl0RWoebXtG9qWDDl3wq064iRf6UlRvhft4Oto3hgvZtuvk03WwpFmXHZIOqcsquaHfz
	V8Ew==
Received: by 10.216.198.14 with SMTP id u14mr5070923wen.12.1338639127965;
	Sat, 02 Jun 2012 05:12:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.12.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:16:01 +0200
Message-Id: <1338639361-23775-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 15/15] task-xfce-extended: add panel plugins / applications
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
index 2dbd9f0..3c9fced 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -33,8 +33,17 @@ RRECOMMENDS_${PN} = " \
     xfce4-diskperf-plugin \
     xfce4-netload-plugin \
     xfce4-genmon-plugin \
+    xfce4-xkb-plugin \
+    xfce4-wavelan-plugin \
+    xfce4-places-plugin \
+    xfce4-systemload-plugin \
+    xfce4-time-out-plugin \
+    xfce4-embed-plugin \
+    xfce4-weather-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
+    xfce4-power-manager \
+    xfce4-mixer \
     ristretto \
 "
-- 
1.7.4.4



