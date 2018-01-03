Return-Path: <liu.ming50@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 332A477E87
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:48:10 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id b39so89413ybj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V5eyWGlxKVI8A6tMnz0Tr92ic4Ibl/P7u7MCMYhYdCM=;
	b=EyK8xgGhlnYlT4iTpF0BcHxB3LIOD/o+Kt38s22NGM4DQ/6oAFSx41JyH4fGEQ08Wg
	gUlZq5qbXP7qSH4PHIV6juKduDpuZ5/c6iw3FM3C4E/u0euiWq7+HBKCbhge14aiqbPT
	IKfB3q3pQiunmUqMAIjhmPdFdJmfk824V/PSU4Vt8nT51rfeBOaEIe0M3+OsrY0SLZaQ
	YQVOpSk7rLoauClHLtVDsC+jC41WmqHizwm8qbJwzH/gWS4xjOEh8vsom74Xu/94aBM+
	RO332uv1CDMTKad6c3vU23ctqfMZDjK1ytJVTIhz9G0siNc8w+8M9BkDpo/cJAg2xE5x
	nFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V5eyWGlxKVI8A6tMnz0Tr92ic4Ibl/P7u7MCMYhYdCM=;
	b=Sy+w2dUkxbS9jr1ykSd1c+nMLZKkhseUbyShCh/lRdlgJOXo2YPwd4FnIpYalQBbje
	kdsQlILak1+ymcSiJpU9A4JknnalAjUK7vkYsUg7/ElTRSZUT3x/nHfERMD55JniNqPA
	cjiVZWWrIgDxiCBJfdJm0RMobjHxy9JLgAtOWnmp9p+9yLKOV6Cydq7Pnbe4uxBDdnns
	yoXYT/vNJO7k1cseYv2dyBsJgVmpuGlB2Fs6SfGYu9YE5eMIchp7Hg6cE+FN5esKArPJ
	9VQRWcNJxUOlLfICHpYO5Nsg7a1cXMRhYTQMj71gJPtvMo+p2+Da5EAwzJoiGhyHn+Db
	DEsQ==
X-Gm-Message-State: AKGB3mJjkboE762nqK3H4zrIFyAhPViPEpbweFwRZxLAkkq1p/jR4Bju
	jamkUGvTZ/x83wT/ZwNEiPeklKzK
X-Google-Smtp-Source: ACJfBov5OO35B43K+mj9NHKA31iAoz/aVZbG36AhaYsP2Wyjv4dS7ua63FW8wn1BaYkYANXWRMa7nA==
X-Received: by 10.37.18.5 with SMTP id 5mr30705260ybs.501.1514944092087;
	Tue, 02 Jan 2018 17:48:12 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.48.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:48:11 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:30 +0100
Message-Id: <1514944050-12039-8-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 7/7] ant-contrib-native: add recipe
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
X-List-Received-Date: Wed, 03 Jan 2018 01:48:11 -0000

From: Ming Liu <liu.ming50@gmail.com>

The Ant-Contrib project is a collection of tasks (and at one point
maybe types and other tools) for Apache Ant.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../ant-contrib/ant-contrib-native_1.0b3.bb        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb

diff --git a/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
new file mode 100644
index 0000000..2a44ea2
--- /dev/null
+++ b/recipes-core/ant-contrib/ant-contrib-native_1.0b3.bb
@@ -0,0 +1,37 @@
+SUMMARY = "(java): collection of tasks, types and other tools for Apache Ant"
+DESCRIPTION = "The Ant-Contrib project is a collection of tasks (and at one \
+point maybe types and other tools) for Apache Ant."
+HOMEPAGE = "http://ant-contrib.sourceforge.net"
+PRIORITY = "optional"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=f84919efee8dbf5c7730927c5b8716f9"
+
+DEPENDS = "ant-native commons-cli-native commons-codec-native \
+           commons-httpclient-native commons-logging-native \
+           oro-native bcel-native xerces-j-native \
+          "
+
+inherit java-library java-native
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ant-contrib/ant-contrib-${PV}-src.zip"
+
+SRC_URI[md5sum] = "07b23539bef04ec56970c876a33f7665"
+SRC_URI[sha256sum] = "ba3621f397af14d5a19375f391ec9bf2908c46c5558ca0df8365e04fe3ac3633"
+
+S = "${WORKDIR}/ant-contrib"
+
+do_compile() {
+    mkdir -p build
+
+    oe_makeclasspath cp -s ant commons-cli commons-codec commons-httpclient commons-logging oro bcel xercesImpl
+    cp=build:${S}/lib/ivy/jars/ivy-1.3.1.jar:$cp
+
+    find src/java -name "*.java" > java_files
+
+    javac -sourcepath src/java -cp $cp -d build @java_files
+
+    (cd src/java && find . \( -name "*.properties" -or -name "*.xml" -or -name "*.mf" \) -exec cp {} ../../build/{} \;)
+
+    fastjar cf ${JARFILENAME} -C build .
+}
-- 
2.7.4


