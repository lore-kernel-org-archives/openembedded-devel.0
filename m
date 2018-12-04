Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 25F656D22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 17:46:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id b5so8665539plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cq37jB08vDM4BuwQ/3a1VKd6I2Ztl40q2gZAVO3b0Uw=;
	b=jrVEkLUbGfreeypejaXXc6YQ0TKqj0NxrAdAlGpIFrL7xcu9FxeaMFTdxY/Dary69O
	SMaAsPAgFDE/XP+A9HouC+Jw24mWugZz4KKOnegplkTGMkRmQuwKuujkssmMm0lbjKuu
	QYydKGtj5E9LQiuMGHxDbKTz59AMmTz3YswAaibxZs3UMYBhzv8HpYYF+E03eH4xhQLL
	Kc9hJwORhyBIlYZhdbvQYkyek7Xai/AkvEmGvBoSmExwc0WDgqi6dkuyC83A7ihsQ8Un
	tCG9rtjQvFzuVSrbizdmXaRnClQHC/dM54PlL0P4jHm7QB9IuoYEWfyHdDhdgMdmFwuC
	Ltbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cq37jB08vDM4BuwQ/3a1VKd6I2Ztl40q2gZAVO3b0Uw=;
	b=mr8TFdbav/Y7ZtP9M8reEJa3V3T14UPvtHVMR5BaVCA3m+3bQq9ibJcz38w06UvXcB
	GqzyhHr4HqWuOJzc9NNEQkN6GM06NNvKJwOGAkK6nR91btjZKHXOWQ9xYXtXOaRi34Pt
	vK79F17sTXlKgIoBxDDCVUDiQ1zxpgHE50T8f2/HtEF/Qvl2cHeZm5pgd3SDZNIFQXpc
	TdEY++b2kqpmDOFBVMdMeqocMErBr/5SvjKO85FPbZbzacR00hENXiPf5Prajm2ZoSEl
	3pc4g4qeyQV9MPswosrX3CjejVseG8nYT244yQIQS8HNYJJuNVsEY/YI7LdZuZfjt8a2
	nNmg==
X-Gm-Message-State: AA+aEWanVY2i+mhOljp8y281z7ZKT3LwMHbov8VrjZt75ZvlKk7raRAN
	YZ5DCae+oQIjQmL7FPABqa8r4NzfzaI=
X-Google-Smtp-Source: AFSGD/XdNae+wIHyXIvrJriUjZB7BXAsEx+PVx4ibDr7Q/Tg+selG2xFdXKmohGGEKQbQxKOdsuAsA==
X-Received: by 2002:a17:902:209:: with SMTP id
	9mr21255667plc.288.1543945591488; 
	Tue, 04 Dec 2018 09:46:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	i62sm20503065pge.44.2018.12.04.09.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 09:46:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 09:46:17 -0800
Message-Id: <20181204174618.6271-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204174618.6271-1-raj.khem@gmail.com>
References: <20181204174618.6271-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 2/3] packagegroup-meta-oe: Remove arch specific packages as needed
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
X-List-Received-Date: Tue, 04 Dec 2018 17:46:31 -0000
Content-Transfer-Encoding: 8bit

Some packages are not supported on all architectures, therefore they
can not be included unconditionally.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Add more non-x86 arch specific removals

 .../packagegroups/packagegroup-meta-oe.bb     | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2a5ff33e57..e79d6ee217 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Meta-oe ptest packagegroups"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
@@ -52,6 +53,8 @@ RDEPENDS_packagegroup-meta-oe-benchmarks = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "glmark2", "", d)} \
 "
 
+RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mipsarch = "libhugetlbfs"
+
 RDEPENDS_packagegroup-meta-oe-connectivity ="\
     gammu hostapd irssi krb5 libev libimobiledevice \
     libmbim libmtp libndp libqmi libtorrent \
@@ -83,6 +86,9 @@ RDEPENDS_packagegroup-meta-oe-bsp ="\
     efivar flashrom lmsensors lmsensors-config \
     lsscsi nvme-cli pcmciautils pointercal \
     "
+RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
+
 RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
     mysql-python postgresql psqlodbc rocksdb soci \
@@ -106,6 +112,10 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
     "
 
+RDEPENDS_packagegroup-meta-oe-devtools_remove_armv5 = "uftrace nodejs"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "uftrace lshw"
+
 RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
     ddrescue dialog dumb-init enscript fluentbit \
@@ -130,6 +140,8 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
     ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", "", d)} \
     "
+RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm gnome-common gnome-doc-utils-stub gtkmm \
@@ -223,6 +235,9 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ${NE10} \
     "
 
+RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
+RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch_libc-glibc = "gperftools"
+
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
     freerdp libnice opencv \
     "
@@ -232,6 +247,10 @@ RDEPENDS_packagegroup-meta-oe-test ="\
     fwts gtest pm-qa stress-ng testfloat \
     "
 
+RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
+RDEPENDS_packagegroup-meta-oe-test_remove_mipsarch = "fwts"
+RDEPENDS_packagegroup-meta-oe-test_remove_powerpc = "fwts"
+
 RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
     leveldb-ptest \
@@ -242,8 +261,13 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
-    mcelog-ptest \
     libee-ptest \
-    numactl-ptest \
     poco-ptest \
     "
+RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = "\
+    mcelog-ptest \
+"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86-64 = "\
+    mcelog-ptest \
+"
+RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_arm = "numactl-ptest"
-- 
2.19.2


