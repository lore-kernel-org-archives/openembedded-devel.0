Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCorN-0001fq-2h
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 11:08:05 +0200
Received: by wera1 with SMTP id a1so497910wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1b2crE/SmXCMDPMgC4nH5rSqqd77ScnSw/XplGqxq1g=;
	b=0TcoOhNGU8lstfeOgsLPMsaQie87NKTJupp2q48KC7vC7UKkp6MFwuPYQWUH43KUn7
	nH0rAfuNQFoM0/AoMW6ZmAzDQbr94gy7koufmAsr5GxXnZLA077KqTKr+nUqt0m0YczP
	diU9jn8JmMhqBRX19knoQrCU22a698aJj7fsLCJkHz3qgbVFmjsyJTuTjLhYBL+9OXk3
	1hzLhCGJq1H1ncFieQQGa7VvNG+dB53EhXjjnN8uQQI/xs7mo+O4l/VoDxCP9DhpdUgS
	tiYdscMJVSVZjrhVW4h/kbRxtam2nqXh5W74XVFS6A19oLOcxQcpfRRgB1dMjQuqZekz
	lgxA==
Received: by 10.180.97.41 with SMTP id dx9mr5079056wib.9.1332925143385;
	Wed, 28 Mar 2012 01:59:03 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ex2sm10807133wib.8.2012.03.28.01.59.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 01:59:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 10:58:56 +0200
Message-Id: <1332925138-28464-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332925138-28464-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332925138-28464-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, v2 2/4] faad2: fix QA warnings
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
X-List-Received-Date: Wed, 28 Mar 2012 09:08:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix the following warnings:
WARNING: QA Issue: non -staticdev package contains static .a library: libfaad-dev path '/work/armv7a-angstrom-linux-gnueabi/faad2-2.7-r1/packages-split/libfaad-dev/usr/lib/libfaad.a'
WARNING: QA Issue: non -staticdev package contains static .a library: libmp4ff-dev path '/work/armv7a-angstrom-linux-gnueabi/faad2-2.7-r1/packages-split/libmp4ff-dev/usr/lib/libmp4ff.a'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 462837f..855299c 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
+PR = "r1"
+
 inherit autotools
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${PN}-${PV}.tar.bz2;name=faad2 \
@@ -17,8 +19,10 @@ PACKAGES =+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
 FILES_${PN} = "${bindir}/faad"
 
 FILES_libfaad = "${libdir}/libfaad.so.*"
-FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${libdir}/libfaad.a ${includedir}/faad.h"
+FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${includedir}/faad.h"
+FILES_libfaad-staticdev = "${libdir}/libfaad.a"
 
 FILES_libmp4ff = "${libdir}/libmp4ff.so.*"
-FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${libdir}/libmp4ff.a ${includedir}/mp4ff.h"
+FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${includedir}/mp4ff.h"
+FILES_libmp4ff-staticdev = "${libdir}/libmp4ff.a"
 
-- 
1.7.6.5



