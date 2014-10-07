Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Oct 2014 10:30:40 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.110])
	by mail.openembedded.org (Postfix) with ESMTP id BAAA56FDEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 10:30:40 +0000 (UTC)
Received: from [216.82.254.195:12599] by server-14.bemta-7.messagelabs.com id
	41/1C-14464-14FB3345; Tue, 07 Oct 2014 10:24:01 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-12.tower-200.messagelabs.com!1412677438!21002647!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5394 invoked from network); 7 Oct 2014 10:23:59 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-12.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Oct 2014 10:23:59 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 7 Oct 2014 05:23:49 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 7 Oct 2014 05:23:58 -0500
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.181.6; Tue, 7 Oct 2014 12:23:56 +0200
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Oct 2014 12:23:54 +0200
Message-ID: <1412677434-50139-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-oe][daisy][PATCH] imagemagick: fix SRC_URI
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
X-List-Received-Date: Tue, 07 Oct 2014 10:30:49 -0000
Content-Type: text/plain

The package download URL has changed.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
index e261eb8b7020..27d02edbe3ec 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 PATCHSET = "10"
-SRC_URI = "http://www.imagemagick.org/download/legacy/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
+SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
            file://remove.dist-lzip.patch \
 "
 SRC_URI[md5sum] = "a3a0fa301965d6fde68fccd066f62b0b"

