Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QNVLP-0005Og-1C
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:26:43 +0200
Received: by yia13 with SMTP id 13so1546439yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=JX+e7P7sXCHfmRWTcVXjIJ6y0nSnaBLZ7hE8X6AnVNE=;
	b=JxTvSMVf9owZ03ZDRPSGZdT5b1mxTLzKeZsT8QVtfhENtRYTdPzvMo2CVlOmGhRn1k
	6LopXCQ2aNjDf+4HqNskFT1An4sKFyQd9j2jKXTkoBL6WuqljTac53vW9ir6RmZwBUqS
	XLlPnS3izG2D25DNCnLVZKWPW2FDiOSA5kpHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GhdKBV5k+kvjZcmJQRZqEG/lhVOOab1ul3f+zlqvtBFKKQl21IHD106M0P8rzkU8nU
	E7ipn3l0mfTk9YqKJMQ88OkPJ5a9Lk6hbkuchQqHvlLvxREqDRrQM6lgXOKlu4O1eepH
	hh1k7C9q8KnBDvnWvQqP/RnCt6UY7xeC9S/Ug=
Received: by 10.236.180.130 with SMTP id j2mr4991069yhm.487.1305919425501;
	Fri, 20 May 2011 12:23:45 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w1sm2821186anh.10.2011.05.20.12.23.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 12:23:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 May 2011 19:23:05 +0000
Message-Id: <01feadc2dec5821a20cc92a5dcf08d12fa15ec52.1305917406.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] freerdp-extension-xpunlimited: add git version
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
X-List-Received-Date: Fri, 20 May 2011 19:26:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
new file mode 100644
index 0000000..7e67a63
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
@@ -0,0 +1,23 @@
+# Copyright (C) 2011 O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license
+
+DESCRIPTION = "FreeRDP XPUnlimited RDP Extension support"
+HOMEPAGE = "https://github.com/OSSystems/FreeRDP-Extension-XPUnlimited"
+DEPENDS = "freerdp"
+SECTION = "x11/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+PV = "gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+PR = "r0"
+
+inherit pkgconfig cmake
+
+SRCREV = "7b3b8538c8cb863f720ba5351aebc220e126a4b7"
+SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/freerdp/extensions/*.so"
+FILES_${PN}-dbg += "${libdir}/freerdp/extensions/.debug/*.so"
-- 
1.7.2.5



