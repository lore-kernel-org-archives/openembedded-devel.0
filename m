Return-Path: <pablocazorla95@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74ADC7751C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 10:20:37 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p37so1218954wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iKvWcs/QfP65jNBQ6pQxW88RvgS8Fig+v5lbobY0T3E=;
	b=uieXaF544fIShoioizKxE3emLXSukfsyrF664hc8bA2W0s4BCdU1g4AuVs1U09czSw
	fF5OTZs6GlkInfOXTE2PL3Cp8SmYEMzjL+grkailZW6p3vw1XsmNslhKlZS8x001O8K8
	Je9serSh6+ifwWp18g/0Jz5prVRR/OxdCAR8wg73GLcxZ9HQWbZIdNbLRY8ajNJQADaX
	wpAr4Tk3oGKmrOQNak1oz79naWiiD8ua98/6HQQ8B+7rJst5hi6ORgCC1LQIRw3pH/tf
	jnY0bQzynpO9HbbM8qfsN4R2aGLEWvx3wXlnPQm5VU39WZxJFpXgtb/FcDl4asnbczEf
	d55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iKvWcs/QfP65jNBQ6pQxW88RvgS8Fig+v5lbobY0T3E=;
	b=cCaLdbv3yIRQNL5oRPloNYPG4MjyCaU2pNvjfMYcE8+u5ladeyzd46ZcrKfv2TW1/Z
	Vlcch36foaO3hwrVn1kmqak/WHANcOOvA2VWH5w73wm2fqKiM9QTDNQRFrVCZZkF8QHv
	sgXpIy1UqpFjlBiUnt01pR/nCFVSa+mLUayGmipyl5m3byjjNIsMxBuQeQPt/1vXImib
	Os/OL24w/DpsUhT6rn7eGRXVMmRjs/hG+3/elqTYTOZ9UNvDU6MulWAlpuVrcr56cp7O
	HiiSXBcDQKZX9URBJnY0y9oF3RtPeinXjG72n2fjggPHGXIkVUSmjMqQALG0HFA1zl3v
	aGxw==
X-Gm-Message-State: AHPjjUjPuZTazhOFAFFb6cumsGdvPbptntgGTbfTpth2h0hA+9HIY813
	cr14ZqXDinMk7thoif7SKsBkOw==
X-Google-Smtp-Source: AOwi7QDO5YFZqSGUdetEdEcbCOJxgmWHNpGuf+iJaEf+Le3FGxUZDQ26dkJulvfalptWBVxQD1BVCg==
X-Received: by 10.223.139.157 with SMTP id o29mr1700101wra.190.1505902837822; 
	Wed, 20 Sep 2017 03:20:37 -0700 (PDT)
Received: from localhost.localdomain ([178.60.200.41])
	by smtp.gmail.com with ESMTPSA id
	f13sm1374455wre.66.2017.09.20.03.20.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 03:20:36 -0700 (PDT)
From: Pablo Cazorla <pablocazorla95@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 12:20:22 +0200
Message-Id: <1505902822-39673-1-git-send-email-pablocazorla95@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-java][PATCH 1/1] Added a patch which allow to compile openjdk-7-jre (Compile transaction...error:).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 10:20:37 -0000

From: Pablo <pablocazorla95@gmail.com>

Signed-off-by: Pablo <pablocazorla95@gmail.com>
---
 .../openjdk7-avoid-compile-errors.patch            | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/openjdk7-avoid-compile-errors.patch

diff --git a/recipes-core/openjdk/patches-openjdk-7/openjdk7-avoid-compile-errors.patch b/recipes-core/openjdk/patches-openjdk-7/openjdk7-avoid-compile-errors.patch
new file mode 100644
index 0000000..9fd2a79
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/openjdk7-avoid-compile-errors.patch
@@ -0,0 +1,43 @@
+diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
+index 1ac3154..9c49c39 100644
+--- a/recipes-core/openjdk/openjdk-7-common.inc
++++ b/recipes-core/openjdk/openjdk-7-common.inc
+@@ -179,6 +179,8 @@ do_install() {
+ # runtime)
+ # 3) All other packages, including -jdk, are optional and not needed for normal Java apps.
+ PACKAGES = " \
++    ${JDKPN}-common \
++    ${JDKPN}-java \
+     ${JDKPN}-jre \
+     ${JDKPN}-jre-dbg \
+     ${JDKPN}-dbg \
+@@ -187,9 +189,7 @@ PACKAGES = " \
+     ${JDKPN}-source \
+     ${JDKPN}-doc \
+     ${JDKPN}-jdk \
+-    ${JDKPN}-java \
+-    ${JDKPN}-vm-zero \
+-    ${JDKPN}-common \
++    ${JDKPN}-vm-zero \ 
+ "
+ 
+ FILES_${JDKPN}-dbg = "\
+@@ -272,7 +272,7 @@ INSANE_SKIP_${JDKPN}-common = "dev-so"
+ 
+ # libfreetype.so.6 is copied from STAGING_LIBDIR
+ # which is already stripped.
+-INSANE_SKIP_${JDKPN}-jre = "already-stripped"
++INSANE_SKIP_${JDKPN}-jre = "already-stripped dev-so textrel"
+ 
+ FILES_${JDKPN}-jdk = " \
+     ${JDK_HOME}/bin \
+diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+index eba353e..8ebfcb6 100644
+--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
++++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+@@ -67,4 +67,4 @@ export DISTRIBUTION_PATCHES
+ 
+ # readdir_r was deprecated in glibc-2.24. Ignore the error for now
+ # NOTE: When updating the recipe, please check if this is still needed
+-CFLAGS_append = " -Wno-error=deprecated-declarations"
++CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=narrowing -fpermissive"
-- 
1.9.1


