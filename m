Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLjAx-0007BR-AM
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 23:48:35 +0200
Received: by gxk3 with SMTP id 3so1459031gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=iE6EE2DXlfo4EdDEvRC9GckGyIakJzJSds+qQ2nwkY4=;
	b=rCZ6vNwx3uVusgzwjnEs+Ej1FnTumw6tQJzXX71HUYFpfU1EZTxg7y/O8eJOc7SXWA
	gQKh8+zcCZildd7qaHcfAlHRfXrNzebpHbskS5ciObssxCsSxLZ06M+JAm+HOBXeBhC+
	vqJXJ6Rf/PsMkJCklpjbx0t738z9GvlzgrDOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=UbsCtpxOalh/VxFPxZyyCPqIHOUnPphqv/lSagIFI4OCQBRD1646rVDGwq04nmfjHu
	AwwkTD0w/mRL+b9CcY9bALF/+s55Ed3P5qIExZEr18Anx28VKUvbqSXMNcns435Krhxp
	rd4mi/AAZmRwAUhAU2UyhOB9vJ7Ol+QVIyoDU=
Received: by 10.236.154.70 with SMTP id g46mr1155959yhk.446.1305495938413;
	Sun, 15 May 2011 14:45:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l30sm2110499yhn.6.2011.05.15.14.45.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 14:45:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 21:45:24 +0000
Message-Id: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 1/3] libiconv: drop EXTRA_OECONF as it is handled by gettext class
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
X-List-Received-Date: Sun, 15 May 2011 21:48:35 -0000

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



