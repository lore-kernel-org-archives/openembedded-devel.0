Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rz5cp-0002PW-6p
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Feb 2012 13:12:19 +0100
Received: by eaal10 with SMTP id l10so1582564eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2012 04:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.213.28.133 as permitted sender) client-ip=10.213.28.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.213.28.133 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.213.28.133])
	by 10.213.28.133 with SMTP id m5mr1372803ebc.62.1329653042867 (num_hops
	= 1); Sun, 19 Feb 2012 04:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tuHT8rGTHvtomrDILb4zpvNadVHsCi3bqlTXvrrI0TA=;
	b=Fp01ju/EAMdyHEiRhr3wdO4xXJK6B/w+GkdvCnh0RhfihcM2hKT6NF/B0bxlWNAYae
	1hlb7cr5dwToS8ZQLPBs1NXLDWB+VUZHK7rwjmE4K/wDcr4Pid9Hr7V23LjGToQRYqx3
	TwyYf89hjaTtSCg5O3/8FVBIlp5gAN56fJT/Y=
Received: by 10.213.28.133 with SMTP id m5mr1095249ebc.62.1329653042409;
	Sun, 19 Feb 2012 04:04:02 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm63923972eeh.6.2012.02.19.04.04.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Feb 2012 04:04:01 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Feb 2012 13:01:32 +0100
Message-Id: <1329652892-30435-2-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1329652892-30435-1-git-send-email-tworaz666@gmail.com>
References: <1329652892-30435-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-oe][PATCH 2/2] farsight2: Fix QA warning about non staticdev containing .a files.
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
X-List-Received-Date: Sun, 19 Feb 2012 12:12:19 -0000


Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 8b92ec3..91fe692 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -5,7 +5,7 @@ SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
@@ -18,7 +18,8 @@ EXTRA_OECONF = " \
 "
 
 FILES_${PN} += "${libdir}/*/*.so"
-FILES_${PN}-dev += "${libdir}/*/*a"
+FILES_${PN}-dev += "${libdir}/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/*/*.a"
 FILES_${PN}-dbg += "${libdir}/*/.debug"
 
 
-- 
1.7.3.4



