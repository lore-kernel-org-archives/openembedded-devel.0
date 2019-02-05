Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id C56517C387
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:53:38 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id d11so9522022itf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CCWLCMicr/Ls9uhPq2T3gONDy8ZmafZ9Dqi5H6tj58w=;
	b=gh26PRWxYnOgZ0VXmI7nHAVTxqj2kugiMzI7udwzn2SaR5ImXLE/21hszZsfN5RHAh
	9aGOfRAZUpPHU7TBdkS9lLM0rZDEMQaOczzP0J0E1YKSN6rl09aEdq3InwMMpAFKbjlU
	QszlJ83+P5JW7MnUcQIXYR9sG/Yx2liZEOfGxj1Jtey6mURGn3JIO1qxBdrk8DURdhfX
	S7Eu/9/Fd3d7ZlMLK9Yf2XNA/PnWNk9EjLwh3fjMklSt+2CHY6oHvPoo8v+RB0os2oEc
	w0Lqydsl0pOSOS5MaFOnZYTCjjyYUhW5+He+tgP2XVjZ3usSPbAQnnW2hsCR7Zo1snZp
	UxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CCWLCMicr/Ls9uhPq2T3gONDy8ZmafZ9Dqi5H6tj58w=;
	b=B0qG0he414nM/FhoFbriEu38w1A4axrZIybuoXSGvJxLkq4FFHISXyn5/QouJRQy0S
	0t+PmdPpgmNyKs4/KyzQP1malRCIlQO6tWfW3O8+mORpSxoUK9atQnSH9HwLx15T/2JP
	Q+NlOA9L3xvZnRR7w3YvCPmJdRAwCcRb5vJs+6s0kdOOXGe5EmmD0ItuQ8imt/VGp9dR
	dvlgFivPva1Yv1IJmMxAQrERng6Xa6fbN4cgrbtRr/FSzv6e649xmCq5evE0wQPVBwIy
	rceX4Et/xOFlGgP/YhaGqs2TBH6RvCbq4teOPxpqlCkSGtp4vOcAnnfbAmwrHNElbR3O
	bxhA==
X-Gm-Message-State: AHQUAuZIQ2r7+VKgHLZbCLKy55SyMIpQAcXzhs3f0kGx2x0p9s0Dt/TS
	tABEnHhuJmOVa6m+dtYY2dNywERd
X-Google-Smtp-Source: AHgI3IYRsUf+arqV+HxCbqeiE0IRyMhDHBQou46TpMajTuZj7WvPCRJ8S62Ks646YmRsMWaSqQJoig==
X-Received: by 2002:a05:660c:283:: with SMTP id
	s3mr3098062itl.135.1549382019667; 
	Tue, 05 Feb 2019 07:53:39 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id z6sm441985iop.73.2019.02.05.07.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 07:53:39 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 10:53:25 -0500
Message-Id: <20190205155325.7493-3-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205155325.7493-1-bkylerussell@gmail.com>
References: <20190205155325.7493-1-bkylerussell@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ant-native: only use classpath tools if no JDK
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
X-List-Received-Date: Tue, 05 Feb 2019 15:53:38 -0000
Content-Transfer-Encoding: 8bit

If ant gets invoked with a $JAVA_HOME that points to a JDK (for example,
from an 'inherit java-native'), use the tools.jar from the JDK instead
of the classpath-initial tools.

Once a native JDK has been bootstrapped, other Java recipes should be
able to use a more featureful set of classes if needed.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 recipes-core/ant/ant-native_1.8.1.bb | 2 +-
 recipes-core/ant/files/ant           | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 7839abd..67cb5fc 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -53,7 +53,7 @@ do_compile() {
   fastjar cf ${JARFILENAME} -C build .
 
   oe_makeclasspath cp -s ecj-bootstrap jsch bsf xalan2 xercesImpl resolver gnumail gnujaf bcel regexp log4j1.2 antlr oro junit jdepend commons-net commons-logging
-  cp=${STAGING_DATADIR_JAVA_NATIVE}/ant.jar:${STAGING_DATADIR}/classpath/tools.zip:$cp
+  sed -i -e"s|@ANT_JAR@|${STAGING_DATADIR_JAVA_NATIVE}/ant.jar|" ${WORKDIR}/ant
   sed -i -e"s|@JAR_FILE@|$cp|" ${WORKDIR}/ant
 }
 
diff --git a/recipes-core/ant/files/ant b/recipes-core/ant/files/ant
index bb282a9..939f3ec 100755
--- a/recipes-core/ant/files/ant
+++ b/recipes-core/ant/files/ant
@@ -1,6 +1,15 @@
 #!/bin/sh
 
 export CLASSPATH
+
+CLASSPATH=$CLASSPATH:@ANT_JAR@
+
+if [ -f "$JAVA_HOME/lib/tools.jar" ] ; then
+        CLASSPATH="$CLASSPATH:$JAVA_HOME/lib/tools.jar"
+else
+        CLASSPATH="$CLASSPATH:${STAGING_DATADIR}/classpath/tools.zip"
+fi
+
 CLASSPATH=$CLASSPATH:@JAR_FILE@
 
 if [ ! $JAVA ];then
-- 
2.20.1


