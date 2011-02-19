Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pqt0a-0007uR-As
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 21:02:24 +0100
Received: by fxm8 with SMTP id 8so377074fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 12:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=todMwo5XlwaC6JbTSe4SjxfGdRInzMtQ/6q05aic8m0=;
	b=ZvN+J6JT13M0F7rU4lFRYUWekJ8FcM220MmWGsrIGVvFYMcWdN9PPNIH4GJCMziCvl
	xATPHHyOaa1f4ezSP8EWGNwLK9jumN2Ww4bLsiHcByJmSwRc/HQKqVhAoFK0J2q/iuVh
	QjFZ+L9ePwMrsXtMYDZkqrZfdYgkVi1EOMQGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=ZT/0PBPHdYRcbeEoik8OkCxg85+HlNY9f68AfeHOOglMrD8hf50siXHn3+pi38HCbw
	/rbQ5rR2aUS7zym49tgKV+OjFCK5SRh7d8lJAdK9wd74Sift1wQiz5m3QHoYFjJ544W7
	Qar/mgRnkD/+T153X5TrSthXsUAqkBDoiFQDs=
Received: by 10.223.96.68 with SMTP id g4mr1506598fan.33.1298145668675;
	Sat, 19 Feb 2011 12:01:08 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id f24sm1691864fak.24.2011.02.19.12.01.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 12:01:07 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Feb 2011 21:00:59 +0100
Message-Id: <1298145659-23468-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] less_436.bb: provide absolute path in ALTERNATIVE_PATH.
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
X-List-Received-Date: Sat, 19 Feb 2011 20:02:24 -0000

Relative path causes dpkg's update-alternatives to ignore this
alternative.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/less/less_436.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/less/less_436.bb b/recipes/less/less_436.bb
index 711abfd..c62c821 100644
--- a/recipes/less/less_436.bb
+++ b/recipes/less/less_436.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.greenwoodsoftware.com/"
 SECTION = "console/utils"
 LICENSE = "BSD"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://www.greenwoodsoftware.com/less/less-${PV}.tar.gz"
 
@@ -16,7 +17,7 @@ do_install () {
 }
 
 ALTERNATIVE_NAME = "less"
-ALTERNATIVE_PATH = "less.${PN}"
+ALTERNATIVE_PATH = "${bindir}/less.${PN}"
 ALTERNATIVE_PRIORITY = "100"
 
 SRC_URI[md5sum] = "817bf051953ad2dea825a1cdf460caa4"
-- 
1.7.1



