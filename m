Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZS-0001lo-4p
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:22 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so13559894oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nIRKbKj2OCEKpAXqPF12AuuttixRWgjkjQpwsTAC8pU=;
	b=JFYN1yiI9Bu2rc35AIe+AGBTBT+3AVS3QN1EnDIi51kF0AglmLXzF9WHitgWiKIzA9
	mYhluN60+5a3B/hLNkOthCaOc6AcsSJCp+6wIjBQUPsSy9BnmAbJ3jxEtfq5HoaMgpwA
	Mhtb5/OT7yEojJk1uuk4TJ86FsShjYM2Smb1QDiY5Q7j0bgQONNlYBH55EsqCaJE9Gdk
	Yfqa4iNktMKgvawbBy+WEFmNUNdONcx4GIeEIdggVN6O+DFq+MlxFBT2lIrPmQyDFVzI
	ReI4ix0yIm38QQKiuCnBfQHii6AJBs6jNYhP/U6mpv2FMNdE0+hUcHQEreHCDJmMz47D
	s2GQ==
Received: by 10.182.18.196 with SMTP id y4mr5315625obd.52.1354131069434;
	Wed, 28 Nov 2012 11:31:09 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:31:08 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:39 -0200
Message-Id: <1354131040-9077-5-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][meta-systemd][PATCH 5/6] xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's git snapshot
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:22 -0000

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



