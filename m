Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 581AA6FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 21:07:10 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hf6so2025092pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lo83yxw+C4/THhwjf+zxFXRyfCH/dGr+k8zSHIVAHPk=;
	b=eq2a0lJ/GVuquRkVIoUHJDdYxOd5NXShDhd04E1k30krp6B9o3UgUoNmucBYYWG6+G
	N6jI5PxHQykEcQN2PYawKzYgpoF3rxNBGddqVpfEdGeuSAcXffOR8yqwF4TvnuRiz/Gs
	E/hZQwmcpXDvFN36G81v8DBqLLyOAmTWWRIBm9AtAHU8iFVhB/t6wRmYJYhJbi5v+Sc6
	7Ym7HqoponPk9Ck9q3lBWQwMUcez2D2VijkkI4HyP9fLsTNnLQxXQGX5/F+CkhXFRe6t
	ayUj/iVrw3vTeeBBPiXq07D9R1Coe4kgs+AaQJ+9A1yYs8MFLTf3ICU5pe6429usUzlU
	SvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lo83yxw+C4/THhwjf+zxFXRyfCH/dGr+k8zSHIVAHPk=;
	b=W4aMN5+xcvxsCJMRIGWQCTw7wxNySVhPEzpj/zLoE+vdfx63Dx8TgH/xNUpkdhEMxh
	1jnlPto1m63lh/AUm/FVaXPd5SKoZ8hGGrUApUZxSdKTomSkdyeH0FyHgSkNSCdpW/1N
	Hi6LHMC/yqiWWkn2hK2jfR0kWY097uy0Y9b+ue4Ep7k0Nb/IIpHRAKPWgZBUs3EsTCKt
	xMUcD6KyPOx3ts6vJRttqtbmMfXUUT38f5z9I7vSweIerODtk0esjsRNCQWhNEtsHwC/
	resjIBvRG2+VY/aCSelNCLelFwe2Z/WqFMyjSizftRqxRuMYcyT9H9IBVPdkuvwFhxGh
	YU3A==
X-Gm-Message-State: ALyK8tIi+wFl7LqskKigv3fRR3+CZs0qS8b1jCMT5DjgsjDBxZXTcqNI+giBKcJr0KuWLw==
X-Received: by 10.66.73.193 with SMTP id n1mr30279127pav.70.1466543231533;
	Tue, 21 Jun 2016 14:07:11 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	qc16sm58805637pab.1.2016.06.21.14.07.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 14:07:10 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jun 2016 15:07:07 -0600
Message-Id: <20160621210707.5816-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-java][PATCH v2] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Tue, 21 Jun 2016 21:07:11 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

GCC 6 sets the default C++ standard to C++14 and introduces dead store
elimination by default. icedtea7 is not ready for either of these
changes, so just set the C++ standard back to gnu++98 and disable dead
store elimination.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 recipes-core/icedtea/icedtea7-native.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index d624b7a..3344acb 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -17,6 +17,13 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
 CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
 
+# Disable dead store elimination and set C++ standard to C++98.
+# There are dead stores in the JVM that would be pretty hard to
+# remove, so disable the optimisation in the compiler.
+CFLAGS_append = " -fno-tree-dse"
+CXXFLAGS_append = " -fno-tree-dse"
+CXX_append = " -std=gnu++98"
+
 inherit native java autotools pkgconfig
 
 JAVA_HOME[unexport] = "1"
@@ -153,6 +160,8 @@ do_configure_append() {
 	for F in openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/agent/src/os/linux/Makefile ;
 	do
 		sed -i \
+			-e"s|HOST_GCC = gcc$|HOST_GCC = ${CC}|" \
+			-e"s|HOST_CPP = g++$|HOST_CPP = ${CXX}|" \
 			-e"s|gcc\$(GCC_SUFFIX)|${CC}|" \
 			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
 			$F
-- 
2.9.0


