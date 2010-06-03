Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OK8Gd-0002ih-Md
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 13:07:23 +0200
Received: by fxm9 with SMTP id 9so1743805fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nnH+943a36myvIHhJpkRWEaAaVcYWLvQR2Iy3x9kIeg=;
	b=pqVNJaf/zj13Ya9AyFUIdjI2w63b90ZNjJvDlOZQ8y8IK+K73UsKCIb8bRPsFikB+6
	ocp+78CctWebF2ST2FuQch9u/F17Zz8r/PW5+mUozCbHoQeIkegqASm8MPsz2/PTlo6L
	icgp4W6PPbCmgxBRwdU4nOA6wS8vEU1Wht2vk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SDYYCFseobTjRlqt10uf/AdycutdEk1v9QDy+3kEpVfzLS3jE/pHo+fJuZT/VGkpnb
	f42ebVZn5HL5emZuIrKtCWTHoI+eVi9yDPaNp0s4qg9tdXMPW0fiXiT87tcTmcuchCoF
	4am3Q2w5PMiHhKp2x4BY/M+JL2v6+qF6/ESyI=
Received: by 10.223.56.212 with SMTP id z20mr10088531fag.1.1275562983559;
	Thu, 03 Jun 2010 04:03:03 -0700 (PDT)
Received: from localhost.localdomain (mailout.fortiscorp.be [213.246.247.35])
	by mx.google.com with ESMTPS id
	u12sm56933791fah.16.2010.06.03.04.03.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 04:03:02 -0700 (PDT)
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 13:02:45 +0200
Message-Id: <1275562965-3178-1-git-send-email-jan.paesmans@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] grep: add missing dependency on gettext
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
X-List-Received-Date: Thu, 03 Jun 2010 11:07:23 -0000

---
 recipes/grep/grep_2.5.1.bb |    2 +-
 recipes/grep/grep_2.5.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/grep/grep_2.5.1.bb b/recipes/grep/grep_2.5.1.bb
index be954a6..4452a84 100644
--- a/recipes/grep/grep_2.5.1.bb
+++ b/recipes/grep/grep_2.5.1.bb
@@ -6,7 +6,7 @@ PR = "r2"
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://uclibc-fix.patch"
 
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
 
diff --git a/recipes/grep/grep_2.5.bb b/recipes/grep/grep_2.5.bb
index 92e5d9f..0d1b4c0 100644
--- a/recipes/grep/grep_2.5.bb
+++ b/recipes/grep/grep_2.5.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "grep GNU utility"
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
 	   file://install.patch"
 
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
 
-- 
1.7.0.4



