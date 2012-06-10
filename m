Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3h-0001fg-RH
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:29 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+8E3Yj3tFYqJDaLGafX7r4/PPw+M3n0/sBdLenascQU=;
	b=Gk4zDpz+ZJSNViJMJb0uFqlerAQ30tdSbbFiekOzXCu8Bc88REO5lYFL0fmOX+mx8s
	/1vp+K5uiOixWRnyKE/f2eL3MzRZvlb1Rw5Q0OyW+112XE10hR440gUYfBtL+t3Jn4x3
	ZUEgkxhsN8ACeRrj75i4/d8r+ap322Pr+n4Uhtdk1ll0VQRPPSAThrbMLxqopHXBz+zo
	gc531ghWhpkpGw+sOfMWh485JQtdFPTIbY92DC+61pgLygt6JJ2zMjpCO8ALKRgrvZw4
	ppFNXFjlIV05RSrWmRaemGBfuwIXkROypX84uJCQWZitjdMDj2LVnrwttyR8YhZmJMbJ
	pM3Q==
Received: by 10.180.103.42 with SMTP id ft10mr15690641wib.18.1339364519517;
	Sun, 10 Jun 2012 14:41:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:52 +0200
Message-Id: <1339364820-2880-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 19/27] openssh: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openssh/openssh/sshd.socket                    |    0
 .../openssh/openssh/sshd@.service                  |    0
 .../openssh/openssh/sshdgenkeys.service            |    0
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshd@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh/sshdgenkeys.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/openssh/openssh_6.0p1.bbappend (88%)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd.socket
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshd@.service
diff --git a/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
similarity index 100%
rename from meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh/sshdgenkeys.service
diff --git a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
similarity index 88%
rename from meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
index de7668f..a708a36 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
-- 
1.7.4.4



