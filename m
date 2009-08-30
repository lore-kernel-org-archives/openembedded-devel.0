Received: from [209.85.211.193] (helo=mail-yw0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhZIw-0005sn-UK
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 03:34:03 +0200
Received: by ywh31 with SMTP id 31so4259494ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 18:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AyeKlF4Wg90HjTXmq/fYJrZhsK0Q1csleT2Dcgkne2Y=;
	b=OKY9a1qS9Hdr7NlpygIaFhMX5HCmsn//oTAhQd9Xww0J1ANH9+m9Zn3dMtdUHTnNMP
	SShc8SJID4/WR+f5xZJLejx8c+Hmmqzf4eh1R3g+bd7aZvWbWPShO6rRY/jxYOKKrHzR
	hBNVO5TqUoJZ/l5Fph5JuFmSOye4N2m+Smoag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JGn0ZB9u3x5DF5rIs5jHY4zS+xBRKTmO7tHYzFgIQKbkS3jtWX70uzFq0XKzeGxXx6
	rbpvPYymOcPw+g7W4HHh4s2x79dIKqvUd7+zbpAvRhx3JkSmib97cO3C7daAGuUj3dLf
	rNaSsmFaxaawHvMrxWc5gu8sMOS+2aZ97Zd2U=
Received: by 10.150.243.13 with SMTP id q13mr2732699ybh.167.1251594940555;
	Sat, 29 Aug 2009 18:15:40 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 21sm345042pzk.3.2009.08.29.18.15.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 18:15:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Aug 2009 18:15:36 -0700
Message-Id: <1251594936-4909-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] micro.conf: Remove PREFERRED_PROVIDER_virtual/libintl
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
X-List-Received-Date: Sun, 30 Aug 2009 01:34:03 -0000

This is set appropriately in toolchain configuration.
It gives a possibility to cleanly override LIBC
say to eglibc or glibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/micro.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 861f7ef..2d45425 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -1,7 +1,7 @@
 #############################################################################
 #@TYPE: Distribution
 #@NAME: Micro
-#@DESCRIPTION: Micro Linux Distribution (glibc based)
+#@DESCRIPTION: Micro Linux Distribution (eglibc based)
 #@MAINTAINER: Martin Lund <mgl@doredevelopment.dk>
 #@COMMENT: This distribution configuration defines a truely tiny OE Linux  
 #@COMMENT: distribution. The matching buildable image target (micro-image)
@@ -79,7 +79,6 @@ ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 # PREFERRED PROVIDERS
 #############################################################################
 PREFERRED_PROVIDER_task-bootstrap	= "task-bootstrap"
-PREFERRED_PROVIDER_virtual/libintl	= "glibc"
 
 #############################################################################
 # PREFERRED VERSIONS
-- 
1.6.3.3



