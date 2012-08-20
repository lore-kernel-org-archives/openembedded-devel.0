Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T3V7p-0003Tb-60
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 18:46:49 +0200
Received: by bkcik5 with SMTP id ik5so3063033bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=r/ABP/0/9EVZ8SE22nrvxGZMH060zn61Ad4ptouanyk=;
	b=vCyE4b4bbzwP808Pefq084tlg3sNJDMtXcrDrj+Dl/mI0GPsmZ08DgxWIem28r+h/t
	NTH6EWeBDRCDPYSzfbddKELT8tlaqiPbhdN6QmD8Pew/7VfrhIIdftzoVkr21h9s+a1b
	p3rbnsMR0dcY2dxuwXlwqfOmlA9swnJ2E3oSpo/LC5ITJWuuGyYJfLln+1z3T8WlhY0D
	JtIFw8WZMFcuH/OKp8ok31N/27DSArliEYE3wd49Udazm3li+T5ngWuZ7rx5RBpkGTVv
	n0wklPvdywnKugArPhCkAOlPzC+Ri5zgh3zuTfAOUtdN3Nd//N1U0ZeVoUOjz49FXDnj
	HMWg==
Received: by 10.205.118.5 with SMTP id fo5mr4648939bkc.124.1345480486270;
	Mon, 20 Aug 2012 09:34:46 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm6500240bkc.3.2012.08.20.09.34.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 09:34:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 18:34:05 +0200
Message-Id: <1345480445-16994-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-system] systemd-compat-units: ensure /tmp is mounted when starting run-postinsts
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
X-List-Received-Date: Mon, 20 Aug 2012 16:46:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

/tmp is required for postinst:
Aug 20 16:59:33 overo S98run-postinsts[68]: * opkg_prep_intercepts: Failed to make temp dir /tmp/opkg-07xOYO/opkg-intercept-wfVgAQ: No such file or directory.
Aug 20 16:59:33 overo S98run-postinsts[68]: * rm_r: Failed to open dir /tmp/opkg-07xOYO: No such file or directory.

This bug left postints unfinished e.g. pango-module-* [1].

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |    2 +-
 .../systemd-compat-units/run-postinsts.service     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
index aefd6a7..6b6b4dd 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r17"
+PR = "r18"
 
 inherit allarch
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 879a251..da6fe76 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -2,7 +2,7 @@
 Description=Run pending postinsts
 DefaultDependencies=no
 ConditionPathExists=|/etc/rcS.d/S98run-postinsts
-After=remount-rootfs.service
+After=remount-rootfs.service tmp.mount
 Before=sysinit.target
 
 [Service]
-- 
1.7.6.5



