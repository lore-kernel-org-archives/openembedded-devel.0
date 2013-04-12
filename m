Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQlCG-0000G6-9y
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 23:07:53 +0200
Received: by mail-pb0-f53.google.com with SMTP id un15so1593540pbc.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3bY3Qg5Ap3KwDan1MPCdMXZizjfsck9NoJE5HQ2/4EA=;
	b=Rkhc55AjtcWwGhpKUfC7JV+LXxhdyc/LoZGIS1i2swzyziu8+KQ7xQqI4MJppB4WsN
	oNXJXG96uGLKvVsJTyAVIZfLSMdz6GXTQZxh8FNWTjX6Ov7iEjsXtfFoeKO146yd/R/L
	nsQnufdepSYosado9GvhmPs5ecSUTGAEnxjgtH9/Ox4LvtW3ww04baG94f2arIqLJxI7
	5yf7Gm5a86A5fL6zzB2eGoQRa5NdIaV5fXcL0wGs19zC7esaP4mbVljMpXiVhghzT8/0
	TiONUyr2y4oIDOIKohBuIi9dn0KtjAaOYrdjgDzQZYF2X7MLIwEP8pZdwH3zdWIUHruU
	ebPg==
X-Received: by 10.67.1.39 with SMTP id bd7mr16948618pad.194.1365799822604;
	Fri, 12 Apr 2013 13:50:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id be10sm9824674pbd.30.2013.04.12.13.50.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 13:50:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 22:50:09 +0200
Message-Id: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][meta-systemd][meta-gpe][PATCH 1/4] openssh: fix warnings about overwritting keys
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
X-List-Received-Date: Fri, 12 Apr 2013 21:07:55 -0000

* they were causing real issues like openssh-sshd-systemd not really RPROVIDED..
  WARNING: Variable key RCONFLICTS_${PN}-sshd (dropbear) replaces original key RCONFLICTS_openssh-sshd ( openssh-sshd-systemd).
  WARNING: Variable key FILES_${PN}-sshd (${sbindir}/sshd ${sysconfdir}/init.d/sshd ${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config) replaces original key FILES_openssh-sshd ( ${systemd_unitdir}/system/sshd.socket).
  WARNING: Variable key RPROVIDES_${PN}-sshd (sshd) replaces original key RPROVIDES_openssh-sshd ( openssh-sshd-systemd).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/openssh/openssh_6.1p1.bbappend    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
index fe61a89..d757c70 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bbappend
@@ -1,13 +1,13 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
-SYSTEMD_PACKAGES = "openssh-sshd"
-SYSTEMD_SERVICE_openssh-sshd = "sshd.socket"
-FILES_openssh-sshd += "${systemd_unitdir}/system/sshd.socket"
-RPROVIDES_openssh-sshd += "openssh-sshd-systemd"
-RREPLACES_openssh-sshd += "openssh-sshd-systemd"
-RCONFLICTS_openssh-sshd += "openssh-sshd-systemd"
+SYSTEMD_PACKAGES = "${PN}-sshd"
+SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
+FILES_${PN}-sshd += "${systemd_unitdir}/system/sshd.socket"
+RPROVIDES_${PN}-sshd += "${PN}-sshd-systemd"
+RREPLACES_${PN}-sshd += "${PN}-sshd-systemd"
+RCONFLICTS_${PN}-sshd += "${PN}-sshd-systemd"
 
 inherit systemd
 
-- 
1.8.1.5



