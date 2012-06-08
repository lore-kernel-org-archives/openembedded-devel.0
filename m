Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrV-0004PX-0e
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:09 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/DtJb2BIVG2uc71H3c7nwodT9GAbaDQCx/ym3o29F3A=;
	b=gZ0b0FCN+dBuwnH0qTVoqxiDIZY2AsyjDcC2PKLK4xirabVMcg+7wJ9G9BjDqLsl4W
	0e83a9zYfPJ0+iRqIOsZ4yVkUtsHeyQh5QMqFC3SJ4DUMGJV68rZk21okx45nMP/tq1O
	gjmuNyXCQZSHqacIg4L0ScJxxq6i1UNE8CXy8qBk+Q2Nz2eidIY9tqovthDOHGtiGemf
	OS6Pr9eSXe0CkJAYaY8TyKklLXWgTQW7ac+zgZCqiYMInl5j0+3mIlWICbWl6GRynx+X
	Y+h65spaR0Q1JJRDyg1FF255wxMeb9WbzIK/YLoCjr44XKjaLx5Q0ghI3uBKWhhL+kpu
	pQTQ==
Received: by 10.14.119.140 with SMTP id n12mr3459779eeh.30.1339148501680;
	Fri, 08 Jun 2012 02:41:41 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id h53sm20271979eea.1.2012.06.08.02.41.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:42 +0200
Message-Id: <1339148443-9467-13-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl3y5Yeszc+IHoQcraf6+vnG4MvxN49IjG5M3CCQkP1nYDKXoTIF2o/9SVnOrv6hCWrSyLL
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 13/14] gateone: add config file
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:09 -0000

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



