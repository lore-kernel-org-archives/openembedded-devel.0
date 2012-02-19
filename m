Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rz5cm-0002PQ-MP
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Feb 2012 13:12:16 +0100
Received: by eekd41 with SMTP id d41so1626195eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2012 04:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.14.126.68 as permitted sender) client-ip=10.14.126.68; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.14.126.68 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.14.126.68])
	by 10.14.126.68 with SMTP id a44mr8466852eei.101.1329653040303
	(num_hops = 1); Sun, 19 Feb 2012 04:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7w9DZ7aRH/WgtKlD3waXdeQ/XnFtngA4wMdMikX10RY=;
	b=DNrakXXGqoNgi31gSeuDGC8B1zNR3jled7jagTGslPXAIrlDt9T8MNKmcSBq2m8V4e
	4VECWx8UTzQ6uZooB98PUa5ucZJQfvq8cMa8+Besc+iJVrgcffHKm2b/8d2SqrwFksAY
	MqoV+XF1qjTQRvjjojeA51wPfYqjHjeMSLwjY=
Received: by 10.14.126.68 with SMTP id a44mr6764420eei.101.1329653039854;
	Sun, 19 Feb 2012 04:03:59 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm63923972eeh.6.2012.02.19.04.03.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Feb 2012 04:03:59 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Feb 2012 13:01:31 +0100
Message-Id: <1329652892-30435-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 1/2] libnice: Fix QA warning about non staticdev containing .a files.
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
X-List-Received-Date: Sun, 19 Feb 2012 12:12:16 -0000


Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 42ab297..2e93690 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -8,14 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
                     file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
 "
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0 gstreamer"
 
 inherit autotools
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*a"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 
 do_compile_append() {
-- 
1.7.3.4



