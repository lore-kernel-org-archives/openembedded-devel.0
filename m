Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2B70B7039E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:03:16 +0000 (UTC)
Received: from [69.196.158.250] (port=47112 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6fuX-0008AW-KZ for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2014 09:03:17 -0400
Date: Mon, 14 Jul 2014 09:03:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407140857500.26321@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-oe][PATCH] Remove deprecated "task" backward compatibility from packagegroups
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
X-List-Received-Date: Mon, 14 Jul 2014 13:03:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  all of this looked relatively straightforward.

diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index 4e5ce78..5ead412 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -11,9 +11,6 @@ require packagegroup-efl-sdk.inc

 PACKAGES = "${PN}"

-RPROVIDES_${PN} += "task-efl-sdk"
-RREPLACES_${PN} += "task-efl-sdk"
-RCONFLICTS_${PN} += "task-efl-sdk"
 RDEPENDS_${PN} = "\
     packagegroup-core-sdk \
     ${SDK-EFL} \
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 1bcac45..6a3f33d 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -11,9 +11,6 @@ require packagegroup-efl-sdk.inc

 PACKAGES = "${PN} ${PN}-dbg"

-RPROVIDES_${PN} += "task-efl-standalone-sdk-target"
-RREPLACES_${PN} += "task-efl-standalone-sdk-target"
-RCONFLICTS_${PN} += "task-efl-standalone-sdk-target"
 RDEPENDS_${PN} = "\
     packagegroup-core-standalone-sdk-target \
     ${SDK-EFL} \
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 47f758a..63ef0f6 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -11,9 +11,6 @@ inherit packagegroup allarch
 ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-mobile"

-RPROVIDES_${PN} += "task-x11-illume"
-RREPLACES_${PN} += "task-x11-illume"
-RCONFLICTS_${PN} += "task-x11-illume"
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 08db943..ad1cd83 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -23,9 +23,6 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 #
 TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"

-RPROVIDES_${PN} += "task-basic"
-RREPLACES_${PN} += "task-basic"
-RCONFLICTS_${PN} += "task-basic"
 #
 # The section below is designed to match with packagegroup-boot, but doesn't depend on it to allow for more freedom
 # when writing image recipes.
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 3b634f3..61a519d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -19,10 +19,6 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 # Make sure we build the kernel
 DEPENDS = "virtual/kernel"

-RPROVIDES_${PN} += "task-boot"
-RREPLACES_${PN} += "task-boot"
-RCONFLICTS_${PN} += "task-boot"
-
 #
 # minimal set of packages - needed to boot
 #
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index fbba23c..2a4b067 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -10,13 +10,6 @@ inherit packagegroup allarch

 PACKAGES += "${PN}-debug"

-RPROVIDES_${PN} += "task-cli-tools"
-RPROVIDES_${PN}-debug += "task-cli-tools-debug"
-RREPLACES_${PN} += "task-cli-tools"
-RREPLACES_${PN}-debug += "task-cli-tools-debug"
-RCONFLICTS_${PN} += "task-cli-tools"
-RCONFLICTS_${PN}-debug += "task-cli-tools-debug"
-
 RDEPENDS_${PN} = "\
     dbus-daemon-proxy \
     dosfstools \
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 9b8cc9a..aafe63a 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -6,9 +6,9 @@ PR = "r1"

 inherit packagegroup allarch

-RPROVIDES_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
-RREPLACES_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
-RCONFLICTS_${PN} += "packagegroup-native-sdk task-sdk-target task-native-sdk"
+RPROVIDES_${PN} += "packagegroup-native-sdk"
+RREPLACES_${PN} += "packagegroup-native-sdk"
+RCONFLICTS_${PN} += "packagegroup-native-sdk"
 RDEPENDS_${PN} = "gcc-symlinks g++-symlinks cpp cpp-symlinks \
                   binutils-symlinks \
                   perl-modules \
diff --git a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index 931564f..632e7d4 100644
--- a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -12,18 +12,6 @@ PACKAGES += "\
     ${PN}-chinese \
     ${PN}-japanese \
 "
-RPROVIDES_${PN} += "task-fonts-truetype"
-RPROVIDES_${PN}-core += "task-fonts-truetype-core"
-RPROVIDES_${PN}-chinese += "task-fonts-truetype-chinese"
-RPROVIDES_${PN}-japanese += "task-fonts-truetype-japanese"
-RREPLACES_${PN} += "task-fonts-truetype"
-RREPLACES_${PN}-core += "task-fonts-truetype-core"
-RREPLACES_${PN}-chinese += "task-fonts-truetype-chinese"
-RREPLACES_${PN}-japanese += "task-fonts-truetype-japanese"
-RCONFLICTS_${PN} += "task-fonts-truetype"
-RCONFLICTS_${PN}-core += "task-fonts-truetype-core"
-RCONFLICTS_${PN}-chinese += "task-fonts-truetype-chinese"
-RCONFLICTS_${PN}-japanese += "task-fonts-truetype-japanese"

 RRECOMMENDS_${PN} = "\
     ${PN}-core \
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 7fcb388..28cfc7f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -6,10 +6,6 @@ PR = "r5"

 inherit packagegroup

-RPROVIDES_${PN} += "task-xfce-base"
-RREPLACES_${PN} += "task-xfce-base"
-RCONFLICTS_${PN} += "task-xfce-base"
-
 RDEPENDS_${PN} = " \
     xfwm4 \
     xfce4-session \
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index e91362e..0eab1cc 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -9,10 +9,6 @@ PNBLACKLIST[packagegroup-xfce-extended] = "BROKEN: rdepends on broken xfce4-powe

 inherit packagegroup

-RPROVIDES_${PN} += "task-xfce-extended"
-RREPLACES_${PN} += "task-xfce-extended"
-RCONFLICTS_${PN} += "task-xfce-extended"
-
 # mandatory
 RDEPENDS_${PN} = " \
     packagegroup-xfce-base \

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

