Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SX76j-0002Fh-AO
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 10:39:49 +0200
Received: by eaal1 with SMTP id l1so2283215eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 01:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/DtJb2BIVG2uc71H3c7nwodT9GAbaDQCx/ym3o29F3A=;
	b=lKObz7nfHzwMX5WWkC13QHUPojvbzsKhAjShOsBhPTTEGxUfyljW+ETI0MRtJ5dlaC
	zCLetAFE+j1nCr3Bvbx81eE3c3sdN9rlHuTrakBcj7zSOmSEEA4m23ginEsSAN2MMpRy
	Huh9olEKOGTH1U7A8u+B6pbL4dZ3Q39HryOPwKjUEcvDHyiM/qGE2EBSKanN+7Bkndtc
	2uxpd8AF494sfffaY7GKsrhqmkYEoiiPUB9iMyOqrwYgRiNZsrFCwZAI+3JbQUIZdQx8
	MZCeUoncNqLY5XC5Q3Jmn1eB4xqQ0KNGtiqPfZ1ZDUqvYKUCTZNj8/PNlAjPj/o/JWrn
	kL3w==
Received: by 10.213.10.76 with SMTP id o12mr767825ebo.7.1337761779617;
	Wed, 23 May 2012 01:29:39 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	v46sm119453438eef.11.2012.05.23.01.29.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 01:29:38 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2012 10:29:26 +0200
Message-Id: <1337761766-28429-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1337761766-28429-1-git-send-email-koen@dominion.thruhere.net>
References: <1337761766-28429-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnLmeiZUCGbuxXDOjHZmXyMwQCOQlXsE/y/9rAqJ5VpDG5pVVgkA1UX71KaMrytjedoWo7Z
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] gateone: add config file
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
X-List-Received-Date: Wed, 23 May 2012 08:39:49 -0000

The config file changes some options to have a lower latency for key input

Based on https://github.com/liftoff/meta-oe/commit/9cb653845d7bb4416d2e8e6c5a09a54e08dd7578 by Dan McDougall

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/gateone/gateone/server.conf |    5 +++++
 meta-oe/recipes-connectivity/gateone/gateone_git.bb      |    5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/server.conf

diff --git a/meta-oe/recipes-connectivity/gateone/gateone/server.conf b/meta-oe/recipes-connectivity/gateone/gateone/server.conf
new file mode 100644
index 0000000..988b0d0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gateone/gateone/server.conf
@@ -0,0 +1,5 @@
+session_logging = False
+origins = "*"
+command = "/var/lib/gateone/plugins/ssh/scripts/ssh_connect.py -S '/tmp/gateone/%SESSION%/%SHORT_SOCKET%' --sshfp -a '-oUserKnownHostsFile=%USERDIR%/%USER%/ssh/known_hosts'"
+log_file_prefix = "/var/log/gateone.log"
+
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index bfb3274..d56c848 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r4"
+PR = "r5"
 
 PV = "1.1"
 SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://gateone.service \
+           file://server.conf \
           "
 
 S = "${WORKDIR}/git"
@@ -22,6 +23,8 @@ do_install_append() {
 
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
+
+	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
 }
 
 NATIVE_SYSTEMD_SUPPORT = "1"
-- 
1.7.10



