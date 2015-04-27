Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B462B73D99
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:19 +0000 (UTC)
Received: by wgso17 with SMTP id o17so128612899wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jCtC9XlmPYTvqCHmXn0ImUQRL7Mhj+ZPKcubLKDMyq4=;
	b=wGmqchPdjcbG6/uhcbceHWvKvaj11ST41VRqAGb+DdzJbRWylAoSBxbbVDxX/Wxydj
	3W60/g3e029lv1Iit2n69Cryp9G+WU15c10GahlX3x5lU5n0hOcA+EhkktoXJdKau/8u
	CXghZys3PlXxKPW0FjzNuvKCiLrK3x+RCsWs7aWsQZw96LRiU1ASL1gVltnNJ4hHiwP3
	fOAyhhNvFHwxWyUfe3z+5qhOvfPgsfAJiU25POvrXAzdAw53AKTD1eq7Uw+g4ocXlMmb
	mJkU6DKE/Q7dMGxSy+F18lsITBdtj0kwlo+UZETWES+GdRYRIf6E/E7QwdTPGpIu4Akp
	LWZA==
X-Received: by 10.180.83.130 with SMTP id q2mr23157768wiy.89.1430165600606;
	Mon, 27 Apr 2015 13:13:20 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:19 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:13:01 +0200
Message-Id: <1430165584-5634-7-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 06/10] openjdk-7: Add libxslt-native and krb5 as dependency
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
X-List-Received-Date: Mon, 27 Apr 2015 20:13:20 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 29519fa..5b0ac7c 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -27,11 +27,11 @@ PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
            icedtea7-native zip-native ant-native \
-           zlib \
+           zlib libxslt-native \
 	   jpeg libpng giflib \
            gtk+ glib-2.0 \
            cups fontconfig \
-	   rhino \
+	   rhino krb5 \
 	   libxt libxinerama libxrender libxtst libxi \
 	   freetype alsa-lib libffi \
           "
-- 
1.9.1


