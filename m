Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMRp8-0005Vc-Uw
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:29:03 +0200
Received: by fxm19 with SMTP id 19so950806fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=OpcjdBd9TuITg2lx97JSlVZ+VeFJS5QwRQYTL0Gnep0=;
	b=vhSaBCFraanozYRjGUuWmodxJjttCqQJyjUyLJF6QD3HT5q9MYGg5ZWrQXISiQ+J2L
	5NEgDFVW9dhGFNmkabeWyMdpyud2aDwZXMji0o/3qSXr499ljuUIDS0MAT1W0wsSDcyy
	Eml5uqq+4MQkmmHbdL0qMx8HkHttC18xbEFxM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hUoKYTzU+8bzX41/aZK+3VIj1HtVJ3Fh1CUPnrGLtue43KJoMW6DwWnXL7BgyzJ5+J
	zRZ1laqi/SGCDh0GXlvCFjLi4lsEgoYbCvkcxF/FMlJwAQ24bbnYV6XzFNURUZg48h9k
	jnB2nbeJGAp/K/53bnf813h1KM4Unu+6bBo7o=
Received: by 10.223.87.69 with SMTP id v5mr1457350fal.57.1305667569122;
	Tue, 17 May 2011 14:26:09 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm365052fat.38.2011.05.17.14.26.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 14:26:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 23:25:59 +0200
Message-Id: <1305667559-15671-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] sane-toolchain-java: define PREFERRED_PROVIDER_openjdk-6-jre to use openjdk-6 as java2-runtime provider instead of cacao
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
X-List-Received-Date: Tue, 17 May 2011 21:29:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-toolchain-java.inc |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-java.inc b/conf/distro/include/sane-toolchain-java.inc
index 365a3d6..a754f11 100644
--- a/conf/distro/include/sane-toolchain-java.inc
+++ b/conf/distro/include/sane-toolchain-java.inc
@@ -2,5 +2,20 @@
 
 PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
 PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
+
+# target cacao is failing to build
+# without this provider we get
+# DEBUG: sorted providers for java2-runtime are: [
+#        '/OE/dev/recipes/cacao/cacao_0.99.4.bb', 
+#        '/OE/dev/recipes/jamvm/jamvm_1.5.3.bb', 
+#        '/OE/dev/recipes/openjdk/openjdk-5_6b18-1.8.5.bb']
+# with this provider we get
+# NOTE: selecting openjdk-6-jre to satisfy runtime java2-runtime due to PREFERRED_PROVIDER_openjdk-6-jre = openjdk-6-jre
+# DEBUG: sorted providers for java2-runtime are: [
+#        '/OE/dev/recipes/openjdk/openjdk-6_6b18-1.8.5.bb', 
+#        '/OE/dev/recipes/cacao/cacao_0.99.4.bb', 
+#        '/OE/dev/recipes/jamvm/jamvm_1.5.3.bb']
+PREFERRED_PROVIDER_openjdk-6-jre = "openjdk-6-jre"
+
 PREFERRED_VERSION_classpath-native = "0.98"
 PREFERRED_VERSION_classpath = "0.98"
-- 
1.7.5.rc3



