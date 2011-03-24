Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hWB-0002BU-J2
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:11:51 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7236709bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=wouwxdktdP7o1297m7Zq0Rd//u/77Vv/07duLo94JIA=;
	b=oBIIDHxnZ7x1J903Z+QZ78JFq5MRhA5xjObd3OUlva5KrwjzuBl9gVnS45Zl3s9AcU
	7j9UY1GF0Cc/FVFPlDn+jDLlXZiXlPcEEfcy2wP3ZrnCXkyjKxU2WwvQ+3sl8o+zhKdy
	ChZX/sAAf42qOh4b6jsTa8uUT8wkS1zLIJclI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mtc+s3QCPdicFwu3jI4L75K2GkzB+TTPGDwyEpeodGaQRm4tfpVVoMfD6yoeeC9/10
	GFpftyT0LY9jv6NvWIcHYVsqBQpnxy1uXb/34OMYIXxMwhqNivOhMWUBjCvP9P1Vwrzy
	DfhwyzUZCHUIC23FUXIJqMkFa2qIi87c163eU=
Received: by 10.204.143.4 with SMTP id s4mr6329135bku.98.1300961401644;
	Thu, 24 Mar 2011 03:10:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm6583898bkt.17.2011.03.24.03.10.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:10:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:09:54 +0100
Message-Id: <d4a17c4542c760ec7a091fc162ae2cfd26f66fc9.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/7] libgpg-error: add checksums
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
X-List-Received-Date: Thu, 24 Mar 2011 10:11:51 -0000

---
 .../libgpg-error/libgpg-error_1.8.bb               |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
index 5f6b72c..19a3c26 100644
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
+++ b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/gpg-error.h;endline=23;md5=83c16c8f5cea85affa1ff270a6f4fcff \
                     file://src/init.c;endline=20;md5=b69742f2a8827d494c6f6a4b1768416c"
-
+SRC_URI[md5sum] = "1d2005268a2f096db28cf9cf77b3229a"
+SRC_URI[sha256sum] = "bdfbf2677147239d2d26d4e37f44635d9fd97c133c9ef9fd9793a12a059508c5"
 
 SECTION = "libs"
 LICENSE = "GPLv2+ & LGPLv2.1+"
-- 
1.7.4.1



