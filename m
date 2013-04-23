Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UUY5y-0003r2-DF
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 09:56:59 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so101703eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 00:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=eQj/Q58i5V0yLeq9VipeYidIxIBuhgJJDlNzZOwFiHY=;
	b=IZS1KcAvnRQGyIvwNoVd3Pnc8T3xljDnJam76xhcy4c4OpxNHlH+NbpomPn3JvfeSB
	CoeUF4tE92NSNCW8KWMCBZqd23tT3OzezqsCauqg2ZAhQFk8pyOAefsJyUDcqd+A0PGB
	rcouG7ahPS5u4W1hHueATEWlXp9KNloHxuzpk6M97awQscVtGwjGIb9yqMkQJ/JUAy1P
	8zpeAhAO+cBR4GgscKOs2j4TmqN6SqIJIEIDmpb9+J97NzIgwBVyGTGXfCYChPGKXQJP
	kwFjk1opzVNobOrcrWNXZw54L1A9Px6a0DBG4hQE158YHeo9jm6atdqXnJ13guVIS6QG
	t6cQ==
X-Received: by 10.14.194.70 with SMTP id l46mr1680772een.28.1366702758328;
	Tue, 23 Apr 2013 00:39:18 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w51sm45036741eev.13.2013.04.23.00.39.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 00:39:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 09:39:05 +0200
Message-Id: <1366702745-10346-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQnTek7BmeIHGmiMATvs5ReT+WJ9WHucz3LL3EgybY32byNTaze9XY0oeddW+q/UrxKlskYC
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce][PATCH] xfce4-mixer: add missing dep on libunique
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
X-List-Received-Date: Tue, 23 Apr 2013 07:57:01 -0000

checking for unique-1.0 >= 1.1... not found
*** The required package unique-1.0 was not found on your system.
*** Please install unique-1.0 (atleast version 1.1) or adjust
*** the PKG_CONFIG_PATH environment variable if you
*** installed the package in a nonstandard prefix so that
*** pkg-config is able to find it.
Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
index 1884860..57bcf42 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf"
+DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-- 
1.8.1.4



