Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 680D77FD6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 18:59:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id az3so2962046plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5L2GNRlvCsuf7Wuql/DPYhaZXE82+7PJS6BEVcKqL/8=;
	b=T4GIkRZsZpXNhvhfYDsV7n6eEmggAaPXaeeC3sYK+2xg4IFaiMUsUn9Zya/S6Px5U1
	whsSTak5JJT+O61PzD+fKVLP6B4rq9I75B0U2uF0dM2aeMvnp9JB5r4pUjaTQo2TaNE6
	KFplF8YJZIBuRWD6spZYifFlQPqx2aFc9n4SAwnya9RnB7Gh4H/wAyn9L/8asCDwpqS8
	M1PGqGrSEp9EfPV2TAfXOkQmlV6U9yj9pQg3iWmBkqBKAE6ze+j/BXIdOScfDANNLRwf
	cufTdLnTluBMyey1m2U0bwBaR6jVb2bAtkHuKCeUIN8lxdgYq8ebCvaDAH+3glqCznzL
	UWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5L2GNRlvCsuf7Wuql/DPYhaZXE82+7PJS6BEVcKqL/8=;
	b=O8QhMZgay/5lF5rfjSO4QUof98DL4QV68NkTkAg9bSEOuVDZuCk0R/PVv9v38yjYFW
	eRmIvSJhSCi4zq4QdGheX5t6X740YMKIxmdtstxR3ct/3iP0AZcsemqlYWIAIR5CjQ4N
	QhdEHaRLQ9owolC0qwfYG5aGYz9tHdN0FXLAfDH4vEOSBuOR8DFkMJXvOT7XCcbzyvHk
	23Jr4ikLnmrMAZ/WacRFjG36TE0MtqCU5yzQhxvwzns1MaUOgoDyIGVibT4QWPwxgGa/
	yh2XaUsFWaU6rnW0RV5oUhAjAI+UKkU8rgjnhZCySPyjkxY+75rb19F3VBGWHUZMB3Bl
	TSjw==
X-Gm-Message-State: APjAAAUUeKbnrVmwKys70nJoH7IWsuDY7CKE6sYMch4JlHb60rY859/x
	Nlg9zGVEy2rgp6Pn4PbL7JbzBx/bgYg=
X-Google-Smtp-Source: APXvYqxNebFZmRRlq4r9i7kidJ086m5ElO32EAdsdBLFQgarnFr0eNDCac+mCltMcwWzv6X8gk1Dbw==
X-Received: by 2002:a17:90b:4391:: with SMTP id
	in17mr11255321pjb.33.1576781979856; 
	Thu, 19 Dec 2019 10:59:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	o184sm8129200pgo.62.2019.12.19.10.59.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 10:59:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 10:59:31 -0800
Message-Id: <20191219185931.1325337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dfu-util-native, sjf2410-linux-native: Fix Deploy in multimachine builds
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
X-List-Received-Date: Thu, 19 Dec 2019 18:59:39 -0000
Content-Transfer-Encoding: 8bit

When more than two machine are built using same tmpdir and happen to use
these tools the builds fail

Fixes
ERROR: The recipe dfu-util-native is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
  TOPDIR/build/tmp/deploy/tools/dfu-util-0.9
    (matched in manifest-qemumips-dfu-util-native.deploy)
Please verify which recipe should provide the above files.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb  | 9 ++++++++-
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb        | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index 76faefefbb..feb16fa730 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -8,7 +8,6 @@ PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[static] = "CFLAGS='${CFLAGS} -pthread -static',,"
 
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 do_deploy() {
     install -m 0755 src/dfu-util ${DEPLOYDIR}/dfu-util-${PV}
     rm -f ${DEPLOYDIR}/dfu-util
@@ -16,3 +15,11 @@ do_deploy() {
 }
 
 addtask deploy before do_package after do_install
+
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
+# cleandirs should possibly be in deploy.bbclass but we need it
+do_deploy[cleandirs] = "${DEPLOYDIR}"
+# clear stamp-extra-info since MACHINE_ARCH is normally put there by
+# deploy.bbclass
+do_deploy[stamp-extra-info] = ""
+
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
index 9e609c4dd8..3a5172eecc 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -13,7 +13,6 @@ SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;protocol=
 S = "${WORKDIR}/sjf2410-linux"
 
 inherit native deploy
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 
 CFLAGS += "-DLINUX_PPDEV"
 
@@ -31,3 +30,11 @@ do_deploy() {
 }
 
 addtask deploy before do_build after do_install
+
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
+# cleandirs should possibly be in deploy.bbclass but we need it
+do_deploy[cleandirs] = "${DEPLOYDIR}"
+# clear stamp-extra-info since MACHINE_ARCH is normally put there by
+# deploy.bbclass
+do_deploy[stamp-extra-info] = ""
+
-- 
2.24.1


