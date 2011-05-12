Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKXzg-0006i1-W4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 17:40:05 +0200
Received: by gxk3 with SMTP id 3so610911gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=iE6EE2DXlfo4EdDEvRC9GckGyIakJzJSds+qQ2nwkY4=;
	b=Eexlun5VKpYde0djs4cIVhzQ1sdkBsT7RN2XZ4diXwfSI4RovARiayGt5z5XNQ0yMx
	wOQK1QbHJ++0Hksci6Vy9pL4zpKdrhmQXmycrdR1mAl86ACzydoYtyCMax47wG6C2+HC
	bZnqrQjbK6MBUK8qxkFSCRS2Y8LkkLJ8aWtSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=WxgScUKLot/BK5Bu8krpEGn5JmRLxu0JwqdO7ZKQT6O5ysDvAkDrR7lVVcmid8XQct
	fHk5NHZft10I0CVm077L1y7K0AJuPdPIXVURMAopTEYaC4k2FAOFfRbMusSME4+375td
	jmNq0FB+E7dekdorpaY6CQ3PAQWfoRf8uvOtQ=
Received: by 10.236.191.66 with SMTP id f42mr389549yhn.345.1305214636488;
	Thu, 12 May 2011 08:37:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c66sm628875yhj.70.2011.05.12.08.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 08:37:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 15:37:05 +0000
Message-Id: <1305214625-416-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1] libiconv: drop EXTRA_OECONF as it is handled by gettext class
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
X-List-Received-Date: Thu, 12 May 2011 15:40:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index 868314b..35f4e2d 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -8,9 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-PR = "r2"
-
-EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+PR = "r3"
 
 SRC_URI += "file://autoconf.patch"
 
-- 
1.7.2.5



