Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMuvE-0007SZ-4M
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Apr 2013 08:42:20 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so32382ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 23:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=E1MFG0knwfTi1QBV+ylfxbCZ5zVMG+qXHYslLELLWb4=;
	b=UuV/yfUzbVnA3a3EtHeMR1mrX1bo1pMcUWi7Mya7z+nH1IeGQBfrOGG3s2PUNP9p8j
	BjvsG5CAwnFtoLv69ajg1UnHmTvsp2sV7PaS9BjadjatNRPdhJN1d+wVnUAqTVzKjD9b
	y1y3XpeNu2pZdHQ8c/Ul3c78lxNUy87PAhvnS7a1MTlry2QrvdbsVodQ65qWN2KongxR
	GyD5CFnq4A3MdogKzx4e/8INAv3vg+I8EEA2nUOAYU1y+ikdqMlXirXvK+bYDbwQuuUX
	X9HvEXkQwR3uAEUlSIbKEFl11+KzHuHHSXVBJrT91WVhgbLQtKD6KzZOudq1eLTNvIua
	GV/g==
X-Received: by 10.14.175.71 with SMTP id y47mr45384045eel.18.1364883910997;
	Mon, 01 Apr 2013 23:25:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3A51.dip.t-dialin.net.
	[91.10.58.81])
	by mx.google.com with ESMTPS id s3sm458591eem.4.2013.04.01.23.25.09
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 23:25:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2013 08:24:53 +0200
Message-Id: <1364883895-24252-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364883895-24252-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce, V2 3/5] exo: split out exo-csource to exo-dev - it is not required on target
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
X-List-Received-Date: Tue, 02 Apr 2013 06:42:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index cafa531..45a346e 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_virtclass-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r2"
+PR = "r3"
 
 inherit xfce pythonnative perlnative
 
@@ -37,4 +37,7 @@ FILES_${PN} += "${datadir}/xfce4/ \
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
 
+FILES_${PN}-dev += "${bindir}/gio/exo-csource \
+                   "
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.4



