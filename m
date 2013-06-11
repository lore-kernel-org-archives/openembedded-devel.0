Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 754DF6A9F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:44:21 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so3121030eek.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wlaSLlXkOO73O3g9T/AlWRwc1fe6idCmc+2ogViEBKY=;
	b=IkM/JwrqO2/lie1J5yA67UDH0DlaAA9fWmQBYa03XTJaiHe8hm+JTC7MS/XPlUl2k7
	A22fwqkb5oOT2DNmOf/fcWO2pG00f3n5ZubZSlh38TDO4GAF055NN0dVplqDp/7Fkqaa
	efNwoM0INw9GeBjw+iAxxkcWaG/BYi/5vbIwhVx+LDC6XvjhFMnIl6c3LUDLdIvZsiTk
	Xw7PQ7ZRrAjGx+/jWdn2vYkIt0nGtoGpvbpgj6jV9jUDkGYDj0X2FqziLlf6eHxxmr7f
	050L4hLyr1939qfaPPR3kzX1nDgpqttph9Cppdpdsp9MVpiVySiMawrVbt8kmDXYjDyt
	ZhWA==
X-Received: by 10.15.65.8 with SMTP id p8mr8829012eex.55.1370969061299;
	Tue, 11 Jun 2013 09:44:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm22107752eex.17.2013.06.11.09.44.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 09:44:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 18:44:41 +0200
Message-Id: <1370969081-31095-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-systemd][PATCH] openssh: Rename bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 16:44:22 -0000

---
 .../openssh/{openssh_6.2p1.bbappend => openssh_6.2p2.bbappend}          | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/openssh/{openssh_6.2p1.bbappend => openssh_6.2p2.bbappend} (95%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
similarity index 95%
rename from meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
index 4789ad0..d9ad9ba 100644
--- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p1.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.2p2.bbappend
@@ -1,7 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 3}"
-
 SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 FILES_${PN}-sshd += "${systemd_unitdir}/system/sshd.socket"
-- 
1.8.2.1


