Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A37CD7743B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:47 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y124so15014632iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ouAX8PefsCwH2MPsZAnNHhGaoDQJsRW4XvqwoGik4Ec=;
	b=VcqRSEw2lffCrCm68DPwCyXtq/vJbjAjZts09UWzyRwaXDmtK9eaM41h8yhvX/0vlk
	T4XIhV3Ej2D2r00Ek9y5FvlYtvXev7utbPkeaSq0SVIkq4xHYNQD4JxupQQUjfUD04wy
	oFDbEaoMwaN37bU7SffC0wstKSSVDIcymVhY4jXc1zG8whIDqTtXo+lLdECuyNivwcVj
	rtp7GeT7LyZdpEpg2yJNAJneaIs5NrWgeql2KFv4NeDwdToqDIhZZbxxzkeVfwI/sikr
	uQjdytqLxkkc91ujDv1xsEfAmmZMqwhvd7EiyLdmTqf4EZx0lJAWSqSJl8dx3BIJ8ZFL
	R2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ouAX8PefsCwH2MPsZAnNHhGaoDQJsRW4XvqwoGik4Ec=;
	b=G6392u19qrMmAkKJZgguBe2DBXGUaaYh//PZlS7Q1I9aHYa2NklN71Z3oVYfb4B9b7
	lvc/IfUFOsa0td2Up65eLp1xxEP3uCy3Ko+1A7PDngmrphLw+/qT1gDBtfwLdFZX51Sr
	EQEVT5f4bwDj5qGyKAeymMBVxZcXX8yPKPGa7YktulnUDSt6A13H099N5EtNAuWHg5D4
	T9PAv064eVOScunQUPPCP4UmHV0C/FyEzfJ9H4UBHctHhoTriU9zjeEdJV70hpAD1dlR
	ve9R+PjtXP4ZFs29xgoMLYf53dmzJ0caD1ClaGNiQioGT8A+SIRvZSQiEP/wm7YgiU/z
	JK/A==
X-Gm-Message-State: AIkVDXKIcKHsQQi7ROWY1xlPoNbx/hzguWGyZqnrTd0DK46oduGmH5+4NdK8RfwUHZPiIA==
X-Received: by 10.107.35.73 with SMTP id j70mr8458340ioj.195.1481990689074;
	Sat, 17 Dec 2016 08:04:49 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:48 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:50 -0500
Message-Id: <1481990698-15962-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 02/10] samba: install systemd units and initscripts unconditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 16:04:47 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Fixes hybrid systemd/sysvinit setups.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb       | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 783a7cd..aabc043 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -98,19 +98,18 @@ DISABLE_STATIC = ""
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
-
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
-        echo "d ${localstatedir}/log/samba 0755 root root -" \
-            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
+    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+
+    install -d ${D}${sysconfdir}/tmpfiles.d
+    install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    echo "d ${localstatedir}/log/samba 0755 root root -" \
+        >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    if ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
+    else
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
-- 
1.9.1


