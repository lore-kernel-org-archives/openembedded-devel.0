Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6g-0006VU-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:14 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/DtJb2BIVG2uc71H3c7nwodT9GAbaDQCx/ym3o29F3A=;
	b=K8uZW35aWjAiyRKKZ8dsbvGc9ibp+8cFP8LtuG0+WRymaKAixncftfeHwad0OK9eIl
	EnmZxjroecebVdtH9UpGZw4meyZx7X6yuFXVV3a6T6103bm0gvPg/ZD5aM50irKb1dbo
	do+DCOCE9FCUca+1T9ZNAkTt9OsnJZtsllMjOcJPS+H4CaWNfLJa+rM2qgkcOFy4qOeY
	jUeJkDZuteaiVqDXzdejx8UGd0JK6gF5DquF1jt1qdRBGXRawqHk5EzF9mxYcngBCza0
	fR8zpcYJi41h9yDLxCZgthGYJQin0Xm9ub+Cw+SP/E+O42VY4y07/GnWwY9rWgDmOcAG
	bngw==
Received: by 10.14.95.66 with SMTP id o42mr48505eef.202.1342170782187;
	Fri, 13 Jul 2012 02:13:02 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e48sm23159778eea.12.2012.07.13.02.13.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:59 +0200
Message-Id: <1342170730-14982-13-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmb/oqh461R3B0dS41M/hBRXB2T4X290e+8pfTvdiJTqQs1UMl4FuncFXgT27Yip+twVqHQ
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 13/24] gateone: add config file
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:14 -0000

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



