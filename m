Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpi6-0002RJ-OC
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:57:06 +0200
Received: by wibhn17 with SMTP id hn17so398941wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zTUecsDxiw23ETgGP3y0ua4t3R4Ae1xpIfYCXvNS4rI=;
	b=GWu8lF0AnxlyrXKomTcs/ZAVyOphMP1B2hxLt5det/3irSqrX8QY3w56ZrbxfUnHA0
	LZ92ABLk5LWsZ4CYlpWjTqV5mYItK8nliMeRRa5OLMM8DKJNiVEX7jZasZCbasDTLLE+
	XufQmQckasnDbqNMaK2AFbiw8RG20/sIKjQNPGi8q4OJedcb3DxP/gWpiaz5+y24sqMI
	dh94H7pQg0BFHcNkiT2xES7YepQ1QmQwOig5U9IZYLf0XWJJQVi6FPviuy9yFfhNSN+e
	Ixe53Hcc0BStdCBR/aKuUhrXSDHfdqeAi1ILpT/TLAgvxvf9J2st0zqmb7WwOopgqG8A
	ggDA==
Received: by 10.180.81.38 with SMTP id w6mr6255928wix.10.1344606317270;
	Fri, 10 Aug 2012 06:45:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm11630198wib.3.2012.08.10.06.45.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:45:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:07 +0200
Message-Id: <46718dbf0fd669b5de75437a11b74ad07aad1ed5.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 12/46] edbus: add eina to DEPENDS
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
X-List-Received-Date: Fri, 10 Aug 2012 13:57:06 -0000

* it's using that
| performance.c:2:18: fatal error: Eina.h: No such file or directory
| compilation terminated.
| make[3]: *** [e_dbus_performance-performance.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: Leaving directory /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/edbus-2_1.2.1+svnr74419-r0.0/e_dbus/src/bin

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index ad20c8c..cca9c5e 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
-DEPENDS = "dbus ecore"
+DEPENDS = "dbus ecore eina"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
 
-- 
1.7.8.6



