Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4bzB-0007GU-6T
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 18:46:13 +0100
Received: by wera1 with SMTP id a1so2626956wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 09:37:38 -0800 (PST)
Received: by 10.180.107.162 with SMTP id hd2mr13409284wib.8.1330969058409;
	Mon, 05 Mar 2012 09:37:38 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id er8sm65122247wib.1.2012.03.05.09.37.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 09:37:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 18:37:29 +0100
Message-Id: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmPA8kBvBI1/SmocvYDC+vkJXe2H0arZfE56kVAnOB6PdVztHyGkjUClYnKej9MVmcL4FQs
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/3] systemd: enable xz compression for journald
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
X-List-Received-Date: Mon, 05 Mar 2012 17:46:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 62a326e..2b549a0 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
+DEPENDS = "xz docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r17"
+PR = "r18"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -44,6 +44,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --with-rootlibdir=${base_libdir} \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --disable-gtk \
+                 --enable-xz \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
-- 
1.7.2.5



