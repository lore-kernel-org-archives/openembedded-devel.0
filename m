Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1927C0D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:53:35 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id g85so9501287ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3dS17vXqvOHsxCCICk4ZyxwdGgzP3eQuHJPDzr7ARUE=;
	b=Wz8CcniAacuAg/zcVaANBTk8WShcsU2nyp82ELVkxG+H12VXHXvZ9P9EVb4PBinzkZ
	mXdqSsgvtHzW+qs/KwZTNliFvlb4kH3zA2bQWxpcNf7ntSzf3FwGXGLqdN4Lcer7ItPU
	ROLcV7QFrUfThWom4hyRqo0bKgw5EvfLG6vIpZ2BpwU3pCExdE7owrDMKk8OmFhVq8K2
	DSEt7LyPfRpMltfhzOlNlp5XXjISOi8XBEWqnMB4dfORmPRBZjILhgpi57s2PoLoK+e3
	YIK5SpzmMpelOhb5J3Fp4cBhdYqB6XIDTaKVp7mQ7v9qrixw3DBYVOXmc5iH6V2Xx8Xl
	Ovgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3dS17vXqvOHsxCCICk4ZyxwdGgzP3eQuHJPDzr7ARUE=;
	b=eKGIMOCdr0qMHynYt0iylAAmH6sNXhSKvX+MSNrrqtpPl+Ky6Z6kWZEgnNsZtmPLdx
	hONh9Sj2zf4vo4gR86+rqDwN27oSPoU7hexbHzRYws8bKHwfpEQTyC7HJwkc5u5SAWv5
	21C/EnO1p3wi5M9g9FIhKpO+yUHFnPejBXdUGXeZZoOgWrMJkqKH3zcmDtgWTlp8vECZ
	IZaG6W56nNmUx2fEec2LxQmGtWFDRatCdS0T2KCc+rYUqjXaAQ9wtmEcgriNOnfx0y/l
	480EQTVm1/lm0wnNdL2d6Dt2eP8cJPgsXAjXyk+Jd17ukzAgXJFDdGS7AClNgX2ABG86
	sLiA==
X-Gm-Message-State: AHQUAub9rMLe3OcDAoZnJs5jPoQZC43AWvFNTOEfJxA+6RD8REIIc2Rf
	TTinRJy3epIztyV2aNbfWTnCEwlg
X-Google-Smtp-Source: AHgI3IaKqjAWkvWW6id6/1oSMXjhKM3vtephwSifqyREtyR4/5vuvSoSfneNBdvyevWXuXQ/qo912g==
X-Received: by 2002:a24:3987:: with SMTP id l129mr2797382ita.45.1549382016205; 
	Tue, 05 Feb 2019 07:53:36 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id z6sm441985iop.73.2019.02.05.07.53.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 07:53:35 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 10:53:24 -0500
Message-Id: <20190205155325.7493-2-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205155325.7493-1-bkylerussell@gmail.com>
References: <20190205155325.7493-1-bkylerussell@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Add support for building Java recipes using java-native
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
X-List-Received-Date: Tue, 05 Feb 2019 15:53:35 -0000
Content-Transfer-Encoding: 8bit

Repurpose the old java-native class to setup a native JDK for building
Java code in other layers' recipes.  This provides a modern JDK, like
openjdk-8-native, for building Java recipes where some of the bootstrap
VMs are not sufficient.

Since there don't appear to be any usages of NATIVE_INSTALL_WORKS,
java-native.bbclass appears to only provide an 'inherit native', which
would be more straightforward to declare in the individual recipes.

Analogous to pythonnative and perlnative classes provided by oe-core.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 README                                          |  7 +++++++
 classes/java-native.bbclass                     | 17 ++++++++++-------
 .../ant-contrib/ant-contrib-native_1.0b3.bb     |  2 +-
 recipes-core/ant/ant-native_1.8.1.bb            |  2 +-
 recipes-core/openjdk/openjdk-8-native.inc       |  2 ++
 5 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/README b/README
index 031709e..96132e8 100644
--- a/README
+++ b/README
@@ -126,3 +126,10 @@ Please note that libstdc++ static is needed on your host to compile icedtea7-nat
 (install libstdc++-static on a Fedora).
 
 For debian-based distributions you need the libstdc++6-$compilerversion-dev package.
+
+To build a native JDK for using java tools like javac to build your own recipes,
+define the following variable in a distro include or local.conf and inherit java-native
+from your recipe.
+
+# Possible provider: openjdk-8-native
+PREFERRED_PROVIDER_virtual/jdk-native = "openjdk-8-native"
diff --git a/classes/java-native.bbclass b/classes/java-native.bbclass
index cade7b1..58d7266 100644
--- a/classes/java-native.bbclass
+++ b/classes/java-native.bbclass
@@ -1,9 +1,12 @@
-# This is to be used by recipes which rely on java-library.bbclass
-# infrastructure and are a *-native recipe which needs to install
-# jar files into staging.
-# 
-# This class has nothing to do with Java's JNI.
+# Configures EXTRANATIVEPATH for recipes that need a modern,
+# native JDK to use java tools.
 
-inherit native
+inherit java
 
-NATIVE_INSTALL_WORKS = "1"
+JAVA_BUILD_VERSION ?= "${PREFERRED_PROVIDER_virtual/jdk-native}"
+
+export JAVA_HOME="${STAGING_LIBDIR_JVM_NATIVE}/${JAVA_BUILD_VERSION}"
+export CLASSPATH += "${STAGING_LIBDIR_JVM_NATIVE}/${JAVA_BUILD_VERSION}/lib/tools.jar"
+EXTRANATIVEPATH += "../${baselib}/jvm/${JAVA_BUILD_VERSION}/bin"
+
+DEPENDS += "virtual/jdk-native"
diff --git a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
index 2a44ea2..db79626 100644
--- a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
+++ b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
@@ -12,7 +12,7 @@ DEPENDS = "ant-native commons-cli-native commons-codec-native \
            oro-native bcel-native xerces-j-native \
           "
 
-inherit java-library java-native
+inherit java-library native
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ant-contrib/ant-contrib-${PV}-src.zip"
 
diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 5a39f42..7839abd 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz
 
 S = "${WORKDIR}/apache-ant-${PV}"
 
-inherit java-library java-native
+inherit java-library native
 
 DEPENDS = " \
 	jsch-native bsf-native xalan-j-native xerces-j-native \
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index bae5d09..3909096 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -7,6 +7,8 @@ DEPENDS = "\
     ca-certificates-native openssl-native coreutils-native \
 "
 
+PROVIDES += "virtual/jdk-native"
+
 PACKAGECONFIG ??= "gif jpeg png zlib"
 PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
-- 
2.20.1


