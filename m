Received: from mail-pz0-f191.google.com ([209.85.222.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1OAvJY-0005qs-VE
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 May 2010 03:28:17 +0200
Received: by pzk29 with SMTP id 29so1060035pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iywXCM+qUN0i/r428T8ANVF9ufWKV0txoj7pYV/Ck4Q=;
	b=IkJOmbJYripGx40WuijuXtMHRXIel60VgVcd3/1ioEEleO3GgfxtghdsEDGLlHcJj6
	pdEEF13OCkQJLPHKFaZlcs7vV+/dt43uLAqtGHD+A30NNf/JO7N1IGCV7+eaS3V8G///
	9u0goymO0aTAW9+2cpNfKtraZt47SBVj34ZRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PSuidE19iwt368UXH9Tcgrd9GphvWouGS0q3ZAaHYTzVSE/lq7q5A5+oo10fbRCrlb
	zVfoSq3T7yhcyx5x0Ag0M70qzFRm4vyzXSu6uh9RGJtgXA5JyvM2i+dMPUGQEy5l4UJX
	yOx9Pz0y49UQZdKCP7Uvp65UFcSVlEINAKbJc=
Received: by 10.115.102.36 with SMTP id e36mr1577985wam.126.1273368265290;
	Sat, 08 May 2010 18:24:25 -0700 (PDT)
Received: from localhost (adsl-75-3-207-17.dsl.sndg02.sbcglobal.net
	[75.3.207.17])
	by mx.google.com with ESMTPS id c22sm17448820wam.6.2010.05.08.18.24.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 08 May 2010 18:24:24 -0700 (PDT)
From: Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 May 2010 18:24:20 -0700
Message-Id: <1273368260-12668-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.222.191
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] slugos-image: fix opkg-cl hanging on installing device tables
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
X-List-Received-Date: Sun, 09 May 2010 01:28:18 -0000

opkg-cl was hanging during slugos image builds due to opkg-cl waiting for an answer for overwriting the device tables.
adding " -force-defaults" to IPKG_ARGS allows the image to build

Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
---
 recipes/images/slugos-image.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/images/slugos-image.inc b/recipes/images/slugos-image.inc
index 6a4b7b9..809459c 100644
--- a/recipes/images/slugos-image.inc
+++ b/recipes/images/slugos-image.inc
@@ -23,3 +23,5 @@ IMAGE_LINGUAS = ""
 IMAGE_PREPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/?Image*;"
 
 inherit image
+
+IPKG_ARGS += " -force-default"
\ No newline at end of file
-- 
1.6.3.3



