Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXCk-000810-Gp
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:15:31 +0100
Received: by mail-gg0-f175.google.com with SMTP id p1so242148ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=4SkrtRqLb+846JtSpKYqN/UHQKSlyJiq0wyOB6GNhlg=;
	b=I+G+CryXhijNqeozWMfmodPzOi7oHrBa+qn4ZAl/1ch4ZRav1aBiIU3YoNuESN429k
	eag74818LRX/47phv/ofq9djQhvpS6lx2f9B4LXtN7NJbX+sIdvQhIcYgU38USyTWRbZ
	TJdYAzlVdQdA+PhC7kDdYC/ciMvvqfrvGfcsERILwOBuXIS/aPP0uMwHMKIRZzlgCovE
	1em+5JgWdPj7YobiVlEHDcxrErsJFzFsEPgN3KSDD8DoX1Krhr+P3KwhZXimXBx+th9L
	Ck1wRBjDZTF4UFWnYYV8vYYf5CzY0g5Al/z4WH+s7/jDZ325tclwTQKvRix63PwhrY10
	cWLQ==
Received: by 10.236.83.230 with SMTP id q66mr35618994yhe.118.1351684913510;
	Wed, 31 Oct 2012 05:01:53 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id z6sm3426978yhl.8.2012.10.31.05.01.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 05:01:52 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 10:01:43 -0200
Message-Id: <1351684903-1276-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] meta-systemd: ntp: Fix ntpdate.service file to use right binary
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
X-List-Received-Date: Wed, 31 Oct 2012 12:15:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
index b2bc632..8df9970 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
@@ -4,7 +4,7 @@ Before=ntpd.service
 
 [Service]
 Type=oneshot
-ExecStart=/usr/bin/ntpd -q -g -x
+ExecStart=/usr/bin/ntpdate pool.ntp.org
 RemainAfterExit=yes
 
 [Install]
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
index c6cd031..dbf3145 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.7.2.5



