Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpzsI-0001Tk-IK
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 11:14:42 +0100
Received: by eekd41 with SMTP id d41so1627056eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vYlB1QChvhcCQmaHOBO5MYxW3VcUVtjbGg6nOuTCo7M=;
	b=WcNOjmBLGf7pnwnYzNaEtlsA2vRWCQ0rge1qOvWjIS1lqD3PIEWQ/2R4K0wpmYe3/e
	QTfRa1kipTjEBHfh1t1u7M8Vd6nMpDl1FAJwWWQcTKi8cBDaxFrlHBemfOH7DM03tprx
	LGueYfjqUiVUOKINn7DTbA0p/6Rnv4/ZHBbJs=
Received: by 10.14.135.16 with SMTP id t16mr5845322eei.6.1327486015388;
	Wed, 25 Jan 2012 02:06:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e12sm79469770eea.5.2012.01.25.02.06.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:06:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:06:38 +0100
Message-Id: <ed9120b47c25633476787942662d7e03ab7014c7.1327485929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <a9957f330a7b791a8eba677a2c672923ba4601ed.1327485929.git.Martin.Jansa@gmail.com>
References: <a9957f330a7b791a8eba677a2c672923ba4601ed.1327485929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327485929.git.Martin.Jansa@gmail.com>
References: <cover.1327485929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/3] meta-efl: add recipes for efl sdk
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
X-List-Received-Date: Wed, 25 Jan 2012 10:14:42 -0000

From: Nicolas Aguirre <aguirre.nicolas@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-core/meta/meta-toolchain-efl.bb   |    6 ++++++
 meta-efl/recipes-efl/tasks/task-efl-sdk.bb         |   15 +++++++++++++++
 meta-efl/recipes-efl/tasks/task-efl-sdk.inc        |   17 +++++++++++++++++
 .../tasks/task-efl-standalone-sdk-target.bb        |   15 +++++++++++++++
 4 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-core/meta/meta-toolchain-efl.bb
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-sdk.bb
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-sdk.inc
 create mode 100644 meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb

diff --git a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
new file mode 100644
index 0000000..875d8f8
--- /dev/null
+++ b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
@@ -0,0 +1,6 @@
+TOOLCHAIN_TARGET_EFLTASK ?= "task-efl-standalone-sdk-target task-efl-standalone-sdk-target-dbg"
+TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_EFLTASK}"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-efl-${DISTRO_VERSION}"
+require recipes-core/meta/meta-toolchain.bb
+
+TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.bb b/meta-efl/recipes-efl/tasks/task-efl-sdk.bb
new file mode 100644
index 0000000..5c1a13a
--- /dev/null
+++ b/meta-efl/recipes-efl/tasks/task-efl-sdk.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Efl Software Development Kit"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+ALLOW_EMPTY = "1"
+
+require task-efl-sdk.inc
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "\
+    task-core-sdk \
+    ${SDK-EFL} \
+    ${SDK-EXTRAS}"
diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.inc b/meta-efl/recipes-efl/tasks/task-efl-sdk.inc
new file mode 100644
index 0000000..8f01267
--- /dev/null
+++ b/meta-efl/recipes-efl/tasks/task-efl-sdk.inc
@@ -0,0 +1,17 @@
+SDK-EFL = " \
+     eina-dev \
+     eet-dev \
+     evas-dev \
+     embryo-dev \
+     ecore-dev \
+     edbus-dev \
+     lua5.1-dev \
+     edje-dev \
+     elementary-dev \
+    "
+
+SDK-EXTRAS ?= ""
+SDK-EXTRAS_qemux86 ?= " valgrind lttng-ust-dev"
+SDK-EXTRAS_qemux86-64 ?= " lttng-ust-dev"
+SDK-EXTRAS_qemuppc ?= " lttng-ust-dev"
+SDK-EXTRAS_qemuarm ?= " lttng-ust-dev"
diff --git a/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
new file mode 100644
index 0000000..95a66b9
--- /dev/null
+++ b/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Efl Software Development Kit"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+ALLOW_EMPTY = "1"
+
+require task-efl-sdk.inc
+
+PACKAGES = "${PN} ${PN}-dbg"
+
+RDEPENDS_${PN} = "\
+    task-core-standalone-sdk-target \
+    ${SDK-EFL} \
+    ${SDK-EXTRAS}"
-- 
1.7.8.4



