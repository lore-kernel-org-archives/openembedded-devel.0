Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 216D7787CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:19:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f140so3376060wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V5eyWGlxKVI8A6tMnz0Tr92ic4Ibl/P7u7MCMYhYdCM=;
	b=eVUXBqiQVAQihAaeKr/HDKCMns2S9oqzAGsttRP51QzTSyC+fOqwpJlvW+SDgv10Bk
	PBubyYVgxT72nf5GMCFtRfBQc+he0NZmvuUh9KUed0dVTIoIISoVxKy6v4QKi8mb/pN4
	qXNqI7vpJZnDlC/RYtfwled3DLth9z3z+7fuKoBTkYp6Fg99eOKd5iSO7BYubENlahEv
	WXh8czTKMt1cNm+WaLsILpe1RDG0C6QSaKEfYidEOHTEwK/d2bKjcffn586lChstrzwc
	JvxoLyyqiLDbLbGVQjYSTuJAtoxfD3J6BBBKkt/qsxFrFvfPrTvNxuYaV7RR5BrnW1Q6
	ivRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V5eyWGlxKVI8A6tMnz0Tr92ic4Ibl/P7u7MCMYhYdCM=;
	b=VrZhqJ42YUfypY6U6Uu+Mll3OJLdpHrYUKLJxALs66/a0L4GEkULIsm7SZy8u1h188
	3zTFSDCyCvqDpreL2QvZSwDGyEV0L4xwcqPMUxx7XrKaYaN+Ud2wm2B0/fTLjjJ6+0U5
	+G+912JGX8gV2SJsMrYJN/Mz05U48Z8PUQR7qKzAvKyUA6Q1AgSy70WjXAx/gAOsEWGd
	mkSz7Qf/7xZHWBC3OzXkar9XNuaPEEwnclH+I9CjRq/Ap2e6F5d2ATf1pPf882mQ/WPW
	ta6ZLqdg/s+6hHPZ5dRscDnKaZ8wLnPqndySoq2SUSPKgxy1Tb7c/e4/UMCEafxzb2Jl
	EYmw==
X-Gm-Message-State: AKGB3mK+7CjxiHiOU9pux61+GcJEAhkyjEPv1qXo577pLBDLIFBvxtlC
	RBOCyNzFMimO/hYiCN3bwGYV+A==
X-Google-Smtp-Source: ACJfBosdOxJo3DaY8+Uh2X6jQHQ7zub5u29l8qlTXXA9NZRYLcXAKqDaRz306WpqmHMGviFa7Bcfbg==
X-Received: by 10.80.240.138 with SMTP id v10mr7394723edl.52.1515071989862;
	Thu, 04 Jan 2018 05:19:49 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	m23sm2107083edc.27.2018.01.04.05.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 05:19:49 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:19:10 +0100
Message-Id: <1515071950-15401-8-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
References: <1515071950-15401-1-git-send-email-liu.ming50@gmail.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 13:19:49 -0000

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


