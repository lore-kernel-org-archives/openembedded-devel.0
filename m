Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PoLCb-0002Fz-VL
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 20:32:18 +0100
Received: by bwz10 with SMTP id 10so4062595bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 11:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=BB3sh0i6GboAUrrrKIQFXd7iHhC7Qi2atMRpdf+Jjto=;
	b=wu0Bqef377FVE+W4zlLH56CwKhCMj51Qi1nbdb+NsBC7ySr6QitvC+n6wbLuoF01Ps
	YeJizQUZxFfXf9sWAiZcAKv/Zcymn76WtgEBVPfPB7bn1vWz3T3gVFhYVNlzdUf4Hi9A
	i0fBitWu7w4vg/VDRd1G7OEEYnGRH8kQpeNRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Te1n2/tFSlbSzsBJ8pO8kJnrLcXRXFsYeaqU6z9foM72Mx7V6VyCBWpFgf6Z11o2FM
	NdMRRjV/Z3z3g7KFjYhA4YTnGeapTYVSt6JQNnySMwNO3pS/yi2sxCSZEACfDlvaI32D
	z1rncLAEgosKnMA/9j8vWxpawBuMJLpLjJfqA=
Received: by 10.204.23.15 with SMTP id p15mr7730797bkb.108.1297539067533;
	Sat, 12 Feb 2011 11:31:07 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id a17sm539532bku.11.2011.02.12.11.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 11:31:06 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Feb 2011 20:31:00 +0100
Message-Id: <1297539060-30144-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] makedevs: increase alternatives priority
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
X-List-Received-Date: Sat, 12 Feb 2011 19:32:18 -0000

makedevs from busybox is installed with priority 50, so the discrete
version of it should be installed with a higher one.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/makedevs/makedevs_1.0.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/makedevs/makedevs_1.0.0.bb b/recipes/makedevs/makedevs_1.0.0.bb
index 2b7e84a..d362175 100644
--- a/recipes/makedevs/makedevs_1.0.0.bb
+++ b/recipes/makedevs/makedevs_1.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A tool to make device nodes"
 LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "file://makedevs.c"
 S = "${WORKDIR}/makedevs-${PV}"
@@ -30,7 +30,7 @@ do_install() {
 ALTERNATIVE_PATH = "${base_sbindir}/makedevs.makedevs"
 ALTERNATIVE_NAME = "makedevs"
 ALTERNATIVE_LINK = "${base_sbindir}/makedevs"
-ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.1



