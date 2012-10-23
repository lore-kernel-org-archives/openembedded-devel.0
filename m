Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TQcY0-0004DH-TG
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 13:21:24 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1315747eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 04:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=BcJMhn11q4EpXohMkF+a1bfaEVie7qxa8+N0j3t73HI=;
	b=g/XNRFyfdGqOjX7SSM2ajmcXOlAC8s+IlQNVFwf4W8TMvbcQ1JV6i2P2r6CTtZaVPW
	Z8UIuNkLXhC1B92/+OB5SW9aUKpj91wTd1YSxhLTgHQiN7GvsgS6W/AXzg0noeL54bUx
	iXHn6WF5Rvj8/HKOh8CfxH5ZIt83pxFHbEFAVItFpTsNHN0Wqf3r01mPTXMYStluR9Y6
	I8YDZSXNJDQqqF2jyBKJZ48YdvnVMd7w4p6HOireNS6am8HR3goe65zV5ViZN0hQYbgb
	RFyvJWdLhNtvTjzBjU2PeOrCaN5ZkKrKImTnvs4kN7hwFunO1DvUPuOYHpjQ0rGLhWDo
	0h4Q==
Received: by 10.14.223.4 with SMTP id u4mr16056452eep.19.1350990478863;
	Tue, 23 Oct 2012 04:07:58 -0700 (PDT)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g5sm20322434eem.4.2012.10.23.04.07.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 04:07:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 13:07:51 +0200
Message-Id: <1350990471-2548-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmZqyPwaHi4gtTTj/oqa5xdIJ1m8XmCcStcdm+Z29XnHD4D9A79jMUddzlzB/KcPPd7IPFT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-systemd][PATCH] systemd: update to 195
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
X-List-Received-Date: Tue, 23 Oct 2012 11:21:25 -0000

disable microhttd and package new files

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 512f5d4..efc2d95 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,11 +19,11 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r7"
+PR = "r8"
 
 inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "a3eb665e0c12df35e807611582e7332ebed325b1"
+SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
            file://gtk-doc.make \
@@ -66,6 +66,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-gtk-doc-html \ 
                  --disable-tcpwrap \
                  --enable-split-usr \
+                 --disable-microhttpd \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
@@ -138,12 +139,16 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
                 ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
                 ${systemd_unitdir}/* \
                 ${systemd_unitdir}/system/* \
                 ${base_libdir}/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
                 /cgroup \
                 ${bindir}/systemd* \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
                 ${libdir}/tmpfiles.d/*.conf \
                 ${libdir}/systemd \
                 ${libdir}/binfmt.d \
-- 
1.7.10



