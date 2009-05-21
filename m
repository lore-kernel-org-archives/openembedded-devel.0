Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M78L4-0000jo-B2
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 15:29:50 +0200
Received: by fxm20 with SMTP id 20so1060651fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5RwnPDtXiCSo0HhN5WqsJHj4g6kxE7L22pBzjPFGKog=;
	b=uD5AGYOwO1uajFAWDJuJYLcVZog6vRK4l5um1UVtsMax7IOU4soKwCT/TO73z0FWLJ
	rswM0lzVQTk0ppuMGCM8Fxj+hD4g6m8M0c8jUUp5UlpkE15w8tktgDWTFpr/GScjhC/G
	ZGUR1/3n9V95055C0hcoK05+adttc0mjuiFtc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dt0sg9xP6XcwM9o/gbcpBd1AdfFIKU65t1FMK87vTGLi8PS0pScl0dnT2kuylPQW1W
	A8VzWv2+2FE3eW9yQXkWE7dleFWXWfWK2YtzDtmAVG23j6osXahZZt4eOOVhmQXkLC+4
	BHcfpVtpX7Y/IHoXWtbR9BfgvuuSdWJv4MZ7U=
Received: by 10.103.174.18 with SMTP id b18mr1343110mup.132.1242912121755;
	Thu, 21 May 2009 06:22:01 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id j10sm2646547muh.15.2009.05.21.06.22.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 May 2009 06:22:01 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 May 2009 16:21:34 +0300
Message-Id: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 13:30:33 -0000

This fixes package name matching so that gst-plugins-*-meta
packages include all the plugin ones. The current matching
implementation doesn't make meta packages depend on gst-plugins
with 'locale' and 'dev' in their names (f.e. gstfbdevsink).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/gstreamer/gst-plugins.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
index bcb3e39..0156cff 100644
--- a/recipes/gstreamer/gst-plugins.inc
+++ b/recipes/gstreamer/gst-plugins.inc
@@ -33,7 +33,7 @@ python populate_packages_prepend () {
 	metapkg_rdepends = []
 	packages = bb.data.getVar('PACKAGES', d, 1).split()
 	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count('dev') and not pkg.count( 'locale' ):
+		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-locale'):
 			metapkg_rdepends.append(pkg)
 	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)
-- 
1.6.3.1



