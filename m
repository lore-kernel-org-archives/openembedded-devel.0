Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 97CFA6DC62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 16:23:12 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id w62so3359944wes.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 08:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1/wo9VFWqPQA26/GWEahSSzrU1kOflgRlJgObrWtVkw=;
	b=YBKjgWlY1MZGBrNkoAKyQzngwDwpfAZDBB+iALFtd5hoKGuu7LLd69jOf21q6Ijn6B
	aB+8DdUGaauAninGp3HQlqJZPWRnKGH4/NrdZaYJ++eKpzJHSblrlIH4ild7eShueORI
	cdfFNLubNLMcd4a0Dl1cWUm79KWZxnu4kGHwIy3UVZ6v2vRo9f7eC3s7CokSO8lnx6oN
	/4Pn1qt8EeDmgsq1QXJBsXo5xPSCoaAi9FDUSU4I9o/G/lR/qzKlGJDMTrOJbd0WrOa3
	2Xxxehki0s7PRug8pleWEiOM4+0emUZqrV1qYzq4to62WkD30IX9wkOZRsv9+RwiQuyV
	AX3g==
X-Gm-Message-State: ALoCoQnh4k0bUzfXbGBMlVLSOJvWj/MqrLlUdYdgpJ/RYRQ3SX8N/biMSlszooazgjy8S5WUuQGG
X-Received: by 10.180.99.39 with SMTP id en7mr9118432wib.10.1389889393084;
	Thu, 16 Jan 2014 08:23:13 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id eh7sm34449776wic.2.2014.01.16.08.23.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 08:23:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:23:09 +0100
Message-Id: <1389889389-6514-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-java][PATCH] openjdk-7: use icetea6-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2014 16:23:14 -0000

Since icetea6-native fails to build on all my machines and icedtea7-native works, switch to that.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-core/openjdk/openjdk-7-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 9ecc990..206bf12 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -26,7 +26,7 @@ PN = "${JDKPN}-jre"
 PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
-           icedtea6-native zip-native ant-native \
+           icedtea7-native zip-native ant-native \
            zlib \
 	   jpeg libpng giflib \
            gtk+ glib-2.0 \
@@ -101,7 +101,7 @@ EXTRA_OECONF = " \
 	\
         --enable-zero \
 	\
-	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native \
+	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
 	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
 	\
         --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
-- 
1.8.4.2


