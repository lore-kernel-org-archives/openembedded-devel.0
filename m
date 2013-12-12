Return-Path: <joe@deserted.net>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id D6875610D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 19:01:00 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id ii20so19894qab.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2013 11:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PnBtNU9DSDZn3VThN6gxelqtOuAC8E+gwfBFZeraBYA=;
	b=g82RJn8dTHvsr8TvLV2H8DXMMJnSpUhNF4MfhV1/oBaKtiSLH1/A7wC+wI6NKvKhxu
	gXAtVqWBhzi7WaLTPcdTGlmeNLLIlqxkHzPcS1f7moeYcxtN2MeKTMOb/mcMmRgpO2x1
	YEtXZpd6XWE375SVGqcODnDk/xamc0kwbjkL5N+ZAVNZnC6Qz3C+32s4DifGfTD2t61t
	60dO6S3gwnKRisV85uWPR0pb21qTGJIV0QVKKHOtnWzugofr3AZwRaYFE2Db8tr704ny
	7eL68wtUuSviy9x0gTg42KjUB0Gu8QJjI5OFs7NkamEfMjG6lFtdtvOEQFx9m5kSr9It
	Rnwg==
X-Gm-Message-State: ALoCoQkeF2Nw/gmWO7c6LsdPVmSHZ2aB3598JHqQa+TFKFiUeZqsNW6d9blmx8o7rrej4pnDUWAA
X-Received: by 10.49.25.16 with SMTP id y16mr16324760qef.20.1386874860043;
	Thu, 12 Dec 2013 11:01:00 -0800 (PST)
Received: from burninator.local ([128.224.252.2])
	by mx.google.com with ESMTPSA id f10sm66302782qej.1.2013.12.12.11.00.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2013 11:00:59 -0800 (PST)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2013 14:00:57 -0500
Message-Id: <1386874857-8596-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
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
X-List-Received-Date: Thu, 12 Dec 2013 19:01:01 -0000

The sysvinit populate-volatile.sh scans for volatiles in
/etc/default/volatiles.  systemd expects the same format files to live in
/etc/tmpfiles.d.  Depedning on the DISTRO_FEATURE list, install vsftpd's
volatiles file to the expected location.  While we're here, drop the
creation of the empty ${localstatedir}/run/ hierarchy since they should be
created by the volatiles processing.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
index 0698a63..9d82fd7 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -59,8 +59,13 @@ do_install() {
     install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
     install -d ${D}${sysconfdir}/init.d/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
-    install -d ${D}/${sysconfdir}/default/volatiles
-    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}/${sysconfdir}/tmpfiles.d
+        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/tmpfiles.d/99_vsftpd
+    else
+        install -d ${D}/${sysconfdir}/default/volatiles
+        install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
+    fi
 
     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
@@ -70,7 +75,6 @@ do_install() {
         sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
     fi
-    install -d ${D}${localstatedir}/run/vsftpd/empty
 }
 
 INITSCRIPT_PACKAGES = "${PN}"
-- 
1.7.10.4


