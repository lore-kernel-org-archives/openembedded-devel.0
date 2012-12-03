Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYix-0006mv-Md
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:27 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2539248obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sgh2eYBg2De6eGjPpeBEyQaOQ0SDsLqfp3sL+7yBJZM=;
	b=qcXs2jaeyqHRCxVncHpC8rkhX69GxjXnB3brKuPXkDJhjMP2a/wfmX2BhORzxFivJ3
	Hbej7nOUj983cL3fr1uYeXQqq58P8jz3Ddkc/MqJePI+EsfN9ZuuleDEGCgtLk9Wrwlr
	sxMX5+CZ32vNf+1ThkcHZgXgM52JjG5BB0ZXC4T+EDSr9x+rtBzxw5Uhrla3H8P+EnOI
	gF+wk4Jl+p6ioGjk3z569gHpRacHsLOmV/y0bB54WUScv4L5/rjLrLmLPG2OforX7PUr
	0KK6zn9RQ7UlnT4atYZyEMvr+sFccm7xprHTCFQE4/jMMpUCwvCWqrfPVLwx3NN8TfiY
	bhRA==
Received: by 10.182.121.97 with SMTP id lj1mr4770493obb.63.1354550648396;
	Mon, 03 Dec 2012 08:04:08 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id el2sm13739774obc.9.2012.12.03.08.04.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:04:07 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:03:25 -0200
Message-Id: <1354550606-10377-5-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
References: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][meta-systemd][PATCHv2 5/6] xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's git snapshot
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:27 -0000

Change-Id: Iffa01114008f958c815d1d2ec7f81a92cc788aeb
Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../xinput-calibrator_0.7.5.bbappend               |   10 ----------
 .../xinput-calibrator_git.bbappend                 |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend

diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
deleted file mode 100644
index e12abec..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 1}"
-
-inherit systemd
-
-SRC_URI += "file://xinput-calibrator.service"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
new file mode 100644
index 0000000..e12abec
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xinput-calibrator.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.2.5



