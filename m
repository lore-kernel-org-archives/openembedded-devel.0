Return-Path: <joe@deserted.net>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C88D773F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:23 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 75so4543401ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7hNnTHTUAP9P/TVeR23LuCoD2/Wel8WfLKxJWF6eg9s=;
	b=euGCV5KFUDqaSn6hwLuNHWY7VG7cKhpXzXj57GDgKth6MMCTWVjBUUxuYITzQVm97L
	I6+0WX3XlpGY1j14SRE8MAYDgiOpI370bsoru/e2Kjst0XSeM8J0J3wCD9xpeTGMfrMm
	ZKZ02VGRuKiKmfAHrd9t71EMFxLvPiUr5WGgEhg/2IikRersxt1AyWKR+M+aK5i3zJX3
	9F5k0NCOld/vyfbWFKJYBZmY2oDMU37PSM0Asq1bvgpJ6FGUL/c77PwhzFejDjnt5i5q
	B2Z2/x0I3QMw4MZfm7ax3bxtE+CO6u0TWkZvNcfe8wfOIhQ8eRdVxE5+7f6uL1kBUWmi
	wYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7hNnTHTUAP9P/TVeR23LuCoD2/Wel8WfLKxJWF6eg9s=;
	b=s2MzI4fTnX9OEC9957tVIgdwULWBYB6lm29B6GGA2C58pCyz3vpS2a12AYBDVV30ml
	zSu3Cd/xsSFinPUP+ZL9K+3rEDt4p1j8u/DvV3g8xWrLKSYrUANGGrpF3MEK6W7Maa70
	+khKO+dYgT+uLBPkQshaY0Fdzcq2IkZXMhiqta2jYuiEIREC9g+P8y0vyIrh95A1lMwe
	OBMjyw9OypkZ0pNBtpOkjogreAQs62qLDOinmvQ64arGsdwZQrvyLtNdxnNSOlmerRik
	/O7gLboiBWmmQ3nfCXf411g3nxPZrUhv2S2VCkUmPJ2VcGKSg1edmAbvYDI9jp32WTSC
	9jJw==
X-Gm-Message-State: AKaTC02hxDtOOM5zefL+GUvuNnnOxJ7rHXkRT1kneEII/M4xqaKIo6IA3vK/cOh3rNCnGw==
X-Received: by 10.36.159.3 with SMTP id c3mr6813713ite.50.1481940924967;
	Fri, 16 Dec 2016 18:15:24 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:24 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:21 -0500
Message-Id: <1481940923-12914-10-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 09/11] samba: move /etc/sysconfig to more common /etc/default, package tmpfiles.d in samba-common
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:23 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index a678578..1caf8af 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -108,7 +108,9 @@ do_install_append() {
 
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+    sed -e 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' \
+        -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
+        -i ${D}${systemd_system_unitdir}/*.service
 
     install -d ${D}${sysconfdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
@@ -133,8 +135,8 @@ do_install_append() {
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
     install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
+    install -d ${D}${sysconfdir}/default
+    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/default/samba
 
     # install ctdb config file and test cases
     install -D -m 0644 ${S}/ctdb/tests/onnode/nodes ${D}${sysconfdir}/ctdb/nodes
@@ -202,6 +204,7 @@ FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
 
 FILES_${BPN}-common = "${sysconfdir}/default \
                        ${sysconfdir}/samba \
+                       ${sysconfdir}/tmpfiles.d \
 "
 
 FILES_${PN} += "${libdir}/vfs/*.so \
-- 
1.9.1


