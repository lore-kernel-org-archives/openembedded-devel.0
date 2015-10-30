Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B985575D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 19:19:57 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82365912pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f3RyaKmpHU0g5wuKFsaLcln9UXyvQfrhV3ewa+QUcDA=;
	b=EIs6Nfa4NT5wUlkiM4kG4/d5y6tchZYnrwYWwIlXFWY73SC6+PW0/TdcXbxPIMNz47
	bjOS/mb5m4m32Vp/Qx0w/hnGF6Eaa2oLgQKgVgZoDPEf9uVI31yiiXDEWu0sduybbSuz
	+6yep5l3J9FtU53n6vCUo0sN4HVod9OTqTkt9a6Ngj3hQgM14gyf52Y4Kj6ow+fI6zpm
	MladiikjoLNhXitlt21yhtN6KY6hPcM/rGSQqCu8L4pg8tnnZ/wzLnn5o0zIKrLmTIYf
	KU9sJcMAOfcy3RPOX0L+wULRXQwJyhmWwsV31TOTYbC8V2KB7+UJQhPLR33cfaoyJ2EV
	WeXA==
X-Received: by 10.68.193.5 with SMTP id hk5mr10501419pbc.152.1446232797890;
	Fri, 30 Oct 2015 12:19:57 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	gv1sm9621179pbc.38.2015.10.30.12.19.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Oct 2015 12:19:56 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 12:19:49 -0700
Message-Id: <1446232789-12178-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] ninja-native: add initial recipe, ninja 1.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 19:20:02 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-devtools/ninja/ninja-native_1.6.0.bb   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb

diff --git a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
new file mode 100644
index 0000000..c00710a
--- /dev/null
+++ b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Ninja is a small build system with a focus on speed."
+HOMEPAGE = "http://martine.github.com/ninja/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+DEPENDS = "re2c-native"
+
+inherit native
+
+SRCREV="484c16336f19bd8970bb6e75322d61b92a229899"
+
+SRC_URI = "git://github.com/martine/ninja.git;branch=release"
+
+S="${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    python ${S}/configure.py --bootstrap
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/ninja ${D}${bindir}/
+}
-- 
1.9.1


