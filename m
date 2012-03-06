Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4qjW-000716-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 10:31:03 +0100
Received: by wgbdr12 with SMTP id dr12so3795647wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 01:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.83.198 as permitted sender)
	client-ip=10.180.83.198; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.83.198 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.83.198])
	by 10.180.83.198 with SMTP id s6mr2383760wiy.8.1331025747603 (num_hops
	= 1); Tue, 06 Mar 2012 01:22:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.83.198 with SMTP id s6mr1863740wiy.8.1331025747426;
	Tue, 06 Mar 2012 01:22:27 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hn8sm76113583wib.11.2012.03.06.01.22.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 01:22:26 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 10:22:19 +0100
Message-Id: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQkssy06WQFqvQPZzEB40IN7BbMO9I/EoO6Yryl2XvqM/zkLNohf5Pp5EgxZN6x37ahFKz/e
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2 1/3] systemd: enable xz compression for journald
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
X-List-Received-Date: Tue, 06 Mar 2012 09:31:03 -0000

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



