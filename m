Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MmPWF-0003kS-Se
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Sep 2009 12:07:50 +0200
Received: by fxm22 with SMTP id 22so1273948fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 03:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=VEAL6AlvDAVIrC8lVqANg1aF0VhsC1wijpRhAl0lEDo=;
	b=JNtYfGEeFimc+GgfLxs0dTN6DW0P+AWVNq8sluacS/xjyhKttC8Xe8+JtNbkUy/QGI
	IcX4QcyA1EEaSch6YW0chJWT6hD4HzS0R888k/mkAppiKNfL/G7OTRsuEPUWa5ULBw1z
	hdMxsLxt60u+5dx8u1IJGI8MlsnzRAkbmwfD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Qi5qfeWatsgyi1uXhy2ju8B/B+bc4E79uySzaNsUVH1zP2CpY2/xMYVPO46j9jKEXS
	LrPDHL6JyL40GL6iFTdezbgfXxY7wqOxLfgcDkj6Hrpw8jOMj8D2MpKPlvOZ6GZh6lns
	BHgMFLZkM/hGFgXHU2YhNnvNVcedWuHJN0cLw=
Received: by 10.86.12.2 with SMTP id 2mr3063652fgl.12.1252749709195;
	Sat, 12 Sep 2009 03:01:49 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 3sm942087fge.13.2009.09.12.03.01.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Sep 2009 03:01:48 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2009 12:01:47 +0200
Message-Id: <1252749707-1115-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] freeimage: fix QA errors
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
X-List-Received-Date: Sat, 12 Sep 2009 10:07:51 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ogre/freeimage_3.11.0.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/ogre/freeimage_3.11.0.bb b/recipes/ogre/freeimage_3.11.0.bb
index 8281aaf..7df573e 100644
--- a/recipes/ogre/freeimage_3.11.0.bb
+++ b/recipes/ogre/freeimage_3.11.0.bb
@@ -1,9 +1,13 @@
 LICENSE = "MIT"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/freeimage/FreeImage3110.zip"
 
 S = "${WORKDIR}/FreeImage/"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_configure() {
     sed -i -e /^CC/d \
            -e /^CXX\ /d \
-- 
1.6.1



