Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ink-0004r1-GV
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:28 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so214337bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gwYlmTF0862CetREoSY5q866nykKLPl92GZzpDo67ng=;
	b=YNm6HugRdEazLnL02tIPwRfBzRJQhn3tFOgTyn08YrU1jaiCejlokm07Op/SRYqAgJ
	hBYKdmRTOLi81FmBFuxCkyYdbR90rMcTlXyVT3v+oJIQbLyAwep0+oc5f+rlzmsp7Me/
	kXfVNa/7fDtX99A+7PWD5GxAv5P0Nqu1gM75Q=
Received: by 10.204.149.2 with SMTP id r2mr3758890bkv.379.1315404208393;
	Wed, 07 Sep 2011 07:03:28 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:03 +0400
Message-Id: <1315404187-18176-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 08/12] linux.inc: drop old udev check
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:28 -0000

We have udev 145, 164, 173 in oe-core/meta-oe and the check was
for udev < 141.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |   39 +++++++++++++++------------------------
 1 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 51231db..03b9811 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -9,9 +9,6 @@ inherit kernel siteinfo
 # Enable OABI compat for people stuck with obsolete userspace
 ARM_KEEP_OABI ?= "1"
 
-# Quirk for udev greater or equal 141
-UDEV_GE_141 ?= "0"
-
 # Set the verbosity of kernel messages during runtime
 # You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
 CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "loglevel=3", d)}'
@@ -87,13 +84,8 @@ do_configure_prepend() {
         echo 'CONFIG_LOCALVERSION="${LOCALVERSION}"' >>${S}/.config
         echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.config
 
-        #
-        # Udev quirks
-        #
-
         # Newer versions of udev mandate that sysfs doesn't have deprecated entries
-        if [ "${UDEV_GE_141}" = "1" ] ; then
-            sed -e /CONFIG_SYSFS_DEPRECATED/d \
+        sed -e /CONFIG_SYSFS_DEPRECATED/d \
                 -e /CONFIG_SYSFS_DEPRECATED_V2/d \
                 -e /CONFIG_HOTPLUG/d \
                 -e /CONFIG_UEVENT_HELPER_PATH/d \
@@ -107,21 +99,20 @@ do_configure_prepend() {
                 -e /CONFIG_BLK_DEV_BSG/d \
                 -i '${S}/.config'
 
-            echo '# CONFIG_SYSFS_DEPRECATED is not set' >> ${S}/.config
-            echo '# CONFIG_SYSFS_DEPRECATED_V2 is not set' >> ${S}/.config
-            echo 'CONFIG_HOTPLUG=y' >> ${S}/.config
-            echo 'CONFIG_UEVENT_HELPER_PATH=""' >> ${S}/.config
-            echo 'CONFIG_UNIX=y' >> ${S}/.config
-            echo 'CONFIG_SYSFS=y' >> ${S}/.config
-            echo 'CONFIG_PROC_FS=y' >> ${S}/.config
-            echo 'CONFIG_TMPFS=y' >> ${S}/.config
-            echo 'CONFIG_INOTIFY_USER=y' >> ${S}/.config
-            echo 'CONFIG_SIGNALFD=y' >> ${S}/.config
-            echo 'CONFIG_TMPFS_POSIX_ACL=y' >> ${S}/.config
-            echo 'CONFIG_BLK_DEV_BSG=y' >> ${S}/.config
-            echo 'CONFIG_DEVTMPFS=y' >> ${S}/.config
-            echo 'CONFIG_DEVTMPFS_MOUNT=y' >> ${S}/.config
-        fi
+        echo '# CONFIG_SYSFS_DEPRECATED is not set' >> ${S}/.config
+        echo '# CONFIG_SYSFS_DEPRECATED_V2 is not set' >> ${S}/.config
+        echo 'CONFIG_HOTPLUG=y' >> ${S}/.config
+        echo 'CONFIG_UEVENT_HELPER_PATH=""' >> ${S}/.config
+        echo 'CONFIG_UNIX=y' >> ${S}/.config
+        echo 'CONFIG_SYSFS=y' >> ${S}/.config
+        echo 'CONFIG_PROC_FS=y' >> ${S}/.config
+        echo 'CONFIG_TMPFS=y' >> ${S}/.config
+        echo 'CONFIG_INOTIFY_USER=y' >> ${S}/.config
+        echo 'CONFIG_SIGNALFD=y' >> ${S}/.config
+        echo 'CONFIG_TMPFS_POSIX_ACL=y' >> ${S}/.config
+        echo 'CONFIG_BLK_DEV_BSG=y' >> ${S}/.config
+        echo 'CONFIG_DEVTMPFS=y' >> ${S}/.config
+        echo 'CONFIG_DEVTMPFS_MOUNT=y' >> ${S}/.config
 
         # Newer inits like systemd need cgroup support
         if [ "${KERNEL_ENABLE_CGROUPS}" = "1" ] ; then
-- 
1.7.2.5



