Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlz-00063o-3N
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:39 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uUbSABbIafIILzuPL+ieDoa1viDUlNijzbn3/CylINM=;
	b=oy7c4GedjPwivKUU2JnJCjMp+SVlYYYzzhQtfjMCDtUc3qspGKshLv85iDfZvDyKYQ
	pyBMH7/1A4OR7tHrsdPN87dRveW0/u+gpxGqwbnkG034ZwrQDDaRPxRIxSFubJROoQy9
	eVIe5CQ6GERqfV/fmwXEvcxGilaeC+OqXTkBk=
Received: by 10.14.39.148 with SMTP id d20mr332139eeb.90.1329357628926;
	Wed, 15 Feb 2012 18:00:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:04 +0100
Message-Id: <1329357796-27398-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 10/22] openssh: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openssh/openssh_5.9p1.bbappend                 |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
index 3f68e09..de7668f 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
+++ b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
@@ -8,15 +8,3 @@ SYSTEMD_SERVICE = "sshd.socket"
 inherit systemd
 
 SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
-
-do_install_append() {
-       install -d ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd.socket ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd@.service ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshdgenkeys.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "openssh-sshd-systemd"
-
-FILES_openssh-sshd-systemd += "${base_libdir}/systemd"
-RDEPENDS_openssh-sshd-systemd += "openssh-sshd"
-- 
1.7.4.4



