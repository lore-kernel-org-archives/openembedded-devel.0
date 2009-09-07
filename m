Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlHoR-0002nm-FM
	for openembedded-devel@openembedded.org; Wed, 09 Sep 2009 09:41:58 +0200
Received: by fxm22 with SMTP id 22so556815fxm.12
	for <openembedded-devel@openembedded.org>;
	Wed, 09 Sep 2009 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=29v9WQYf4KtAxoa+guHfsSJ9qJU0icYJiixbg+NBvdA=;
	b=llsgFp4YcFaCEDXJgi2fqkPpIKlUnzL8qZ4Gwapnl6C9vHM+PNsIV3YSb+QzRqX86w
	qpi9rQC3h29FXkvnMV1/aruynETAcJUYc7WDwwbIoEOZon4UW77d0vmDQgXxYGjna2ly
	QyAokfV1hOU3V7PC3Yn0E+n05bDAMK+ydFJAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Q3JB6aCs3bBzfo8ZyMfEXjw1yTOpMFt2wFeSi/Ow6nzNuuhFRzVeAuBPJaWEwNh7hm
	nSPaD5KLb/oQTcMSbAooLOOwpBdijK1921r8CLqRDtUx652Mij2QAmSTHU2DEnr8dypr
	hFEWg4V2bkBQpgDsStNCpYkGPV/LA+CMdHr8o=
Received: by 10.103.84.15 with SMTP id m15mr6082899mul.105.1252329031296;
	Mon, 07 Sep 2009 06:10:31 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id s11sm11884007mue.13.2009.09.07.06.10.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 06:10:29 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon,  7 Sep 2009 16:10:14 +0300
Message-Id: <1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Use automatic unzip-native dependency detection.
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
X-List-Received-Date: Wed, 09 Sep 2009 07:41:58 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/jpeg/jasper_1.900.1.bb       |    1 -
 recipes/miglayout/miglayout_3.0.3.bb |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/jpeg/jasper_1.900.1.bb b/recipes/jpeg/jasper_1.900.1.bb
index 9f1f5ee..a71dd68 100644
--- a/recipes/jpeg/jasper_1.900.1.bb
+++ b/recipes/jpeg/jasper_1.900.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Jpeg 2000 implementation"
 LICENSE = "MIT"
-DEPENDS = "unzip-native"
 
 SRC_URI = "http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${PV}.zip"
 
diff --git a/recipes/miglayout/miglayout_3.0.3.bb b/recipes/miglayout/miglayout_3.0.3.bb
index 2450a7e..87ab0f2 100644
--- a/recipes/miglayout/miglayout_3.0.3.bb
+++ b/recipes/miglayout/miglayout_3.0.3.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}"
 
 inherit java-library
 
-DEPENDS = "unzip-native fastjar-native classpath swt3.4-gtk"
+DEPENDS = "fastjar-native classpath swt3.4-gtk"
 
 do_unpackpost() {
 	find -name "*.jar" -exec rm {} \;
-- 
1.5.6.5



